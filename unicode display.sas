

%***************** ODS GRAPH **********;
proc format ;
  value $sup_sg
    'F'="TRT A 5x10(*ESC*){unicode '00b9'x}(*ESC*){unicode '2070'x}"
    'M'="TRT B 1x10(*ESC*){unicode '00b9'x}(*ESC*){unicode '00b9'x}" ;
ods graphics on / width=320px height=240px;
proc sgpanel data=SASHELP.CLASS;
  format SEX $sup_sg.;
  panelby SEX / novarname headerattrs=GraphUnicodeText;
  scatter x=WEIGHT y=HEIGHT;
run;


%***************** ODS REPORT **********;
ods escapechar='^';
proc format ;
  value $sup_ods 'F'="TRT A 5x10^{super 10}"
                 'M'="TRT B 1x10^{super 11}"  ;
proc freq data=SASHELP.CLASS;
  format SEX $sup_ods.;
  table SEX;
run;       


%***************** SAS/GRAPH **********;
%let a=%sysfunc(unicodec(TRT A 5x10, utf16b),$hex40.)00b92070;
%let b=%sysfunc(unicodec(TRT B 1x10, utf16b),$hex40.)00b900b9;
legend value=(font="arial unicode ms/unicode" "&a"x "&b"x) ;
goptions ypixels=240 xpixels=320;
proc gplot data=SASHELP.CLASS;
  plot WEIGHT*AGE=SEX/legend=legend1;
  run; 
quit;     


ods excel file="&wdir\t.xls";
ods pdf file="&wdir\t.pdf";
ods rtf file="&wdir\t.rtf";
ods html file="&wdir\t.html";
ods escapechar='!'; 
footnote "Note: xxx Drug !{super !{unicode 24C7}}" ;
footnote2 "Note: xxx Drug !{super A}" ;
proc print data=sashelp.class; run;


