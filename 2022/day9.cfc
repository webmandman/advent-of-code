
component {

  variables.lines = fileRead('./day09-part1.txt').listToArray(chr(13) & chr(10));
  variables.hx = 0;
  variables.hy = 0;
  variables.tx = 0;
  variables.ty = 0;
  variables.knots = [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]];

	function part1() {
    var visited = [];
    var directions = {
      "U": [0,1],
      "D": [0,-1],
      "R": [1,0],
      "L": [-1,0]
    }
    visited.append("#tx#/#ty#");

    for(l in lines){
      // direction and move count
      var d = l.listGetAt(1," ");
      var c = l.listGetAt(2," ");
      /* visited.append("#d#/#c#"); */
      var dx = directions[d][1];
      var dy = directions[d][2];
      // move c times in d direction
      for( _ in arrayNew(1).set(1,c,0) ){
        move(dx,dy)
        visited.append("#variables.tx#/#variables.ty#");
      }

    }
    /* print.line(visited); */
    /* print.line(visited.len()); */
    var list = visited.toList(",");
    /* print.line(list); */
    /* print.line(list.len()); */
    var answer = listToArray(listRemoveDuplicates(list,","));
    /* print.line(list); */
    print.line(answer.len());
	}

  void function move(dx,dy){
    variables.hx += dx;
    variables.hy += dy;
    if( not touching(hx,hy,tx,ty) ){
      sign_x = (variables.hx == variables.tx)? 0 : (variables.hx - variables.tx) / abs(variables.hx - variables.tx);
      sign_y = (variables.hy == variables.ty)? 0 : (variables.hy - variables.ty) / abs(variables.hy - variables.ty);
      variables.tx += sign_x;
      variables.ty += sign_y;
    }
  }

  void function move2(dx,dy){
    knots[1][1] += dx;
    knots[1][2] += dy;
    for(var i = 1; i<=10; i++){
      hx = knots[i][1];
      hy = knots[i][2];
      tx = knots[i];
      ty = knots[i];
      if( not touching(hx,hy,tx,ty) ){
        sign_x = (variables.hx == variables.tx)? 0 : (variables.hx - variables.tx) / abs(variables.hx - variables.tx);
        sign_y = (variables.hy == variables.ty)? 0 : (variables.hy - variables.ty) / abs(variables.hy - variables.ty);
        variables.tx += sign_x;
        variables.ty += sign_y;
      }
      knots[i][1] = tx;
      knots[i][2] = ty;
    }
  }

  boolean function touching(x1,y1,x2,y2){
    return abs(x1 - x2) <= 1 && abs(y1 - y2) <= 1
  }

	function part2() {
    var visited = [];
    var directions = {
      "U": [0,1],
      "D": [0,-1],
      "R": [1,0],
      "L": [-1,0]
    }
    visited.append("#knots[10][1]#/#knots[10][2]#");

    for(l in lines){
      // direction and move count
      var d = l.listGetAt(1," ");
      var c = l.listGetAt(2," ");
      /* visited.append("#d#/#c#"); */
      var dx = directions[d][1];
      var dy = directions[d][2];
      // move c times in d direction
      for( _ in arrayNew(1).set(1,c,0) ){
        move2(dx,dy)
        visited.append("#knots[10][1]#/#knots[10][2]#");
      }

    }
    /* print.line(visited); */
    /* print.line(visited.len()); */
    var list = visited.toList(",");
    /* print.line(list); */
    /* print.line(list.len()); */
    var answer = listToArray(listRemoveDuplicates(list,","));
    /* print.line(list); */
    print.line(answer.len());	}
}
    
