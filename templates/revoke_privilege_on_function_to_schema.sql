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
spool c:\_dblog\revoke_privilege_on_function_to_schema.log

exec dbms_output.put_line('--- Begin script revoke_privilege_on_function_to_schema.sql ---') ;

BEGIN

    EXECUTE IMMEDIATE 'REVOKE EXECUTE ON schema_name.function_name TO role_name';
	
	EXCEPTION
		WHEN others THEN
			ROLLBACK ;
			DBMS_OUTPUT.PUT_LINE('Error revoking execute on function_name : ' || substr(SQLERRM, 1, 200));
			RAISE;
END;
/


 
exec dbms_output.put_line('--- End script revoke_privilege_on_function_to_schema.sql ---') ;

set define on
set echo off
spool off