# 正则表达式笔记

> 正则表达式在线工具网站：https://regexr.com

<br>

## Cheatsheet

| Regex Expression                                             | Description                    |
| ------------------------------------------------------------ | ------------------------------ |
| **<font color='blue'>Character classes 字符类</font>**       |                                |
| `.`                                                          | any character except newline   |
| `\w \d \s`                                                   | word, digit, whitespace        |
| `\W \D \S`                                                   | not word, digit, whitespace    |
| `[abc]`                                                      | any of a, b, or c              |
| `[^abc]`                                                     | not a, b, or c                 |
| `[a-g]`                                                      | character between a & g        |
| **<font color='blue'>Anchors 定位符</font>**                 |                                |
| `^abc$`                                                      | start / end of the string      |
| `\b \B`                                                      | word, not word boundary        |
| **<font color='blue'>Escaped characters 转义字符</font>**    |                                |
| `\. \* \\`                                                   | escaped special characters     |
| `\t \n \r`                                                   | tab, linefeed, carriage return |
| **<font color='blue'>Groups & Lookaround 分组 & 前瞻后顾</font>** |                                |
| `(abc)`                                                      | capture group                  |
| `\1`                                                         | backreference to group #1      |
| `(?:abc)`                                                    | non-capturing group            |
| `(?=abc)`                                                    | positive lookahead             |
| `(?!abc)`                                                    | negative lookahead             |
| `(?<=abc)`                                                   | positive lookbehind            |
| `(?<!abc)`                                                   | negative lookbehind            |
| **<font color='blue'>Quantifiers & Alteration 量词 & 替换</font>** |                                |
| `a* a+ a?`                                                   | 0 or more, 1 or more, 0 or 1   |
| `a{5} a{2,}`                                                 | exactly five, two or more      |
| `a{1,3}`                                                     | between one & three            |
| `a+? a{2,}?`                                                 | match as few as possible       |
| `ab|cd`                                                      | match ab or cd                 |

<br>

## 常用验证模式

| Type                   | Regex Pattern                                                | Improved |
| ---------------------- | ------------------------------------------------------------ | -------- |
| Email                  | `^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$`           | `^$`     |
| URL                    | `^(https?:\/\/)?([a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5})()$` |          |
| Date<br />(YYYY-MM-DD) | `^(?:19|20)\d{2}-(?:0[1-9]|1[0-2])-(?:0[0-9]|[12]\d|3[01])$` |          |

