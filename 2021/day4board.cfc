component accessors=true {
	property board;
	
	// lines: an array of 5 strings
	function init(required array lines){
		var board = ArrayNew().set(1,5,[]);
		lines.each( function( line,j ){
			// the numbers of each row
			rowNums = line.listToArray(" ");
			// append boolean drawn (default false)
			rowNums.each( function( num,k ){
				board[j].append([num,false]);
			});
		});
		variables.board = board;
		return this;
	}

	public function mark(required numeric drawn){
		for( row in variables.board ){
			for( el in row ){
				if( el[1] == drawn ) el[2] = true;
			}
		}
	}

	public function detectWin(){
		for(var row = 1; row <= 5; row++){
			for(var el = 1; el <= 5; el++){
				if( variables.board[row][el][2] == false ) break;
				if( el == 5 ) return true;
			}
		}
		for(var col = 1; col <= 5; col++){
			for(var el = 1; el <= 5; el++){
				if( variables.board[el][col][2] == false ) break;
				if( el == 5 ) return true;
			}
		}
		return false;
	}

	public function getScore(required numeric lastdrawn){
		var unmarkedSum = 0;
		for(var row = 1; row <= 5; row++){
			for(var col = 1; col <= 5; col++){
				if( not variables.board[row][col][2] ){
					unmarkedSum += variables.board[row][col][1];
				}
			}
		}
		return unmarkedSum * lastdrawn;
	}

}
