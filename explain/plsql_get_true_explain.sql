declare
  b1 date;
begin
  execute immediate 'alter session set statistics_level=ALL';
  b1 := sysdate - 1;
  for test in (
               select /*+ monitor */
                *
                 from scott.dept) loop
    null;
  end loop;
  for x in (select p.plan_table_output
              from table(dbms_xplan.display_cursor(null,
                                                   null,
                                                   'advanced -bytes -PROJECTION allstats last')) p) loop
    dbms_output.put_line(x.plan_table_output);
  end loop;
  rollback;
end;
/
