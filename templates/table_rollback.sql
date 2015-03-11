-- ###########################################################################
-- # TITLE......              : table_rollback.sql
-- # USAGE......              : drop table_name
-- # Total Execution Time     : mere seconds.
-- # Modifications            : 
-- #-Date-----------Author and Description----------------------------------
-- # 	
-- ############################################################################

connect sys/sys@DEV
set serveroutput on
spool c:\_dblog\table_rollback.log

exec dbms_output.put_line('--- Begin script table_rollback.sql ---') ;

DECLARE

objCount NUMBER ;

BEGIN
	
	SELECT count(*)
		INTO objCount
		FROM all_objects
		WHERE object_name = 'table_name' and object_type = 'TABLE' and OWNER='shcema_name';

	IF objCount = 0 THEN
		dbms_output.put_line('Table table_name does not exist...') ;
	ELSE		
		
		dbms_output.put_line('Dropping table shcema_name.table_name....') ; 
		  
		execute immediate 'DROP TABLE shcema_name.table_name';	
	
		dbms_output.put_line('Table table_name successfully dropped.') ;
	END IF ;	

    EXCEPTION
		WHEN others THEN
			ROLLBACK ;
			DBMS_OUTPUT.PUT_LINE('Error dropping table table_name: ' || substr(SQLERRM, 1, 200));
			RAISE;
	
END;
/
	
  
exec dbms_output.put_line('--- End script table_rollback.sql ---') ;

set define on
set echo off
spool off	   

