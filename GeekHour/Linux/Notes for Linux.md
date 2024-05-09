# Linux学习笔记

> 内核是操作系统的核心，具有很多最基本功能，它负责管理系统的进程、 内存、 设备驱动程序、 文件和网络系统。

## Vi编辑器

> Vim (Vi Improved) 就是升级版的Vi编辑器。

### 模式及其切换

| 模式                       | 模式切换                                         |
| -------------------------- | ------------------------------------------------ |
| 命令模式（Command Mode）   | `:` 进入尾行模式<br />`i/I,a/A,o/O` 进入插入模式 |
| 插入模式（Insert Mode）    | `ESC` 进入命令模式                               |
| 尾行模式（Last Line Mode） | `ESC/Enter` 进入命令模式                         |

### 基本操作

| 操作指令                                   | 功能                                                  |
| ------------------------------------------ | ----------------------------------------------------- |
| <font color='blue'>**光标移动**</font>     |                                                       |
| `h j k l` or `← ↓ ↑ →`                     | left, down, up, right                                 |
| Ctrl + `f b d u`                           | forward, backward, down, up                           |
| `^ $`                                      | start or end position of the line                     |
| `G gg`                                     | last or first line of the file                        |
| <font color='blue'>**复制粘贴**</font>     |                                                       |
| `dd #dd`                                   | cut the line or the following # lines                 |
| `yy #yy`                                   | copy the line or the following # lines                |
| `p/#p P/#P`                                | paste below or above for # times                      |
| `J`                                        | join next line after the current line                 |
| `u`                                        | undo                                                  |
| `.`                                        | repeat                                                |
| <font color='blue'>**插入模式指令**</font> | `i/I` 表示 insert，`a/A` 表示 append，`o/O` 表示 open |
| `i`                                        | insert before the cursor                              |
| `a`                                        | insert after the cursor                               |
| `I`                                        | insert at the start of the line                       |
| `A`                                        | insert at the end of the line                         |
| `o`                                        | insert at the below line                              |
| `O`                                        | insert at the above line                              |
| <font color='blue'>**尾行模式指令**</font> |                                                       |
| `:w`                                       | save                                                  |
| `:w!`                                      | force to save                                         |
| `:q`                                       | quit                                                  |
| `:q!`                                      | quit without save                                     |
| `:wq`                                      | save and quit                                         |
| `:set nu/number`                           | set line numbers                                      |
| `:set nonu/nonumber`                       | set no line numbers                                   |
| <font color='blue'>**搜索替换**</font>     |                                                       |
| `/ ?`                                      | search down, search up                                |
| `n N`                                      | next in the direction, or reversed direction          |
| `\c`                                       | ignore case 忽略大小写字母                            |
| `#1,#2s/word1/word2`                       | substitute word1 with word2 from line #1 to #2        |
| `1,$s/word1/word2`                         | substitute word1 with word2 for all lines             |
| `/g`                                       | match all findings in the line                        |

另外，可以在 `.vimrc` 文件中进行一些Vi编辑器的全局设置，避免每次重复操作。

<br>

## Linux常用命令

| 操作指令                               | 功能                                                         |
| -------------------------------------- | ------------------------------------------------------------ |
| <font color='blue'>**文件管理**</font> |                                                              |
| `ls`<br />`-a -l -t -r -h`             | list directory contents<br />(all, detailed, time, reversed, human readable) |
| `pwd`                                  | print working directory                                      |
| `cd`                                   | change directory                                             |
| `mkdir`<br />`-p, --parents`           | make directory                                               |
| `mv`<br />`-f, --force`                | move or rename file                                          |
| `cp`<br />`-r, --recursive`            | copy file or directory                                       |
| `rm`<br />`-f -r`                      | remove file or directory                                     |
| `touch`                                | create file or change timestamp                              |
| `ln`<br />`-s`                         | create link file<br />(soft link)                            |
| <font color='blue'>**文本操作**</font> |                                                              |
| `echo`                                 | print contents                                               |
| `cat`                                  | concatenate and print                                        |
| `head`                                 | print first 10 lines                                         |
| `tail`                                 | print last 10 lines                                          |
| <font color='blue'>**其他**</font>     |                                                              |
| `whoami`                               | show user name                                               |
| `chmod`                                | change mode (user/group/others)                              |
| `du`                                   | show disk usage                                              |
|                                        |                                                              |

补充说明：移动、复制、链接等操作的指令都是先给出源（待操作）文件或目录，然后再给出目标文件或目录，即 `mv/cp/ln [params] source dest`。

### Linux常用目录

| 目录    | 功能                         |
| ------- | ---------------------------- |
| `/`     | 根目录，所有文件和目录的起点 |
| `/bin`  | 用户二进制文件               |
| `/sbin` | 系统二进制文件               |
| `/etc`  | 配置文件                     |
| `/dev`  | 设备文件                     |
| `/home` | 用户家目录                   |
| `/root` | root用户家目录               |
| `/lib`  | 系统库文件                   |
| `/opt`  | 可选的第三方软件包           |
| `/tmp`  | 临时文件                     |
| `/usr`  | 用户程序                     |
| `/var`  | 可变文件，如日志等           |
| `/boot` | 启动加载器文件               |
| `/proc` | 进程信息                     |
| `/sys`  | 系统文件                     |