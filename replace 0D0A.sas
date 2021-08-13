

%* Replace quoted ODOA in a text file. Caution: Can be slow on a large file ;



        data t;
         file "&wdir\t.csv";
         put 'A"B' '0d0a'x 'CD';
        data t; 
         infile "&wdir\t.csv";
        input;put _infile_ $hex22.;run;


%let filein = &wdir\t.csv; %* Full path of text file       ;

data _null_;
  retain Q 0;    %* Open quote toggle flag       ;
  REP0D  = ' ' ; %* Replacement character for CR ;   
  REP0A  = ' ' ; %* Replacement character for LF ;
  infile "&filein" recfm=n sharebuffers;
  file   "&filein" recfm=n;
  input CHAR $char1.;                                                           
  if CHAR = '"' then Q = ^Q;   
  if Q & CHAR = '0D'x then put REP0D $1.; 
  if Q & CHAR = '0A'x then put REP0A $1.;
run;



        data t; 
         infile "&wdir\t.csv";
        input;put _infile_ $hex22.;run;
