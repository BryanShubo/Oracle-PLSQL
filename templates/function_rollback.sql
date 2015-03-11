-- ###########################################################################
-- # TITLE......              : function_rollback.sql
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

spool c:\_dblog\function_rollback.log 
exec dbms_output.put_line('--- Begin script function_rollback.sql ---') ;

DECLARE

objCount NUMBER;

BEGIN

     SELECT count(1)
         INTO objCount
         FROM ALL_OBJECTS
         WHERE OBJECT_TYPE='FUNCTION' AND OBJECT_NAME='function_name' and OWNER='schema_name';
		 
    IF objCount = 0 THEN
	    dbms_output.put_line('function_name does not exist....');
    ELSE
	    dbms_output.put_line('Removing function_name.....');
        execute immediate 'DROP FUNCTION schema_name.function_name';
  
    END IF;
	
	EXCEPTION
		WHEN others THEN
			ROLLBACK ;
			DBMS_OUTPUT.PUT_LINE('Error removing function_name function: ' || substr(SQLERRM, 1, 200));
			RAISE;
END;
/

exec dbms_output.put_line('--- End script function_rollback.sql ---') ;
set define on
set echo off
spool off


