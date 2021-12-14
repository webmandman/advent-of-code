component {

	function part1() {
		var fish = fileRead("./day6-input.txt").listToArray(",");
		
		for(var i = 1; i <= 80; i++){
			var N = fish.len();
			for(var j = 1; j <= N; j++){
				if( fish[j] == 0 ){ 
					fish[j] = 6;
					fish.append(8);
				}else{
					fish[j] -= 1;
				}
			}
		}
		print.line( fish.len() );
	}

	function part2() {
		var fish = fileRead("./day6-input.txt").listToArray(",");
		
		// Instead of looping through every fish in the array,
		// since the array will be increasing every day eventually
		// reaching possibly billions of fish (very low performance),
		// first count how many identical fish there are. how many
		// fish with 0 days left to spawn a new fish? How many fish with 1 day
		// left to spawn a new fish? and so on. create an array with these counts
		// and call it queue.
		// sample input we have 5 fish: [3,4,3,1,2]
		// queue: [0,1,1,2,1,0,0,0,0]

		// create the empty queue
		var queue = ArrayNew().set(1,9,0);
		// count the fish with similar internal timers
		for( f in fish  ){
			queue[f+1] += 1;
		}

		for(var i = 1; i <= 80; i++){
			var currentfishes = queue.shift();
			queue.push(currentFishes);
			queue[7] += currentFishes;
		}
		
		print.line( queue );

		// sum of all
		print.line( queue.sum() );
	}

}

    
