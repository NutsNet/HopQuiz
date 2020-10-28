# HopQuiz

## Sum

Compute the sum of all numbers between 1 and *N* included that are multiples of either 3 or 5 but not both.

For example, if *N* = 10, the sum of multiples is:  3 + 5 + 6 + 9 + 10 = **33**

## Morse decoder

A signal is either a `.` (left branch) or a `-` (right branch). 

Morse is case-insensitive. **Only consider letters A to Z in this problem** (no digits or accented letters.)

1. Given a valid string of signals, write a function *decode* that returns the corresponding letter. For example, `...` returns `S`.
2. Let's now assume the transmission is not reliable, and we sometimes receive a `?` instead of a `.` or a `-`. Update the function *decode* to return all possible letters. For example, `-?` will return `N` and `M`.
*Note:* there may be multiple `?` within the string of signals.

## Markdown to HTML

Write a function that converts Markdown headers to HTML. For example,  `### Title` will return `<h3>Title</h3>`.

- Markdown headers can have 1 to 6 `#`.
- There may be any number of spaces:
    - before the first `#`
    - between the last `#` and the title (but always at least 1)
    - after the title

For example     `##    This is a test`        would return `<h2>This is a test</h2>`.

The function should report invalid input, *e.g.* `Test`, `##MissingSpace` or `########## Too Many Hashes`.
