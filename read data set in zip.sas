%let member=data.sas7bdat;
filename IN zip "&path/data.zip" member="&member" recfm=n;
filename OUT   "%sysfunc(pathname(work))/&member" recfm=n;
data _null_;
  RC=fcopy('IN','OUT');
run;
