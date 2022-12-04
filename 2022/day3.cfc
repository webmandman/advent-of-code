
component {

	function part1() {
		var lines = fileRead('./day03-part1.txt').listToArray(chr(13) & chr(10));
    var p1 = 0;
    var index = 1;
    for( l in lines){
      //if( index eq 2 ) break;
      var len = l.len();
      var c1 = l.listToArray('').slice(1,len/2);
      var c2 = l.listToArray('').slice((len/2)+1,len/2);
      for( ch in c1 ){
        if( c2.find(ch) ){
          p1 += score(ch);
          break;
        }
      }
      index++;
    }
    print.line(p1);
	}

  function score(string ch){
    var ascii = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    var aa = ascii.listToArray('');
    return aa.find(ch);
  }

	function part2() {
		var lines = fileRead('./day03-part1.txt').listToArray(chr(13) & chr(10));
    var p2 = 0;
    var index = 3;
    for(var i=3; i <= lines.len(); i+=3){
      //if( index eq 6 ) break;
      var r1 = lines[i-2].listToArray('');
      var r2 = lines[i-1].listToArray('');
      var r3 = lines[i].listToArray('');
      for( ch in r1 ){
        if( r2.find(ch) and r3.find(ch) ){
          p2 += score(ch);
          break;
        }
      }
      index += 3;
    }
    print.line(p2);
	}

}
    
