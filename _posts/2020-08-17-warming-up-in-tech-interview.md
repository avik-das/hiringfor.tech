---
title: "Warming up in a tech interview"
layout: edition
tags: interviewers
---

<figure id="cover-img" markdown="1">
![A man stretching by sitting and holding his feet in front of him.](/assets/images/posts/2020-08-17-warming-up-in-a-tech-interview.jpg)
<figcaption markdown="1">Warmups help get our body ready for exercise, whether that's physical or mental. Photo by [Scott Broome](https://unsplash.com/@scottbroomephotography?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/s/photos/stretch?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)
</figcaption>
</figure>

A recent paper, [_Does Stress Impact Technical Interview Performance?_](https://chrisparnin.me/pdf/stress_FSE_20.pdf) (which I covered [a few weeks ago]({% post_url 2020-08-03-reducing-interview-stress-with-independent-work %})) offered the following advice:

> To reduce stress, provide the candidate with a warmup exercise [...] to familiarize themselves with the interview setting, experience the interview format, and ask questions

The paper further suggests "the warmup interview should be conducted by an interviewer who does not score the candidate." While I haven't seen any interview go as far as to have a completely separate warmup interview, I've seen a warmup question be put to good use.

## Why a warmup question?

Every interview is different, even when companies take inspiration from one another. I remember the first time I went to a startup, where the typically whiteboard interview was replaced by a small project. Even when I encountered the same format, the demeanor of the interviewers or the general culture of the company had me wondering how the interview would go.

A warmup question allows candidates to practice working with interviewers with less pressure:

- The candidate thinks about how to communicate with the interviewer, instead of being stumped on a hard problem from the get-go. Later in the interview, the focus shifts to the problems because the communication has been worked out.

- Once the candidate finishes the warmup, they also feel comfortable, knowing they are capable of succeeding in this particular interview. An early failure can demoralize candidates and make them perform worse than they are capable of.

Ensuring the warmup is conducted by someone not scoring the candidate probably also reduces stress, but switching interviewers too often can have the opposite effect. I'd love to see more research on this area.

## What makes a good warmup question?

**For a warmup question to reduce stress, the question needs to be less stressful!** That seems obvious, but I've seen warmup questions basically be gotchas: regurgitation of library functions and trivia from college. The goal of the warmup is to make the _candidate_ feel good about themselves, so they can showcase their strengths going forward.

To that end, the warmup should have a couple of properties:

- **Design the warmup question to be solved.** The solution should be straightforward, without too many edge cases. For example, if going through the input element by element sounds like a good option, that should be an acceptable solution.

- **Accept simple solutions.** Even if there is a more performant solution, accept the simpler solution. As usual, [make it clear you're looking for the simplest solution]({% post_url 2020-03-02-are-you-asking-candidates-to-read-your-mind %}), then stick to that expectation.

- **Declare success early.** Since the goal is to boost the candidate's confidence, make it clear a simple solution, when implemented, is considered success. If you're going to ask follow-up questions, that's fine, but a candidate who knows they've completed one problem successfully will be more confident than someone who thinks they're still working on the first problem.

## Warmups for different types of interviews

My experience with warmup questions has been in interviews that ask a series of independent questions over the course of the interview. For example, there may be a few algorithm questions, a systems design question, etc. For that style, a warmup question fits in naturally. A small list-manipulation question, for example, works well.

But in my experience, I haven't seen project interviews use warmups at all. That includes the interviews I conducted.

I don't have a good answer to how to incorporate warmups to projects (especially when you leave candidates to work on their own). However, I might break down the problem into an easily completed initial task. For example, if the project is to create a small REST API, the first task may be to get _any_ web server up and running. This is another area where I would love to hear other people's experience.

---

Part of allowing candidates to show their strengths is presenting them with a success early on. This gets candidates comfortable with the interview format and boosts their confidence. But, this only works if the interviewer is actually trying to present the candidate with an early success, instead of starting off with gotchas.
