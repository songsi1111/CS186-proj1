# Testing

You can run your answers through SQLite directly by running `sqlite3 lahman.db` to open the database and then entering `.read proj1.sql`

> 您可以直接通过 SQLite 运行答案，方法是运行`sqlite3 lahman.db`打开数据库，然后输入`.read proj1.sql`

```text
$ sqlite3 lahman.db
SQLite version 3.33.0 2020-08-14 13:23:32
Enter ".help" for usage hints.
sqlite> .read proj1.sql
```

This can help you catch any syntax errors in your SQL.

To help debug your logic, we've provided output from each of the views you need to define in questions 1-4 for the data set you've been given. Your views should match ours, but note that your SQL queries should work on ANY data set. **We will test your queries on a \(set of\) different database\(s\), so it is** _**NOT**_ **sufficient to simply return these results in all cases!**

> 为了帮助调试您的逻辑，我们提供了您需要在问题 1-4 中为您提供的数据集定义的每个视图的输出。您的视图应该与我们的视图一致，但请注意，您的 SQL 查询应该适用于任何数据集。 **我们将在一组不同的数据库上测试您的查询，因此 _不是_ 只需返回这些结果就足够了!**

To run the test, from within the `sp21-proj1-yourname` directory:

```text
$ python3 test.py
$ python3 test.py -q 4ii # This would run tests for only q4ii
```

Become familiar with the UNIX [diff](http://en.wikipedia.org/wiki/Diff) format, if you're not already, because our tests saves a simplified diff for any query executions that don't match in `diffs/`. As an example, the following output for `diffs/q1i.txt:`:

> 如果您还不熟悉 UNIX [diff](http://en.wikipedia.org/wiki/Diff) 格式，请先熟悉一下，因为我们的测试会为任何与 ` 中不匹配的查询执行保存一个简化的差异差异`。例如，`diffs/q1i.txt:`的以下输出：

```text
- 1|1|1
+ Jumbo|Diaz|1984
+ Walter|Young|1980
```

indicates that your output has an extra `1|1|1` \(the `-` at the beginning means the expected output _doesn't_ include this line but your output has it\) and is missing the lines `Jumbo|Diaz|1984` and `Walter|Young|1980` \(the plus at the beginning means the expected output _does_ include those lines but your output is missing it\). If there is neither a `+` nor `-` at the beginning then it means that the line is in both your output and the expected output \(your output is correct for that line\).

If you care to look at the query outputs directly, ours are located in the `expected_output` directory. Your view output should be located in your solution's `your_output` directory once you run the tests.

>表示您的输出有一个额外的 `1|1|1` （开头的 `-` 表示预期输出_不_包含此行，但您的输出有它）并且缺少行 `Jumbo|Diaz| 1984` 和 `Walter|Young|1980` （开头的加号表示预期输出_确实_包含这些行，但你的输出缺少它）。如果开头既没有“+”也没有“-”，则意味着该行既在您的输出中又在预期输出中（您的输出对该行来说是正确的）。
>
>如果您想直接查看查询输出，我们的输出位于“expected_output”目录中。运行测试后，您的视图输出应位于解决方案的“your_output”目录中。

**Note:** For queries where we don't specify the order, it doesn't matter how you sort your results; we will reorder before comparing. Note, however, that our test query output is sorted for these cases, so if you're trying t

o compare yours and ours manually line-by-line, make sure you use the proper ORDER BY clause \(you can determine this by looking in `test.py`\). Different versions of SQLite handle floating points slightly differently so we also round certain floating point values in our own queries. A full list is specified here for convenience:

> **注意：** 对于我们不指定顺序的查询，您如何对结果进行排序并不重要；我们将在比较之前重新排序。但请注意，我们的测试查询输出是针对这些情况进行排序的，因此，如果您尝试手动逐行比较您的和我们的，请确保使用正确的 ORDER BY 子句 （您可以通过查看来确定这一点在`test.py`中）。不同版本的 SQLite 对浮点的处理略有不同，因此我们也在自己的查询中舍入某些浮点值。为方便起见，此处指定了完整列表：

```sql
SELECT * FROM q0;
SELECT * FROM q1i ORDER BY namefirst, namelast, birthyear;
SELECT * FROM q1ii ORDER BY namefirst, namelast, birthyear;
SELECT birthyear, ROUND(avgheight, 4), count FROM q1iii;
SELECT birthyear, ROUND(avgheight, 4), count FROM q1iv;
SELECT * FROM q2i;
SELECT * FROM q2ii;
SELECT * FROM q2iii;
SELECT playerid, namefirst, namelast, yearid, ROUND(slg, 4) FROM q3i;
SELECT playerid, namefirst, namelast, ROUND(lslg, 4) FROM q3ii;
SELECT namefirst, namelast, ROUND(lslg, 4) FROM q3iii ORDER BY namefirst, namelast;
SELECT yearid, min, max, ROUND(avg, 4) FROM q4i;
SELECT * FROM q4ii WHERE binid <> 9;
WITH max_salary AS (SELECT MAX(salary) AS salary FROM salaries)
        SELECT binid, low,
            ((CASE WHEN high >= salary THEN '' ELSE 'not ' END) ||
                    'at least ' || salary) AS high, count
        FROM q4ii, max_salary WHERE binid = 9;
SELECT yearid, mindiff, maxdiff, ROUND(avgdiff, 4) FROM q4iii;
SELECT * FROM q4iv ORDER BY yearid, playerid;
SELECT team, ROUND(diffAvg, 4) FROM q4v ORDER BY team;
```

