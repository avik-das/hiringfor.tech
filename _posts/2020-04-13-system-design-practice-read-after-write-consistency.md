---
title: "System design practice: read-after-write consistency"
layout: edition
---

<figure markdown="1">
![A person writing on a notepad with a pen](/assets/images/posts/2020-04-13-system-design-practice-read-after-write-consistency.jpg)
<figcaption markdown="1">It's important to be able to read what you write. Photo by [Adolfo Félix](https://unsplash.com/@adolfofelix?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/s/photos/notes?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)
</figcaption>
</figure>

This is something I'll say each time this topic comes up: it can be hard to get experience designing complex systems if you don't previously have that experience. To help candidates bootstrap their system design skills, today I'll talk about **read-after-write consistency**, a topic that comes about at scale. As usual, I published [a deep-dive on read-after-write consistency on my personal blog](https://avikdas.com/2020/04/13/scalability-concepts-read-after-write-consistency.html). Here, I'll talk about it in the context of a common system design interview problem.

## The URL shortener revisited

Let's go back to [the URL shortener problem]({% post_url 2020-03-23-system-design-practice-distributed-id-generation %}) I talked about in my last post about system design questions. To recap: build a service where users can input URLs, and the service will return a short URL. Later, that short URL should redirect to the original URL.

## Read-after-write consistency for short URLs

Read-after-write consistency can be violated in many different ways. What's important is to understand the user impact of these violations and make the right trade-offs between complexity, speed and consistency. Showing you can make trade-offs in the context of the user experience is an important skill for engineers.

### Creation delays

Centralized ID generation with multiple read-only replicas can lead to read-after-write inconsistency for the user shortening a URL. You write the new short URL to one database, but if you read from one of the replicas before the data is replicated there, your user won't find the short URL. The user experience is they try to visit the new short URL, but the URL redirection system says that short URL does not exist.

This may actually be okay if your system sets the expectation that there is a propagation delay. Perhaps the error message when a short URL is not found says there may be a delay. This ends up being a product decision.

### Delays on short URL updates

One way to solve the problem with read-only replicas is backup reads in case a short URL is not found. If you don't find the short URL in the database you're reading from, you do a backup read from the centralized write database, where you're guaranteed to have the latest short URLs.

This works great for newly-created short URLs. However, if your application allows users to _edit_ their short URLs, then you'll still have read-after-write inconsistency. This is because, after an edit, the short URL will still be found in the read-only replicas, but replication delays mean the mapping you read may not be the latest version.

If you expect most users to create new URLs and only rarely edit existing ones, this may be acceptable. The benefit of this approach is, for new URLs, read-after-write consistency is maintained not only for the user creating the new URL, but the URL is also available immediately to other viewers.

### Delays for other viewers

You can ensure read-after-write consistency for a single user (for both creates and edits) using user pinning, making sure each user reads and writes from the same database. However, you then have the problem that other viewers won't necessarily see the latest URLs immediately.

Again, this may be an acceptable if the right expectations are set. The advantage is the user creating or editing a URL sees the write immediately.

### No delays

Finally, you could do something like synchronous replication to force new or edited short URLs to be available to all users immediately. The downside is increased write latency (the time it takes to do the write).

This makes the solution problematic if you have a high number of writes. However, URL shorteners typically will have an order of magnitude more people using the URLs (reads) than creating them (writes). So, synchronous replication may actually be a good solution for this application, though only if you have a reasonable number of replicas.

---

The URL shortener problem seems straightforward at first, but there are many considerations once you start needing to operate at scale. If there's one takeaway from practicing system design problems, it's that once you operate at scale, it's really important to think about the user experience and usage patterns so you can make the right trade-offs.
