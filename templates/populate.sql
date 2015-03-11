-- ###########################################################################
-- # TITLE......              : populate.sql
-- # Total Execution Time     : A matter of seconds.
-- # Modifications            :
-- #-Date-----------Author and Description----------------------------------
-- # 09/25/2014  Bryan Zhang - Copy the existing contents from research.deal_reporting_info table in qdsmisc1 to reporting.dmf_extract
-- ############################################################################
CONNECT sys/sys@dev
set serveroutput on
spool c:\_dblog\populate.log

exec dbms_output.put_line('--- Begin script populate.sql ---') ;

TRUNCATE TABLE table_name;
COMMIT;

INSERT INTO table_name
SELECT * FROM table@db_link;
COMMIT;

  

exec dbms_output.put_line('--- End script populate.sql ---') ;
spool off 