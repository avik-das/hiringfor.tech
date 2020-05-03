---
title: "System design practice: designing a payment system"
layout: edition
---

<figure markdown="1">
![Five rubber ducks, each with different decorations, lined up behind each other](/assets/images/posts/2020-05-11-system-design-practice-designing-a-payment-system.jpg)
<figcaption markdown="1">A queue is central to a robust payment system. Image by [Alexas_Fotos](https://pixabay.com/users/Alexas_Fotos-686414/?utm_source=link-attribution&utm_medium=referral&utm_campaign=image&utm_content=3412065) from [Pixabay](https://pixabay.com/?utm_source=link-attribution&utm_medium=referral&utm_campaign=image&utm_content=3412065)
</figcaption>
</figure>

As usual: it can be hard to get experience designing complex systems if you don't previously have that experience, especially if you're unfamiliar with the relevant business domain. Today, I want to break down how to design a payment system, a system design interview problem you may encounter.

The problem is as follows: design a payment system in which users authorize payments (typically when buying a product), and the system interfaces with external payment processors like Visa to complete the payment.

## A queue-based architecture

Payment systems demand high reliability, because the consequences of not making payments users requested or charging users multiple times is too high. To achieve this reliability, the system puts a "payment task" onto a queue that is processed asynchronously.

The central piece of this architecture is detailed on [my deep-dive on the reliability queue](https://avikdas.com/2020/05/11/scalability-concepts-the-reliability-queue.html). With that in mind, I'll talk about how to put it all together:

1. The front-end service accepts a user's payment request. The first order of business is to set up a record in a database that says the user's request has been received and payment is pending. The record is what will be used to communicate with the user what the status of the payment is.

1. The front-end service also puts a message on the payment queue with the following information: a reference to the newly-created database record, and any details about the payment (which credit card to use, the amount, etc.). If either this step or the previous one failed, the user is immediately notified.

1. An asynchronous processor reads from the queue, processing individual payment tasks. The processing is idempotent and crash-tolerant as described in my blog post. The primary objective of the processing is to make the payment using the external payment service (like Visa) and update the user's payment database record based on the result.

1. Once the payment goes through or fails in a non-recoverable way (e.g. the external service rejects the payment due to insufficient funds), the asynchronous processor notifies the user. Typically, this would be by sending an email to the user.

These pieces comprise the central flow of the payments system, in which a user requests a payment and the payment is made via an external service. The central flow, when implemented this way, provides reliability and fault-tolerance, but there are many missing pieces. For example, legal compliance may require auditing capabilities.

I’m not familiar enough with the business domain to flesh out the rest of the system (so I would probably not do well on this problem), but I know enough to say the queue-based design is an important part of this architecture.
