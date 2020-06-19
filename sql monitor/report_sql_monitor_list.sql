SET LONG 1000000
SET LONGCHUNKSIZE 1000000
SET LINESIZE 1000
SET PAGESIZE 0
SET TRIM ON
SET TRIMSPOOL ON
SET ECHO OFF
SET FEEDBACK OFF
SPOOL report_sql_monitor_list.html
SELECT dbms_sqltune.report_sql_monitor_list(
  type         => 'HTML',
  report_level => 'ALL') AS report
FROM dual;
SPOOL OFF
