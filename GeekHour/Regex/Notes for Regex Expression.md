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
| `ab\|cd`                                                     | match ab or cd                 |

<br>

## 常用验证模式

| Type                | Regex Pattern                                                |
| ------------------- | ------------------------------------------------------------ |
| Email               | `^[\w.-+%]+@[A-Za-z\d.-]+\.[A-Za-z]{2,}$`                    |
| URL                 | `^(https?:\/\/)?([a-z\d]+([.-]{1}[a-z0-9]+)*\.[a-z]{2,5})(:\d{1,5})?(\/.*)?$` |
| Numeric Input       | `^\d+(?:\.\d+)?$`                                            |
| Date (YYYY-MM-DD)   | `^(?:19\|20)\d{2}-(?:0[1-9]\|1[0-2])-(?:0[0-9]\|[12]\d\|3[01])$` |
| Time (HH: MM AM/PM) | `^(1[0-2]\|0?[1-9]):[0-5]\d (AM\|PM)$`                       |
| Phone Number        | `^\+?[1-9]\d{1,14}`                                          |
| Password Strength   | `^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[^\w\s]).{8,}$`         |
| File Extension      | `^.+\.(jpg\|jpeg\|png\|gif\|pdf)$`                           |
| IP Address          | `^(?:(?:25[0-5]\|2[0-4]\d\|[01]?\d?\d)\.){3}(?:25[0-5]\|2[0-4]\d\|[01]?\d?\d)$` |

密码强度的正则表达式含义解释：

- `.*[A-Z]` 表示以大写字母结尾的任意长度字符串；
- `(?=.*[A-Z])` 表示通过前瞻找到上述字符串的起点位置；
- 同理，`(?=.*[a-z])`、`(?=.*\d)` 和 `(?=.*[^\w\s])` 分别表示通过前瞻找到以小写字母、数字和特殊符号（非字母、数字和空格）结尾的、任意长度的字符串的起点位置；
- 当上述四种前瞻方法同时作用时，可以找到同时满足这四个条件的字符串；
- `^.{8,}$` 表示得到以行为单位的、总位数大于等于8的字符串，即为满足条件的密码。

<br>

## 实例：提取文章的时间和页数

### 提取时间信息

我们希望从IEEE（或ACM）的网页上或者PDF中提取出某篇文章的提交（received）、修改（revised）、接收（accepted）及发表（published）等时间信息。以IEEE Transactions on Information Forensics and Security (TIFS)和ACM Computing Survey (CUSR)为例，其时间信息如下所示：

> IEEE TIFS: *Personalized Federated Learning With Differential Privacy and Convergence Guarantee*
>
> Manuscript received 4 February 2022; revised 16 December 2022 and 5 May 2023; accepted 6 June 2023. Date of publication 10 July 2023; date of current version 28 July 2023.

> ACM CUSR: *Deep Multimodal Data Fusion* 
>
> Published: 24 April 2024 <br>
> Online AM: 24 February 2024 <br>
> Accepted: 31 January 2024 <br>
> Revised: 25 October 2023 <br>
> Received: 6 November 2022

这里，我们给出一种通用的正则表达式，可以同时作用于IEEE和ACM。

```bash
# 提取Received时间
(?<=[Rr]eceived:?\s+)(\d{1,2})\s+([A-Z][a-z]{2,8})\s+(20[0-2][0-4])

# 提取Revised时间
(?<=[Rr]evised:?\s+)(\d{1,2})\s+([A-Z][a-z]{2,8})\s+(20[0-2][0-4])

# 提取Accepted时间
(?<=[Aa]ccepted:?\s+)(\d{1,2})\s+([A-Z][a-z]{2,8})\s+(20[0-2][0-4])

# 提取Published时间
(?<=[Pp]ubli(?:shed|cation):?\s+)(\d{1,2})\s+([A-Z][a-z]{2,8})\s+(20[0-2][0-4])

# 提取ACM Online时间
(?<=Online\s+(?:AM|PM):?\s+)(\d{1,2})\s+([A-Z][a-z]{2,8})\s+(20[0-2][0-4])

# 提取IEEE version时间
(?<=version\s+)(\d{1,2})\s+([A-Z][a-z]{2,8})\s+(20[0-2][0-4])

# 提取后续Revised时间
(?<=and\s+)(\d{1,2})\s+([A-Z][a-z]{2,8})\s+(20[0-2][0-4])
```

以Accepted时间为例，我们解释正则表达式中的具体含义：

- `[Aa]ccept` 表示适用于首字母大写或小写的情况；
- `(?<=)` 表示后顾，提取关键字后面的时间信息；
- `:?` 表示既可以有也可以没有关键字后面的冒号；
- `\s+` 表示存在空格或换行符号，或者既有空格也有换行；
- `\d{1,2}` 表示日期，可能是一位或两位数字；
- `[A-Z][a-z]{2,8}` 表示月份，首字母大写，最短为May，最长为September；
- `20[0-2][0-4]` 表示年份，这里只考虑2000年之后的；
- `()()()` 表示将日月年分成三个组，可以分别提取，甚至替换。

<br>

### 提取页数信息

> Examples:
>
> Page(s): 4488 - 4503 <br>
> pp 1–36

类似地，我们希望可以通过 `Page(s)` 或 `pp` 等关键字提取相应文章的页数。

```bash
# 提取文章页数信息
(?<=[Pp](?:p|age(?:\(s\))?):?\s*)(\d{1,5})\s*[^\w\s]\s*(\d{1,5})
```

上述正则表达式中的具体含义：

- `[Pp](?:p|age(?:\(s\))?)` 表示关键字可以是 `pp` 或 `page(s)`，首字母大小写均可，并且 `(s)` 可有可无；
- `:?` 表示既可以有也可以没有关键字后面的冒号；
- `\s*` 表示可以存在空格或换行符号，也可以都没有；
- `\d{1,5}` 表示起始页或终止页的页数，最多不超过10万页；
- `[^\w\s]` 表示起始页和终止页之间的连接符号，可以是破折号、波浪号等；
- `()()` 表示将起始页、终止页分成两个组，便于提取相应的数字计算差值来得到文章的页数。

