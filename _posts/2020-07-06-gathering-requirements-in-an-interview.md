---
title: "Gathering requirements in an interview"
layout: edition
tags: candidates
---

<figure id="cover-img" markdown="1">
![Abstract swirls of blue and red](/assets/images/posts/2020-07-06-gathering-requirements-in-an-interview.jpg)
<figcaption markdown="1">Interview problems are often abstract on purpose. <span>Photo by [Lucas Benjamin](https://unsplash.com/@aznbokchoy?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/s/photos/abstract?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)
</figcaption>
</figure>

Recently, I've been writing a lot about interviewing from the company's perspective, so let's switch gears to some tips for candidates. As a candidate, **you need to gather and clarify requirements early in an interview**, to ensure you're answering the right question.

A common strategy in interviews is to leave the question open-ended, to see how you approach under-specified problems. It's still [the responsibility of the interviewer to clearly state their expectations]({% post_url 2020-03-02-are-you-asking-candidates-to-read-your-mind %}), and that includes being up-front about the problem being open-ended. That said, it's generally expected you ask questions early on.

## Edge cases

The most common vagueness in a problem is in the edge cases. As a classic example, let's consider [the Valid Number problem](https://leetcode.com/problems/valid-number/). You should ask about the following:

- What constitutes a valid number? Are decimals allowed? Exponential notation?

- As a follow up to the above, how should spaces be handled in the input? Is `" 1"` a valid number?

- Is an empty string a valid number?

These are the types of questions you should clarify before diving into the implementation.

## Making trade-offs

Another requirement that's often under-specified is which trade-offs you need to make. Let's say you're asked to implement a data structure with two methods: inserting data and querying data. (A common example is storing numeric data, then returning the smallest data points when querying.)

Given the initial requirements, there are two possibilities:

1. Data is frequently added and less frequently queried. This means adding data has to be fast. In fact, a typical approach is to throw the data into a fairly unstructured data structure (like a list) when adding, only processing it when querying.

1. Data is rarely added and frequently queried. Perhaps most of the data collection happens early on, then the data is only queried going forward. You want to take the hit of slowing down the data collection by entering that data into a structured container, like a binary tree or heap. Saving work between queries is crucial.

Each approach optimizes for a different access pattern, which is something engineers have to do all the time in their work. Clarifying what you're optimizing for demonstrates your ability to think in terms of the product.

In general, with multiple competing approaches, it's good to clarify which approach the interviewer wants to see. Not only does that ensure you demonstrate exactly the skills the interviewer is evaluating, but it also shows the breadth of your problem-solving.

---

While interviewers should be up-front with their evaluation criteria, it's still effective for interviewers to leave a problem under-specified in order to evaluate your critical thinking abilities. For this reason, as well as to work around bad interviewers who are not clear about their expectations, asking questions early on is important. Most importantly, asking for clarification is not a sign of weakness.
