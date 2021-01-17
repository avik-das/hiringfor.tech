---
title: "Interviewing and pattern matching"
layout: edition
---

<figure id="cover-img" markdown="1">
![An assortment of tools, like a hammer, plier and a wrench, lying on a wooden table.](/assets/images/posts/2021-01-18-interviewing-and-pattern-matching.jpg)
<figcaption markdown="1">A wide variety of readily-available tools is key to success in interviews. Photo by [energepic.com](https://www.pexels.com/@energepic-com-27411?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels) from [Pexels](https://www.pexels.com/photo/tool-set-on-plank-175039/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)
</figcaption>
</figure>

For candidates, a full day of interviews is grueling, but in the context of demonstrating your technical skills and how well you'll perform on the job, it's a short amount of time. There's not enough time to invent completely novel solutions, or to prototype multiple different approaches. Instead, you'll have to rely on previous experience.

Given this time constraint, the single most effective trick for an effective interview is **pattern matching on a toolbox of common techniques**.

## Rapid pattern matching

Interviews become easier when you can look at a problem and quickly assess, at a high-level, what approach to take. Every problem is unique, but most are variations of the same common principles. It's even okay to be wrong at first. When you go down one route and encounter some difficulties, just pattern match on the next technique based on those difficulties.

Let's see how pattern matching plays out in a few scenarios:

- **[The balanced parentheses problem](https://avikdas.com/2020/01/28/the-balanced-parentheses-problem.html)**, specifically the third follow-up with arbitrary delimiters. Until that follow-up, you can go through the input string once in a for loop. But if you try that with arbitrary delimiters, you find you may not have enough information to tell if a particular character is an opening or closing delimiter. There's ambiguity. At this point, you reach into your toolbox to find which technique deals with ambiguity: backtracking!

- **A system design problem like [designing a payment processor]({% post_url 2020-05-11-system-design-practice-designing-a-payment-system %}).** Talking through the problem with the interviewer, it turns out the key requirements are reliability (ensuring every promise made to the user is fulfilled) and idempotency (the effect of each action happens only once). If you have a comprehensive toolbox, you know a queue-based architecture is appropriate and you can design the system around that queue.

- **Design and implementing a lightweight chat application.** Some of the tools in your toolbox to draw from include a client-server architecture, database modeling of domain objects like users and messages, and REST APIs. To support instantaneous delivery of messages, the tools you have include server-sent events, polling or even bi-directional channels like WebSockets. Even the composite architecture composed out of these tools is itself a common architecture, and therefore a pattern in your toolbox.

In all these cases, you _can_ build up the right techniques from scratch, often through trial and error. But if you can immediately pattern match to find the appropriate techniques, and *you can name those techniques* ("I'm going to use backtracking because we're dealing with ambiguity"), then the interviewer quickly knows you're on the right track.

## Building a comprehensive toolbox

An effective toolbox of techniques consists of:

- **Common algorithmic techniques.** [Dynamic programming](https://avikdas.com/2019/04/15/a-graphical-introduction-to-dynamic-programming.html), [backtracking](https://avikdas.com/2020/02/25/a-tree-based-introduction-to-backtracking.html), [graph algorithms](https://avikdas.com/2019/08/13/practical-computer-science-connected-components-in-a-graph.html), to name a few. Having a formal computer science education helps, but practicing problems and reading up on the theory can make up the gap.

- **Common types of large-scale systems.** [Horizontal scaling](https://avikdas.com/2020/03/23/scalability-concepts-distributed-id-generation.html), [consistency in distributed systems](https://avikdas.com/2020/04/13/scalability-concepts-read-after-write-consistency.html) and [queue-based architectures](https://avikdas.com/2020/05/11/scalability-concepts-the-reliability-queue.html) are good examples. Unfortunately, experience working at scale really puts you ahead of the pack, but I've tried to write articles about these concepts to help those without the relevant experience.

- **Common building blocks of practical applications.** These are the tools you'll use to implement a project, like web frameworks used to build REST APIs, common databases and interfaces to those databases, and UI libraries for the client portion of these projects. You don't have to know every possible API or framework, but you should be able to build a full application in your area of expertise (client, server, full-stack, etc.).

The latter two categories of tools become increasingly more important the more senior you are. Meanwhile, algorithmic techniques are more important for junior engineers with less industry experience.

The best way to build up this type of toolbox is to observe real-life applications, recognize the technologies and techniques used in those applications, and most importantly, **understand why those technologies and techniques were used**. Whether the application uses Kafka or RabbitMQ doesn't matter, but the fact that a queue is used for reliability is key.

## Is this the right approach?

I don't think an interview that relies only on pattern matching is ideal, though it's not completely unfounded either.

Interviewers often talk about assessing a candidate's problem solving skills. There's the type of interview where you're expected to not come up with a perfect solution, but to think through a hard problem from the ground up. To some extent, that type of interview is more reflective of a software developer's day to day work. But some amount of pattern matching is important for any senior engineer, whose past experience plays a large part in making solid technical decisions.

Still, regardless of what interview style is ideal, pattern matching will still help you succeed in the types of interviews you'll encounter _in practice_.

---

Real-world development is done collaboratively over the course of weeks, months and years. Interviews need to evaluate candidates in a matter of hours. For that reason, candidates benefit from pattern matching problems to common techniques. By quickly recognizing the type of problem and what techniques are applicable, you can demonstrate to the interviewer you're going in the right direction early on. Then, you can spend the rest of your time focusing on the particulars of the given problem.
