2.1.Introduction	
2.2.Select clause	
2.3.Where	
2.4.Order By	
2.5.Group By	
2.6.HAVING	
2.7.DISTINCT	
2.8.Columns	
2.9.Concatenation	
2.10.Arithmetic	
2.11.AND OR	
2.12.Alias	
2.13.ALL	
2.14.ANY	
2.15.CASE	
2.16.BETWEEN	
2.17.IN	
2.18.EXISTS	
2.19.LIKE	
2.20.IS INFINITE	
2.21.IS NAN	
2.22.IS NOT INFINITE
2.23.IS NOT NAN
2.24.IS NULL
2.25.NOT
2.26.NOT BETWEEN
2.27.NOT IN
2.28.NOT LIKE
2.29.Level
2.30.ROWID
2.31.rownum
2.32.GUID
2.33.ROW
2.34.START WITH
2.35.with
2.36.Single Row Subquery
2.37.Correlated Subquery
2.38.Multiple Row Subquery
2.39.Nested Subquery
2.40.Hierarchical Queries
2.41.Multi column subquery
2.42.CONNECT


2.1 Introduction
The SQL operators allow you to limit rows based on
--pattern matching of strings,
--lists of values,
--ranges of values, and
--null values.

The SQL operators are listed in the following table:
Operator	Description
--LIKE	Matches patterns in strings
--IN	Matches lists of values
--BETWEEN	Matches a range of values
--IS NULL	Matches null values
--IS NAN	New for Oracle10g. Matches the NaN special value, which means "not a number"
--IS INFINITE	New for Oracle10g. Matches infinite BINARY_FLOAT and BINARY_DOUBLE values

You can also use the NOT operator to reverse the meaning of LIKE, IN, BETWEEN, and IS NULL:
--NOT LIKE
--NOT IN
--NOT BETWEEN
--IS NOT NULL
--IS NOT NAN
--IS NOT INFINITE


2.2 Select clause
-- select retrieves information from table
-- Oracle database converts the column names into their uppercase equivalents
-- Character and date columns are left-justified.
-- Number columns are right-justified.
-- By default, the Oracle database displays dates in the format DD-MON-YY
-- NO_INDEX function in select statement

1) Using as to specify the alias name: 
SELECT au_fname AS "First name", au_lname AS "Last name", city AS "City", state, zip AS "Postal code", 10 As Batch_number, -salary as SALARY FROM employees;

-- you may select a negate column as a column
-- you may also select a constant(number) as a column, but not string.

2) Using function: 
SELECT id, salary, salary - 80000, ABS(salary - 80000) FROM employee;

3) Concatenate string:
select ename ||', '||init as full_name from   employees;

