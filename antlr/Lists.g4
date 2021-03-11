grammar Lists;

@members{
	boolean isAscending = true;
}

start : list EOF;

list : {  }
     | element list { int curr = Integer.parseInt( $element.text ); }
     ;

NUMBER : [0-9]+;
element : NUMBER;
WS : [ \t\r\n]+ { skip(); };