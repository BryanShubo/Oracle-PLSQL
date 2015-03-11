connect sys/sys@DEV
SET serveroutput ON
SET VERIFY OFF
spool c:\_dblog\role.log
exec dbms_output.put_line('--- Begin script role.sql ---') ;

DECLARE

objCount NUMBER;

BEGIN

    SELECT COUNT(1)
        INTO objCount
        FROM dba_roles
        WHERE UPPER(role) = UPPER('role_name'); 

    IF objCount > 0 THEN
        dbms_output.put_line('role_name already exists, drop prior to re-creating....');
    ELSE 
        dbms_output.put_line('Start to create role_name....');
        
		-- Create role
        EXECUTE IMMEDIATE 'CREATE ROLE role_name NOT IDENTIFIED';

        -- Grant select privileges on REPORTING tables
        EXECUTE IMMEDIATE 'GRANT SELECT ON schema_name.object_name TO other_role_name';				
		EXECUTE IMMEDIATE 'GRANT INSERT ON schema_name.object_name TO other_role_name';		
		EXECUTE IMMEDIATE 'GRANT UPDATE ON schema_name.object_name TO other_role_name';		
		EXECUTE IMMEDIATE 'GRANT DELETE ON schema_name.object_name TO other_role_name';

    END IF;

	EXCEPTION
		WHEN others THEN
			ROLLBACK ;
			DBMS_OUTPUT.PUT_LINE('Error creating role_name: ' || substr(SQLERRM, 1, 200));
			RAISE;

END;
/

set define on
exec dbms_output.put_line('--- Begin script role.sql ---') ;
set echo off

spool off