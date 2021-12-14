component {

	function part1() {
		var crabs = fileRead("./day7-input.txt").listToArray(",");
		var max = crabs.max();
		var min = crabs.min();
		var pos_cost = ArrayNew().set(1,max-min,0);
		for(var i = min; i <= max; i++){
			var total = 0;
			for( c in crabs ){
				total += (c - i).abs();		
			}
			pos_cost[i+1] = total;
		}
		print.line( pos_cost.min() );
	}

	function part2() {
		var crabs = fileRead("./day7-input.txt").listToArray(",");
		var max = crabs.max();
		var pos_cost = ArrayNew().set(1,max,0);
		for(var pos = 0; pos <= max; pos++){
			var total = 0;
			for( c in crabs ){
				var dist = (c - pos).abs();
				var cost = dist * (dist + 1) / 2;
				total += cost;
			}
			pos_cost[pos+1] = total;
		}
		print.line( pos_cost.min() );
	}

}

    
