
component {

  variables.lines = fileRead('./day10-part1.txt').listToArray(chr(13) & chr(10));

	function part1() {
    var X = 1;
    var cycle = 0;
    var answer = 0;
    var points = [20,60,100,140,180,220];

    for( l in lines ){
      var command = l.listToArray(" ");
      
      if(command[1] == "noop"){
        cycle++;
        if( points.find(cycle) ){
          answer += cycle * X;
        }
      }else if( command[1] == "addx"){
        V = command[2];
        X += V;
        cycle++;
        if(points.find(cycle)){
          answer += cycle * (X - V);
        }
        cycle++;
        if(points.find(cycle)){
          answer += cycle * (X - V);
        }
      }
    }
    print.line(answer);
	}

	function part2() {
  }
}
    
