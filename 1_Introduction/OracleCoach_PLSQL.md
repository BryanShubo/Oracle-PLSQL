
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

The Declaration Section
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

```
