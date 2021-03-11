grammar asbs;

asbs : start EOF;
start :
      | ( 'a' start 'b' )
      ;

WS : [ \t\r\n]+ -> skip;
