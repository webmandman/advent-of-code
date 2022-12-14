component extends="commandbox.system.BaseTask"{

  variables.asciilowercase = "abcdefghijklmnopqrstuvwxyz";
  variables.asciiuppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

  function range(numeric n){
    var ary = ArrayNew(1);
    for(var i = 1; i <= n; i++){
      ary.push(i);
    }
    return ary;
  }
  void function printArray(array aryOfArrays){

    print.line("[");
    for(row in arguments.aryOfArrays){
      print.text("[ ");
      for(col in row){
        print.text(col & ", ");
      }
      print.text(" ]").line();
    }
    print.line("]");

    print.toConsole();
  }

  void function printRaw(array aryOfArrays){
    for(row in arguments.aryOfArrays){
      for(col in row){
        print.text(col);
      }
      print.line();
    }

    print.toConsole();
  }

  function hashset(any initialarray = []){
    return createObject("java", "java.util.HashSet").init(initialarray);
  }

  function infinity(){
    return createObject("java", "java.lang.Double").POSITIVE_INFINITY;
  }

  function ascii(string case = "uppercase"){
    if(arguments.case == "lowercase"){
      return variables.asciilowercase;
    }
    return variables.asciiuppercase;
  }

  function ascii_index(string char){
    return find(char,variables.asciilowercase);
  }

}
