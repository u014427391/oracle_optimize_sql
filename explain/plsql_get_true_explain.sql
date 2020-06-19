declare
  b1 date;
begin
  execute immediate 'alter session set statistics_level=ALL';
  b1 := sysdate - 1;
  for test in (
               -- 业务SQL(sql后面不需要加";")
               select /*+ monitor */
                *
                 from appr_handle_info) loop
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
