---
title: "System design practice: distributed ID generation"
layout: edition
---

<figure id="cover-img" markdown="1">
![Tilt shift lens photo of stainless steel chain](/assets/images/posts/2020-03-23-system-design-practice-distributed-id-generation.jpg)
<figcaption markdown="1">The URL shortener problem is all about links. Photo by [JJ Ying](https://unsplash.com/@jjying?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/s/photos/link?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)
</figcaption>
</figure>

It can be hard to get experience designing complex systems if you don't previously have that experience. For that reason, I recently started a series on [my personal blog](https://avikdas.com) on scalability concepts. Today, let's explore [distributed ID generation](https://avikdas.com/2020/03/23/scalability-concepts-distributed-id-generation.html) in the context of a very common systems design question: building a URL shortener.

## The problem statement

Build a service where users can input URLs, and the service will return a short URL. Later, that short URL should redirect to the original URL. Common examples of this type of service are [bit.ly](https://bitly.com/) and [TinyURL](https://tinyurl.com/).

At its core, a URL shortener is a mapping from an arbitrary long URL to a short ID you store in your service. Given a short ID, you need to look up the long URL for redirection. (As part of the "requirements gathering state", you might decide you want the reverse mapping too, in order to avoid generating two IDs for the same long URL.)

Once the mapping exists, doing the redirection is straightforward, so we'll look at the ID generation.

## Generating a short ID

The important part of the short ID generation is the short ID must be unique. If you give the service a long URL, whatever ID is generated must not be in use for another long URL. For a single-threaded, single server application, the requirement is easily met: generate a random short ID, check if it already exists in the database, then write to the database only if the ID didn't exist.

The situation becomes more complicated as you handle more traffic. Let's evaluate the different solutions in the blog post:

- **Moving the uniqueness constraint to a single database.** The database can atomically do the test and write in one step, allowing you to scale to multiple threads and even multiple application servers, as long as you have one database. You would catch the constraint violation in your application and generate a new ID.

- **Centralized writes.** The write portion doesn't change if you have only one database handling your writes. However, you have to account for replication delays to your read replicas, and you still can't scale to multiple write databases. I'll talk about replication delays in a future post.

- **Centralized ID generation.** Certainly a possibility, but because the IDs are not sequential, you may just end up with a database containing all your IDs to back your ID generation service! Probably not a good fit for this application.

- **Pick randomly from a large range.** Not a possibility for a URL shortener, because you specifically want your IDs to be small!

- **Encode the partition in the ID.** As you start scaling your application geographically, you'll probably have no choice but to pick this approach, at least across different data centers. As I mentioned in the blog post, in a single data center, you might still use a centralized approach if that makes sense (sufficient randomness in your short IDs for example).

- **Semantic IDs.** You could hash the original URL to get your short ID. However, you have to be careful you don't end up with hash collisions. To prevent this, you would probably end up using one of the above mechanisms to guarantee uniqueness anyway.

---

The URL shortener problem is a classic, partially because it's easy to explain, but brings about some interesting scaling challenges if you take it to its limit. A lot of developers will never encounter these challenges, which is why I don't think this problem allows for adequate evaluation of all candidates. But if you're looking to bootstrap your scaling knowledge, you'll be better prepared for big company interviews.
