---
title: "Are you asking candidates to read your mind?"
layout: edition
---

<figure id="cover-img" markdown="1">
![A red neon window sign with the word "Psychic"](/assets/images/posts/2020-03-02-are-you-asking-candidates-to-read-your-mind.jpg)
<figcaption markdown="1">Maybe more interviews should look for candidates here. Photo by [Mark de Jong](https://unsplash.com/@mrmarkdejong?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/@mrmarkdejong?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)
</figcaption>
</figure>

Recently, a reader told about me their interview experience. They successfully completed all the problems in the interview, only to get rejected. The feedback was that they jumped into the code too quickly. The problem is it wasn't clear that was one of the evaluation criteria.

One reason interviewing is so antagonistic is because candidates have to read the interviewer's mind. There are common themes in every interview, like needing to show you can solve problems, but each interview also has its own flavor. Interviewers need to set clear expectations so the candidate knows what skills, out of many, they need to demonstrate. Let's look at two examples.

## Algorithms and code

You're asked to solve a coding challenge. Nothing out of the ordinary, and you think you're doing fine. But as you write down some code, the interviewer keeps interjecting to ask you trivia about the code. "How would you do this do this with the Java standard library?" "Can you write this part using Python list comprehensions?"

And this whole time, you thought you were trying to convey the _algorithm_, not your knowledge of a programming language.

Or the opposite happens. You're worried about syntax errors or not knowing what classes are available in a language's standard library. But your interviewer cares more about how you solve a problem, and would be happy to tell you exactly what method does what you want, if you just ask.

The problem is the interviewer didn't make it clear what kind of interview they were conducting.

I often start a phone interview with a warm up question to make the candidate feel comfortable. This entails telling them, "I'm not looking for an optimal solution, just _some_ solution that you can code up in a few minutes." For any question where they may need a data structure, I tell them they can assume standard data structures exist in the language, as long as they define verbally what the data structure is. My philosophy: "I'll be your Javadoc!"

## The past project walkthrough

One example I've seen is a technical experience and communication interview. The prompt is something like, "Tell me about a complex project you worked on, and walk me through the technical details of that project." Think about all the different skills you can learn about from the answer to this question:

- How well does the candidate communicate complex ideas, like the architecture of a large, distributed system? Here, you don't care if the architecture is not the best, because maybe the candidate inherited a legacy application. What you care about is how they communicate the existing complexity.

- How did the candidate _solve_ complex problems, including paying off the technical debt left in a legacy application? Are their architecture skills up to par?

- How does the candidate trade off technical and business requirements, including taking on technical debt? In this case, too much technical detail may be negative, and the interviewer wants to see more emphasis on the business considerations.

It's not enough to have encountered this type of interview. Each company will look at the problem with a different lens. Depending on which variant of the question I encounter, I would pick completely different projects!

A good interviewer states exactly which aspect of the candidate's ability they are evaluating, and what kind of answer they want to hear. "We're looking for technical detail, like the structure of your application, which technologies you used, data models, etc. We're not evaluating the design itself, but how well you explain it."

## Help! My interviewer wants me to read their mind!

If your interviewer doesn't explicitly state what they are evaluating up front, congratulations, you got yourself a bad interviewer. And whether you get hired or not depends on them! What do you do?

**Ask.**

Ask in no uncertain terms what the interviewer is evaluating. Ask if they want you to spend more time on the code implementation, or should you focus on designing the algorithm. Ask if you should talk about technical details or explain something at a high-level.

(And for those wondering, it's okay to leave a problem under-specified in order to see how candidates clarify requirements. But you _have_ to be upfront that's what you're evaluating!)

----

I've been on both sides of the interview. It's extremely frustrating to think you did well on an interview, only to find out the interview was evaluating you on a different axis. Or failing to connect with your interviewer because every time you answer the question, you didn't do it in the way they wanted.

On the other side, there were times I wasn’t clear about expectations. The result is having to course correct the candidate halfway through the interview, leading to the candidate not finishing the problem (I always accounted for this in their feedback). All of which could have been avoided if the candidate just knew what I wanted.

If you're interviewing candidates, **be upfront with your expectations, course correct them if they're misunderstanding, and don't expect them to read your mind**.
