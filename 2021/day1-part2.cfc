component {

	function run() {
        var crlf = chr(13)&chr(10);
		var input = fileRead("./day1-part1.txt").listToArray(",#crlf#");
		var count = prev_sum = curr_sum = 0;
		for(var i = 1; i <= input.len(); i++ ){
			if( i == 1 || i == 2 ) continue;

			curr_sum = input[i] + input[i-1] + input[i-2];

			if( prev_sum !== 0 && curr_sum > prev_sum ) count += 1;

			prev_sum = curr_sum;
		}
		print.line(count);
	}

}

    
