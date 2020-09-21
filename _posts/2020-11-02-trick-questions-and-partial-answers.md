---
title: "Trick questions and partial answers"
layout: edition
---

<figure id="cover-img" markdown="1">
![A motocross rider performing an aerial trick.](/assets/images/posts/2020-11-02-trick-questions-and-partial-answers.jpg)
<figcaption markdown="1">Maybe tricks are best left to sports and entertainment. Photo by [Web Donut](https://unsplash.com/@webdonut?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/s/photos/trick?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)
</figcaption>
</figure>

The least insightful type of interview problem I've seen is the type that has one correct answer, and no partial solutions along the way. In my experience, it's not so much the problem can only be solved in one way, but there's only one _acceptable_ solution.

Today, I want to give a few examples of such trick questions, and why they don't give much insight into the candidate's technical abilities.

## Maximum contiguous subarray sum

**Problem:** given an array of integers, find the maximum sum of consecutive elements. For example, given the array of integers:

```
-2  -3   4  -1  -2   1   5  -3
         |---------------|
```

The maximum contiguous sum is 7, given by the subarray `4, -1, -2, 1, 5`.

The brute force solution considers every pair of indices, computing the sum of the elements in between those indices and taking the maximum such sum. This approach takes quadratic time because that's how many distinct pairs of indices there are.

However, this problem is meant to be solved in linear time. [There's an elegant solution to doing so.](https://www.geeksforgeeks.org/largest-sum-contiguous-subarray/) The _trick_ is that whenever your contiguous sum so far dips below zero, you should start a new contiguous sum instead of trying to continue the previous one. Try to convince yourself this is true.

The problem is that the quadratic time solution won't be acceptable in any large tech company interview. Essentially, you have to know or discover the trick, or else you have nothing to show.

## Product array without division

Given an array of numbers, produce a new array where each element is the product of all elements in the original array except the current one. For example:

```
 INPUT:  10    3    5    6    2
OUTPUT: 180  600  360  300  900
```

The catch is: do this without using division.

Actually, the restriction to not use division ends up making your life easier. If you try to use division, you'll have to think about what happens when there's one or more zeros in the input, complicating your solution. But, to find the actual solution, you'll have to know the _trick_ of [creating running prefix and suffix products](https://www.geeksforgeeks.org/a-product-array-puzzle/).

## You get it or you don't

The problem with these types of trick questions---aside from their obvious lack of application to day-to-day software engineering---is they don't allow room for error. Until the candidate figures out the trick, they have nothing to show. Even if there's a sub-optimal solution, if that solution is not an acceptable answer, it might as well not be a solution at all.

As an interviewer, you don't actually get much insight from this type of problem. Perhaps the candidate has seen this trick before, in which case you didn't really test their problem solving. Or, perhaps the candidate is great at trading off storage and computation time in real-world systems, but they just couldn't figure out this trick. Either way, the outcome of the interview doesn't correlate with the candidate's technical ability.

## So what can we do?

I'll fall back to my usual suggestion of using [a project interview]({% post_url 2020-05-04-the-project-interview %}). This type of problem lends itself to multiple approaches, and the candidate can build right up to their level of expertise gradually. No matter what the candidate does, you'll have found out quite a bit about the candidate.

Aside from a project interview, look for problems that have multiple solutions. And just as importantly, make sure sub-optimal solutions count for something. You can try to push candidates toward the optimal solution, but if the candidate can't find the trick, their ability to solve the problem at all should be a useful, positive signal. Though, at this point, consider if the optimal solution is even worth anything in the first place.

---

Problems that don't build up gradually, specifically ones that depend on knowing or discovering a trick, are frustrating for the candidate and provide a low-quality signal to the interviewer. Consider instead open-ended questions, like a project interview, that allows the candidate to show their strengths.
