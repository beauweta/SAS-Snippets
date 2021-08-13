
proc sql noprint;
  select Name into :list separated by '*'
  from sashelp.vcolumn
  where libname = 'WORK' 
    and memname = 'AA' 
    and lowcase(name) like 'proper^_ingredient%' escape '^'
  ;
quit;

