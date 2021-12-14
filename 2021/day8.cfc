component {

	variables.input = 
		fileRead("./day8-input.txt")
		.listToArray(chr(13) & chr(10))
		.map( (l) => l.listToArray("|") )
		.map( (s) => s[2].trim().listToArray(" ") );

	function part1() {
		var count = 0;
		var good = [2,4,3,7];
		for( o in variables.input ){
			for( s in o ){
				if( good.find(s.len()) ) count += 1;
			}
		}
		print.line( count );
	}

	function part2() {
		print.line( variables.input[1] );
	}

}

    
