
component {

  variables.stacks = [
    ['F','H','B','V','R','Q','D','P'],
    ['L','D','Z','Q','W','V'],
    ['H','L','Z','Q','G','R','P','C'],
    ['R','D','H','F','J','V','B'],
    ['Z','W','L','C'],
    ['J','R','P','N','T','G','V','M'],
    ['J','R','L','V','M','B','S'],
    ['D','P','J'],
    ['D','C','N','W','V']
  ];

	function part1() {
		var lines = fileRead('./day05-part1.txt').listToArray(chr(13) & chr(10));
    for( l in lines ){
      var proc = reMatch("[0-9]+",l);
      // move 3 from 5 to 1 
      for(var i = 1; i <= proc[1]; i++){
        var move = stacks[proc[2]].pop();
        stacks[proc[3]].push(move);
      }
    }
    var p1 = "";
    for( s in stacks ){
      p1 = p1 & s.last();
    }
    print.line(p1);
	}

  

	function part2() {
		var lines = fileRead('./day05-part1.txt').listToArray(chr(13) & chr(10));
    var index = 1;
    for( l in lines ){
      //if( index eq 3) break;
      var proc = reMatch("[0-9]+",l);
      // move 3 from 5 to 1 
      var stack1 = stacks[proc[2]];
      //print.line("stack #proc[2]# before: " & stack1.tolist());
      var stack2 = stacks[proc[3]];
      //print.line("stack #proc[3]# before: " & stack2.tolist());
      var procmove = [];
      for(var i = 1; i <= proc[1]; i++){
        if( stack1.len() ){
          var move = stack1.pop();
          //print.line(move);
          //print.line(stack);
          procmove.prepend(move);
        }
      }
      //print.line("moving " & procmove.tolist());
      for( m in procmove ){
        stack2.push(m);
      }
      //print.line("stack #proc[2]# after: " & stack1.tolist()); 
      //print.line("stack #proc[3]# after: " & stack2.tolist()); 
      index++;
    }
    var p2 = "";
    //print.line(stacks);
    for( s in stacks ){
      print.line(s.tolist()); 
      p2 = p2 & s.last();
    }
    print.line(p2);
	}

}
    
