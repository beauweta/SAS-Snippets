/*
https://communities.sas.com/t5/SAS-Programming/Dynamic-Multi-Table-Merge-Using-Hash-of-Hashes/m-p/668886
*/
data LEFT1;
  input ID $ VAL1 ;
cards;
D 7
E 7
F 5
A 8
B 6
C 1
run;

data LEFT2;
  input ID $ VAL2 ;
cards;
A 1
B 1
D 2
E 7
run;

data LEFT3;
  input ID $ VAL3 ;
cards;
G 1
D 5
E 9
run;

data TABLES;
  input TABLE $ ;
cards;
left1
left2
left3
run;

data MAIN;
  input ID $ ;
cards;                      
E
F
G
A
B
C
D
run;
	
data WANT (keep=ID VAL:);

  if _N_ = 1 then do;
    if 0 then set LEFT: TABLES;
    dcl hash HoH();
    HoH.definekey('TABLE');
    HoH.definedata('H','TABLE');
    HoH.definedone();
    dcl hiter HoHi('HoH');

    do until (LASTOBS);
      set TABLES end=LASTOBS;
      dcl hash H(dataset:TABLE);
      H.definekey('ID');
      H.definedata(all:'yes');
      H.definedone();
      HoH.add();          
    end;
  end;

  set MAIN;
  call missing(of VAL:); 
  do while (HoHi.next() = 0);
  	RC = H.find();
  end;

run;
