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

2.3 Where 
-- The WHERE clause in a SELECT statement filters the rows;
-- Notice that ORDER BY is applied last - after the SELECT .. FROM .. WHERE (ORDER BY).

1) The WHERE clause first filters the rows returned, then the remaining rows are grouped into blocks by the GROUP BY clause.

For example, the following query uses

A WHERE clause to filter the rows from those whose salary is less than $50000
A GROUP BY clause to group the remaining rows by the city column

SELECT city, AVG(salary) FROM employee WHERE salary < 50000 GROUP BY city;

2) Do calculation in where clause:
SELECT title_name, price * sales AS "Revenue" FROM titles WHERE price * sales > 1000000;


2.4 Order by
-- The ORDER BY clause may specify one or more columns on which to sort the data
-- The ORDER BY must follow the FROM clause or the WHERE clause (if a WHERE clause is supplied).
-- Default is ASC (ascending). DESC is descending.

1) ASC and DESC (column name or alias name):
SELECT au_fname, au_lname, city, state FROM employees ORDER BY state ASC, city  DESC;

2) Sort by index ascending and descending:
SELECT au_fname, au_lname, city, state  FROM employees ORDER BY 4 ASC, 2 DESC; // state is asc and lname is desc.

3) Combine order by clause with case statement: 
 select job, ename,      case
           when msal <= 2500   then 'cheap'
           else 'expensive'
           end         as class
    from   employees
    where  bdate < date '1964-01-01'
    order  by case job
             when 'DIRECTOR' then 1
             when 'MANAGER'  then 2
                             else 3
             end;
             
4) Sorting email address:
Query(For Sql Server):
select * from mytbl order by SUBSTRING(email,(CHARINDEX('@',email)+1),1)

Query(For Oracle):
select * from mytbl order by substr(email,INSTR(email,'@',1) + 1,1)

Output:
id name	email
5   Tarrack Ocama	me@am-no-president.org
3   Ali Baba	ali@babaland.com
1   John Doe	johndoe@domain.com
2   Jane Doe	janedoe@helloworld.com
4   Foo Bar	foo@worldof.bar.net

2.5 Group By
-- The GROUP BY clause is used for grouping sets of records.

-- WHERE clause constraints are evaluated on the data before it is grouped.

-- HAVING clause constraints are evaluated on the results of the data after it has been grouped together.


