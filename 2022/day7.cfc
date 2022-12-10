
component {

	function part1() {
		var lines = fileRead('./day07-part1.txt').listToArray(chr(13) & chr(10));
    var directories = query();
    directories.addColumn('folderpath',"varchar");
    directories.addColumn('totalsize',"integer");
    var folderpath = "";
    var foldertotal = 0;
    var lsmode = false;
    for( l in lines ){
      var p = l.listToArray(" ");
      if(p[1] == "$"){
        // command
        if(p[2] == "cd"){
          // change directory
          if(p[3] == "/"){
            // change to root
            folderpath = "/";
            foldertotal = 0;
            continue;
          }
          if(p[3] == ".."){
            // change directory to parent
            folderpath = listDeleteAt(folderpath,listLen(folderpath,"/"),"/");
            foldertotal = 0;
            continue;
          }
          //change into directory
          if(folderpath == "/") {
            folderpath = folderpath & p[3];
          }else{
            folderpath = folderpath & "/" & p[3];
          }
          directories.addRow({folderpath:folderpath,totalsize:foldertotal});
          foldertotal = 0;
          continue;
        }
        if(p[2] == "ls"){
          // list 
          lsmode = true;
          continue;
        }
      }else{
        if(p[1] == "dir") continue;

        // file size p[1]
        // file name p[2]
        directories = directories.map(function(r,i){
          if(r.folderpath == folderpath){
            //print.text(r.folderpath & " " & folderpath).line();
            r.totalsize = p[1];
          }
          return r;
        })
      }

    }
    var total = queryReduce(directories,function(a,b){
      return (b.totalsize <= 100000)? a + b.totalsize : a;
    },0)
    print.line(total); 
	}

  function folderExists(string folderpath, array club){
    var folder = collectionFilter(club, function(f){
      return f.folderpath is folderpath;
    });
    return (folder.len() == 1)? true : false;
  }

	function part1a() {
		var lines = fileRead('./day07-part1.txt').listToArray(chr(13) & chr(10));
    var club = [];
    var folderpath = "";
    var foldertotal = 0;
    for( l in lines ){
      var p = l.listToArray(" ");
      if(p[1] == "$"){
        // command
        if(p[2] == "cd"){
          // change directory
          if(p[3] == "/"){
            // change to root
            if(foldertotal <= 100000){
              club.push({folderpath:folderpath,totalsize:foldertotal});
            }
            folderpath = "/";
            foldertotal = 0;
            continue;
          }
          if(p[3] == ".."){
            // change directory to parent
            if(foldertotal <= 100000){
              club.push({folderpath:folderpath,totalsize:foldertotal});
            }
            var fparr = folderpath.listToArray("/");
            folderpath = fparr.deleteAt(fparr.len()).toList("/");
            foldertotal = 0;
            continue;
          }
          //change into directory
          if(foldertotal <= 100000){
            club.push({folderpath:folderpath,totalsize:foldertotal});
          }
          folderpath = folderpath & "/" & p[3];
          foldertotal = 0;
          continue;
        }
        if(p[2] == "ls"){
          // list 
          continue;
        }
        continue;
      }
      if(p[1] == "dir"){
        // dir name p[2]
        continue;
      }
      // file size p[1]
      // file name p[2]
      // does folderpath already been added?
      foldertotal += p[1];
    }
    
    var p1 = 0;
    collectionEach(club, function(f){
      p1 += f.totalsize;
    })
    print.line(p1); 
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
    
