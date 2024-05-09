# Shell学习笔记

> Shell提供了用户与内核进行交互操作的接口。 它接收用户输入的命令，并送入内核去执行，是一个命令解释器。另外，Shell编程语言具有普通编程语言的很多特点，用这种编程语言编写的Shell程序与其他应用程序具有同样的效果。
>
> 常用的Shell种类包括：``sh``、`csh`、`ksh`、`bash`、`zsh` 和 `fish`。

## 基本介绍

### Shell的基本操作

- 查看系统中所有的Shell版本

  ```bash
  cat /etc/shells
  ```

- 按照约定俗成的习惯，Shell文件一般以 `.sh` 结尾；

- Shell文件的开头需要指定具体的Shell解释器，例如 `bash`；

  ```shell
  #!/bin/bash
  ```

- 在命令行中执行Shell文件有两种方式：
  
  ```bash
  # 方式一
  bash <file-name.sh>
  
  # 方式二
  chmod +x <file-name.sh>
  ./<file-name.sh>
  ```

### Shell的条件判断

```shell
if condition; then
    要执行的语句
fi
```

这里的condition可以是 `[]`、`[[]]` 或者 `(())`：

- `[]` 是最基本的条件测试表达式；
- `[[]]` 是扩展测试命令，提供了比 `[]` 更强大的功能；
- `(())` 是数学表达式，支持常见的 `+-*/` 等数学运算。

### Shell中的特殊变量

| 变量   | 含义                                                       |
| ------ | ---------------------------------------------------------- |
| `$#`   | 传递给脚本或函数的位置参数的个数                           |
| `$?`   | 上一个命令的退出状态码：0通常表示没有错误，非0值表示有错误 |
| `$*`   | 传递给脚本或函数的位置参数，双引号包围时作为一个整体       |
| `$@`   | 传递给脚本或函数的位置参数                                 |
| `$$`   | 当前Shell进程的进程ID（PID）                               |
| `$!`   | 最后一个后台命令的进程ID                                   |
| `$0`   | 当前正在执行的脚本名称                                     |
| `$1-n` | 脚本或函数的位置参数                                       |

<br>

## 样例实现

### Example 1

通过交互读取用户的输入变量

```shell
#!/bin/bash
echo "Please enter your name:"
read name
echo "Hello, $name!"
```

### Example 2

通过执行参数获取输入变量（执行 `./game.sh Ray GeekHour`）

```shell
#!/bin/bash
echo "Please enter your name:"
name=$1
channel=$2
echo "Hello, $name! Welcome to $channel."
```

### Example 3

在环境变量中提前设置好变量名称和取值

```bash
# 当前会话有效
export name=Ray
export channel=GeekHour
./game.sh

# 全局设置有效
# 1) 在.bashrc中定义变量
export name=Ray
export channel=GeekHour

# 2) 重新加载文件
source .bashrc
# 或者
. .bashrc
```

```shell
#!/bin/bash
echo "Please enter your name:"
echo "Hello, $name! Welcome to $channel."
```

### Example 4

随机猜数字的几个主要功能如下：

- `$()` 表示将括号内的指令视为整体
- `$(())` 表示括号内的结果是数学表达式

```shell
# 生成随机数字
number=$(shuf -i 1-10 -n 1)
# 或者
number=$((RANDOM % 10 + 1))
echo "The ground truth is: $number"

# 随机猜测数字
echo "Please guess a number from 1 to 10:"
read guess

# 比较数字大小
if [[ $guess -eq $number ]]; then
    echo "You are right!"
elif [[ $guess -lt $number ]]; then
    echo "Your guess is small."
else
    echo "Your guess is large."
fi

# 是否继续游戏
echo "Continue to play? (y/n)"
read choice
if [[ $choice = 'y' || 'Y' ]]; then
    continue
else
    break
fi
```

### 完整功能实现

```shell
#!/bin/bash
name=Ray
game=Number\ Guessing
echo "Hello, $name! Welcome to $game."

# 0) 生成随机数字
number=$(shuf -i 1-10 -n 1)
echo "The ground truth is: $number"

# 开始游戏
while true
do

# 1) 随机猜测数字
echo "Please guess a number from 1 to 10:"
read guess

# 2) 比较数字大小
if [[ $guess -eq $number ]]; then
    echo "You are right!"

    # 3) 是否继续游戏
    echo "Continue to play? (y/n)"
    read choice
    if [[ $choice = 'y' || 'Y' ]]; then
        number=$((RANDOM % 10 + 1))
        echo "The ground truth is: $number"
        continue
    else
        break
    fi

elif [[ $guess -lt $number ]]; then
    echo "Your guess is small."
else
    echo "Your guess is large."
fi

done
```

注意事项：

- `if` 判断的结尾一定要有 `fi`；
- `while` 循环以 `do` 开始、以 `done` 结束；
- 条件判断的 `[[  ]]` 中左右各要留出一个空格。

<br>

## 补充信息

### Linux中查看环境变量

```bash
# 当前用户的Home目录
echo $HOME

# 系统的可执行文件查找路径
echo $PATH

# 系统默认使用的Shell路径
echo $SHELL

# 当前正在执行的脚本名称
echo $0
```

### Linux中的比较符号

| 符号 | 含义                     |
| ---- | ------------------------ |
| `lt` | less than                |
| `le` | less than or equal to    |
| `gt` | greater than             |
| `ge` | greater than or equal to |
| `eq` | equal to                 |
| `ne` | not equal to             |
