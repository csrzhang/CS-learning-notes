# Git学习笔记

## 基本操作

### 初始化

```bash
# 配置用户名
git config --global user.name "Your Name"

# 配置邮箱
git config --global user.email "mail@example.com"

# 存储配置
git config --global credential.helper store
```

### 创建仓库

```bash
# 创建新的本地仓库
git init <project-name>

# 克隆已有的远程仓库
git clone <url>
```

### 添加和提交

```bash
# 添加已修改文件到暂存区
git add <file>

# 添加所有已修改文件到暂存区
git add .

# 提交所有暂存区文件到仓库
git commit -m "message"

# 提交所有已修改文件到仓库
git commit -am "message"
```

### 查看状态或差异

```bash
# 查看仓库状态，列出所有未提交的文件
git status

# 查看提交历史，--oneline表示简洁模式
git log --oneline

# 查看未暂存文件的更新部分
git diff

# 查看两个提交之间的差异
git diff <commit-id> <commit-id>
```





### 分支操作

```bash
# 
git branch

# 
git branch <branch-name>

# 
git 
```













## 基本概念

### 四个区域

| 区域名称                      | 功能描述                 |
| ----------------------------- | ------------------------ |
| 工作区（Working Directory）   | 电脑本地的文件目录       |
| 暂存区（Stage/Index）         | 临时存放未提交的内容     |
| 本地仓库（Repository）        | Git在本地的版本库        |
| 远程仓库（Remote Repository） | 托管在远程服务器上的仓库 |

### 文件状态

| 文件状态            | 状态描述                           |
| ------------------- | ---------------------------------- |
| 已修改（Modified）  | 修改了但是没有保存到暂存区的文件   |
| 已暂存（Staged）    | 修改后已经保存到暂存区的文件       |
| 已提交（Committed） | 将暂存区文件提交到本地仓库后的状态 |

### 基本概念

| 基本概念      | 描述               |
| ------------- | ------------------ |
| main/master   | 默认主分支         |
| origin        | 默认远程仓库       |
| HEAD          | 指向当前分支的指针 |
| HEAD^ / HEAD~ | 上一个提交版本     |
| HEAD~4        | 上4个提交版本      |

### 特殊文件

|      |      |
| ---- | ---- |
|      |      |
|      |      |
|      |      |























