---
title: "Acing the system design interview"
layout: edition
tags: candidates
---

<figure id="cover-img" markdown="1">
![A busy container port at night, with hundreds, maybe thousands of containers](/assets/images/posts/2022-01-10-acing-the-system-design-interview.jpg)
<figcaption markdown="1">A complex system has many parts working together. Image by [Timelab Pro](https://unsplash.com/@timelabpro?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) from [Unsplash](https://unsplash.com/s/photos/shipping?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)
</figcaption>
</figure>

It's been a while since I last wrote, but in the last year, I've done a lot of system design interviews. I really like these interviews, even if they could use some improvement, because they can closely resemble work I really do and are open-ended enough to allow candidates to play to their strengths.

Based on interviewing many candidates, I've compiled a few important tips to make sure you're giving interviewers exactly the signals they need to evaluate your strengths. System design is a skill that requires experience, but for those who are experienced, that skill should be something they are utilizing in their daily work anyway. What follows is a checklist to combat interview nerves and showcase your experience in that one hour.

## Gather functional and non-functional requirements

I talked about [gathering requirements]({% post_url 2020-07-06-gathering-requirements-in-an-interview %}) before, but doing so is especially important for system design interviews. Unlike a constrained algorithm, a large system has many more areas where you can make different decisions based on your requirements. There are two types of requirements you should be clarifying:

- **Functional requirements**: what should the system actually _do_? For example, when [designing a URL shortener]({% post_url 2020-03-23-system-design-practice-distributed-id-generation %}), one important question to ask is if we want to support reverse lookups (from a long URL to an existing short URL), or if you can tolerate the same long URL being shortened in two different ways. This is where you understand how users will actually interact with the system.

- **Non-functional requirements**: how the system behaves technically. You'll want to understand the scale of the system (number of users, simultaneous requests, amount of data being processed or stored). Another common factor to clarify is expected latency, especially end-to-end latency for the entire system, which can include read-after-write consistency requirements.

It's okay to dive into some of these requirements during the design of your system, as you figure out what trade-offs you're being forced to make. However, the more experienced you are, the more of these requirements you can recognize up front and therefore, your experience level comes through in this portion of the interview.

But whatever you do, don't dive straight into a design. Figure out what you're designing first.

## Present an end-to-end solution

The biggest issue I see is when candidates go into too much detail in some parts of their architecture, and at the end of the interview, they don't have an end-to-end solution. Maybe they focused too much on the data storage and hand-waved over how the data is processed. Or they never talked about how the data, or even what data, actually ends up in their system.

If nothing else, make sure you have a high-level block diagram that clearly presents all the different components of your proposed system. Most solutions will consist of these common pieces:

- Data sources: application servers, client devices, etc.
- Data stores: relational, time series and key-value databases, in-memory caches, etc.
- Data transport: message queues, REST APIs, etc.
- Data processing : where the processing happens, what data is needed and what the processing does.
- Auxiliary services if they make sense: firewalls, load balancers, etc. In the problems I give, these are usually a given and not necessary to mention, but they may be central to other applications.

Notice the heavy emphasis on _data_. This is because in most large-scale systems, at least in my experience, the data is at the heart of the system. Everything about the system, the different pieces and how they tie together, exist to make sure the data can flow through the system and get processed in a way that's valuable for your users.

## Use industry-standard terminology

The specific technologies and terminology your company uses is sometimes unique, often driven by the specific needs of its history. But underlying that uniqueness is a common set of patterns your company applies, and those patterns are the language you share with the interviewer. Reference those patterns.

For example, feel free to name drop Kafka or Amazon SQS if that's what you're comfortable with, but mention that you want a message queue configured as a pub/sub system. This approach has many advantages:

- If the interviewer doesn't know the same technologies as you (though they should know the big ones), you have a common language.
- You show you understand exactly the functionality your proposed system needs, since the same technology can often be used for multiple reasons.
- And finally, it shows that regardless of your background, you have sufficient general knowledge to translate your experience to your new role, where you may be using different technologies.

Naming a specific technology is great to show you have real-world experience, but still make sure to reference the underlying patterns.

The same goes for company-specific terminology. If you and the interviewer interpret the same words as different concepts, you'll have a lot of miscommunication. (Interestingly, all of this can apply when working with other teams at a big company!)

## Explain what problems you're solving with your choices

I have historically thought of this as presenting trade-offs, but I found candidates often spend too much time detailing alternate solutions instead of committing to a specific proposal. Still, trade-offs are an important part of designing large systems, so it's important you explain what problems each of your choices solves.

For example, if you decided to incorporate a message queue into your design, you can say that you're willing to take the hit to processing time (the processing is no longer on-demand, but when the queue consumer gets to that piece of data) in order to ensure every piece of data is processed reliably, without worrying about race conditions between processing of related data. Or if you incorporate a key-value store, you can say you want low latency reads for individual items, and you don't need to do any other queries based on the functional requirements you gathered earlier.

Saying this much and moving on shows you made your choices deliberately and with a clear understanding of both the problem and solution spaces, all while sticking to a unified narrative about your proposed system.

## Be ready to deep dive into your areas of expertise

It should be acceptable to not have deep expertise in all areas of the system (though I know not all interviewers are so accommodating), but if the interviewer chose the problem based on your background, there should be areas you have experience in. In particular, you want to make sure you can talk intelligently about any piece of the system that aligns with your previous work, especially if that piece is prominently mentioned on your resume.

Did you say you worked on a streaming architecture for processing data? You should be able to talk about message queues, mention technologies like Apache Spark or Samza (or whatever technologies you used before), the trade-offs between stream processing and online or offline data processing, etc. If you've worked extensively with data storage, you should be able to talk about sharding, database choices, disk-based persistent vs. in-memory caching, etc.

This is another area where your knowledge is expected to be broader the more experienced you are. If you're senior enough, you should be able to talk about the different areas I mentioned above at least at a high level. Those are fairly standard concepts in software engineering that come up in many large-scale systems.

## Talk about productionizing the system

Finally--and this is the part inexperienced people trip up on--talk about getting the system to production. Hopefully [your interviewer clearly asked for this]({% post_url 2020-03-02-are-you-asking-candidates-to-read-your-mind %}) when presenting the problem, but if not, make sure you clarify if this part is something you need to talk about.

This is where you talk about monitoring and logging, error handling (though some of that may have come up earlier), gradual rollouts to address concerns like cache warmup periods, graceful degradation in case of unexpected traffic spikes, etc. Specifically, monitoring and error handling are two areas _every_ system deals with, so I would lead with those.

This part of the interview is where you show you not only can design a theoretical system, but you have the real-world experience to know what problems such a system will encounter in production. If I were to make you a tech lead, would I have the confidence you'll think about these concerns _before_ we launch? It's also a reason why you need to be streamlined about the overall system design, so you have time to address this section.

---

The last tip I have is minor, but it's worth a quick mention: be ready to show your design as you build it. If you're doing the interview in person, be prepared to draw out block diagrams on the whiteboard. If the interview is virtual, pick a drawing tool and practice with it. That could even mean getting your own whiteboard for yourself! Just make sure it's visible from your camera.

---

When done correctly, system design gives you, the experienced engineer, an opportunity to showcase (at least a subset of) your skills as a technical lead for a project. However, since you're trying to fit in your experience into just one hour, having a script for the interview means you can show exactly the skills that inspire confidence in your abilities.
