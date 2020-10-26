---
title: "My resources for dynamic programming"
layout: edition
---

<figure id="cover-img" markdown="1">
![A tree structure for computing the Fibonacci numbers recursively, showing how the same subproblems are solved multiple times.](/assets/images/posts/2020-10-26-my-resources-for-dynamic-programming.png)
<figcaption>Dynamic programming is a technique for efficiently solving recursive problems which shows up in many interviews</figcaption>
</figure>

Today, I want to focus on interview preparation from the candidate's perspective.

Even though I avoid dynamic programming questions in interviews, the rest of the industry does not. So if you're going to prepare for job hunting, it's beneficial to understand the concept thoroughly. Today, I want to cover a few resources I've created to teach dynamic programming. I'll also go over a few additional example problems, ones that are typical of interview problems.

## Building a strong foundation

Part of the reason dynamic programming problems can be hard is often, people don't have a strong foundation of what dynamic programming is and how to apply it. At a high level, **dynamic programming is a technique to solve recursive problems with a highly-overlapping subproblem structure**. "Highly-overlapping" refers to the subproblems repeating again and again.

There are many resources online to learn dynamic programming, which I encourage you to read through. However, I feel many of them don't go over the visual structure that makes the concept intuitive. To that end, I've created a few resources myself. I know many people have subscribed to this newsletter without having read my personal writing, so first, my blog post series introducing and deep-diving into dynamic programming:

- **[A graphical introduction to dynamic programming](https://avikdas.com/2019/04/15/a-graphical-introduction-to-dynamic-programming.html)** - an overview of the foundations. If you don't read any other articles, read this one.
- **[A deep-dive into chain matrix multiplication](https://avikdas.com/2019/04/25/dynamic-programming-deep-dive-chain-matrix-multiplication.html)** - a deep-dive into a classic dynamic programming problem, which will help you practice applying the concepts from the first post.
- **[Real-world dynamic programming: seam carving](https://avikdas.com/2019/05/14/real-world-dynamic-programming-seam-carving.html)** - a real-world application, again good for practicing the concepts.
- **[Dynamic programming for machine learning: Hidden Markov Models](https://avikdas.com/2019/06/24/dynamic-programming-for-machine-learning-hidden-markov-models.html)** - one more real-world application.

Finally, last week, I released a LinkedIn Learning course covering the same content as the blog posts above, so I highly recommend watching that if you prefer a video format: **[Fundamentals of Dynamic Programming](https://www.linkedin.com/learning-login/share?forceAccount=false&redirect=https%3A%2F%2Fwww.linkedin.com%2Flearning%2Ffundamentals-of-dynamic-programming%3Ftrk%3Dshare_ent_url&account=104)**.

## Practice, practice, practice

As with any new concept, it's helpful to practice on a variety of exercises. In addition to the problems in my blog posts, I'll go through two dynamic programming problems you might encounter in actual interviews. I'll keep the analyses brief, leaving it up to you to tie the high-level outline to the underlying concepts. But, if you want me to do a deep-dive on either problem, let me know!

### Subset sum

Given a set of integers and an integer _n_, determine if any subset of the input set adds up to _n_. For example:

- Given: `{2, 3, 4, 9, 13}` and a target of `20`

- Solution: Yes, using `{3, 4, 13}`

The subset sum problem is a classic example of backtracking, [another topic I covered on my blog](https://avikdas.com/2020/02/25/a-tree-based-introduction-to-backtracking.html). The basic algorithm is:

1. Pick one of the numbers from your set.

1. Subtract it from the target.

1. Recursively try to reach the new target with the remaining numbers in the set.

The base case is when one of the numbers in the set is exactly equal to your target, or if you don't have any numbers in your set that are smaller than your target.

However, if you try to implement this algorithm directly, you quickly find yourself computing the same subproblem, that is the same input set and target combination, multiple times. To avoid this, you can use memoization. In fact, this works almost exactly like the change making problem in my first blog post above, only when you use a number, you can't use it again.

[GeeksforGeeks has an analysis of this problem.](https://www.geeksforgeeks.org/subset-sum-problem-dp-25/)

### Edit distance

Given two strings, determine the lowest number of deletions, insertions or substitutions needed to convert the first string into the second. For example:

- Given: strings `abcd` and `xcda`

- Solution is three operations: delete the `a` at the beginning, insert a new `a` at the end, and replace the `b` with an `x`.

In this classic dynamic programming problem:

1. You go through both strings one letter at a time.

1. If the letters at the beginning of both strings match, you can advance along both strings at the same time. Otherwise, you have the choice to either advance along the first string by deleting that letter, advance along the second string by adding that letter, or advance along both strings by replacing one letter for the other.

Here, the input to the subproblem consists of two integers, corresponding to where you are in both strings. The subproblem is to determine how to transform the corresponding suffixes of the strings (starting from the positions denoted by the inputs) into each other.

You can see how the subproblems evolve over time in the third column below:

| str1   | str2   | subproblem | # of operations          |
|--------|--------|------------|--------------------------|
| `abcd` | `xcda` | (0, 0)     | 0                        |
| `bcd`  | `xcda` | (1, 0)     | 1 (delete the `a`)       |
| `cd`   | `cda`  | (2, 1)     | 2 (replace `b` with `x`) |
| `d`    | `da`   | (3, 2)     | 2                        |
| `-`    | `a`    | (4, 3)     | 2                        |
| `-`    | `-`    | (4, 4)     | 3 (add `a`)              |

The table above only considers one possible set of operations. When implementing this algorithm, you have to try any available possibilities, and choose the one that gives you the lowest count. Here, either memoization or bottom-up dynamic programming will work, since you'll explore most of the subproblems instead of skipping over a large percentage.

[GeeksforGeeks has an analysis of this problem.](https://www.geeksforgeeks.org/edit-distance-dp-5/)

---

Dynamic programming is a useful technique to learn for interviews, even if I feel it's not a good measure of someone's ability to perform at a typical programming job. Over the last two years, I've created content to help others learn about dynamic programming, so for all the readers of my newsletter who haven't seen my personal writing, I hope these resources are helpful.
