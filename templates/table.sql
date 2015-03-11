-- ###########################################################################
-- # TITLE......              : table_name.sql
-- # USAGE......              : Create table_name
-- # Total Execution Time     : mere seconds.
-- # Modifications            : 
-- #-Date-----------Author and Description----------------------------------
-- # 10/31/2014		 - Created script	
-- ############################################################################

connect sys/sys@DEV
set serveroutput on
spool c:\_dblog\table.log

exec dbms_output.put_line('--- Begin script table.sql ---') ;

DECLARE

objCount NUMBER ;

BEGIN
	
	SELECT count(*)
		INTO objCount
		FROM all_objects
		WHERE object_name = 'table_name' and object_type = 'TABLE' and OWNER='shcema_name';

	IF objCount > 0 THEN
		dbms_output.put_line('Table table_name already exists, drop prior to re-creating...') ;
	ELSE		
		
		dbms_output.put_line('Creating table shcema_name.table_name....') ;
		
		execute immediate 'CREATE TABLE shcema_name.table_name
		  (
			COLUMN_1              NUMBER NOT NULL ENABLE,
            COLUMN_2          VARCHAR2(255 BYTE),
            CREATE_DATETIME DATE,
			CONSTRAINT EEAL_REPORTING_INFO_PK01 PRIMARY KEY (COLUMN_1) 
			USING INDEX PCTFREE 10 
					INITRANS 2
					MAXTRANS 255
					STORAGE(INITIAL 65536
						NEXT 1048576 
						MINEXTENTS 1 
						MAXEXTENTS 2147483645 
						PCTINCREASE 0 
						FREELISTS 1 
						FREELIST 
						GROUPS 1 
						BUFFER_POOL DEFAULT) 
					TABLESPACE REPORTING_DATA_TAB ENABLE		
		   )
		  PCTFREE 10 
		  PCTUSED 0 
		  INITRANS 1 
		  MAXTRANS 255 
		  STORAGE
		  (
			INITIAL 65536
			NEXT 1048576 
			MINEXTENTS 1 
			MAXEXTENTS 2147483645 
			PCTINCREASE 0 
			FREELISTS 1 
			FREELIST GROUPS 1 BUFFER_POOL DEFAULT
		  )	   
		  TABLESPACE schema_name_DATA_TAB';	 
		  
		execute immediate 'CREATE OR REPLACE PUBLIC SYNONYM table_name FOR schema_name.table_name';	
		
		
        execute immediate 'COMMENT ON COLUMN shcema_name.table_name.COLUMN_1 IS ''this is COLUMN_1''';
		execute immediate 'COMMENT ON COLUMN shcema_name.table_name.COLUMN_2 IS ''this is COLUMN_2''';
	
		dbms_output.put_line('Table table_name successfully created.') ;
	END IF ;	

    EXCEPTION
		WHEN others THEN
			ROLLBACK ;
			DBMS_OUTPUT.PUT_LINE('Error creating table table_name: ' || substr(SQLERRM, 1, 200));
			RAISE;
	
END;
/
	
  
exec dbms_output.put_line('--- End script table_name.sql ---') ;

set define on
set echo off
spool off	   
