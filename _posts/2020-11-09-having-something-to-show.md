---
title: "Having something to show"
layout: edition
---

<figure id="cover-img" markdown="1">
![A notebook on a wooden table, with pencils around the notebook. The page is blank.](/assets/images/posts/2020-11-09-having-something-to-show.jpg)
<figcaption markdown="1">Avoid a blank canvas at the end of the interview. Photo by [KOBU Agency](https://unsplash.com/@kobuagency?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/s/photos/drawing?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)
</figcaption>
</figure>

In my [last article about trick questions]({% post_url 2020-11-02-trick-questions-and-partial-answers %}), I talked about how certain interview questions don't build up from straightforward answers to more complex ones. Either you get the trick, or you don't. But what do you do if you, as a candidate, are faced with this type of question?

The key is, no matter how poorly you think you're doing, **have something to show at the end of the interview**.

## Keep it stupid simple

One of the worst mistakes I made in an interview was to completely fail in finding a solution. The problem involved subsequences of a string, and my instinct told me to try using dynamic programming. Unfortunately, I couldn't figure out the recurrence relation in time, and I stumbled.

What I should have done is at least try for the brute force solution. I doubt the solution is what was expected, but at least I would have solved the problem. In fact, doing so may have even yielded some insight.

Similarly, in the "maximum contiguous subarray sum" problem from the last article, it's a good idea to show you can formulate the quadratic time naive solution. Again, this isn't what the interviewer is looking for. It may be that failing to find the linear time solution is equivalent to not finding any solution in the interviewer's mind, but the quadratic time solution won't be worse than no solution. It's even possible solving the problem provides some other signals to the interviewer, like your ability to write down code that expresses an algorithm.

## Show your work

When it comes to trick questions, it's entirely possible to not work out the intended solution. There are obvious ways to prepare, like doing as many Leetcode-style problems as possible, but at the moment of the interview, there's not much you can do.

But along the way, you should be writing down key pieces of your thought process. Good things to write down are:

- Example inputs and outputs, especially ones that cover tricky edge cases.

- Progression of any algorithms you can think of. This may include showing how the state of your program evolves over time. For example, when working with recursive algorithms, you can write down how the input changes from one recursive call to another.

- A catalog of your attempts. For example, maybe your first attempt at an algorithm didn't find the right answer for certain inputs. Did you write down the inputs that did and didn't work with that algorithm?

At the end of the interview, you want to have a written record of what you actually worked on.

---

When faced with a hard problem, aim to have at least one solution written down, even if it's not the one the interviewer is looking for. Failing that, make sure to document what you did try.

A good interview should not present you with trick questions. But if you're in that situation, it doesn't hurt to show you won't take defeat lying down.
