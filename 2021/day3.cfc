component {
	function getCount(lines) {
		var B = lines[1].len(); // number of bits in each number
		var zeros = arrayNew().set(1,B,0);
		var ones = arrayNew().set(1,B,0);
		for(var i = 1; i <= lines.len(); i++ ){
			for(var j = 1; j <= lines[i].len(); j++ ){
				if( lines[i][j] == 1 ){
					ones[j] += 1;
				}else{
					zeros[j] += 1;
				}
			}
		}
		return { zeros:zeros, ones:ones };
	}

	function part1() {
		var input = fileRead("./day3-input.txt").listToArray(chr(13) & chr(10));
		var count = getCount(input);
		var gamma = epsilon = "";
		for(var i = 1; i <= count.zeros.len(); i++ ){
			if( count.zeros[i] > count.ones[i] ){
				gamma &= "0";
				epsilon &= "1";
			}else{
				gamma &= "1";
				epsilon &= "0";
			}
		}
		print.line(gamma);
		print.line(epsilon);
		print.line(inputBaseN(gamma,2) * inputBaseN(epsilon,2));
	}

	function getOxygenRating(lines,index=1){
		var count = getCount(lines);
		var most = "1";
		if( count.zeros[index] > count.ones[index] ){
			most = "0";
		}
		var filtered = lines.filter((line) => line[index] == most);
		if( filtered.len() == 1 ) return filtered[1];
		return getOxygenRating(filtered,index+1);
	}

	function getCO2Rating(lines,index=1){
		var count = getCount(lines);
		var least = "0";
		if( count.zeros[index] > count.ones[index] ){
			least = "1";
		}
		var filtered = lines.filter((line) => line[index] == least);
		if( filtered.len() == 1 ) return filtered[1];
		return getOxygenRating(filtered,index+1);
	}

	function part2() {
		var input = fileRead("./day3-input.txt").listToArray(chr(13) & chr(10));
		var orating = getOxygenRating(input);
		print.line(orating);
		var co2rating = getCO2Rating(input);
		print.line(co2rating);
		print.line(inputBaseN(orating,2) * inputBaseN(co2rating,2));
		print.line(getCount(input));
	}

}

    
