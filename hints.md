The use of Oracle hints allows you to change suboptimal SQL execution plans.  Some professionals misunderstand hints, believing that they overcome shortcomings of the optimizer.  This is not always true, as Oracle hints are used to supply additional information to the optimizer, and compensate to cardinality estimates for complex queries.

###1. Hints in Oracle
```
 * The optimizer makes the right choice most of the time
 * Even if the optimizer doesn't make the perfect choice, ussually the choice it makes is just fine.
 * There are times the optimizer just doesn't or cannot get it.
 * When this happens, hints can be used in SQL to provide diretives to the optimizer.
```
Oracle hints can be used to tune SQL as "optimizer directives", overrides that change the execution plans of the SQL.  There are times when Oracle hints are legitimate for tuning.


###2. Why does the optimizer fail
```
* Bugs
* Bind variables disable histograms
* Incorrect or incomplete statistics
* Incorrect configuration settings
* Dynamic vs Static SQL
* Highly volatile data change patterns
* Poorly written SQL (not always a failure of the optimizer here)
```


```
Tuning with hints
 

There are many hints for every possible step within execution plans:
Global hints:   rule, first_rows, first_rows_n all_rows, driving_site

Table join hints:  use_nl, use_hash

Index hints:  Specifies an index name

Table access hints:  parallel, full, cardinality
 
Table join hints:  ordered
 
You can tune Oracle with hints by placing them after the SELECT statements, but Oracle hints can also be used in subqueries:
 
SELECT
a.Author_last_name, a.author_first_name
FROM author a
WHERE author_key in 
(select /*+ FULL(a) FULL(b) */ b.author_key 
from sales a, book_author b
Where a.book_key=b.book_key);
 
Tips for tuning with Oracle hints

Carefully check the hint syntax. It is always a good idea to use the full-comment syntax for a hint. For example, the /+* hint */ syntax is generally preferred to the ? ?+ hint syntax.

Use the table alias Whenever you have a query that specifies an alias for a table, you cannot use the table name. Instead, you must specify the table alias name. For example, the following query will invoke the index hint because the emp table is aliased with ?e?:

select /*+ index(e,dept_idx) */ * from emp e;

Never reference the schema name in a hint Hints will be ignored when the schema owner is specified in the hint. For example, the following hint will be ignored:

select /*+ index(scott.emp,dept_idx) */ * from emp;
 

Inappropriate Oracle hints

 
First, please read this link to understand why Oracle SQL can ignore hints.
 
Some Oracle hints are contradictory and invalid, and a hint will be ignored if it assumes an access path that is not available. For example,
Specifying an index hint on a table that has no indexes
Specifying a parallel hint for an index range scan
You need to be especially careful with validation of hints because it is not always obvious that a hint is contradictory with the query. For example, consider the following query in the emp table with no index on the ename column.

select /*+ first_rows */ * from emp order by ename;

The following hint is invalid because first_rows access and parallel access are mutually exclusive. That is because parallel access always assumes a full-table scan and first_rows favors index access. 

-- An invalid hint
select /*+ index (emp emp_idx) parallel(emp,8)*/ 
  emp_name 
from 
  emp 
where
  emp_type = 'SALARIED';

Some Oracle professionals will place hints together to reinforce their wishes. For example, if there is a SMP server with eight or more CPUs, one may want to use Oracle Parallel Query to speed up legitimate full-table scans.

Spelling - If table name or index name is spelled incorrectly, then the hint will not be used. Here we see a query with a misspelled table name:

select /*+ index(erp, dept_idx) */ * from emp;


Table Name - The table name is mandatory in the hint. For example, the following hint will be ignored because the table name is not specified in the query:

select /*+ index(dept_idx) */ * from emp;
 

Other Oracle hints tips:

Here are guidelines for using Oracle hints for tuning:

Because hints are placed inside comments, they will be ignored if the hint is incompatible with the existing execution plan or when the hint is formatted improperly.
 
When using the RBO, hints can be used to change specific queries to use the CBO. Always remember to analyze all table and indexes that participate in the query.
 
When using the CBO, you can start tuning a suspect SQL statement by adding the rule or first_rows hint.
 
Hints can be applied to subqueries, but a hint in the outer query will not carry over into the subquery.
 
Tuning with the parallel hint


When using parallel query, one should seldom turn on parallelism at the table level, alter table customer parallel 35, because the setting of parallelism for a table influences the optimizer. This causes the optimizer to see that the full-table scan is inexpensive. Hence, most Oracle professionals specify parallel query on a query-by-query basis, combining the full hint with the parallel hint to ensure a fast parallel full-table scan:

-- A valid hint
select /*+ full parallel(emp,35)*/ 
   emp_name 
from 
   emp 
order by 
   ename;

Lets take a look at one of the most important hints for Oracle tuning. 

The ordered hint determines the driving table for the query execution and also specifies the order that tables are joined together. The ordered hint requests that the tables should be joined in the order that they are specified in the from clause, with the first table in the from clause specifying the driving table.
 
Using the ordered hint can save a huge amount of parse time and speed SQL execution because the optimizer is given the best order to join the tables.
 
Tuning with the cardinality hint

The use of the cardinality hint compensates for the optimizers inability to estimate the inter-table join result set.  This is NOT a problem with the optimizer, as no amount of metadata will help when joining tables with complex, multi-column where clauses.

The cardinality hint is used in two general cases, complex joins and dynamically created tables like global temporary tables (and possibly using materializations using the WITH clause):

select /*+ cardinality( gtt 500 ) */ 
stuff
from global_temp_table;
The dynamic sampling hint

The use of the 10g dynamic_sampling hint is very useful for highly volatile tables and global temporary tables.

In 10g, you can use the dynamic_sampling hint to direct Oracle to estimate the cardinality of highly volatile tables.

The dynamic sampling hint is also useful for estimating the size of dynamically created objects such as global temporary tables (GTT?s)

select /*+ dynamic_sampling(customer 4) */ pol_no, sales_id, sum_assured, premium
from customer;

 
```
