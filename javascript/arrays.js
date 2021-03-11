


var first = [];
first[0] = 'A';
first[1] = 'B';
first[2] = 'C';

for( var i = 0; i < 3; i++ ){
	console.log( first[i] );
}

var second = [];
second['zero'] = 'a';
second['one'] = 'b';
second['two'] = 'c';

for( var i = 0; i < 3; i++ ){
	console.log( second[i] );
}

console.log( first );
console.log( second );

for( var e in second ){
	console.log( second[ e ] );
}
