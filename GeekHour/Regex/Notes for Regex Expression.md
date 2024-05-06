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

| Type                | Regex Pattern                                                |      |
| ------------------- | ------------------------------------------------------------ | ---- |
| Email               | `^[\w.-+%]+@[A-Za-z\d.-]+\.[A-Za-z]{2,}$`                    |      |
| URL                 | `^(https?:\/\/)?([a-z\d]+([.-]{1}[a-z0-9]+)*\.[a-z]{2,5})(:\d{1,5})?(\/.*)?$` |      |
| Numeric Input       | `^\d+(?:\.\d+)?$`                                            |      |
| Date (YYYY-MM-DD)   | `^(?:19\|20)\d{2}-(?:0[1-9]\|1[0-2])-(?:0[0-9]\|[12]\d\|3[01])$` |      |
| Time (HH: MM AM/PM) | `^(1[0-2]\|0?[1-9]):[0-5]\d (AM\|PM)$`                       |      |
| Phone Number        | `^\+?[1-9]\d{1,14}`                                          |      |
| Password Strength   | `^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[^\w\s]).{8,}$`         |      |
| File Extension      | `^.+\.(jpg\|jpeg\|png\|gif\|pdf)$`                           |      |
| IP Address          | `^(?:(?:25[0-5]\|2[0-4]\d\|[01]?\d?\d)\.){3}(?:25[0-5]\|2[0-4]\d\|[01]?\d?\d)$` |      |

<br>

## 实例：提取期刊日期

我们希望从IEEE或ACM期刊的PDF中提取出文章提交（received）、修改（revised）、接收（accepted）和发表（publication）的时间。具体地，由于关键字或日期可能存在换行，所以我们使用 `\s+` 来同时处理年月日之间的空格和可能存在的换行符。

```bash
# 提取received时间
(?<=received\s+)(\d{1,2})\s+([A-Z][a-z]+)\s+(20[0-2][0-4])

# 提取revised时间
(?<=revised\s+)(\d{1,2})\s+([A-Z][a-z]+)\s+(20[0-2][0-4])

# 提取accepted时间
(?<=accepted\s+)(\d{1,2})\s+([A-Z][a-z]+)\s+(20[0-2][0-4])

# 提取publication时间
(?<=publication\s+)(\d{1,2})\s+([A-Z][a-z]+)\s+(20[0-2][0-4])
```
