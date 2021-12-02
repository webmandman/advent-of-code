component {

	function run() {
        var crlf = chr(13)&chr(10);
		var input = fileRead("./day2-part1.txt").listToArray(",#crlf#");
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

    