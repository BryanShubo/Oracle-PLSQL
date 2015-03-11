prompt Follow all instructions very carefully: 
prompt		  
prompt THIS SCRIPT IMPLEMENTS THE SYSTEM SCRIPTS FOR system_deploy.
-- Removed at DBA request PAUSE 'Press ENTER to continue OR CNTL+C to exit!'

SET SERVEROUTPUT ON SIZE 100000
SET TIMING OFF

WHENEVER SQLERROR EXIT SQL.SQLCODE
WHENEVER OSERROR EXIT FAILURE


