filename CSV "%sysfunc(pathname(WORK))/Claimsfile.csv";

proc export data=SASHELP.CLASS outfile=CSV dbms=csv replace;run;

ods package(zipout) open nopf;
ods package(zipout) add file=CSV path="/";
ods package(zipout) publish archive properties 
  (archive_name="claimsfile.zip"
   archive_path="%sysfunc(pathname(WORK))");
ods package(zipout) close;
