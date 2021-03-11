grammar exprCorrect;

expr : term
     | ( term op2 expr )
     ;

term : factor
     | ( factor op1 term )
     ;

factor : number
       | id
       | ( '(' expr ')' )
       | ( '-' factor )
       ;

op1 : OP1;
op2 : OP2;
number : NUMBER;
id : ID;

OP1 : '*' | '/';
OP2 : '+' | '-';
NUMBER : ('0'..'9')+;
ID : [a-z]+;

WS : [ \t\r\n]+ -> skip;
