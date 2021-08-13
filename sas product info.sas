proc product_status;
run;

data PRODUCTS;
  set _PRODSAVAIL;
  LICENSED=sysprod(PRODCODE);
  do OPTION='A', 'D', 'E', 'F', 'H', 'I', 'M', 'P', 'S', 'T' ;
    TSLVL = tslvl(PRODMOD,OPTION);
    output;
  end;
run; 
