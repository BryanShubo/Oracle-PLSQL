


1.Drop Vs Truncate
```
Drop command deletes the table structure completely, and ultimately the table will no more be available in the database. However, truncate command deletes the data in two steps: First it deletes the t...

TRUNCATE is faster than DROP because DROP does double work - First it removes data and secondly it removes the structure of table where as truncate does only one work - it just deletes the data.
```


