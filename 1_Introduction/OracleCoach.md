
###1. schema is a logical collection of objects that belong to a user.

###2. Structured Query Language SQL: RDBMS relational database management system

###3. SQL: sub languages 
Data definition language DDL: create / alter / drop
Data manipulation language DML: insert/update/delete
Data Control language DCL: grant/revoke
Transaction control language TCL: commit/rollback
Data retrieval language DRL: select


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


