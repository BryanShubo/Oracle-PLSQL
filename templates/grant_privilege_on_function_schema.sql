-- ###########################################################################
-- # TITLE......              : 
-- # USAGE......              : 
-- # Description......        :
-- # Total Execution Time     : A matter of seconds.
-- # Modifications            :
-- #-Date-----------Author and Description----------------------------------
-- # 
-- ############################################################################

connect sys/sys@DEV

SET serveroutput ON
SET VERIFY OFF
spool c:\_dblog\grant_execute_on.log

exec dbms_output.put_line('--- Begin script grant_execute_on.sql ---') ;

BEGIN

    EXECUTE IMMEDIATE 'GRANT EXECUTE ON schema_name.function_name TO role_name';
	
	EXCEPTION
		WHEN others THEN
			ROLLBACK ;
			DBMS_OUTPUT.PUT_LINE('Error granting execute on function_name : ' || substr(SQLERRM, 1, 200));
			RAISE;
END;
/


 
exec dbms_output.put_line('--- End script grant_execute_on.sql ---') ;

set define on
set echo off
spool off