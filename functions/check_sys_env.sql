-- SELECT value INTO vEnv from v$parameter where name='db_domain';
  SELECT SYS_CONTEXT('USERENV','SERVER_HOST',50) into vEnv from dual;
