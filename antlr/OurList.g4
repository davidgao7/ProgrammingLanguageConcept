grammar OurList;

@members{
	float avg = 0;
	int count = 0;
	int sum = 0;
}

ourList : list EOF { 
	System.out.println( "FIRST" );
	if( count == 0 ){
	    count = 1;
	}
	avg = (float)((float)(sum) / count);
	System.out.format( "The average is %f\n" , avg );
	 };
list :
     | number { count++; sum += Integer.parseInt( $number.text ); } list
     ;

number : NUMBER;
NUMBER : [0-9];
WS : [ \t\r\n]+ { skip(); };