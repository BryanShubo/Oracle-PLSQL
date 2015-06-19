
### Schema is a logical collection of objects that belong to a user.

### Structured Query Language SQL: RDBMS relational database management system

### SQL: sub languages 
```
Data definition language DDL: create / alter / drop
Data manipulation language DML: insert/update/delete
Data Control language DCL: grant/revoke
Transaction control language TCL: commit/rollback
Data retrieval language DRL: select
```

### Manipulate table
```
1) Create a tablle
CREATE TABLE [schema.]table
(column datatype[size] [DEFAULT expr][, ...]);

datatype: number, char, varchar2, date
Explanation: NUMBER(12,2) 12 is the precision, 2 is the scale

2) create a table using exist table

CREATE TABLE table_name
AS select statement...

CREATE TABLE EMPBACKUP
AS SELECT first_name fname, last_name lname FROM EMPLOYEES;

or
CREATE TABLE EMPBACKUP(fname, lname)
AS SELECT first_name, last_name FROM EMPLOYEES;


3)  Alter a table

Add a new column:
ALTER TABLE employees
ADD (ADDRESS varchar2(100),
     PHONE varchar2(15));

Modify an existing column 
--increase or decrease the width of a column
----decreasing the size of a numeric column: the column must be empty
----decreasing the size of a character column: can be done all existing values in the column are equal or less than the new width you to specify
--Changing the data type of a column
----The column must be empty (changing a varchar2 to char does not need the column being empty)
--Changing the null or not null property of a column

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
### LIKE, IS
```
The pattern can contain special pattern-matching characters:

An underscore (_) in the pattern matches exactly one character (as opposed to one byte in a multibyte character set) in the value.

A percent sign (%) in the pattern can match zero or more characters (as opposed to bytes in a multibyte character set) in the value. The pattern '%' cannot match a null.

IS is used to compare a column with null
```

### Single-row functions--character functions
```
A single row function acts on one row at a time, and will return a value for each row sent to it as input.
```
The following single row function must be used with select statement.
```
1) select UPPER('hello') from dual; // HELLO

2)select lower('CAT') from dual; //cat

3)select INITCAP('hello world') from dual; // Hello World

4)select LENGTH('hello') from dual; // 5

5)select SUBSTR('hello', 2, 3) from dual; // Position starts from 1. 2-> start position, 3-> number of characters

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

### Single row functions--numeric functions
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

### Single row function--Date Functions
```
1)select SYSDATE from dual; //'25-JAN-15'

2)select SYSTIMESTAMP from dual; //25-JAN-15 08.06.17.968000000 PM -05:00

3)select ADD_MONTHS('2-MAY-10', 2) from dual; // '2-JUL-10'
select ADD_MONTHS('2-MAY-10', -2) from dual; // '2-MAR-10'

4)select MONTHS_BETWEEN('1-Jan-15', 17-JAN-14) from dual;// 11.48387096774193548387096774193548387097

5)select TRUNC(sysdate, 'YEAR') from dual; // the first date of the year in the date 
select TRUNC(sysdate, 'MONTH') from dual; // the first date of the month in the date
```

### Single row function--Conversion Functions
```
1) select TO_CHAR(sysdate, 'ddth "of" MONTH, YYYY') from dual;
   select TO_CHAR(4578900.13, '$999,999.99') from dual;
   
2) select TO_DATE('3 of June, 2010', 'dd "of" Month, YYYY') from dual;

3) select TO_NUMBER('$45.6', '$99.9') + 3 from dual; // 48.6

```

### Single row--Null Functions
```
1)NVL(column, 0) // if column is null, use 0

2) NVL2(column, 'new value', '0') // if column is null, use '0'. Otherwise, use 'new value'.

3) NULLIF(expr1, expr2) // expr1 == expr2, return null. Otherwise, return expr1.
```

###15. Group functions
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

```

### Data Dictionary
```
16.1 User created tables

16.2 Database system created table: data dictionary tables
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
more tables or views. A view contains no data itself. The tables upon which a view is based are 
called base tables.
```

### Create an index
```
Purpose

Use the CREATE INDEX statement to create an index on:

One or more columns of a table, a partitioned table, an index-organized table, or a cluster

One or more scalar typed object attributes of a table or a cluster

A nested table storage table for indexing a nested table column

An index is a schema object that contains an entry for each value that appears in the indexed column(s) of the table or cluster and provides direct, fast access to rows. Oracle Database supports several types of index:

Normal indexes. (By default, Oracle Database creates B-tree indexes.)

Bitmap indexes, which store rowids associated with a key value as a bitmap

Partitioned indexes, which consist of partitions containing an entry for each value that appears in the indexed column(s) of the table

Function-based indexes, which are based on expressions. They enable you to construct queries that evaluate the value returned by an expression, which in turn may include built-in or user-defined functions.

Domain indexes, which are instances of an application-specific index of type indextype
```
### Create synonym
```
Purpose

Use the CREATE SYNONYM statement to create a synonym, which is an alternative name for a table, view, sequence, procedure, stored function, package, materialized view, Java class schema object, user-defined object type, or another synonym.

Synonyms provide both data independence and location transparency. Synonyms permit applications to function without modification regardless of which user owns the table or view and regardless of which database holds the table or view. However, synonyms are not a substitute for privileges on database objects. Appropriate privileges must be granted to a user before the user can use the synonym.

You can refer to synonyms in the following DML statements: SELECT, INSERT, UPDATE, DELETE, FLASHBACK TABLE, EXPLAIN PLAN, and LOCK TABLE.

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


### Database Links
