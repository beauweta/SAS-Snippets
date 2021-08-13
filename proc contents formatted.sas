proc fcmp outlib=WORK.FUNCS.GENERAL;
  function commastr( STR $ ) $ ;
    length A B $800 ; 
    A=STR;
    do until (A=B);
      B=A;
      A=prxchange('s/(\d)(\d\d\d(\Z|,))/\1,\2/',1,trim(B));  
    end;
    return (A);
  endsub;
run;

options cmplib=WORK.FUNCS;

proc format ;
  value $commastr low-high=[commastr()];
run;

%let null=;

&null.
%macro Format_Contents;
  ods path reset;
  ods path (prepend) WORK.TEMPLAT(update);

  proc template;
    edit BASE.CONTENTS.ATTRIBUTES;
      edit CVALUE2;
        format = $commastr800.;
      end;
    end;
    edit BASE.CONTENTS.ENGINEHOST;
      edit CVALUE1;
        format = $commastr800.;
      end;
    end;
  run;
%mend Format_Contents;

%Format_Contents;

proc contents data=SASHELP.CARS;
run;
