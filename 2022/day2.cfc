component {

	function part1() {
		var lines = fileRead('./day02-part1.txt').listToArray(chr(13) & chr(10));
    var score = 0;
    for( l in lines ){
      var player = l.listToArray(" ");
      if(player[1] == 'A'){ // rock
        if(player[2] == 'X') score += 4; // rock
        if(player[2] == 'Y') score += 8; // paper 
        if(player[2] == 'Z') score += 3; // scissors
      }else 
      if(player[1] == 'B'){ // paper
        if(player[2] == 'X') score += 1; // rock
        if(player[2] == 'Y') score += 5; // paper 
        if(player[2] == 'Z') score += 9; // scissors
      }else{ ///////////////// scissors
        if(player[2] == 'X') score += 7; // rock
        if(player[2] == 'Y') score += 2; // paper 
        if(player[2] == 'Z') score += 6; // scissors
      }
    }
    print.line(score);
	}

	function part2() {
    var lines = fileRead('./day02-part1.txt').listToArray(chr(13) & chr(10));
    var a = 'A';
    try{
      evaluate(a + 2);
    }catch(any e){
      print.line(e.message);
      return;
    }
    var score = 0;
    for( l in lines ){
      var player = l.listToArray(" ");
      if(player[1] == 'A'){ // rock
        if(player[2] == 'X') score += 3; // scissors 3
        if(player[2] == 'Y') score += 4; // rock 1
        if(player[2] == 'Z') score += 8; // paper 2
      }else 
      if(player[1] == 'B'){ // paper
        if(player[2] == 'X') score += 1; // rock 1
        if(player[2] == 'Y') score += 5; // paper  2
        if(player[2] == 'Z') score += 9; // scissors 3
      }else{ ///////////////// scissors
        if(player[2] == 'X') score += 2; // paper 2
        if(player[2] == 'Y') score += 6; // scissors 3
        if(player[2] == 'Z') score += 7; // rock 1
      }
    }
    print.line(score);

	}

}

    
