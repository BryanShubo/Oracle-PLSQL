
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
