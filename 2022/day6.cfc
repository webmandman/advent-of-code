
component {

	function part1() {
		var chars = fileRead('./day06-part1.txt').listToArray("");
     
    var marker = 0;
    for(var i = 1; i <= chars.len(); i++){
      //if( i > 9  ) break;
      if(i > chars.len() -4 ) break;

      var n = chars.slice(i,4);
      
      if( listRemoveDuplicates(n.toList()) eq n.toList() ){
        marker = i+3;
        break;
      }
    }
    print.line(marker);
	}

  

	function part2() {
		var chars = fileRead('./day06-part1.txt').listToArray("");
     
    var marker = 0;
    for(var i = 1; i <= chars.len(); i++){
      //if( i > 9  ) break;
      if(i > chars.len() -14 ) break;

      var n = chars.slice(i,14);
      
      if( listRemoveDuplicates(n.toList()) eq n.toList() ){
        marker = i+13;
        break;
      }
    }
    print.line(marker);
	}

}
    
