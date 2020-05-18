---
title: "The balanced parentheses problem"
layout: edition
---

<figure id="cover-img" markdown="1">
![A person balancing on a balance board, as training before surfing.](/assets/images/posts/2020-02-17-the-balanced-parentheses-problem.jpg)
<figcaption markdown="1">Photo by [Gustavo Torres](https://unsplash.com/@topspot) on [Unsplash](https://unsplash.com/photos/rBLTWS3WsQ8)
</figcaption>
</figure>

Let's talk about an algorithmic problem I encountered some years ago. Regardless of how I feel about its suitability in a technical interview, this problem does have some interesting characteristics that make it worth discussing.

The problem comes in three parts, where you need to solve each part before moving onto the next:

1. Given a string containing only parentheses `(` and `)`, determine if the parentheses are balanced. That is, is each opening parenthesis closed, in the correct order?

1. Determine if a string is balanced if it contains _three_ types of delimiters: `(`, `)`, `[`, `]`, `{` and `}`. The same rules apply: delimiters must be paired up in the correct order.

1. Finally, determine if a string is balanced of it can contain delimiter pairs specified by the user. For example, the user might say `a` is an open delimiter, closed by `A`, and so on.

The last one has a bit of a trick. [I wrote up a full analysis of this problem on avikdas.com.](https://avikdas.com/2020/01/28/the-balanced-parentheses-problem.html) Try the problem yourself before seeing how I would approach it. Part two is available [on LeetCode](https://leetcode.com/problems/valid-parentheses/description/) if you want to try it there.

Instead of going into the solution in this newsletter, I'll cover what an interviewer is looking for, and how you can meet those expectations.

## Clarifying requirements

Before even thinking about potential solutions, clarify the problem. Interviewers often leave a problem under-specified to see how a candidate deals with ambiguity. This is because, when solving real-world problems, we don't have all the requirements up front and we have to gather them before proceeding.

For this problem, I recommend you write out a few examples strings, some that are balanced and some that are not. Edges cases are particularly important to clarify: is an empty string balanced? Do this for each stage of the problem. Here, you don't have to be exhaustive about your examples. Just show two or three cases for each stage to show you understand the problem.

## Find the simplest solution

As I mentioned in my blog, the solution for the last stage of the problem can be used to solve the previous two stages. However, for each stage of the problem, you should solve the problem as simply as possible.

Doing so makes it easier to have _some_ working solution. In any interview problem, while it's best to have the intended solution, it's still better to have something functional over nothing at all.

Additionally, as the problem progresses in complexity, you can demonstrate you can identify when it's necessary to introduce complexity in your solutions. As a corollary, this shows you don't introduce complexity prematurely.

## Test your solutions

As soon as you have some code, work through the code with some test cases. Think about code reviews: it's okay to have your teammates point out bugs in your code, but you should do your due diligence to test your code thoroughly _before_ putting your code up for review.

An interviewer has seen a problem solved many times by different candidates, so they can spot common mistakes quickly. As a candidate, you are likely to make small mistakes due to being on the spot, but that's not a point against you. What really matters is how you discover those mistakes, and how you fix them.

For a problem like this, start by coming up with test cases. You should already have a few from the requirement gathering phase, but this time, make sure you cover the various categories of inputs relevant to the problem. For example, for the first phase, you'd check an empty string, a balanced string, a string with too many open parentheses, a string with two many closing parentheses, and so on.

If you're working through this problem on a whiteboard, take these test cases and run through your code line by line. This makes it easy to find off-by-one errors or missing edge case handling. If you find these bugs before the interviewer guides you to them, that's a point in your favor.

----

The balanced parentheses is fairly typical algorithmic problem. Solving it well doesn't only mean you wrote working code, but that you clarified the requirements, found simple solutions and tested your solutions on your own.

Interviewers: did I forget anything else you would like to see from candidates? Would you even use this problem on interview? Let me know!
