---
title: "The project interview"
layout: edition
---

<figure id="cover-img" markdown="1">
![A blueprint, with a pencil and a ruler laid on top.](/assets/images/posts/2020-05-04-the-project-interview.jpg)
<figcaption markdown="1">Engineers will work on projects, so why not hire them based on projects? Image by [Wokandapix](https://pixabay.com/users/Wokandapix-614097/?utm_source=link-attribution&utm_medium=referral&utm_campaign=image&utm_content=964629) from [Pixabay](https://pixabay.com/?utm_source=link-attribution&utm_medium=referral&utm_campaign=image&utm_content=964629)
</figcaption>
</figure>

The first time I interviewed at a startup, I encountered a type of interview I wish I had seen before. Instead of solving an algorithmic problem at a whiteboard, I coded a small project end-to-end. This required me to gather product requirements, translate them to a technical solution and finally write the code to implement that solution.

In last week's article, my guest Vinicius [talked about live coding problems and their advantages]({% post_url 2020-04-27-dissecting-the-frontend-interview %}). Today, I want to deep-dive into these "project" interviews and how to run them effectively.

## Effective project interviews

Properly executed project interviews have some serious advantages over algorithm questions:

- The candidate gets to work on their own laptop. This lets them their favorite tools, instead of forcing them to use unfamiliar and artificially limited ones. (Though, you should probably have the option of providing equipment in order to be inclusive.)

- The candidate has access to documentation. Imagine coding without resources like StackOverflow, or at least _some_ documentation. Not ideal. Besides, external resources don't mean copying and pasting. It means solving more interesting problems.

- Most importantly, the candidate won't be solving isolated algorithm questions day to day. So you should evaluate them on what they'll actually do: solve business problems through software.

## Picking the right project

I've talked before about tailoring the interview to the candidate's strengths. A project interview is very flexible, because there are many types of projects you can ask the candidate to work on:

- When I was at a startup making my first technical hire, the job required lots of odds and ends. My first week at the job, I read up on [the Java class file format](https://docs.oracle.com/javase/specs/jvms/se8/html/jvms-4.html) and wrote a parser for it (part of the product was static code analysis). I decided to ask candidates to do exactly that! At least no one could say that interview question was irrelevant for the job.

- For small companies where you're expecting full stack engineers who can own a project from ideation to implementation, creating a web or mobile app end-to-end is a very typical job requirement. Ask the candidate to do that.

- For candidates who are more specialized, say a front-end expert, emphasize that part of the stack. For example, have them implement a mobile app that connects to an existing server you've set up.

All of these problems have a downside. At a big company, engineers usually work with existing codebases. They may understand in detail how a server works, but they haven't actually set up a server from scratch recently. For these candidates, you can provide some skeleton code. Just be sure to tell the candidate what they should have installed on their laptop ahead of time to run that skeleton code.

## Project interviews in a remote-first world

With COVID-19 pushing companies into remote work, figuring out how to hire without a physical onsite has become a hot topic. What's great about project interviews is both system design and implementation happens on a computer. The interviewer can follow along by having the candidate share their screen.

Yes, whiteboarding is a useful tool when designing a system, and that's still not a solved problem in a remote setup. But the project interview lets the candidate demonstrate the full design of a system by actually building that system!

---

Whether it's coding ability, system design, or product requirement gathering that you're looking for, a small, scoped project can help you evaluate all of those. Favor real-world coding over artificial problems.

The part I haven't covered today is whether to implement the project interview via a take-home or with live pairing. For now, I'll say go with pairing, as that shows you're willing to spend as much time on the interview as the candidate. But as with everything, there are nuances I'll cover in a later article.
