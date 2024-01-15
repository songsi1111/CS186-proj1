# Project 1: SQL

### 准备工作

#### 课程

这是伯克利CS186课程的第一个`project`，你可以在[这里](https://github.com/PKUFlyingPig/CS186)找到课程所需的所有资源，课程视频你可以在油管或者B站找到，[这里](https://www.youtube.com/watch?v=j-iq40QBJy8&list=PLYp4IGUhNFmw8USiYMJvCUjZe79fvyYge)是我观看的课程视频，[CS186-Github总站](https://github.com/berkeley-cs186)这是课程在`Github`的总站点，你理应在上面能尝试找到所有相关的代码资源。

如果你只是为了`proj1`来的，你需要的代码资源在[伯克利-CS186/FA23-PROJ1 ](https://github.com/berkeley-cs186/fa23-proj1)，如果你不会使用git，现在你无需急着打开`proj1`的仓库，请继续往下看。

#### 前言

如果你从未尝试过使用Git配置一个远程仓库，不要望而却步，这个教程是一个很好的开始

#### Git

###### 下载Git Bash

在[此处](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)下载

按本人粗浅的理解，git命令只能在`linux shell`中使用，而`bash`提供了window环境下模仿`linux shell`的能力，当然这个理解只是本人臆测，敬请斧正。

###### 第一次使用Git

1. 注册`Github`上的个人名称以及邮箱

​	如果你还没有`Github`账号，请先上网站注册一个

```
git config --global user.name <your_userName>
git config --global user.email <your_emailAddress>
```

2. 断开Git默认https服务，这样可以使用科学上网加速网络连接

   否则很有可能出现拒绝访问的情况（443）

```bash
git config --global --unset http.proxy 
git config --global --unset https.proxy
```

###### 远程仓库的建立

如果我写的有所疏漏，请参考：[管理远程仓库 - `GitHub` 文档](https://docs.github.com/zh/get-started/getting-started-with-git/managing-remote-repositories?platform=windows)

1. 打开Git Bash（用法和Linux Shell相同），`cd`到一个空文件夹，或是存放着你想上传到远程仓库文件的文件夹中

```bash
git init
```

这样就会在文件夹下新建一个`.git`文件,这个文件夹现在就是你的本地仓库

2. 从现有github库中建立

> Tips：你的远程仓库可以直接从他人的已有仓库中建立
>
> 在`CS186-proj1`中，你需要的仓库在[伯克利-CS186/FA23-PROJ1 (github.com)](https://github.com/berkeley-cs186/fa23-proj1)，点击右侧绿色按钮<font color=green>`use this template`</font>来建立你的私人仓库

​	回到bash下，键入以下命令：	

​	`<url>`可以在`github`中的<font color=green>`code`</font>（也是一个绿色按钮）里复制；

​	`git clone`命令会把你远程仓库里面所有的文件同样下载到本地仓库中；

``` bash
git clone <url>
git remote remove origin
git remote add origin <url>
```

###### 远程仓库的使用

参考：[Git - 远程仓库的使用 (git-scm.com)](https://git-scm.com/book/zh/v2/Git-基础-远程仓库的使用)

#### SQLite

###### 下载安装（简单版）

在[SQLite 网站](http://www.sqlite.org/download.html)下载**适用于Windows的预编译二进制文件**。
>1. 访问上面链接的下载页面，然后导航至“**适用于 Windows 的预编译二进制文件**”部分。单击链接 **sqlite-tools-win32-x86-\*.zip** 下载二进制文件。
>2. 解压文件。解压后目录中应该有一个“sqlite3.exe”文件。
>3. 导航到包含 `sqlite3.exe` 文件的文件夹并检查版本是否至少为 3.8.3： `cd path/to/sqlite_folder` `./sqlite3 --version`
>4. 将`sqlite3.exe`可执行文件移至`sp21-proj1-yourname`目录（与`proj1.sql`文件相同的位置）

###### 下载安装（复杂版）

你实际上只需要下载64位的工具包并把`sqlite3.exe`放在本地仓库中就能完成proj任务，但我同样建议你跟着教程一步步安装以防出现纰漏。

[使用SQLite打开本地.db文件_localsqlite.db-CSDN博客](https://blog.csdn.net/qq_42681355/article/details/109804698)

###### 小注意

使用`bash`打开SQLite界面会让人感觉好像是卡住了，但实际上没有卡住，请继续输入命令测试

![1705152906694](C:\Users\guojie\Documents\WeChat Files\wxid_m8z7kqlbnrd122\FileStorage\Temp\1705152906694.png)

#### Lahman数据集

在 [此处](https://drive.google.com/file/d/1WLMFAiNzrA0Qv3p80epO71uN8J6fTXYG/view?usp=sharing)下载，你同样应该把它复制到本地仓库下，现在你需要复制到本地仓库的的新文件有`lahman.db`和`sqlite3.exe`。

#### Python

如果你从未下载过python，你需要从[官网](https://www.python.org/)下载文件，并且配置到环境变量中，如果你不是很熟悉环境变量的配置，建议自行找一篇[教程博客](https://zhuanlan.zhihu.com/p/344887837)。

### 正式开始

#### 注意事项

你可能需要注意，你无法在`sqlite3`界面下进行删除修改（意思是只能一次写对），比较好的流程是现在`proj1.sql`或者一个`.md`笔记文件里面把答案写好，然后再c-p（复制粘贴）到`sqlite3`界面检查，最后输入`python text.py`命令检查

你需要参考官方的项目教程文档，而不是仅仅看本博客，需要的资源在本博客**准备工作**那一part应该全部提供了

#### 1i

```sql
-- 球员表
CREATE TABLE IF NOT EXISTS "people" (
        "playerID" VARCHAR(9) NOT NULL,
        "birthYear" INTEGER NULL,
        "birthMonth" INTEGER NULL,
        "birthDay" INTEGER NULL,
        "birthCountry" VARCHAR(255) NULL,
        "birthState" VARCHAR(255) NULL,
        "birthCity" VARCHAR(255) NULL,
        "deathYear" INTEGER NULL,
        "deathMonth" INTEGER NULL,
        "deathDay" INTEGER NULL,
        "deathCountry" VARCHAR(255) NULL,
        "deathState" VARCHAR(255) NULL,
        "deathCity" VARCHAR(255) NULL,
        "nameFirst" VARCHAR(255) NULL,
        "nameLast" VARCHAR(255) NULL,
        "nameGiven" VARCHAR(255) NULL,
        "weight" INTEGER NULL,
        "height" INTEGER NULL,
        "bats" VARCHAR(255) NULL,
        "throws" VARCHAR(255) NULL,
        "debut" VARCHAR(255) NULL,
        "finalGame" VARCHAR(255) NULL,
        "retroID" VARCHAR(255) NULL,
        "bbrefID" VARCHAR(255) NULL,
        "birth_date" DATE NULL,
        "debut_date" DATE NULL,
        "finalgame_date" DATE NULL,
        "death_date" DATE NULL,
        PRIMARY KEY ("playerID")
);
```

#### 1ii

使用通配比较：'% %' 来获得含空格的名字

#### 2i

需要注意名人堂里还有一个是否入选（inducted）的甄别环节

```sql
-- 名人堂表
     "ID" INTEGER NOT NULL,
     "playerID" VARCHAR(10) NOT NULL,
     "yearid" SMALLINT NOT NULL,
     "votedBy" VARCHAR(64) NOT NULL,
     "ballots" SMALLINT NULL,
     "needed" SMALLINT NULL,
     "votes" SMALLINT NULL,
     -- notice
     "inducted" VARCHAR(1) NULL,
     -- notice
     "category" VARCHAR(20) NULL,
     "needed_note" VARCHAR(25) NULL,
     PRIMARY KEY ("ID"),
     FOREIGN KEY("playerID") REFERENCES "people" ("playerID") ON UPDATE NO ACTION ON DELETE NO ACTION
```

可以通过命令`diffs/q2i.txt`来检查`positive false`和`negetive false`

#### 2ii

```sql
-- 球员和他们就读的大学表
CREATE TABLE IF NOT EXISTS "collegeplaying" (
        "ID" INTEGER NOT NULL,
        "playerid" VARCHAR(9) NOT NULL,
        "schoolID" VARCHAR(15) NULL,
        "year" SMALLINT NULL,
        PRIMARY KEY ("ID"),
        FOREIGN KEY("schoolID") REFERENCES "schools" ("schoolID") ON UPDATE NO ACTION ON DELETE NO ACTION,
        FOREIGN KEY("playerid") REFERENCES "people" ("playerID") ON UPDATE NO ACTION ON DELETE NO ACTION
);
```

```sql
-- 大学表
CREATE TABLE IF NOT EXISTS "schools" (
        "schoolID" VARCHAR(15) NOT NULL,
        "schoolName" VARCHAR(255) NULL,
        "schoolCity" VARCHAR(55) NULL,
        "schoolState" VARCHAR(55) NULL,
        "schoolCountry" VARCHAR(55) NULL,
        PRIMARY KEY ("schoolID")
);
```

另，加利佛尼亚大学在schoolstate中标记为`CA`，看过网上有的博客喷过这个点，但其实你尝试寻找答案的过程何尝不是一种乐趣呢

#### 3i

>军刀计量学：Sabermetrics 的创建是为了让棒球迷通过客观证据了解这项运动。这是通过评估球员在比赛的各个方面来执行的，特别是击球、投球和投球。

> SLG=（单打+（2×双打）+（3×三打）+（4×本垒打））/击球数

> 需要注意表格中的H指的是击球数，所以单垒安打的值等于`H-H2B-H3B-HR`

```sql
-- 击球表
CREATE TABLE IF NOT EXISTS "batting" (
        "ID" INTEGER NOT NULL,
        "playerID" VARCHAR(9) NOT NULL,
        "yearID" SMALLINT NOT NULL,
        "stint" SMALLINT NOT NULL,
        "teamID" CHARACTER(3) NULL,
        "team_ID" INTEGER NULL,
        "lgID" CHARACTER(2) NULL,
        "G" SMALLINT NULL,
        "G_batting" SMALLINT NULL,-- 纯空行
        "AB" SMALLINT NULL,-- 打数？？
        "R" SMALLINT NULL,
        "H" SMALLINT NULL,-- 安打
        "H2B" SMALLINT NULL,-- 二垒安打
        "H3B" SMALLINT NULL,-- 三垒安打
        "HR" SMALLINT NULL,-- 全垒打
        "RBI" SMALLINT NULL,
        "SB" SMALLINT NULL,
        "CS" SMALLINT NULL,
        "BB" SMALLINT NULL,
        "SO" SMALLINT NULL,
        "IBB" SMALLINT NULL,
        "HBP" SMALLINT NULL,
        "SH" SMALLINT NULL,
        "SF" SMALLINT NULL,
        "GIDP" SMALLINT NULL,
        PRIMARY KEY ("ID"),
        FOREIGN KEY("lgID") REFERENCES "leagues" ("lgID") ON UPDATE NO ACTION ON DELETE NO ACTION,
        FOREIGN KEY("team_ID") REFERENCES "teams" ("ID") ON UPDATE NO ACTION ON DELETE NO ACTION,
        FOREIGN KEY("playerID") REFERENCES "people" ("playerID") ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE INDEX "batting_lgID" ON "batting" ("lgID");
CREATE UNIQUE INDEX "batting_playerID" ON "batting" ("playerID", "yearID", "stint");
CREATE INDEX "batting_team_ID" ON "batting" ("team_ID");
```

```sql
SELECT AB,H,H2B,H3B,HR
 FROM q3i inner join batting on q3i.playerid=batting.playerid;
```

使用ROUND（取留小数）和CAST（类型转换）函数，当然这个task并不强制要求你进行ROUND取舍，因为在test中会帮你进行，但是了解一下总是好的

```sql
CREATE VIEW q3i(playerid, namefirst, namelast, yearid, slg)
AS
  SELECT people.playerid, namefirst, namelast, yearid, (CAST(h AS FLOAT) + 1.0 * CAST(h2b AS FLOAT) + 2.0 * CAST(h3b AS FLOAT) + 3.0 * CAST(hr AS FLOAT)) / CAST(ab AS FLOAT) AS slgm
  FROM people
  INNER JOIN batting ON people.playerid = batting.playerid
  WHERE AB > 50
  ORDER BY slgm DESC, yearid, people.playerid AND people.playerid LIKE 'bondwa01'
  LIMIT 10
;
```

###### 遇到的问题

1. AB>50而不是AB>49，这是我因为没看清题然后遇到的bug，直到我学会看`expected_output`才解决了这个问题，这个故事教会我多看看你的`your_output`文件夹并和`expected_output`进行对比将会是一个好习惯，并且非常有助于你发现错误。

2. 当我尝试运行`diffs.q3i.txt`来检验我的错误，我一直得到如下报错，直到我已经能通过`python test.py`，它还是会报错，不知道是什么毛病。

```
diffs/q3i.txt: line 1: syntax error near unexpected token `slg,'
diffs/q3i.txt: line 1: `  playerid|namefirst|namelast|yearid|ROUND(slg, 4)'
```





