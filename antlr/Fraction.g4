grammar Fraction;

fraction : numerator=number '/' denominator=number EOF { 
/* THIS IS A COMMENT */
if( Integer.parseInt( $numerator.text ) % Integer.parseInt( $denominator.text ) == 0 ){
    System.out.println( "This is an integer" );
}

if( Integer.parseInt( $denominator.text ) == 0 ){
    System.err.println( "Value is Undefined" );
}
else{
System.out.format( "The value of the fraction is %f\n" , (double)(Integer.parseInt( $numerator.text ) ) / (double)(Integer.parseInt( $denominator.text ) ));
 }
};
number : NUMBER;
NUMBER : [0-9]+;
WS : [ \t\r\n]+ { skip(); };
