
component {

	function part1() {
		var lines = fileRead('./day04-part1.txt').listToArray(chr(13) & chr(10));
    var count = 0;
    for( l in lines ){
      var elf = l.listToArray();
      var e1min = elf[1].listToArray('-')[1];
      var e1max = elf[1].listToArray('-')[2];
      var e2min = elf[2].listToArray('-')[1];
      var e2max = elf[2].listToArray('-')[2];
      if(e2min >= e1min and e2max <= e1max){
        count++;
        continue;
      }
      if(e1min >= e2min and e1max <= e2max){
        count++;
        continue;
      }
    }
    print.line(count);
	}


	function part2() {
		var lines = fileRead('./day04-part1.txt').listToArray(chr(13) & chr(10));
    var count = 0;
    for( l in lines ){
      var elf = l.listToArray();
      var e1min = elf[1].listToArray('-')[1];
      var e1max = elf[1].listToArray('-')[2];
      var e2min = elf[2].listToArray('-')[1];
      var e2max = elf[2].listToArray('-')[2];
      if(e1min >= e2min and e1min <= e2max){
        count++;
        continue;
      }
      if(e1max <= e2max and e1max >= e2max){
        count++;
        continue;
      }
      if(e2min >= e1min and e2min <= e1max){
        count++;
        continue;
      }
      if(e2max <= e1max and e2max >= e1max){
        count++;
        continue;
      }
    }
    print.line(count);
	}

}
    
