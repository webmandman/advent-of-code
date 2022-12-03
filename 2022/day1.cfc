component {

	function part1() {
		var file = fileOpen('./day01-part1.txt','read');
    var elf = [];
    var most = 0;
    while(!fileIsEOF(file)){
      l = fileReadLine(file);
      if( isEmpty(l) ){
        if( elf.sum() > most ) most = elf.sum();
        elf = [];
      }else{
        elf.push(l);
      }
    }
    fileClose(file);
    print.line(most);
	}

	function part2() {
		var file = fileOpen('./day01-part1.txt','read');
    var elf = [];
    var t1 = 0;
    var t2 = 0;
    var t3 = 0;
    while(!fileIsEOF(file)){
      l = fileReadLine(file);
      if( isEmpty(l) ){
        if( elf.sum() > t1 ){
          t2 = t1;
          t3 = t2;
          t1 = elf.sum();
        }else if( elf.sum() > t2 ){
          t3 = t2;
          t2 = elf.sum();
        }else if( elf.sum() > t3 ){
          t3 = elf.sum();
        }
        elf = [];
      }else{
        elf.push(l);
      }
    }
    fileClose(file);
    print.line(t1+t2+t3);
	}

}

    
