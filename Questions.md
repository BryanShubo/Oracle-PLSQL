
1 Drop Vs Truncate
```
DROP: First it removes data and secondly it removes the structure of table
Truncate just deletes the data.
```

2 What is PL/SQL ?
```
PL/SQL is a procedural language which has interactive SQL, as well as procedural programming 
language constructs like conditional branching and iteration.
```
 

3 Differentiate between % ROWTYPE and TYPE RECORD.
```
% ROWTYPE is used when a query returns an entire row of a table or view.
TYPE RECORD, on the other hand, is used when a query returns column of different tables or views.

Eg.  TYPE r_emp is RECORD (sno smp.smpno%type,sname smp sname %type)
e_rec smp ROWTYPE
Cursor c1 is select smpno,dept from smp;
e_rec c1 %ROWTYPE
```
 

4 Explain uses of cursor.
```
Cursor is a named private area in SQL from which information can be accessed. They are required to 
process each row individually for queries which return multiple rows.

Eg.  FOR smp_rec IN C1 LOOP
totalsal=totalsal+smp_recsal;
ENDLOOP;
```
 

5 Explain the uses of database trigger.
```
A PL/SQL program unit associated with a particular database table is called a database trigger. 
It is used for :

1)Audit data modifications.
2)Log events transparently.
3)Enforce complex business rules.
4)Maintain replica tables
5)Derive column values
6)Implement Complex security authorizations
```
 

6 What are the two types of exceptions.
```
Error handling part of PL/SQL block is called Exception. They have two types : 
user_defined and predefined.

 Show some predefined exceptions:
DUP_VAL_ON_INDEX
ZERO_DIVIDE
NO_DATA_FOUND
TOO_MANY_ROWS
CURSOR_ALREADY_OPEN
INVALID_NUMBER
INVALID_CURSOR
PROGRAM_ERROR
TIMEOUT _ON_RESOURCE
STORAGE_ERROR
LOGON_DENIED
VALUE_ERROR
etc.
```
 

8 Explain Raise_application_error.
```
It is a procedure of package DBMS_STANDARD that allows issuing of user_defined error messages 
from database trigger or stored sub-program.
```
 
9 Show how functions and procedures are called in a PL/SQL block.
```
Function is called as a part of an expression.

total:=calculate_sal(‘b644’)

Procedure is called  as a statement in PL/SQL.

calculate_bonus(‘b644’);
```
 
10 Explain two virtual tables available at the time of database trigger execution.
```
Table columns are referred as THEN.column_name and NOW.column_name.

For INSERT related triggers, NOW.column_name values are available only.

For DELETE related triggers, THEN.column_name values are available only.

For UPDATE related triggers, both Table columns are available.
```
 

11  What are the rules to be applied to NULLs whilst doing comparisons?
```
1) NULL is never TRUE or FALSE
2) NULL cannot be equal or unequal to other values
3) If a value in an expression is NULL, then the expression itself evaluates to 
NULL except for concatenation operator (||)
```

12 How is a process of PL/SQL compiled?
```
Compilation process includes syntax check, bind and p-code generation processes.

Syntax checking checks the PL/SQL codes for compilation errors. When all errors are corrected, 
a storage address is assigned to the variables that hold data. It is called Binding. P-code is 
a list of instructions for the PL/SQL engine. P-code is stored in the database for named blocks 
and is used the next time it is executed.
```

13 Differentiate between Syntax and runtime errors.
```
A syntax error can be easily detected by a PL/SQL compiler. For eg, incorrect spelling.

A runtime error is handled with the help of exception-handling section in an PL/SQL block. 
For eg, SELECT INTO statement, which does not return any rows.
```

14 Explain Commit, Rollback and Savepoint.
```
For a COMMIT statement, the following is true:

Other users can see the data changes made by the transaction.
The locks acquired by the transaction are released.
The work done by the transaction becomes permanent.
A ROLLBACK statement gets issued when the transaction ends, and the following is true.

The work done in a transition is undone as if it was never issued.
All locks acquired by transaction are released.
It undoes all the work done by the user in a transaction. With SAVEPOINT, only part of transaction 
can be undone.
```
 

15 Define Implicit and Explicit Cursors.
```
A cursor is implicit by default. The user cannot control or process the information in this cursor.

If a query returns multiple rows of data, the program defines an explicit cursor. This allows the 
application to process each row sequentially as the cursor returns it.
```
 

16 Explain mutating table error.
```
It occurs when a trigger tries to update a row that it is currently using. It is fixed by using views or 
temporary tables, so database selects one and updates the other.
```
 

17 When is a declare statement required?
```
DECLARE statement is used by PL/SQL anonymous blocks such as with stand alone, non-stored procedures. 
If it is used, it must come first in a stand alone file.
```
 

18. How many triggers can be applied to a table?
```
A maximum of 12 triggers can be applied to one table.
```
 

19. What is the importance of SQLCODE and SQLERRM?
```
SQLCODE: returns the value of the number of error for the last encountered error whereas 
SQLERRM: returns the message for the last error.
```

20. If a cursor is open, how can we find in a PL/SQL Block?
```
the %ISOPEN cursor status variable can be used.
```
 

21 Show the two PL/SQL cursor exceptions.
```
Cursor_Already_Open

Invaid_cursor
```
 

22 What operators deal with NULL?
```
NVL converts NULL to another specified value.

var:=NVL(var2,’Hi’);

IS NULL and IS NOT NULL can be used to check specifically to see whether the value of a variable 
is NULL or not.
```
 

23 Does SQL*Plus also have a PL/SQL Engine?
```
No, SQL*Plus does not have a PL/SQL Engine embedded in it. Thus, all PL/SQL code is sent directly 
to database engine. It is much more efficient as each statement is not individually stripped off.
```
 

24 What packages are available to PL/SQL developers?
```
DBMS_ series of packages, such as, DBMS_PIPE, DBMS_DDL, DBMS_LOCK, DBMS_ALERT, 
DBMS_OUTPUT, DBMS_JOB, DBMS_UTILITY, DBMS_SQL, DBMS_TRANSACTION, UTL_FILE.
```
 

25 Explain 3 basic parts of a trigger.
```
A triggering statement or event.
A restriction
An action
```

26 What are character functions?
```
INITCAP, UPPER, SUBSTR, LOWER and LENGTH are all character functions. Group functions give results based on groups of rows, as opposed to individual rows. They are MAX, MIN, AVG, COUNT and SUM.
```
 

27 Explain TTITLE and BTITLE.
```
TTITLE and BTITLE commands that control report headers and footers.
```
 

28 Show the cursor attributes of PL/SQL.
```
%ISOPEN : Checks if the cursor is open or not

%ROWCOUNT : The number of rows that are updated, deleted or fetched.

%FOUND : Checks if the cursor has fetched any row. It is true if rows are fetched

%NOT FOUND : Checks if the cursor has fetched any row. It is True if rows are not fetched.
```

29 What is an Intersect?
```
Intersect is the product of two tables and it lists only matching rows.
```
 

30 What are sequences?
```
Sequences are used to generate sequence numbers without an overhead of locking. Its drawback is that 
the sequence number is lost if the transaction is rolled back.
```
 

31 How would you reference column values BEFORE and AFTER you have inserted and deleted triggers?
```
Using the keyword “new.column name”, the triggers can reference column values by new collection. 
By using the keyword “old.column name”, they can reference column vaues by old collection.
```
 

32 What are the uses of SYSDATE and USER keywords?
```
SYSDATE refers to the current server system date. It is a pseudo column. USER is also a pseudo 
column but refers to current user logged onto the session. They are used to monitor changes happening 
in the table.
```
 

33 How does ROWID help in running a query faster?
```
ROWID is the logical address of a row, it is not a physical column. It composes of data block number, 
file number and row number in the data block. Thus, I/O time gets minimized retrieving the row, and 
results in a faster query.
```
 

34. What are database links used for?
```
Database links are created in order to form communication between various databases, or 
different environments like test, development and production. The database links are read-only 
to access other information as well.
```
 

35 What does fetching a cursor do?
```
Fetching a cursor reads Result Set row by row.
```
 

36 What does closing a cursor do?
```
Closing a cursor clears the private SQL area as well as de-allocates memory
```
 

37 Explain the uses of Control File.
```
It is a binary file. It records the structure of the database. It includes locations of several 
log files, names and timestamps. They can be stored in different locations to help in retrieval of 
information if one file gets corrupted.
```
 

38  Explain Consistency
```
Consistency shows that data will not be reflected to other users until the data is commit, so that 
consistency is maintained.
```
 

 

39 Differ between Anonymous blocks and sub-programs.
```
Anonymous blocks are unnamed blocks that are not stored anywhere whilst sub-programs are 
compiled and stored in database. They are compiled at runtime.
````
 

40 Differ between DECODE and CASE.
```
DECODE and CASE statements are very similar, but CASE is extended version of DECODE. 
DECODE does not allow Decision making statements in its place.

select decode(totalsal=12000,’high’,10000,’medium’) as decode_tesr from smp where smpno in (
10,12,14,16);

This statement returns an error.

 

CASE is directly used in PL/SQL, but DECODE is used in PL/SQL through SQL only.
```
 

41 Explain autonomous transaction
```
An autonomous transaction is an independent transaction of the main or parent transaction. 
It is not nested if it is started by another transaction.

There are several situations to use autonomous transactions like event logging and auditing.
```
 

42 Differentiate between SGA and PGA.
```
SGA stands for System Global Area whereas PGA stands for Program or Process Global Area. 
PGA is only allocated 10% RAM size, but SGA is given 40% RAM size.
```
 

43 What is the location of Pre_defined_functions.
```
They are stored in the standard package called “Functions, Procedures and Packages”
```
 

44 Explain polymorphism in PL/SQL.
```
Polymorphism is a feature of OOP. It is the ability to create a variable, an object or 
function with multiple forms. PL/SQL supports Polymorphism in the form of program unit 
overloading inside a member function or package..Unambiguous logic must be avoided whilst 
overloading is being done.
```
 

45 What are the uses of MERGE?
```
MERGE is used to combine multiple DML statements into one.

Syntax : merge into tablename

using(query)

on(join condition)

when not matched then

[insert/update/delete] command

when matched then

[insert/update/delete] command
```
 

46 Can 2 queries be executed simultaneously in a Distributed Database System?
```
Yes, they can be executed simultaneously. One query is always independent of the second query 
in a distributed database system based on the 2 phase commit.
```
 

47. Explain Raise_application_error.
```
It is a procedure of the package DBMS_STANDARD that allow issuing a user_defined error messages from the database trigger or stored sub-program.
```
 

48.  What is out parameter used for eventhough return statement can also be used in pl/sql?
```
Out parameters allows more than one value in the calling program. Out parameter is not recommended in functions. Procedures can be used instead of functions if multiple values are required. Thus, these procedures are used to execute Out parameters.
```
 

49. How would you convert date into Julian date format?
```
We can use the J format string :

SQL > select to_char(to_date(‘29-Mar-2013’,’dd-mon-yyyy’),’J’) as julian from dual;

 

JULIAN
```
 

50. Explain SPOOL
```
Spool command can print the output of sql statements in a file.

spool/tmp/sql_outtxt

select smp_name, smp_id from smp where dept=’accounts’;

spool off;
```
 

51. Mention what PL/SQL package consists of?
```
A PL/SQL package consists of:
PL/SQL table and record TYPE statements
Procedures and Functions
Cursors
Variables ( tables, scalars, records, etc.) and constants
Exception names and pragmas for relating an error number with an exception
Cursors
```

52. Mention what are the benefits of PL/SQL packages?
```
It provides several benefits like

Enforced Information Hiding: It offers the liberty to choose whether to keep data private or public
Top-down design: You can design the interface to the code hidden in the package before you actually implemented the modules themselves
Object persistence: Objects declared in a package specification behaves like a global data for all PL/SQL objects in the application. You can modify the package in one module and then reference those changes to another module
Object oriented design: The package gives developers strong hold over how the modules and data structures inside the package can be used
Guaranteeing transaction integrity: It provides a level of transaction integrity
Performance improvement: The RDBMS automatically tracks the validity of all program objects stored in the database and enhance the performance of packages.
 ```

53. Mention what are different methods to trace the PL/SQL code?
```
Tracing code is a crucial technique to measure the code performance during the runtime. Different methods for tracing includes

DBMS_APPLICATION_INFO
DBMS_TRACE
DBMS_SESSION and DBMS_MONITOR
trcsess and tkproof utilities
 ```

 

54. Mention what does the hierarchical profiler does?
```
The hierarchical profiler could profile the calls made in PL/SQL, apart from filling the gap between the loopholes and the expectations of performance tracing. The efficiencies of the hierarchical profiler includes

Distinct reporting for SQL and PL/SQL time consumption
Reports count of distinct sub-programs calls made in the PL/SQL, and the time spent with each subprogram call
Multiple interactive analytics reports in HTML format by using the command line utility
More effective than conventional profiler and other tracing utilities
 ```

55. Mention what does PLV msg allows you to do?
```
The PLV msg enables you to

Assign individual text message to specified row in the PL/SQL table
It retrieves the message text by number
It substitutes automatically your own messages for standard Oracle error messages with restrict toggle
Batch load message numbers and text from a database table directly PLV msg PL/SQL table
 ```

56. Mention what is the PLV (PL/Vision) package offers?
```
Null substitution value
Set of assertion routines
Miscellaneous utilities
Set of constants used throughout PL vision
Pre-defined datatypes
 
Mention what is the use of PLVprs and PLVprsps?

PLVprs: It is an extension for string parsing for PL/SQL, and it is the lowest level of string parsing functionality
PLVprsps: It is the highest level package to parse PL/SQL source code into separate atomics. It relies on other parsing packages to get work done.
 ```

57. Explain how you can copy a file to file content and file to PL/SQL table in advance PL/SQL?
```
With a single program call – “fcopy procedure”, you can copy the complete contents of one file 
into another file.  While to copy the contents of a file directly into a PL/SQL table, you can 
use the program “file2pstab”.
```
 

58. Explain how exception handling is done in advance PL/SQL?
```
For exception handling PL/SQl provides an effective plugin PLVexc.  PLVexc supports four 
different exception handling actions.

Continue processing
Record and then continue
Halt processing
Record and then halt processing
For those exceptions that re-occurs you can use the RAISE statement.
```
 

59. Mention what problem one might face while writing log information to a data-base table in PL/SQL?
```
While writing log information to a database table, the problem you face is that the information is 
only available only once the new rows are committed to the database.  This might be a problem as 
such PLVlog is usually deployed to track errors and in many such instances the current transaction 
would fail or otherwise needed a rollback.
```
 

60. Mention what is the function that is used to transfer a PL/SQL table log to a database table?
```
To transfer a PL/SQL table log a database log table function “PROCEDURE ps2db” is used.
```
 

61. When you have to use a default “rollback to” savepoint of PLVlog?
```
The default “rollback to” savepoint of PLVlog is used when the users has turned on the rollback 
activity and has not provided an alternative savepoint in the call to put_line.  The default 
savepoint is initialized to the c none constant.
```
 

62. Why PLVtab is considered as the easiest way to access the PL/SQL table?
```
The PL/SQL table are the closest to arrays in PL/SQL, and in order to access this table you
have to first declare a table type, and then you have to declare PL/SQL table itself. 
But by using PLVtab, you can avoid defining your own PL/SQL table type and make PL/SQL 
data-table access easy.
```
 

63. Mention what does PLVtab enables you to do when you show the contents of PL/SQL tables?
```
PLVtab enables you to do following things when you show the contents of PL/SQL tables

Display or suppress a header for the table
Display or suppress the row numbers for the table values
Show a prefix before each row of the table
 ```

64. Explain how can you save or place your msg in a table?
```
To save msg in a table, you can do it in two ways

Load individual messages with calls to the add_text procedure
Load sets of messages from a database table with the load_from_dbms procedure
``` 

65. Mention what is the use of function “module procedure” in PL/SQL?
```
The “module procedure” enables to convert all the lines of code in a definite program unit with 
one procedure call.  There are three arguments for modules

module_in
cor_in
Last_module_in
```

66. Mention what PLVcmt and PLVrb does in PL/SQL?
```
PL/Vision offers two packages that help you manage transaction processing in PL/SQL application. 
It is PLVcmt and PLVrb.

PLVcmt: PLVcmt package wraps logic and complexity for dealing with commit processing
PLVrb: It provides a programmatic interface to roll-back activity in PL/SQL
```


1、用两种方式根据部门号从高到低，工资从低到高列出每
个员工的信息。


employee:
eid,ename,salary,deptid;
select * from employee order by deptid desc,salary
2、列出各个部门中工资高于本部门的平均工资的员工数和
部门号，并按部门号排序
创建表：
mysql> create table employee921(id int primary key auto_increment,name varchar(5
0),salary bigint,deptid int);
插入实验数据：
mysql> insert into employee921 values(null,'zs',1000,1),(null,'ls',1100,1),(null
,'ww',1100,1),(null,'zl',900,1) ,(null,'zl',1000,2), (null,'zl',900,2) ,(null,'z l',1000,2) , 
(null,'zl',1100,2);

编写 sql 语句：

（）select avg(salary) from employee921 group by deptid;
（）mysql> select employee921.id,employee921.name,employee921.salary,employee921.dep
tid tid from   employee921 where salary > (select avg(salary) from employee921 where    deptid =


tid);
效率低的一个语句，仅供学习参考使用（在 group  by 之后不能使用 where，只能使用
having，在 group by 之前可以使用 where，即表示对过滤后的结果分组）：
mysql> select employee921.id,employee921.name,employee921.salary,employee921.dep
tid tid from   employee921 where salary > (select avg(salary) from employee921 group by deptid 
having deptid = tid);
（）select count(*) ,tid
from (
select employee921.id,employee921.name,employee921.salary,employee921.deptid tid from        
employee921
where salary >
(select avg(salary) from employee921 where    deptid = tid)

















) as t
group by tid ;

另外一种方式：关联查询 select a.ename,a.salary,a.deptid from emp a,
(select deptd,avg(salary) avgsal from emp group by deptid ) b where a.deptid=b.deptid and 
a.salary>b.avgsal;

1、存储过程与触发器必须讲，经常被面试到?


create procedure insert_Student (_name varchar(50),_age int ,out _id int)
begin
insert into student value(null,_name,_age);
select max(stuId) into _id from student;























end;


call insert_Student('wfz',23,@id);
select @id;


mysql> create trigger update_Student BEFORE update on student FOR EACH ROW
-> select * from student;
触发器不允许返回结果


create trigger update_Student BEFORE update on student FOR EACH ROW
insert into    student value(null,'zxx',28);
mysql 的触发器目前不能对当前表进行操作


create trigger update_Student BEFORE update on student FOR EACH ROW
delete from articles    where id=8;
这个例子不是很好，最好是用删除一个用户时，顺带删除该用户的所有帖子
这里要注意使用 OLD.id


触发器用处还是很多的，比如校内网、开心网、Facebook，你发一个日志，自动通知好 友，其实就是在增加日志时做一个后触发，再向通知表中写入条目。因为触发器效率高。而 UCH 
没有用触发器，效率和数据处理能力都很低。
存储过程的实验步骤：
mysql> delimiter |
mysql> create procedure insertArticle_Procedure (pTitle varchar(50),pBid int,out pId int)
-> begin
-> insert into article1 value(null,pTitle,pBid);
-> select max(id) into pId from article1;
-> end;
-> |
Query OK, 0 rows affected (0.05 sec)

mysql> call insertArticle_Procedure('传智播客',1,@pid);
-> |
Query OK, 0 rows affected (0.00 sec)


mysql> delimiter ;
mysql> select @pid;
+------+
| @pid |
+------+
| 3        |
+------+
1 row in set (0.00 sec)
mysql> select * from article1;
+----+--------------+------+
| id | title                | bid    |
+----+--------------+------+
| 1    | test                  | 1        |
| 2    | chuanzhiboke | 1        |
| 3    | 传智播客        | 1       |
+----+--------------+------+
3 rows in set (0.00 sec)

触发器的实验步骤：
create table board1(id int primary key auto_increment,name varchar(50),ar ticleCount int);
create table article1(id int primary key auto_increment,title varchar(
,bid int references board1(id));


delimiter |


create trigger insertArticle_Trigger after insert on article1 for each ro w begin
-> update board1 set articleCount=articleCount+1 where id= NEW.bid;
-> end;
-> |
delimiter ;


insert into board1 value (null,'test',0);


insert into article1 value(null,'test',1);
还有，每插入一个帖子，都希望将版面表中的最后发帖时间，帖子总数字段进行同步 更新，用触发器做效率就很高。下次课设计这样一个案例，写触发器时，对于最后发帖时间 可能需要用 declare 
方式声明一个变量，或者是用 NEW.posttime 来生成。



1、数据库三范式是什么?


第一范式（1NF）：字段具有原子性,不可再分。所有关系型数据库系统都满足第一范式） 数据库表中的字段都是单一属性的，不可再分。例如，姓名字段，其中的姓和名必须作
为一个整体，无法区分哪部分是姓，哪部分是名，如果要区分出姓和名，必须设计成两个独 立的字段。

第二范式（2NF）： 第二范式（2NF）是在第一范式（1NF）的基础上建立起来的，即满足第二范式（2NF）必 须先满足第一范式（1NF）。 
要求数据库表中的每个实例或行必须可以被惟一地区分。通常需要为表加上一个列，以存储 各个实例的惟一标识。这个惟一属性列被称为主关键字或主键。


第二范式（2NF）要求实体的属性完全依赖于主关键字。所谓完全依赖是指不能存在仅依赖 主关键字一部分的属性，如果存在，那么这个属性和主关键字的这一部分应该分离出来形成 
一个新的实体，新实体与原实体之间是一对多的关系。为实现区分通常需要为表加上一个列， 以存储各个实例的惟一标识。简而言之，第二范式就是非主属性非部分依赖于主关键字。


第三范式的要求如下： 满足第三范式（3NF）必须先满足第二范式（2NF）。简而言之，第三范式（3NF）要求一个
create table article1(id int primary key auto_increment,title varchar(
,bid int references board1(id));


delimiter |


create trigger insertArticle_Trigger after insert on article1 for each ro w begin
-> update board1 set articleCount=articleCount+1 where id= NEW.bid;
-> end;
-> |
delimiter ;


insert into board1 value (null,'test',0);


insert into article1 value(null,'test',1);
还有，每插入一个帖子，都希望将版面表中的最后发帖时间，帖子总数字段进行同步 更新，用触发器做效率就很高。下次课设计这样一个案例，写触发器时，对于最后发帖时间 可能需要用 declare 
方式声明一个变量，或者是用 NEW.posttime 来生成。



1、数据库三范式是什么?


第一范式（1NF）：字段具有原子性,不可再分。所有关系型数据库系统都满足第一范式） 数据库表中的字段都是单一属性的，不可再分。例如，姓名字段，其中的姓和名必须作
为一个整体，无法区分哪部分是姓，哪部分是名，如果要区分出姓和名，必须设计成两个独 立的字段。

第二范式（2NF）： 第二范式（2NF）是在第一范式（1NF）的基础上建立起来的，即满足第二范式（2NF）必 须先满足第一范式（1NF）。 
要求数据库表中的每个实例或行必须可以被惟一地区分。通常需要为表加上一个列，以存储 各个实例的惟一标识。这个惟一属性列被称为主关键字或主键。


第二范式（2NF）要求实体的属性完全依赖于主关键字。所谓完全依赖是指不能存在仅依赖 主关键字一部分的属性，如果存在，那么这个属性和主关键字的这一部分应该分离出来形成 
一个新的实体，新实体与原实体之间是一对多的关系。为实现区分通常需要为表加上一个列， 以存储各个实例的惟一标识。简而言之，第二范式就是非主属性非部分依赖于主关键字。


第三范式的要求如下： 满足第三范式（3NF）必须先满足第二范式（2NF）。简而言之，第三范式（3NF）要求一个

数据库表中不包含已在其它表中已包含的非主关键字信息。
所以第三范式具有如下特征：
1，每一列只有一个值
2，每一行都能区分。
3，每一个表都不包含其他表已经包含的非主关键字信息。 例如，帖子表中只能出现发帖人的 id，而不能出现发帖人的 id，还同时出现发帖人姓名， 否则，只要出现同一发帖人 id 
的所有记录，它们中的姓名部分都必须严格保持一致，这就 是数据冗余。

1、说出一些数据库优化方面的经验?


用 PreparedStatement  一般来说比 Statement 性能高：一个 sql 发给服务器去执行，涉及步骤： 语法检查、语义分析， 编译，缓存
“inert into user values(1,1,1)”-二进制 “inert into user values(2,2,2)”-二进制 “inert into user 
values(?,?,?)”-二进制
有外键约束会影响插入和删除性能，如果程序能够保证数据的完整性，那在设计数据库时就 去掉外键。（比喻：就好比免检产品，就是为了提高效率，充分相信产品的制造商）
（对于 hibernate 来说，就应该有一个变化：empleyee->Deptment 对象，现在设计时就成了
employeedeptid）


看 mysql 帮助文档子查询章节的最后部分，例如，根据扫描的原理，下面的子查询语句要比 第二条关联查询的效率高：
1.    select e.name,e.salary where e.managerid=(select id from employee where name='zxx');


2.      select e.name,e.salary,m.name,m.salary from employees e,employees m where e.managerid = 
m.id and m.name='zxx';

表中允许适当冗余，譬如，主题帖的回复数量和最后回复时间等 将姓名和密码单独从用户表中独立出来。这可以是非常好的一对一的案例哟！


sql 语句全部大写，特别是列名和表名都大写。特别是 sql 命令的缓存功能，更加需要统一 大小写，sql 语句发给 oracle 服务器语法检查和编译成为内部指令缓存和执行指令。 
根据缓存的特点，不要拼凑条件，而是用?和 PreparedStatment

还有索引对查询性能的改进也是值得关注的。 备注：下面是关于性能的讨论举例


航班 3 个城市
m*
select * from flight,city where flight.startcityid=city.cityid and city.name='beijing';
m + n
select * from flight where startcityid = (select cityid from city where cityname='beijing');


select flight.id,'beijing',flight.flightTime from flight where startcityid = (select cityid from 
city where cityname='beijing')


UNION 在进行表链接后会筛选掉重复的记录，所以在表链接后会对所产生的结果集进
行排序运算，删除重复的记录再返回结果。实际大部分应用中是不会产生重复的记录，最常 见的是过程表与历史表 UNION。如：
select * from gc_dfys union
select * from ls_jg_dfys
这个 SQL 在运行时先取出两个表的结果，再用排序空间进行排序删除重复的记录，最 后返回结果集，如果表数据量大的话可能会导致用磁盘进行排序。
而 UNION ALL 只是简单的将两个结果合并后就返回。这样，如果返回的两个结果集中有 重复的数据，那么返回的结果集就会包含重复的数据了。
从效率上说，UNION ALL 要比 UNION 快很多，所以，如果可以确认合并的两个结果集 中不包含重复的数据的话，那么就使用 UNION ALL，




3.分页语句


取出 sql 表中第 31 到 40 的记录（以自动增长 ID 为主键）
sql  server 方案 1：
select top  10 * from t where id not  in (select top  30 id  from  t order  by id  )
orde by id
sql  server 方案 2：
select top 10 * from t where id in  (select  top 40 id from t order  by id) order by id desc

mysql 方案：select * from  t order  by id limit  30,10
oracle 方案：select * from (select rownum r,* from t where r<=40) where r>30







