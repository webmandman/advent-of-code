component {

	function run() {
        var crlf = chr(13)&chr(10);
		var input = fileRead("./day1-part1.txt").listToArray(",#crlf#");
		var count = 0;
		for(var i = 1; i <= input.len(); i++ ){
			if( i !== 1 && input[i] > input[i-1] ) {
				count += 1;
			}
		}
		print.line(count);
	}

}

    
