data USERNAMES;
  input NAME $8.;
cards;
lan_id
;

data USERDATA;
  set USERNAMES;
  length PIPEVAR $20;
  PIPEVAR = "id " !! NAME;
  infile dummy pipe filevar=PIPEVAR end=DONE;
  do until (DONE);
    input UIDSTRING :$20. GID_STRING :$20. GROUP_STRING :$500.;
    output;
  end;
run;
