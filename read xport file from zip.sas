https://communities.sas.com/rss/message?board.id=programming&message.id=227098

filename ZIPPED zip "&codepath/file.zip" ;
libname ZIPPED xport ;
proc copy inlib=ZIPPED outlib=WORK;
run;
