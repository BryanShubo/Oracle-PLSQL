
-- return elements that exist in both table A and B
select value from A where A.value = B.value; 


-- The LEFT JOIN keyword returns all rows from the left table (table1), with the matching rows in 
-- the right table (table2). 
-- The result is NULL in the right side when there is no match.

select value from A where A.value = B.value(+);

-- return the elements only exist in A not B
select value from A where A.value = B.value(+) and B.value is null;


-- return all distinct elements form both table A and B
select distinct(value) from A
union
select distinct(value) from B;
