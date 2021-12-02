component {

	function part1() {
		var input = fileRead("./day2-input.txt").listToArray(chr(13) & chr(10));
		var h = d = move = step = 0;
		for(var i = 1; i <= input.len(); i++ ){
			move = listGetAt(trim(input[i]),1," ");
			step = listGetAt(trim(input[i]),2," ");
			if( move == "forward" ) h += step;
			if( move == "down" ) d += step;
			if( move == "up" ) d -= step;
		}
		print.line(h * d);
	}

	function part2() {
		var input = fileRead("./day2-input.txt").listToArray(chr(13) & chr(10));
		var a = h = d = move = step = 0;
		for(var i = 1; i <= input.len(); i++ ){
			move = listGetAt(trim(input[i]),1," ");
			step = listGetAt(trim(input[i]),2," ");
			if( move == "forward" ){ 
				h += step;
				d += a * step;
			}
			if( move == "down" ) a += step;
			if( move == "up" ) a -= step;
		}
		print.line(h * d);
	}

}

    
