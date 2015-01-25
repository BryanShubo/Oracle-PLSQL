
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
