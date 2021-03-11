grammar expr;
expr : id | number | '-' expr | '(' expr ')' | expr op expr;
op : '+' | '-' | '*' | '/';
id : ID;
number : NUMBER;
ID : ( 'a' .. 'z' )+;
NUMBER : ( '0' .. '9' )+;
WS : [ \t\r\n]+ -> skip ; // skip spaces, tabs, newlines