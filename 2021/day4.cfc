component {

function part1() {
	var boards = [];
	var lines = fileRead("./day4-input.txt").listToArray(chr(13) & chr(10));
	var i = 2;
	while( i < lines.len() ){
		// get 5 input lines
		blines = lines.slice(i,5);
		boards.append( new day4board(blines) );
		i += 5;
	}

	// Run the simulation
	var ans = "none";
	var draw = lines[1].listToArray(",");
	for(x in draw){
		for(b in boards){
			b.mark(x);
		}
		for(b in boards){
			if( b.detectWin() ){
				print.line(b.getBoard());
				ans = b.getScore(x);
				break;
			}
		}
		if( ans != "none" ) break;
	}
	print.line(ans);
}

function part2() {
	var boards = [];
	var lines = fileRead("./day4-input.txt").listToArray(chr(13) & chr(10));
	var i = 2;
	while( i < lines.len() ){
		// get 5 input lines
		blines = lines.slice(i,5);
		boards.append( new day4board(blines) );
		i += 5;
	}

	// Run the simulation
	var winners = [];
	var draw = lines[1].listToArray(",");
	var lastdrawn = "";
	for( x in draw ){
		lastdrawn = x;
		boards.each(function(b,i){
			if( not b.detectWin() ){
				b.mark(x);
			}else{
				continue;
			}
			if( not winners.find(i) && b.detectWin() ){
				winners.append(i);
				continue;
			}
		});
		if( winners.len() == boards.len() ) break;
	};
	print.line(boards[winners.last()].getScore(lastdrawn));
	print.table(boards[winners.last()].getBoard());
}

}

