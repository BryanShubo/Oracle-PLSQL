-- ###########################################################################
-- # TITLE......              : 
-- # USAGE......              : 
-- # Description......        : 
-- # AUTHOR.....              : 
-- # Total Execution Time     : mere seconds.
-- # Modifications            : 
-- #-Date-----------Author and Description----------------------------------
-- # 
-- ############################################################################


connect sys/sys@DEV
SET serveroutput ON
SET VERIFY OFF
spool c:\_dblog\grant_privilege_on_tables_to_schema.log
exec dbms_output.put_line('--- Begin script grant_privilege_on_tables_to_schema.sql ---') ;

begin
  
  for tables IN (select table_name from all_tables where owner = 'source_schema_name') loop
    execute immediate
      'grant select on '||tables.table_name||' to desc_schema_name';
  end loop;
  
  EXCEPTION
		WHEN others THEN
			ROLLBACK ;
			DBMS_OUTPUT.PUT_LINE('Error grant_privilege_on_tables_to_schema.sql: ' || substr(SQLERRM, 1, 200));
			RAISE;
end;
/

EXEC dbms_output.put_line('--- End script grant_privilege_on_tables_to_schema.sql ---') ;
set define on
set echo off
spool off