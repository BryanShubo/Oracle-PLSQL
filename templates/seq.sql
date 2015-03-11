-- ###########################################################################
-- # TITLE......              : seq_name.sql
-- # USAGE......              : Create seq_name
-- # Total Execution Time     : mere seconds.
-- # Modifications            : 
-- #-Date-----------Author and Description----------------------------------
-- # 10/31/2014		- Created script	
-- ############################################################################

connect sys/sys@DEV
set serveroutput on
spool c:\_dblog\seq_name.log

exec dbms_output.put_line('--- Begin script seq_name.sql ---') ;

DECLARE

objCount NUMBER ;

BEGIN
	
	SELECT count(*)
		INTO objCount
		FROM all_objects
		WHERE object_name = 'seq_name' and object_type = 'SEQUENCE' and OWNER='shcema_name';

	SELECT MAX(primary_id)
	       INTO seqNo
	       FROM shcema_name.table_name;
         
    maxSeq := seqNo + 1; 	

	IF objCount > 0 THEN
		dbms_output.put_line('Sequence seq_name already exists, drop prior to re-creating...') ;
	ELSE		
		
        dbms_output.put_line('Creating sequence shcema_name.sequence_name....') ;
        execute immediate '
		    CREATE SEQUENCE shcema_name.sequence_name
            MINVALUE 1 MAXVALUE 1.00000000000000E+27 
            INCREMENT BY 1 START WITH '|| MaxSeq ||' NOCACHE ORDER NOCYCLE ' ;
  
		execute immediate 'CREATE OR REPLACE PUBLIC SYNONYM sequence_name FOR shcema_name.sequence_name';
		dbms_output.put_line('Sequence shcema_name.sequence_name successfully created.') ;
	END IF ;	

    EXCEPTION
		WHEN others THEN
			ROLLBACK ;
			DBMS_OUTPUT.PUT_LINE('Error creating sequence sequence_name: ' || substr(SQLERRM, 1, 200));
			RAISE;
	
END;
/
	
  
exec dbms_output.put_line('--- End script seq_name.sql ---') ;

set define on
set echo off
spool off	   
