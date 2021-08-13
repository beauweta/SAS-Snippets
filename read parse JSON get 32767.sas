https://communities.sas.com/t5/SAS-Programming/How-do-I-Data-manipulate-of-remove-special-char-and-shift-string/m-p/651624#M195531

data want;
if not prxId then prxId + prxParse("/\w+/");
set have;
start = 1; stop = length(type);
call prxnext(prxID, start, stop, type, position, length);
  do while (position > 0);
     newType = substr(type, position, length);
     output;
     call prxnext(prxID, start, stop, type, position, length);
  end;
drop prxId start stop position length;
rename newType=type;
run;
