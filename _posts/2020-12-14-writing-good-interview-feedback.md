---
title: "Writing good interview feedback"
layout: edition
tags: interviewers
---

<figure id="cover-img" markdown="1">
![A notebook with a pen and some writing on the page.](/assets/images/posts/2020-12-14-writing-good-interview-feedback.jpg)
<figcaption markdown="1">Written interview feedback is crucial for the hiring process. Photo by [Aaron Burden](https://unsplash.com/@aaronburden?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/s/photos/journal?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)
</figcaption>
</figure>

I already talked about [what to do before interviewing a candidate]({% post_url 2020-12-07-getting-to-know-the-candidate-before-the-interview %}), but what about after the interview? Whether you're part of a large company or a small startup, **writing down your post-interview feedback is a crucial part of the hiring process**. But why do we write feedback, and how can you write the most effective feedback?

## How feedback fits into the hiring pipeline

Unless you're a founder looking for a co-founder or a first employee, you have multiple employees interview one candidate. Typically, each engineer will assess a different part of the candidate's skill set, whether that be different parts of [a single project]({% post_url 2020-05-04-the-project-interview %}) or different areas like algorithms and system design.

First and foremost, an interviewer's feedback allows others to understand how the candidate did throughout the entire interview. Since each interviewer only assessed the candidate for a limited time, the feedback is what consolidates the different assessments into a full picture of the candidate. This is, of course, useful when making the hire/no-hire decision. But, even when going from a phone screen to an onsite, seeing the feedback from the phone screen can help the onsite interviewers understand what they should focus on.

(As a side note: while the feedback can be useful between interview rounds, feedback should not be used to bias interviewers within the same round of interviews. For that reason, the feedback can be recorded promptly, but should only be shared when the group comes together to make a decision from that round.)

Feedback is also an immutable record of what happened in the interview. This comes in handy not only when other stakeholders in the hiring pipeline, like a hiring committee, makes decisions on a candidate, but also to remind you of the interview if you're involved in later discussions. This information is also important for compliance purposes, to minimize bias in the process.

## What goes into good feedback

When writing your feedback, keep the above goals in mind. Some tips to help you:

- **Record objective facts.** What algorithms or solutions did the candidate come up with? What attempts did they make, and how long did they take overall? What trade-offs did they make? While your evaluation is needed, what happened in the interview is the basis of that evaluation.

- **Mention your part in the interview.** Record how much help you gave, but also, which questions you asked, including which follow ups you used. When making a final decision, understanding how the interviewer affected the candidate's performance helps account for bias.

- **Make a recommendation for your part of the interview.** Suppose you did a system design interview. Make a call about whether the candidate met the bar for system design, regardless of how the candidate performs on the other portions. The final decision makers need clear assessments of each part to paint a holistic picture of the candidate.

- **Don't sit on the fence.** Being non-committal passes the responsibility of evaluating the candidate to someone else, often someone who hasn't assessed the candidate in the area you have. If the candidate is truly borderline, say what you would need (a second round of interviews focusing on area X, above average performance in area Y, etc.) to recommend hiring them.

- **Be complete, but stick to the main points.** If your company is rapidly hiring, there are a lot of candidates to evaluate. But even if you're only hiring a few people, it's still good to practice distilling your assessment down to the relevant details.

- **Write your feedback soon after the interview.** Since feedback is a record of what happened in the interview, you want that record to be as faithful as possible.

## Sample feedback

Your company may have a template for you to follow, but generally, good feedback will look like the following (assuming [the URL shortener problem]({% post_url 2020-03-23-system-design-practice-distributed-id-generation %})):

> **System design interview - URL shortener.** I gave this problem because the candidate has experience with distributed databases. The candidate clarified requirements, such as what the expected size of a short URL should be, and whether the application would be read or write-focused.
>
> The candidate started with a simple one database node solution using a key-value database backing the application. This solution used a lock in the database to avoid conflicts. When I asked about horizontal scaling of the database, the candidate first considered a centralized ID generator, but with some prodding, was able to come up with a partition key embedded in the ID.
>
> This allowed the solution to scale across geographies, when I brought this up. The candidate also clarified the need for strong consistency at this point, which we decided was not needed.
>
> **Overall:** the candidate is able to think through complex systems, clarifying requirements early and considering the trade-offs of different solutions. Given their experience, I would have expected them to already have considered horizontal scaling, but they were also able to come up with a solution to that problem with some thought. Recommended hire.

This feedback records the main points, provides an assessment and finally gives a clear recommendation.

## Providing feedback to the candidate

This is probably the most controversial piece of the puzzle, one that warrants its own article. But to keep the discussion short, if you are going to provide feedback directly to the candidate, the written feedback used internally is a useful starting point for responding to the candidate. While the written feedback is meant to to be used internally, it's still useful to have a record of what happened in the interview and why no-hire recommendations were made.

---

The post-interview feedback process is one that doesn't affect the candidate's interviewing experience, but is still crucial to the hiring process. While not a complete solution, writing an objective record of the interview process along with justified recommendations for the candidate mean the difference between making a well-informed decision and going with a gut feeling.
