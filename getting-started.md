# Getting Started

## Logistics

This project is due **Tuesday, 2/2/2021 at 11:59PM PST (GMT-8)**. It is worth of 5% your overall grade in the class.

## Prerequisites

You should watch the SQL I lecture before beginning this project. Later questions will require material from the SQL II lecture.

> 在开始这个项目之前，您应该观看 SQL I 讲座。后面的问题将需要 SQL II 讲座中的材料。

## Fetching the released code

The GitHub Classroom link for this project is in the Project 1 release post on [Piazza](https://piazza.com/class/kjoxqrf1eq04mr). Once your private repo is set up clone the project 1 skeleton code onto your local machine.

> 该项目的 GitHub Classroom 链接位于 [Piazza](https://piazza.com/class/kjoxqrf1eq04mr) 上的项目 1 发布帖子中。设置私人存储库后，将项目 1 框架代码克隆到本地计算机上。

### Debugging Issues with GitHub Classroom

Feel free to skip this section if you don't have any issues with GitHub Classroom. If you are having issues \(i.e. the page froze or some error message appeared\), first check if you have access to your repo at `https://github.com/berkeley-cs186-student/sp21-proj1-username`, replacing `username` with your GitHub username. If you have access to your repo and the starter code is there, then you can proceed as usual. If you have access to your repo but the starter code is not there, run the following commands in a terminal \(again replacing `username` with your GitHub username\):

> 如果您对 GitHub Classroom 没有任何问题，请随意跳过本部分。如果您遇到问题（即页面冻结或出现一些错误消息），请首先检查您是否有权访问您的存储库：https://github.com/berkeley-cs186-student/sp21-proj1-username ，将 `username` 替换为您的 GitHub 用户名。如果您有权访问您的存储库并且有起始代码，那么您可以照常继续。如果您有权访问您的存储库，但起始代码不存在，请在终端中运行以下命令（再次将“用户名”替换为您的 GitHub 用户名）：

```text
git clone https://github.com/berkeley-cs186/sp21-proj1
cd sp21-proj1/
git remote remove origin
git remote add origin https://github.com/berkeley-cs186-student/sp21-proj1-username.git
git push -u origin master
```

Then, you can proceed as usual.

### 404 Not Found

If you're getting a 404 not found page when trying to access your repo, make sure you've set up your repo using the GitHub Classroom link in the Project 1 release post on [Piazza](https://piazza.com/class/kjoxqrf1eq04mr).

If you don't have access to your repo at all after following these steps, feel free to contact the course staff on Piazza.

## Required Software

### SQLite3

Check if you already have sqlite3 instead by opening a terminal and running `sqlite3 --version`. Any version at 3.8.3 or higher should be fine.

If you don't already have SQLite on your machine, the simplest way to start using it is to download a precompiled binary from the [SQLite website](http://www.sqlite.org/download.html). The latest version of SQLite at the time of writing is 3.34.1, but you can check for additional updates on the website.

>通过打开终端并运行“sqlite3 --version”来检查您是否已经有 sqlite3。任何 3.8.3 或更高版本都应该没问题。
>
>如果您的计算机上尚未安装 SQLite，开始使用它的最简单方法是从 [SQLite 网站](http://www.sqlite.org/download.html) 下载预编译的二进制文件。截至撰写本文时，SQLite 的最新版本是 3.34.1，但您可以在网站上查看其他更新。

#### Windows <a id="windows"></a>

1. Visit the download page linked above and navigate to the section **Precompiled Binaries for Windows**. Click on the link **sqlite-tools-win32-x86-\*.zip** to download the binary.
2. Unzip the file. There should be a `sqlite3.exe` file in the directory after extraction.
3. Navigate to the folder containing the `sqlite3.exe` file and check that the version is at least 3.8.3: `cd path/to/sqlite_folder` `./sqlite3 --version`
4. Move the `sqlite3.exe` executable into your `sp21-proj1-yourname` directory \(the same place as the `proj1.sql` file\)

>1. 访问上面链接的下载页面，然后导航至“**适用于 Windows 的预编译二进制文件**”部分。单击链接 **sqlite-tools-win32-x86-\*.zip** 下载二进制文件。
>2. 解压文件。解压后目录中应该有一个“sqlite3.exe”文件。
>3. 导航到包含 `sqlite3.exe` 文件的文件夹并检查版本是否至少为 3.8.3： `cd path/to/sqlite_folder` `./sqlite3 --version`
>4. 将`sqlite3.exe`可执行文件移至`sp21-proj1-yourname`目录（与`proj1.sql`文件相同的位置）

#### macOS Yosemite \(10.10\), El Capitan \(10.11\), Sierra \(10.12\) <a id="macos-yosemite-10-10-el-capitan-10-11-sierra-10-12"></a>

SQLite comes pre-installed. Check that you have a version that's greater than 3.8.3 `./sqlite3 --version`

#### Mac OS X Mavericks \(10.9\) or older <a id="mac-os-x-mavericks-10-9-or-older"></a>

SQLite comes pre-installed, but it is the wrong version.

1. Visit the download page linked above and navigate to the section **Precompiled Binaries for Mac OS X \(x86\)**. Click on the link **sqlite-tools-osx-x86-\*.zip** to download the binary.
2. Unzip the file. There should be a `sqlite3` file in the directory after extraction.
3. Navigate to the folder containing the `sqlite3` file and check that the version is at least 3.8.3: `cd path/to/sqlite_folder` `./sqlite3 --version`
4. Move the `sqlite3` file into your `sp21-proj1-yourname` directory \(the same place as the `proj1.sql` file\)

#### Ubuntu

Install with `sudo apt install sqlite3`

For other Linux distributions you'll need to find `sqlite3` on your appropriate package manager. Alternatively you can follow the Mac OS X \(10.9\) or older instructions substituting the Mac OS X binary for one from **Precompiled Binaries for Linux.**

### Python

You'll need a copy of Python 3.5 or higher to run the tests for this project locally. You can check if you already have an existing copy by running `python3 --version` in a terminal. If you don't already have a working copy download and install one for your appropriate platform from [here](https://www.python.org/downloads/).

> 您需要 Python 3.5 或更高版本的副本才能在本地运行该项目的测试。您可以通过在终端中运行“python3 --version”来检查是否已有副本。如果您还没有工作副本，请从[此处](https://www.python.org/downloads/)下载并安装适合您适当平台的工作副本。您需要一份 Python 3.5 或更高版本才能运行该项目在本地进行测试。您可以通过在终端中运行`python3 --version`来检查是否已有副本。如果您还没有工作副本，请从[此处](https://www.python.org/downloads/)下载并安装适合您的适当平台的工作副本。

## Download and extract the data set

Download the data set for this project from the course's Google Drive [here](https://drive.google.com/file/d/1WLMFAiNzrA0Qv3p80epO71uN8J6fTXYG/view?usp=sharing). You should get a file called `lahman.db.zip`. Unzip the `lahman.db.zip` file inside your `sp21-proj1-yourname` directory. You should now have a `lahman.db` file in your `sp21-proj1-yourname` directory \(the same place as the `proj1.sql` file\)

> 从课程的 Google Drive [此处](https://drive.google.com/file/d/1WLMFAiNzrA0Qv3p80epO71uN8J6fTXYG/view?usp=sharing) 下载该项目的数据集。您应该获得一个名为“lahman.db.zip”的文件。将“lahman.db.zip”文件解压到“sp21-proj1-yourname”目录中。现在，您的`sp21-proj1-yourname`目录中应该有一个`lahman.db`文件（与`proj1.sql`文件位于同一位置）

## Running the tests

If you followed the instructions above you should now be able to test your code. Navigate to your project directory and try using `python3 test.py`. You should get output similar to the following:

> 如果您按照上面的说明进行操作，您现在应该能够测试您的代码。导航到您的项目目录并尝试使用`python3 test.py`。您应该得到类似于以下内容的输出：

```text
FAIL q0 see diffs/q0.txt
FAIL q1i see diffs/q1i.txt
FAIL q1ii see diffs/q1ii.txt
FAIL q1iii see diffs/q1iii.txt
FAIL q1iv see diffs/q1iv.txt
FAIL q2i see diffs/q2i.txt
FAIL q2ii see diffs/q2ii.txt
FAIL q2iii see diffs/q2iii.txt
FAIL q3i see diffs/q3i.txt
FAIL q3ii see diffs/q3ii.txt
FAIL q3iii see diffs/q3iii.txt
FAIL q4i see diffs/q4i.txt
FAIL q4ii_bins_0_to_8 see diffs/q4ii_bins_0_to_8.txt
FAIL q4ii_bin_9 see diffs/q4ii_bin_9.txt
FAIL q4iii see diffs/q4iii.txt
FAIL q4iv see diffs/q4iv.txt
FAIL q4v see diffs/q4v.txt
```

If so, move on to the next section to start the project. If you see `ERROR`instead of `FAIL` create a followup on Piazza with details from your `your_output/` folder.

> 如果是这样，请继续下一部分来启动该项目。如果您看到“错误”而不是“失败”，请在 Piazza 上创建一个后续内容，其中包含`your_output/`文件夹中的详细信息。

