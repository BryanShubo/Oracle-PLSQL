###1. User Creation
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
###2. Data Control Language--managing System Privileges
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
####2.1 System Privileges
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
####2.2 Object Privileges
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

###3. Managing Roles
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
GRANT rolename TO rolename
```
Some Predefined Roles:
```
ROLENAME   PRIVILEGES
CONNECT: CREATE SESSION
RESOURCE: CREATE CLUSTER, CREATE OPERATOR, CREATE INDEXTYPE, CREATE PROCEDURE, CREATE SEQUENCE, CREATE TABLE,CREATE TRIGGER, CREATE TYPE, etc.
DBA: PRIVILEGES TO ADMINISTER THE DATABASE
```
Checking current roles
```
SELECT * FROM SESSION_ROLES;
```

Removing Roles
```
-- Removes it from all users and roles it was granted
-- Removes it from the database
Syntax:
DROP ROLE rolename;
```

###4. Oracle system files
```
Registry Editor:
ORACLE_BASE
ORACLE_HOME
ORACLE_SID
```

###5. Starting Up the Database
starting up: making the database available for use
```
SQL>STARTUP
1) Instance Created -- references the parameter file
2) Database Mounted -- references the control file
3) Database Opened
```
Stages of Startup
```
1) NOMOUNT
2) MOUNT
3) OPEN
```
Options for startup
```
SQL> STARTUP NOMOUNT -- only instance is created
SQL> STARTUP MOUNT -- instance is created and database mounted
SQL> STARTUP -- instance is created, database mounted and database opend
SQL> STARTUP FORCE -- current instance is aborted, instance created database mounted and database opend
SQL> STARTUP RESTRICT -- database opened only for users with restricted session system privilege
```
Altering a database
```
SQL>STARTUP NOMOUNT
SQL>ALTER DATABASE MOUNT


SQL>STARTUP MOUNT
SQL>ALTER DATABASE OPEN
```
