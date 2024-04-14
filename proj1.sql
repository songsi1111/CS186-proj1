-- Before running drop any existing views
DROP VIEW IF EXISTS q0;
DROP VIEW IF EXISTS q1i;
DROP VIEW IF EXISTS q1ii;
DROP VIEW IF EXISTS q1iii;
DROP VIEW IF EXISTS q1iv;
DROP VIEW IF EXISTS q2i;
DROP VIEW IF EXISTS q2ii;
DROP VIEW IF EXISTS q2iii;
DROP VIEW IF EXISTS q3i;
DROP VIEW IF EXISTS q3ii;
DROP VIEW IF EXISTS q3iii;
DROP VIEW IF EXISTS q4i;
DROP VIEW IF EXISTS q4ii;
DROP VIEW IF EXISTS q4iii;
DROP VIEW IF EXISTS q4iv;
DROP VIEW IF EXISTS q4v;

-- Question 0
CREATE VIEW q0(era)
AS
  SELECT MAX(era)
 FROM pitching
;

-- Question 1i
CREATE VIEW q1i(namefirst, namelast, birthyear)
AS
  SELECT namefirst, namelast, birthyear
 FROM people
 WHERE weight>300
;

-- Question 1ii
CREATE VIEW q1ii(namefirst, namelast, birthyear)
AS
  SELECT namefirst, namelast, birthyear
 FROM people
 WHERE namefirst LIKE '% %'
 ORDER BY namefirst ASC,namelast ASC
;

-- Question 1iii
CREATE VIEW q1iii(birthyear, avgheight, count)
AS
  SELECT birthyear, avg(height), count(*)
 FROM people
 GROUP BY birthyear
 ORDER BY birthyear
;

-- Question 1iv
CREATE VIEW q1iv(birthyear, avgheight, count)
AS
  SELECT birthyear, avg(height), count(*)
 FROM people
 GROUP BY birthyear
 HAVING avg(height)>70
 ORDER BY birthyear ASC
;

-- Question 2i
CREATE VIEW q2i(namefirst, namelast, playerid, yearid)
AS
  SELECT DISTINCT namefirst, namelast, people.playerid, yearid
 FROM people,halloffame
 WHERE people.playerid=halloffame.playerid AND halloffame.inducted LIKE 'Y'
 ORDER BY yearid DESC, people.playerid ASC
;

-- Question 2ii
CREATE VIEW q2ii(namefirst, namelast, playerid, schoolid, yearid)
AS
  SELECT namefirst, namelast, q2i.playerid, s.schoolid, yearid
 FROM q2i, collegeplaying C, schools S
 WHERE q2i.playerid=c.playerid AND s.schoolID=c.schoolID AND schoolstate LIKE 'CA'
 ORDER BY yearid DESC, s.schoolid, q2i.playerid
;

-- Question 2iii
CREATE VIEW q2iii(playerid, namefirst, namelast, schoolid)
AS
  SELECT q2i.playerid, namefirst, namelast, schoolid
 FROM q2i LEFT OUTER JOIN collegeplaying C ON q2i.playerid=c.playerid
 ORDER BY q2i.playerid DESC, schoolid ASC
;

-- Question 3i
CREATE VIEW q3i(playerid, namefirst, namelast, yearid, slg)
AS
  SELECT people.playerid, namefirst, namelast, yearid, ROUND((CAST(h AS FLOAT) + 1.0 * CAST(h2b AS FLOAT) + 2.0 * CAST(h3b AS FLOAT) + 3.0 * CAST(hr AS FLOAT)) / CAST(ab AS FLOAT),4) AS slg
  FROM people
  INNER JOIN batting ON people.playerid = batting.playerid
  WHERE AB > 50
  ORDER BY slg DESC, yearid, people.playerid
  LIMIT 10
;

-- Question 3ii
CREATE VIEW q3ii(playerid, namefirst, namelast, lslg)
AS
 SELECT p.playerid, namefirst, namelast, ROUND((CAST(sum(h) AS FLOAT) + 1.0 * CAST(sum(h2b) AS FLOAT) + 2.0 * CAST(sum(h3b) AS FLOAT) + 3.0 * CAST(sum(hr) AS FLOAT)) / CAST(sum(ab) AS FLOAT),4) AS lslg
 FROM people p INNER JOIN batting b ON p.playerid=b.playerid
 GROUP BY p.playerid
 HAVING sum(ab)>50
 ORDER BY lslg DESC, p.playerid ASC
 LIMIT 10
;

-- Question 3iii
CREATE VIEW q3iii(namefirst, namelast, lslg)
AS
WITH williemays(lslg) AS 
  (SELECT ROUND((CAST(sum(h) AS FLOAT) + 1.0 * CAST(sum(h2b) AS FLOAT) + 2.0 * CAST(sum(h3b) AS FLOAT) + 3.0 * CAST(sum(hr) AS FLOAT)) / CAST(sum(ab) AS FLOAT),4)
 FROM people p INNER JOIN batting b ON p.playerid=b.playerid
 WHERE p.playerid LIKE 'mayswi01'
 GROUP BY p.playerid)

 SELECT namefirst, namelast, ROUND((CAST(sum(h) AS FLOAT) + 1.0 * CAST(sum(h2b) AS FLOAT) + 2.0 * CAST(sum(h3b) AS FLOAT) + 3.0 * CAST(sum(hr) AS FLOAT)) / CAST(sum(ab) AS FLOAT),4) AS lslgn
 FROM people p INNER JOIN batting b ON p.playerid=b.playerid
 GROUP BY p.playerid
 HAVING sum(ab)>50 AND lslgn>(SELECT lslg FROM williemays)
 ORDER BY lslgn DESC, p.playerid ASC
;

-- Question 4i
CREATE VIEW q4i(yearid, min, max, avg)
AS
  SELECT yearid, MIN(salary), MAX(salary), ROUND(AVG(salary), 4)
 FROM people INNER JOIN salaries ON people.playerid=salaries.playerid
 GROUP BY yearid
 ORDER BY yearid ASC
;

-- Question 4ii
CREATE VIEW q4ii(binid, low, high, count)
AS
WITH bin(binid, low, high) AS
  (SELECT num AS binid, (min+num*(max-min)/10) AS low, (min+(num+1)*(max-min)/10) AS high
 FROM
  (SELECT 0 AS num UNION ALL
   SELECT 1 AS num UNION ALL
   SELECT 2 AS num UNION ALL
   SELECT 3 AS num UNION ALL
   SELECT 4 AS num UNION ALL
   SELECT 5 AS num UNION ALL
   SELECT 6 AS num UNION ALL
   SELECT 7 AS num UNION ALL
   SELECT 8 AS num UNION ALL
   SELECT 9 AS num),
  (SELECT MAX(salary) AS max, MIN(salary) AS min
   FROM salaries
   WHERE yearid=2016
   GROUP BY yearid) AS y2016
 GROUP BY binid)

  SELECT binid, low, high, COUNT(salary)
 FROM salaries, bin
 WHERE yearid=2016 AND ((binid<9 AND salary>=low AND salary < high) OR (binid=9 AND salary>=low AND salary <= high))
 GROUP BY binid
;
-- Question 4iii
CREATE VIEW q4iii(yearid, mindiff, maxdiff, avgdiff)
AS
  SELECT yearid, min, max, avg
 FROM q4i
;

-- Question 4iv
CREATE VIEW q4iv(playerid, namefirst, namelast, salary, yearid)
AS
  SELECT 1, 1, 1, 1, 1 -- replace this line
;
-- Question 4v
CREATE VIEW q4v(team, diffAvg) AS
  SELECT 1, 1 -- replace this line
;

