-- ###########################################################################
-- # TITLE......              : db_link_rollback.sql
-- # USAGE......              : drop a database link 
-- # ROLLBACK...              : No roll back required 
-- # Total Execution Time     : A matter of seconds.
-- # Modifications            : 
-- #-Date----------Author and Description----------------------------------
-- #MM/DD/YYYY    Name       description
-- #03/03/2015    
-- ############################################################################
connect sys/sys@DEV

SET serveroutput ON
SET VERIFY OFF
spool c:\_dblog\db_link_rollback.log 

CREATE OR REPLACE PROCEDURE schema_name.drop_db_link AS
BEGIN
EXECUTE IMMEDIATE 'drop database link db_link_name';
END drop_db_link;
/


exec dbms_output.put_line('--- Begin script db_link_rollback.sql ---') ;
DECLARE

objCount NUMBER;

BEGIN

    SELECT count(1)
         INTO objCount
         FROM ALL_OBJECTS
         where OBJECT_NAME='db_link_name' and OBJECT_TYPE='DATABASE LINK' and OWNER='schema_name';
		 
    IF objCount = 0 THEN
	    dbms_output.put_line('DB link db_link_name does not exist....');
    ELSE
	    dbms_output.put_line('Removing db_link_name database link');
        schema_name.drop_db_link;
  
    END IF;
	
	EXCEPTION
		WHEN others THEN
			ROLLBACK ;
			DBMS_OUTPUT.PUT_LINE('Error removing DB link QDS: ' || substr(SQLERRM, 1, 200));
			RAISE;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'drop procedure schema_name.drop_db_link';
END;
/

exec dbms_output.put_line('--- End script remove_db_link_name_database_link.sql ---') ;

set define on
set echo off
spool off