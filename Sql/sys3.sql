alter session set "_ORACLE_SCRIPT"=TRUE;
create user Project identified by "1234";

grant connect,resource,dba to Project;
alter user Project identified by "1234";

commit;