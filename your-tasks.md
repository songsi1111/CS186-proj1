# Your Tasks

![Databaseball](../../.gitbook/assets/databaseball%20%282%29%20%283%29%20%283%29%20%283%29.jpg)

```bash   
cd d/课业/数据库引论/proj1/CS186-proj1
```

In this project we will be working with the commonly-used [Lahman baseball statistics database](http://www.seanlahman.com/baseball-archive/statistics/) \(our friends at the San Francisco Giants tell us they use it!\) The database contains pitching, hitting, and fielding statistics for Major League Baseball from 1871 through 2019. It includes data from the two current leagues \(American and National\), four other "major" leagues \(American Association, Union Association, Players League, and Federal League\), and the National Association of 1871-1875.

> 在这个项目中，我们将使用常用的 [Lahman 棒球统计数据库](http://www.seanlahman.com/baseball-archive/statistics/) （我们在旧金山巨人队的朋友告诉我们他们使用它!\) 该数据库包含美国职业棒球大联盟从 1871 年到 2019 年的投球、击球和守备统计数据。它包括来自当前两个联盟（美国和国家）、其他四个“主要”联盟美国协会、联盟的数据协会、球员联盟和联邦联盟，以及 1871-1875 年的全国协会。

At this point you should be able to run SQLite and view the database using either `./sqlite3 -header lahman.db` \(if in the previous section you downloaded a precompiled binary\) or `sqlite3 -header lahman.db` otherwise.

> 此时，您应该能够运行 SQLite 并使用`./sqlite3 -header lahman.db`（如果在上一节中您下载了预编译的二进制文件）或`sqlite3 -header lahman.db`查看数据库。

```text
$ sqlite3 lahman.db
SQLite version 3.33.0 2020-08-14 13:23:32
Enter ".help" for usage hints.
sqlite> .tables
```

Try running a few sample commands in the SQLite console and see what they do:

> 尝试在 SQLite 控制台中运行一些示例命令并查看它们的作用：

```text
sqlite> .schema people
```

```text
sqlite>  SELECT playerid, namefirst, namelast FROM people;
```

```text
sqlite> SELECT COUNT(*) FROM fielding;
```

## Understanding the Schema

The database is comprised of the following main tables:

> 数据库主要由以下几个表组成：

```text
People - Player names, date of birth (DOB), and biographical info
Batting - batting statistics
Pitching - pitching statistics
Fielding - fielding statistics
```

>人物 - 球员姓名、出生日期 (DOB) 和传记信息
>击球 - 击球统计
>投球 - 投球统计
>守备 - 守备统计

It is supplemented by these tables:.schema

> 以下表格对其进行了补充：

```text
  AllStarFull - All-Star appearances
  HallofFame - Hall of Fame voting data
  Managers - managerial statistics
  Teams - yearly stats and standings
  BattingPost - post-season batting statistics
  PitchingPost - post-season pitching statistics
  TeamFranchises - franchise information
  FieldingOF - outfield position data
  FieldingPost- post-season fielding data
  FieldingOFsplit - LF/CF/RF splits
  ManagersHalf - split season data for managers
  TeamsHalf - split season data for teams
  Salaries - player salary data
  SeriesPost - post-season series information
  AwardsManagers - awards won by managers
  AwardsPlayers - awards won by players
  AwardsShareManagers - award voting for manager awards
  AwardsSharePlayers - award voting for player awards
  Appearances - details on the positions a player appeared at
  Schools - list of colleges that players attended
  CollegePlaying - list of players and the colleges they attended
  Parks - list of major league ballparls
  HomeGames - Number of homegames played by each team in each ballpark
```

>```
>  AllStarFull - 全明星出场
>  HallofFame - 名人堂投票数据
>  Managers - 管理统计
>  Teams - 年度统计数据和排名
>  BattingPost - 赛季后击球统计
>  PitchingPost - 赛季后投球统计
>  TeamFranchises - 特许经营信息
>  FieldingOF - 外场位置数据
>  FieldingPost- 赛季后的防守数据
>  FieldingOFsplit - LF/CF/RF 分割
>  ManagersHalf - 经理的赛季数据
>  TeamsHalf - 球队的赛季数据
>  Salaries - 球员薪资数据
>  SeriesPost - 赛季后系列信息
>  AwardsManagers - 经理获得的奖项
>  AwardsPlayers - 玩家获得的奖项
>  AwardsShareManagers - 经理奖项投票
>  AwardsSharePlayers - 玩家奖项投票
>  Appearances - 有关球员出场位置的详细信息
>  Schools - 球员就读的大学列表
>  CollegePlaying - 球员名单和他们就读的大学
>  Parks - 大联盟球员名单
>  HomeGames - 每个球场每支球队进行的主场比赛数量
>```

For more detailed information, see the [docs online](http://www.seanlahman.com/files/database/readme2019.txt).

## Writing Queries

We've provided a skeleton solution file, `proj1.sql`, to help you get started. In the file, you'll find a `CREATE VIEW` statement for each part of the first 4 questions below, specifying a particular view name \(like `q2i`\) and list of column names \(like `playerid`, `lastname`\). The view name and column names constitute the interface against which we will grade this assignment. In other words, _don't change or remove these names_. Your job is to fill out the view definitions in a way that populates the views with the right tuples.

> 我们提供了一个框架解决方案文件“proj1.sql”来帮助您入门。在该文件中，您将找到下面前 4 个问题的每个部分的“CREATE VIEW”语句，指定特定的视图名称（如“q2i”）和列名称列表（如“playerid”、“姓氏`\)。视图名称和列名称构成了我们将根据其对作业进行评分的界面。换句话说，_不要更改或删除这些名称_。您的工作是以正确的元组填充视图的方式填写视图定义。

For example, consider Question 0: "What is the highest `era` \([earned run average](https://en.wikipedia.org/wiki/Earned_run_average)\) recorded in baseball history?".

> 例如，考虑问题 0：棒球历史上记录的最高`时代`（赢得的跑动平均值）

In the `proj1.sql` file we provide:

```sql
CREATE VIEW q0(era) AS
    SELECT 1 -- replace this line
;
```

You would edit this with your answer, keeping the schema the same:

```sql
-- solution you provide
CREATE VIEW q0(era) AS
 SELECT MAX(era)
 FROM pitching
;
```

To complete the project, create a view for `q0` as above \(via copy-paste\), and for all of the following queries, which you will need to write yourself.

You can confirm the test is now passing by running `python3 test.py -q 0`

```text
> python3 test.py -q 0
PASS q0
```

More details on testing can be found in the [Testing](testing.md) section.

### Changes from Lecture

SQLite doesn't support every SQL feature covered in lecture, specifically:

* There is support for `LEFT OUTER JOIN` but not `RIGHT OUTER` or `FULL OUTER`.
  * To get equivalent output to `RIGHT OUTER` you can reverse the order of the tables \(i.e. `A RIGHT JOIN B` is the same as `B LEFT JOIN A`.
  * While it isn't required to complete this assignment, the equivalent to `FULL OUTER JOIN` can be done by `UNION`ing `RIGHT OUTER` and `LEFT OUTER`
* There is no regex match \(`~`\) tilde operator. You can use `LIKE` instead.
* There is no `ANY` or `ALL` operator.

>* 支持“LEFT OUTER JOIN”，但不支持“RIGHT OUTER”或“FULL OUTER”。
>  * 要获得与“RIGHT OUTER”等效的输出，您可以颠倒表的顺序（即“A RIGHT JOIN B”与“B LEFT JOIN A”相同。
>  * 虽然不需要完成此分配，但可以通过“UNION”“RIGHT OUTER”和“LEFT OUTER”来完成“FULL OUTER JOIN”的等效操作
>* 没有正则表达式匹配 \(`~`\) 波浪号运算符。您可以使用“LIKE”代替。
>* 没有“ANY”或“ALL”运算符。

## Your Tasks

### Task 1: **Basics**

**i.** In the `people` table, find the `namefirst`, `namelast` and `birthyear` for all players with weight greater than 300 pounds.

**ii.** Find the `namefirst`, `namelast` and `birthyear` of all players whose `namefirst` field contains a space. Order the results by `namefirst`, breaking ties with `namelast` both in ascending order

**iii.** From the `people` table, group together players with the same `birthyear`, and report the `birthyear`, average `height`, and number of players for each `birthyear`. Order the results by `birthyear` in _ascending_ order.

>**i.** 在`people`表中，找到所有体重超过 300 磅的玩家的`namefirst`、`namelast`和`birthyear`。
>
>**ii.** 查找`namefirst`字段包含空格的所有玩家的`namefirst`、`namelast`和`birthyear`。按`namefirst`对结果进行排序，并按升序打破与`namelast`的关系
>
>**iii.** 从`people`表中，将具有相同`birthyear`的玩家分组在一起，并报告`birthyear`、平均`height`以及每个`birthyear`的玩家数量。按`出生年份`升序对结果进行排序。

Note: Some birth years have no players; your answer can simply skip those years. In some other years, you may find that all the players have a `NULL` height value in the dataset \(i.e. `height IS NULL`\); your query should return `NULL` for the height in those years.

> 注：有的出生年份没有球员；你的答案可以简单地跳过那些年。在其他一些年份，您可能会发现所有球员在数据集中都有一个“NULL”身高值（即“height IS NULL”）；您的查询应返回那些年份的身高“NULL”。

**iv.** Following the results of part iii, now only include groups with an average height &gt; `70`. Again order the results by `birthyear` in _ascending_ order.

> 顺着第三问的答案，现在只需要包含平均身高大于70的那些组。还是按`birthyear`升序排序

### Task 2: **Hall of Fame Schools**

**i.** Find the `namefirst`, `namelast`, `playerid` and `yearid` of all people who were successfully inducted into the Hall of Fame in _descending_ order of `yearid`. Break ties on `yearid` by `playerid` \(ascending\).

> i.查找 `namefirst`, `namelast`, `playerid` 和 `yearid`，对于那些入选名人堂的运动员，按照`yearid`降序排序，并按`playerid`升序打破与`yearid`的关系

**ii.** Find the people who were successfully inducted into the Hall of Fame and played in college at a school located in the state of California. For each person, return their `namefirst`, `namelast`, `playerid`, `schoolid`, and `yearid` in _descending_ order of `yearid`. Break ties on `yearid` by `schoolid, playerid` \(ascending\). For this question, `yearid` refers to the year of induction into the Hall of Fame.

* Note: a player may appear in the results multiple times \(once per year in a college in California\).

> **ii.**查找成功入选名人堂并且大学时期为加利佛尼亚州大学打球的人。返回他们的`namefirst`, `namelast`, `playerid`, `schoolid`和`yearid`，以`yearid`降序，`schoolid`和`playerid`升序。在这个问题里`yearid`指的是入选名人堂的年份

> 注意：一个运动员可能在结果中出现多次（在加州大学每年都有一次）

**iii.** Find the `playerid`, `namefirst`, `namelast` and `schoolid` of all people who were successfully inducted into the Hall of Fame -- whether or not they played in college. Return people in _descending_ order of `playerid`. Break ties on `playerid` by `schoolid` \(ascending\). \(Note: `schoolid` will be `NULL` if they did not play in college.\)

> 查找`playerid`, `namefirst`, `namelast` 和`schoolid`，对于所有成功入选名人堂，不管他们是否曾经在大学打过球。以`playerid`降序， `schoolid`升序返回。（注意：如果他们没有在大学里打过球，`schoolid`将会是`NULL`）

### Task 3: [**SaberMetrics**](https://en.wikipedia.org/wiki/Sabermetrics)

> 军刀计量学：Sabermetrics 的创建是为了让棒球迷通过客观证据了解这项运动。这是通过评估球员在比赛的各个方面来执行的，特别是击球、投球和投球。

**i.** Find the `playerid`, `namefirst`, `namelast`, `yearid` and single-year `slg` \(Slugging Percentage\) of the players with the 10 best annual Slugging Percentage recorded over all time. For statistical significance, only include players with more than 50 at-bats in the season. Order the results by `slg` descending, and break ties by `yearid, playerid` \(ascending\).

> 查找`playerid`, `namefirst`, `namelast`, `yearid` 和单年的 `slg`（击球率），对那些历史上记录的10名最佳年度击球率的球员。出于统计意义，仅包括赛季击球次数超过50次的球员。按`slg`降序对结果进行排序，并按`yearid、playerid`（升序）打破平局。

>SLG=（单打+（2×双打）+（3×三打）+（4×本垒打））/击球数

* Baseball note: Slugging Percentage is not provided in the database; it is computed according to a [simple formula](https://en.wikipedia.org/wiki/Slugging_percentage) you can calculate from the data in the database.
* SQL note: You should compute `slg` properly as a floating point number---you'll need to figure out how to convince SQL to do this!
* Data set note: The online documentation `batting` mentions two columns `2B` and `3B`. On your local copy of the data set these have been renamed `H2B` and `H3B` respectively \(columns starting with numbers are tedious to write queries on\).
* Data set note: The column `H` o f the `batting` table represents all hits = \(\# singles\) + \(\# doubles\) + \(\# triples\) + \(\# home runs\), not just \(\# singles\) so you’ll need to account for some double-counting
* If a player played on multiple teams during the same season \(for example `anderma02` in 2006\) treat their time on each team separately for this calculation

> - `slg`并没有在数据库中给出，你需要根据[simple formula](https://en.wikipedia.org/wiki/Slugging_percentage)来利用数据库中的数据进行计算
> - SQL注：使用`CAST`来转换成浮点类型计算
> - 数据集注：* 在线文档“batting”提到了两列`2B`和`3B`。在数据集的本地副本上，这些已分别重命名为`H2B`和`H3B`（以数字开头的列在其上编写查询很繁琐）。
> - 数据集注：‘击球’表的`H`列代表所有安打 = \(\#单打\) + \(\#双打\) + \(\#三垒打\) + \(\#本垒打 )，而不仅仅是 \(\# 单打) 所以你需要考虑一些重复计算
> - 如果运动员同一赛季在多个队里出场，那么将他们在每个队时分开计算

**ii.** Following the results from Part i, find the `playerid`, `namefirst`, `namelast` and `lslg` \(Lifetime Slugging Percentage\) for the players with the top 10 Lifetime Slugging Percentage. Lifetime Slugging Percentage \(LSLG\) uses the same formula as Slugging Percentage \(SLG\), but it uses the number of singles, doubles, triples, home runs, and at bats each player has over their entire career, rather than just over a single season.

Note that the database only gives batting information broken down by year; you will need to convert to total information across all time \(from the earliest date recorded up to the last date recorded\) to compute `lslg`. Order the results by `lslg` \(descending\) and break ties by `playerid` \(ascending\)

* Note: Make sure that you only include players with more than 50 at-bats across their lifetime.

**iii.** Find the `namefirst`, `namelast` and Lifetime Slugging Percentage \(`lslg`\) of batters whose lifetime slugging percentage is higher than that of San Francisco favorite Willie Mays.

You may include Willie Mays' `playerid` in your query \(`mayswi01`\), but you _may not_ include his slugging percentage -- you should calculate that as part of the query. \(Test your query by replacing `mayswi01` with the playerid of another player -- it should work for that player as well! We may do the same in the autograder.\)

* Note: Make sure that you still only include players with more than 50 at-bats across their lifetime.

_Just for fun_: For those of you who are baseball buffs, variants of the above queries can be used to find other more detailed SaberMetrics, like [Runs Created](https://en.wikipedia.org/wiki/Runs_created) or [Value Over Replacement Player](https://en.wikipedia.org/wiki/Value_over_replacement_player). Wikipedia has a nice page on [baseball statistics](https://en.wikipedia.org/wiki/Baseball_statistics); most of these can be computed fairly directly in SQL.

_Also just for fun_: SF Giants VP of Baseball Operations, [Yeshayah Goldfarb](https://www.mlb.com/giants/team/front-office/yeshayah-goldfarb), suggested the following:

> Using the Lahman database as your guide, make an argument for when MLBs “Steroid Era” started and ended. There are a number of different ways to explore this question using the data.

\(Please do not include your "just for fun" answers in your solution file! They will break the autograder.\)

### Task 4: **Salaries**

**i.** Find the `yearid`, min, max and average of all player salaries for each year recorded, ordered by `yearid` in _ascending_ order.

**ii.** For salaries in 2016, compute a [histogram](https://en.wikipedia.org/wiki/Histogram). Divide the salary range into 10 equal bins from min to max, with `binid`s 0 through 9, and count the salaries in each bin. Return the `binid`, `low` and `high` boundaries for each bin, as well as the number of salaries in each bin, with results sorted from smallest bin to largest.

* Note: `binid` 0 corresponds to the lowest salaries, and `binid` 9 corresponds to the highest. The ranges are left-inclusive \(i.e. `[low, high)`\) -- so the `high` value is excluded. For example, if bin 2 has a `high` value of 100000, salaries of 100000 belong in bin 3, and bin 3 should have a `low` value of 100000.
* Note: The `high` value for bin 9 may be inclusive\).
* Note: The test for this question is broken into two parts. Use `python3 test.py -q 4ii_bins_0_to_8` and `python3 test.py -q 4ii_bin_9` to run the tests
* Hidden testing advice: we will be testing the case where a bin has zero player salaries in it. The correct behavior in this case is to display the correct `binid`, `low` and `high` with a `count` of zero, NOT just excluding the bin altogether.

Some useful information:

* You may find it helpful to use the provided helper table containing all the possible `binid`s. We'll only be testing with these possible binid's \(there aren't any hidden tests using say, 100 bins\) so using the hardcoded table is fine
* If you want to take the [floor ](https://en.wikipedia.org/wiki/Floor_and_ceiling_functions)of a positive float value you can do `CAST (some_value AS INT)`

**iii.** Now let's compute the Year-over-Year change in min, max and average player salary. For each year with recorded salaries after the first, return the `yearid`, `mindiff`, `maxdiff`, and `avgdiff` with respect to the previous year. Order the output by `yearid` in _ascending_ order. \(You should omit the very first year of recorded salaries from the result.\)

**iv.** In 2001, the max salary went up by over $6 million. Write a query to find the players that had the max salary in 2000 and 2001. Return the `playerid`, `namefirst`, `namelast`, `salary` and `yearid` for those two years. If multiple players tied for the max salary in a year, return all of them.

* Note on notation: you are computing a relational variant of the [argmax](https://en.wikipedia.org/wiki/Arg_max) for each of those two years.

**v.** Each team has at least 1 All Star and may have multiple. For each team in the year 2016, give the `teamid` and `diffAvg` \(the difference between the team's highest paid all-star's salary and the team's lowest paid all-star's salary\).

* Note: Due to some discrepancies in the database, please draw your team names from the All-Star table \(so use `allstarfull.teamid` in the SELECT statement for this\).

## You're done!

Rerun `python3 test.py` to see if you're passing tests. If so, follow the instructions in the next section to submit your work.

