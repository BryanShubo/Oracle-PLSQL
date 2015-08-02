
### Schema
```
Schema is a logical collection of objects that belong to a user.
```
### Structured Query Language SQL: 
```
RDBMS relational database management system
```

### SQL: sub languages 
**DDL** (Data definition language):
```
 create (table or index) / alter (table) / drop (table or index)
 ```
**DML**( Data manipulation language ):
 ```
 insert/update/delete /select
 ```
 **DCL** (Data Control language) :
 ```
 grant/revoke
 ```
 **TCL** (Transaction control language):
 ```
 commit/rollback
 ```
 **DRL** (Data retrieval language):
 ```
 select
```

### SELECT (filting or sorting data) from one table
**LIKE** 
```
The pattern can contain special pattern-matching characters:
1) _ :  matches exactly one character

2) % :  matches zero or more characters. Note: '%' cannot match a null.
```

**IS**  is used to compare a column with null

**ORDER BY** : put it at the end of SELECT clause
```
1)ASC
2)DESC
```
Row limiting(https://oracle-base.com/articles/12c/row-limiting-clause-for-top-n-queries-12cr1)
```sql
1)
SELECT val
FROM   rownum_order_test
ORDER BY val DESC
FETCH FIRST 5 ROWS ONLY;

2) 
SELECT val
FROM   rownum_order_test
ORDER BY val DESC
FETCH FIRST 5 ROWS WITH TIES;

3) 
SELECT val
FROM   rownum_order_test
ORDER BY val
FETCH FIRST 20 PERCENT ROWS ONLY;

SELECT val
FROM   (SELECT val, rownum AS rnum
        FROM   (SELECT val
                FROM   rownum_order_test
                ORDER BY val)
        WHERE rownum <= 8)
WHERE  rnum >= 5;


SELECT val
FROM   rownum_order_test
ORDER BY val
OFFSET 4 ROWS FETCH NEXT 4 ROWS ONLY;

SELECT val
FROM   rownum_order_test
ORDER BY val
OFFSET 4 ROWS FETCH NEXT 20 PERCENT ROWS ONLY;
```

### Single-row functions
1) character functions
```
A single row function acts on one row at a time, and will return a value for each row sent to it as input.
```
The following single row function must be used with select statement.
```
1) select UPPER('hello') from dual; // HELLO

2)select lower('CAT') from dual; //cat

3)select INITCAP('hello world') from dual; // Hello World

4)select LENGTH('hello') from dual; // 5

5)select SUBSTR('hello', 2, 3) from dual; // Position starts from 1. 2->start point, 3-> number of chars

6)select CONCAT('sql', 'plus') from dual; // sqlplus

7)select LPAD('hello', 10, '?') from dual; // ?????hello

8)select RPAD('hello', 10, '?') from dual; // hello?????

9)select LTRIM('hellhhohehe', 'h') from dual; //ellhhohehe, delete the first character from left

10)select TTRIM('hellhhohehe', 'h') from dual; //hellhhohee, delete the first charactoer from right

11)TRIM( [ [ LEADING | TRAILING | BOTH ] trim_character FROM ] string1 )
TRIM('   tech   ')
Result: 'tech'

TRIM(' '  FROM  '   tech   ')
Result: 'tech'

TRIM(LEADING '0' FROM '0001203')
Result: '1203'

TRIM(TRAILING '1' FROM '1T1ech1')
Result: '1T1ech'

TRIM(BOTH '1' FROM '123Te11ch111')
Result: '23Te11ch'
```

2) numeric functions
```
1)select ROUND(27.566, 2) from dual; //27.57
select ROUND(27.566) from dual;// 28

2)select TRUNC(27.566, 2) from dual; // 27.56
select TRUNC(27.566) from dual; // 27

3)select ABS(-5) from dual; // 5
select ABS(-5.66) from dual; // 5.66

4)select FLOOR(38.9) from dual; // 38. Return the largest integer that less than the number.

5)select CEIL(38.1) from dual; // 39. Return the smallest integer that greater than the number.

6)select MOD(21, 4) from dual;// 1
select MOD(-21.5, 4) from dual;// -1.5
select MOD(21, 0) from dual;// 21
select MOD(0, 4) from dual;// 0
select MOD(0,0) from dual;// 0
```

3) Date Functions
```
1)select SYSDATE from dual; //'25-JAN-15'

2)select SYSTIMESTAMP from dual; //25-JAN-15 08.06.17.968000000 PM -05:00

3)select ADD_MONTHS('2-MAY-10', 2) from dual; // '2-JUL-10'
select ADD_MONTHS('2-MAY-10', -2) from dual; // '2-MAR-10'

4)select MONTHS_BETWEEN('1-Jan-15', 17-JAN-14) from dual;// 11.48387096774193548387096774193548387097

5)select TRUNC(sysdate, 'YEAR') from dual; // the first date of the year in the date 
select TRUNC(sysdate, 'MONTH') from dual; // the first date of the month in the date
```

4) Conversion Functions
```
1) select TO_CHAR(sysdate, 'ddth "of" MONTH, YYYY') from dual;
   select TO_CHAR(4578900.13, '$999,999.99') from dual;
   
2) select TO_DATE('3 of June, 2010', 'dd "of" Month, YYYY') from dual;

3) select TO_NUMBER('$45.6', '$99.9') + 3 from dual; // 48.6

```

5) Null Functions
```
1)NVL(column, 0) // if column is null, use 0

2) NVL2(column, 'new value', '0') // if column is null, use '0'. Otherwise, use 'new value'.

3) NULLIF(expr1, expr2) // expr1 == expr2, return null. Otherwise, return expr1.
```

### SELECT from multi-table

To connect n tables, it needs n-1 conditions at least

**INNER JOIN**: returns rows when there is a match in both tables.

**LEFT JOIN**: returns all rows from the left table, even if there are no matches in the 
right table (+).

**RIGHT JOIN**: returns all rows from the right table, even if there are no matches in the 
left table (+).

**FULL JOIN**: returns rows when there is a match in one of the tables.

**SELF JOIN**: is used to join a table to itself as if the table were two tables, 
temporarily renaming at least one table in the SQL statement.

**CARTESIAN JOIN**: returns the Cartesian product of the sets of records from the two or more joined tables.

### Manipulate table
1) Create a table
```
CREATE TABLE [schema.]table
(column datatype[size] [DEFAULT expr][, ...]);

datatype: number, char, varchar2, date
Explanation: NUMBER(12,2) 12 is the precision, 2 is the scale
```
2) create a table using exist table

```
CREATE TABLE table_name
AS select statement...

CREATE TABLE EMPBACKUP
AS SELECT first_name fname, last_name lname FROM EMPLOYEES;

or
CREATE TABLE EMPBACKUP(fname, lname)
AS SELECT first_name, last_name FROM EMPLOYEES;
```

3)  Alter a table
```
Add a new column:
ALTER TABLE employees
ADD (ADDRESS varchar2(100),
     PHONE varchar2(15));

Modify an existing column 
**increase or decrease the width of a column
****decreasing the size of a numeric column: the column must be empty
****decreasing the size of a character column: can be done all existing values in the column are 
     equal or less than the new width you to specify
**Changing the data type of a column
****The column must be empty (changing a varchar2 to char does not need the column being empty)
**Changing the null or not null property of a column

ALTER Table employees
MODIFY (ADDRESS VARCHAR2(150));

Define a new default value for the column

Rename and drop a column
ALTER TABLE table_name
RENAME COLUMN old_name TO new_name

ALTER TABLE table_name
DROP COLUMN column_name;
DROP (first_name, last_name);
```




### Group functions
```
1)SUM // numeric only

2)AVG // numeric only

3)MAX // all data types: numeric, character, and date

4)MIN // all data types: numeric, character, and date

5)COUNT(*) // return the number of rows in the table or group
  COUNT(column) // return the number of non-null value in that column

6)GROUP BY:
--allow you to create sub groups
--every distinct value of the column mentioned in the group by clause becomes a separate goup
--rows that are associated with the column value fall into the sub group
--the group function is then applied to the sub groups to create a value for each sub group

7)HAVING: restriction groups
SELECT column_list FROM table_name
WHERE condition
GROUP BY column(s)
HAVING condition
ORDER BY column;


SELECT JOB_ID, SUM(salary) from EMPLOYEES where JOB_ID like'A%' GROUP BY JOB_ID HAVING SUM(SALARY)>10000;

SELECT first_name, count(1) as count from NAME_LIST group by first_name having count(1)>100;

```

### Data Dictionary
1) User created tables
2) Database system created table: data dictionary tables
```
tables/indexes/views/users /sequences/packages//privileges
-- Central to every Oracle database
-- Describes the database and its objects
-- Can be used as a read-only reference
-- Updated when DDL and DCL commands are issued
-- Owned by the user SYS
-- Stored in the SYSTEM tablespace
-- SELECT_CATALOG_ROLE role to access all its contents

Categories of Data Dictionary Views:
-- DBA_objectname: All of the objects in the database
-- ALL_objectname: Objects OWNED and ACCESS by the current user
-- USER_objectname: Objects OWNED by the current user


GRANT SELECT ON table_name on USER
```

```
1) select table_name from user_tables;

2) select view_name, text from user_views;

3) select sequence_name from user_sequences;

4) select synonym_name from user_synonyms;

5) select index_name from user_indexes;
```

```
ALTER TABLE table_name
ADD CONSTRAINT apk PRIMARY KEY(A)

6) select constraint_name, constraint_type from user_constraints where table_name = 'NEWTAB';

7) select constraint_name, column_name from user_cons_columns where table_name ='NEWTAB';
```

### Create a view
```
Purpose: 
Use the CREATE VIEW statement to define a view, which is a logical table based on one or 
more tables or views. 

1) A view contains no data itself. The tables upon which a view is based are called base tables.

2) Views evaluate the data in the tables underlying the view definition at the time the view is 
queried. It is a logical view of your tables, with no data stored anywhere else. 

3) The upside of a view is that it will always return the latest data to you. 

4) The downside of a view is that its performance depends on how good a select statement the view 
is based on. If the select statement used by the view joins many tables, or uses joins based on 
non-indexed columns, the view could perform poorly.
```

### Create an index
```
Purpose

Use the CREATE INDEX statement to create an index on:

One or more columns of a table, a partitioned table, an index-organized table, or a cluster

One or more scalar typed object attributes of a table or a cluster

A nested table storage table for indexing a nested table column

An index is a schema object that contains an entry for each value that appears in the 
indexed column(s) of the table or cluster and provides direct, fast access to rows. Oracle Database 
supports several types of index:

Normal indexes. (By default, Oracle Database creates B-tree indexes.)

Bitmap indexes, which store rowids associated with a key value as a bitmap

Partitioned indexes, which consist of partitions containing an entry for each value that appears in 
the indexed column(s) of the table

Function-based indexes, which are based on expressions. They enable you to construct queries that 
evaluate 
the value returned by an expression, which in turn may include built-in or user-defined functions.

Domain indexes, which are instances of an application-specific index of type indextype
```
### Create synonym
```
Purpose

Use the CREATE SYNONYM statement to create a synonym, which is an alternative name for a table, view, 
sequence, procedure, stored function, package, materialized view, Java class schema object, 
user-defined object type, or another synonym.

Synonyms provide both data independence and location transparency. Synonyms permit applications to f
unction without modification regardless of which user owns the table or view and regardless of which 
database holds the table or view. However, synonyms are not a substitute for privileges on database 
objects. Appropriate privileges must be granted to a user before the user can use the synonym.

You can refer to synonyms in the following DML statements: SELECT, INSERT, UPDATE, DELETE, FLASHBACK 
TABLE, EXPLAIN PLAN, and LOCK TABLE.

You can refer to synonyms in the following DDL statements: AUDIT, NOAUDIT, GRANT, REVOKE, and COMMENT.

Prerequisites

To create a private synonym in your own schema, you must have the CREATE SYNONYM system privilege.

To create a private synonym in another user's schema, you must have the CREATE ANY SYNONYM system privilege.

To create a PUBLIC synonym, you must have the CREATE PUBLIC SYNONYM system privilege.
```

### Packages

### Procedures

### Functions

### Queues

### Triggers


### Sequences


### Materialized View
```
1) Materialized views are similar to regular views, in that they are a logical view of your data 
(based on a select statement). However, the underlying query resultset has been saved to a table. 

2) The upside of this is that when you query a materialized view, you are querying a table, which may 
also be indexed. 

** In addition, because all the joins have been resolved at materialized view refresh
time, you pay the price of the join once (or as often as you refresh your materialized view), rather 
than each time you select from the materialized view. 

** In addition, with query rewrite enabled, Oracle can optimize a query that selects from the 
source of your materialized view in such a way that it instead reads from your materialized view. 

** In situations where you create materialized views as forms of aggregate tables, or as copies of 
frequently executed queries, this can greatly speed up the response time of your end user application. 

3) The downside though is that the data you get back from the materialized view is only as up to date as
the last time the materialized view has beenrefreshed.

4) Materialized views can be set to refresh manually, on a set schedule, or based on the database 
detecting a change in data from one of the underlying tables. Materialized views can be 
incrementally updated by combining them with materialized view logs, which act as change data 
capture sources on the underlying tables.

5) Materialized views are most often used in data warehousing / business intelligence applications 
where querying large fact tables with thousands of millions of rows would result in query 
response times that resulted in an unusable application.

```


### Database Links
