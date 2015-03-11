-- ###########################################################################
-- # TITLE......              : create_function.sql
-- # USAGE......              : 
-- # Description......        : 
-- # AUTHOR.....              : 
-- # Total Execution Time     : A matter of seconds.
-- # Modifications            : 
-- #-Date----------Author and Description----------------------------------
-- #MM/DD/YYYY    Name       description
-- #
-- ############################################################################
connect sys/sys@DEV

SET serveroutput ON
SET VERIFY OFF

spool c:\_dblog\create_function.log 
exec dbms_output.put_line('--- Begin script create_function.sql ---') ;

create or replace
FUNCTION schema_name.function_name(string1 in varchar2, string2 in varchar2, results in varchar2) return varchar2
   is
       char1 varchar2(1);
   begin
       
   end function_name;
/

exec dbms_output.put_line('--- End script create_function.sql ---') ;
set define on
set echo off
spool off


