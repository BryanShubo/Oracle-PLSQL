###1.1.dual	
###1.2.Arithmetic operator	
###1.3.Comparison Operators	
--1.4.Logical Operators	
--1.5.Null Values	
--1.6.Print
--1.7.Variable
--1.8.Comments
--1.9.Terminology
--1.10.Database Normalization

#1.1 dual
------------------------------------------------------------------------------------------------
-- dual is a table that contains a single row.
-- The dual table has one VARCHAR2 column named dummy.
-- dual contains a single row with the value X.

desc dual
Name  Null Type        
----- ---- ----------- 
DUMMY      VARCHAR2(1) 


-- Operators
SQL> SELECT 10 * (12 / 3 - 1) FROM dual;

-- Comparison operators used in WHERE clause
Operator	Description
=	Equal
<> or !=	Not equal
<	Less than
>	Greater than
<=	Less than or equal
>=	Greater than or equal
ANY	Compares one value with any value in a list
ALL	Compares one value with all values in a list
x AND y	Returns true when both x and y are true
x OR y	Returns true when either x or y is true
NOT x	Returns true if x is false, and returns false if x is true

-- null value
A database use null value to represent a unknown value.
A null value is not a blank string.
A null value means the value for the column is unknown.
When you select a column that contains a null value, you see nothing in that column.

-- NVL: null value and blank string
NVL() allows you to convert a null value into another value.
NVL() accepts two parameters: a column, and the value that should be substituted.
In the following example, NVL() is used to convert a null value in the first_name column to the string Unknown First Name:

-- print and variable
SQL> VARIABLE average_salary NUMBER;
SQL> UPDATE employee
  2  SET salary =  salary * 0.75
  3  RETURNING AVG(salary) INTO :average_salary;
SQL> PRINT average_salary;

AVERAGE_SALARY
--------------
    3053.81875

-- comment
single line --
multiline  /**/


-- terminology
Logical/Relational	Logical/Object-Oriented	Physical Implementation
Entity	              Class	                   Table
Attribute             Attribute	               Column
Instance	            Object	                 Row


-- Database Normalization
Database normalization is useful for several reasons:
It helps to build a structure that is logical and easy to maintain.
Normalized databases are the industry standard.
Retrieving data will be easier.
First Normal Form means that the database doesn't contain any repeating attributes.
Violations of Second Normal Form occur when the table contains attributes that depend on a portion of the primary key.
Second Normal Form violations can exist only when you have a multi-column primary key.
Third Normal Form violations occur when a transitive dependency exists.
All attributes in entities (columns in tables) must be dependent upon the primary key or one of the candidate keys and not on other attributes.



USER_OBJECTS shows the current user objects.
ALL_OBJECTS shows all objects of current and those object which you have rights to access.
DBA_OBJECTS shows all object of all users .
