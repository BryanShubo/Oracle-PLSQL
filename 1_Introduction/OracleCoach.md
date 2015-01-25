
###1. schema is a logical collection of objects that belong to a user.

###2. Structured Query Language SQL: RDBMS relational database management system

###3. SQL: sub languages 
```
Data definition language DDL: create / alter / drop
Data manipulation language DML: insert/update/delete
Data Control language DCL: grant/revoke
Transaction control language TCL: commit/rollback
Data retrieval language DRL: select
```

###4. create a table
```
CREATE TABLE [schema.]table
(column datatype[size] [DEFAULT expr][, ...]);
```

datatype: number, char, varchar2, date
Explanation: NUMBER(12,2) 12 is the precision, 2 is the scale

###5. create a table using exist table
```
CREATE TABLE table_name
AS select statement...
```

```
CREATE TABLE EMPBACKUP
AS SELECT first_name fname, last_name lname FROM EMPLOYEES;

or
CREATE TABLE EMPBACKUP(fname, lname)
AS SELECT first_name, last_name FROM EMPLOYEES;
```

###6. Alter a table
```
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

###7. Create a view
Purpose

Use the CREATE VIEW statement to define a view, which is a logical table based on one or more tables or views. A view contains no data itself. The tables upon which a view is based are called base tables.


###8. Create an index
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

###9. Create synonym
Purpose

Use the CREATE SYNONYM statement to create a synonym, which is an alternative name for a table, view, sequence, procedure, stored function, package, materialized view, Java class schema object, user-defined object type, or another synonym.

Synonyms provide both data independence and location transparency. Synonyms permit applications to function without modification regardless of which user owns the table or view and regardless of which database holds the table or view. However, synonyms are not a substitute for privileges on database objects. Appropriate privileges must be granted to a user before the user can use the synonym.

You can refer to synonyms in the following DML statements: SELECT, INSERT, UPDATE, DELETE, FLASHBACK TABLE, EXPLAIN PLAN, and LOCK TABLE.

You can refer to synonyms in the following DDL statements: AUDIT, NOAUDIT, GRANT, REVOKE, and COMMENT.

Prerequisites

To create a private synonym in your own schema, you must have the CREATE SYNONYM system privilege.

To create a private synonym in another user's schema, you must have the CREATE ANY SYNONYM system privilege.

To create a PUBLIC synonym, you must have the CREATE PUBLIC SYNONYM system privilege.


###10. LIKE, IS
```
The pattern can contain special pattern-matching characters:

An underscore (_) in the pattern matches exactly one character (as opposed to one byte in a multibyte character set) in the value.

A percent sign (%) in the pattern can match zero or more characters (as opposed to bytes in a multibyte character set) in the value. The pattern '%' cannot match a null.

```

```
IS is used to compare a column with null
```

###11. Single-row functions and dual
```
A single row function acts on one row at a time, and will return a value for each row sent to it as input.
```
The following single row function must be used with select statement.
```
*select UPPER('hello') from dual; // HELLO

select lower('CAT') from dual; //cat

select INITCAP('hello world') from dual; // Hello World

select LENGTH('hello') from dual; // 5

select SUBSTR('hello', 2, 3) from dual; // Position starts from 1. 2-> start position, 3-> number of characters

select CONCAT('sql', 'plus') from dual; // sqlplus

select LPAD('hello', 10, '?') from dual; // ?????hello

select RPAD('hello', 10, '?') from dual; // hello?????

select LTRIM('hellhhohehe', 'h') from dual; //ellhhohehe, delete the first character from left

select TTRIM('hellhhohehe', 'h') from dual; //hellhhohee, delete the first charactoer from right

TRIM( [ [ LEADING | TRAILING | BOTH ] trim_character FROM ] string1 )
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
