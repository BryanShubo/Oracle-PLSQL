
###1. PL/SQL Structure
```
Example 1:

DECLARE
N1 NUMBER;
N2 NUMBER;
RESULT NUMBER;

BEGIN
N1:=4;
N2:=5;
RESULT := N1+N2;
DBMS_OUTPUT.PUT_LINE(RESULT);
END;
/
```

```
PL/SQL Structure:

DECLARE -- optional
variable declaration

BEGIN --mandatory
statements of the program

EXCEPTION -- optional
error handling

END:
/
```

###2. The Declaration Section
```
-- Is an optional section
-- Used to declare the variables that will be used in the program
-- A vaiable has a name and datatype at the least
-- Every variable referenced in the program must be declared in the declaration section
```

```
Datatypes:
NUMBER: store numeric data
CHAR: store FIXED length character data
VARCHAR2(n): store variable length character data (n is the max size and  must be initialized)
DATE: stroes date value (DD-MON-YY format)
BOOLEAN: store TURE, FALSE or NULL
```
Examples:
```
vSalary NUMBER; -- initial value is null
vCounter NUMBER(10); -- initial value is null
vPrice NUMBER(10,2); -- initial value is null
vMax NUMBER:=100;

vDate DATE:='10-APR-90';
vBday CONSTANT DATE:='12-DEC-91'; -- this variable cannot be changed.
vFname VARCHAR2(30):='John';
vLname VARCHAR2(30) NOT NULL:='Swift'; -- this variable cannot be assign an null value in the program
vActive BOOLEAN:=FALSE;

The assignment operator:     :=
```

###3. Body block
```
-- Every PL/SQL block should have a body
-- The body is contained of one or more executable statements enclosed between keywords BEGIN and END
-- Each executable statement is terminated with aq semicolon.
-- Teh termination of the block is indicated by a forward slash as the first character on a new line
```

```
DBMS_OUTPUT.PUT_LINE
-- Used to display a string on the screen. The string should be enclosed in single quotes
-- A variable name should not be enclosed in single quotes.
-- If the variable is not a character variable, use the to_char function around the variable name
-- Combine a string with a variable with the use of the concatenation character (double pipe ||)

DBMS_OUTPUT.PUT_LINE('Hello world');
DBMS_OUTPUT.PUT_LINE(TO_CHAR(vSalary));
DBMS_OUTPUT.PUT_LINE(vName);
DBMS_OUTPUT.PUT_LINE('The name is ' || vName);
```

###4. IF statement
```
Syntax:

IF condition THEN
statement(s);
ELSIF condition THEN
statement(s);
ELSIF condition THEN
statement(s);
ELSE
statement(s);
END IF;
```

###5. LOOP Statements
####5.1 Loop
```
   {...statements...}
END LOOP;

Example:
LOOP
   monthly_value := daily_value * 31;
   EXIT WHEN monthly_value > 4000;
END LOOP;
```
####5.2 While Loop
```
WHILE(condition) LOOP
executable statement(s);
END LOOP;

Example:
WHILE monthly_value <= 4000
LOOP
   monthly_value := daily_value * 31;
END LOOP;
```
####5.3 For Loop
```
FOR...LOOP...END LOOP

Example:
FOR Lcntr IN 1..20
LOOP
   LCalc := Lcntr * 31;
END LOOP;

Example: cursor for loop
FOR record_index in cursor_name
LOOP
   {...statements...}
END LOOP;

CREATE OR REPLACE Function TotalIncome
   ( name_in IN varchar2 )
   RETURN varchar2
IS
   total_val number(6);

   cursor c1 is
     SELECT monthly_income
     FROM employees
     WHERE name = name_in;

BEGIN

   total_val := 0;

   FOR employee_rec in c1
   LOOP
      total_val := total_val + employee_rec.monthly_income;
   END LOOP;

   RETURN total_val;

END;
```
####5.4 Case
```
CASE [ expression ]

   WHEN condition_1 THEN result_1
   WHEN condition_2 THEN result_2
   ...
   WHEN condition_n THEN result_n

   ELSE result

END

Example:
SELECT table_name,
CASE owner
  WHEN 'SYS' THEN 'The owner is SYS'
  WHEN 'SYSTEM' THEN 'The owner is SYSTEM'
  ELSE 'The owner is another value'
END
FROM all_tables;
```
####5.5 GOTO
```
CREATE OR REPLACE Function FindCourse
   ( name_in IN varchar2 )
   RETURN number
IS
   cnumber number;

   CURSOR c1
   IS
     SELECT MAX(course_number)
     FROM courses_tbl
     WHERE course_name = name_in;

BEGIN

   open c1;
   fetch c1 into cnumber;

   IF c1%notfound then
      GOTO default_number;

   ELSE
      GOTO increment_number;
   END IF;

<<default_number>>
   cnumber := 0;

<<increment_number>>
   cnumber := cnumber + 1;

   close c1;

RETURN cnumber;
   
END;
```

###6. User Creation
```
Database:
SYSTEM: system tables, dictionary tables
SYSAUX: maintained by specific features, like oracle scheduler, oracle data mining, etc.
USERS: user tables and objects
TEMP: temperal objects, like sorting
UNDO: for rollback and reconsistence
```

Space for a new user
```
A new user associated with a tablespace takes the space from USERS. A schema is : a logic grouping of objects that belonging to an user.
```
Checklist - Creating a USer
```
1) Choose a username and password
2) Identify the default tablespace(DEFAULT TABLESPACE clause)
3) Identify the temporary tablespace(TEMPORARY TABLESPACE clause)
4) Identify the amount of space(quota) to allocate on one or more tablespace(QUOTA n on tablespace_name clause)
5) Define the lock status(ACCOUNT LOCK | UNLOCK)
```
Syntax:
```
CREATE USER username
IDENTIFIED BY password
[DEFAULT TABLESPACE tablespace_name
TEMPORARY TABLESPACE tablespace_name
QUOTA n ON tablespace_name
ACCOUNT lock_status]
-- [] part is optional

Example:
CREATE USER sid
IDENTIFIED BY sidPass
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
QUOTA 10M ON users
QUOTA 3M ON indx
ACCOUNT unlock
```

```
The data dictionary view DBA_TABLESPACSES displays information about tablespaces.
SELECT TABLESPACE_NAME FROM DBA_TABLESPACES;
```

```
The default tablespace is the table space where an object created by the user is automatically stored when the user does not explicitly identify the tablespace for an object.
```

###7. Data Control Language--managing System Privileges
User can do nothing in the database without the necessary privileges.
```
Privilege: is right to perform an action in the database.
-- the action to connect to the database
-- the ability to create a table
-- the ability to create a user
```
Two types of privileges:
```
1) System Privileges
Enables users to perform particular actions in the database, like creating a table
2) Object Privileges
Enables a user to access and manipulate a specific object, such as a table , view, sequence, precedure, function or package belonging to another user.
```
####7.1 System Privileges
There are more than 200 distinct system privileges
```
SELECT * FROM SYSTEM_PRIVILEGE_MAP;
```
Examples of system privileges:
```
CREATE SESSION
CREATE TABLE
CREATE VIEW
CREATE SEQUENCE
```
Granting System Privileges: The GRANT command adds privilege to a user or a group of users
```
Syntax:
GRANT [system_privilege, system_privilege, ...] TO [user, user,...]

Example:
GRANT CREATE SESSION, CREATE TABLE TO SID;
-- CREATE SESSION gives user the ability to connect to database.
```
Revoking Privileges: Use the REVOKE command to remove a system privilege from a user.
```
Syntax:
REVOKE [system_privilege, system_privilege...] FROM [user, user,...]

Example:
REVOKE CREATE TABLE FROM SID;
```
Checking current table privileges:
```
SELECT * FROM SESSION_PRIVS;
```
####7.2 Object Privileges
```
-- Are relevant to specific object
-- Is a privilege or right to perform a particular action on a specific table, view, sequenc3e, procedure, function or package.
--The privilege depends on the type of object.
```
Object Privileges:
```
SELECT / INSERT / UPDATE / DELETE / ALTER / REFERENCES / INDEX / EXECUTE
```
Granting Object Privileges
```
GRANT [object_priv, object_priv, ..| ALL] ON object_name TO [user, user, ...]

Examples:
1) GRANT select ON EMPLOYEES TO SID;
2) GRANT INSERT, UPDATE ON DEPARTMENTS TO SID;
3) GRANT UPDATE(SAL) ON EMPLOYEES TO SID;
4) GRANT EXECUTE ON PROC1 TO SID;
```
Revoking Object Privileges
```
REVOKE [object_priv, object_priv, ...] ON object_name FROM [user_name, user_name, ...]
```
Viewing the privileges
```
the following query can be used to determine all the object privileges that user SID has on HR objects.

SELECT grantee, owner, grantor, privilege, table_name FROM user_tab_privs WHERE owner='HR';
```

###8. Managing Roles
```
Administrators / Analysts / Programmers

Role: a logic group of privileges. It is used to manage privileges.
```
Creating Roles
```
CREATE ROLE rolename
[IDENTIFIED BY password]

Examples:
CREATE ROLE dev1

CREATE ROLE dev2
IDENTIFIED BY pass2
```
Granting Privileges to Roles
```
GRANT privilege, privilege, ... TO rolename

Example:
GRANT CREATE TABLE, CREATE SESSION, UNLIMITED TABLESPACE, CREATE VIEW
TO dev2;
```
Granting Roles to Users
```
GRANT rolename, rolename, ... TO username, username,...
```
Some Predefined Roles:
```
ROLENAME   PRIVILEGES
CONNECT: CREATE SESSION
RESOURCE: CREATE CLUSTER, CREATE OPERATOR, CREATE INDEXTYPE, CREATE PROCEDURE, CREATE SEQUENCE, CREATE TABLE,CREATE TRIGGER, CREATE TYPE, etc.
DBA: PRIVILEGES TO ADMINISTER THE DATABASE
```
Removing Roles
```
-- Removes it from all users and roles it was granted
-- Removes it from the database
Syntax:
DROP ROLE rolename;
```
