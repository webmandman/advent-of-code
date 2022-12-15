
component {

  variables.util = new Utils();
  variables.directions = [ [0,1],[1,0],[-1,0],[0,-1] ];

	function part1() {
    var lines = fileRead('./day12-part1.txt').listToArray( chr(10), false, true);
    // y,x coordinates with true/false values 
    variables.visited = [];
    // y,x coordinates
    variables.grid = [];
    for(row in lines){
			var rowAry = row.listToArray("");
      variables.grid.push(rowAry);
      var visitedrow = [];
      for(col in rowAry){
        visitedrow.push(false);
      }
      variables.visited.push(visitedrow);
    }



    variables.n = grid.len();
    variables.m = grid[1].len();

    // get coordinates for start and end
    for(i in util.range(n)){
      for(j in util.range(m)){
        var char = grid[i][j];
        if( refind("S",char) ){
          var start = [i,j];
        }else if( refind("E",char)){
          var end = [i,j];
        }
      }
    }

    // keeps track of shortest distance from Start and neighbors
    // (distance, y, x) 
    // starting at START 
    variables.heap = util.hashset([[ 0,start[1], start[2] ]]);

    function neighbors(numeric y, numeric x){
      var hood = [];
      for(d in variables.directions){
        var yy = arguments.y + d[1];
        var xx = arguments.x + d[2];
        
        // make sure its within the grid
        if( yy >= 0 and yy < n and xx >= 0 and xx < m ){
          continue;
        }

        // limit the check on the height to 1 hence the >= and -1
        if( height(grid[yy][xx]) <= (height(grid[y][x]) +1) ){
          hood.push([yy,xx]);
        }
      }
      return hood;
    }

    function shortest(heap){
      var distance = util.infinity();
      var shortest = [];
      for(v in heap.toArray()){
        if ( v[1] < distance ){
          distance = v[1];
          shortest = v;
        }
      }
      return shortest;
    }

    function height(char){
      if( refind(char,util.ascii("lowercase")) ){
        return util.ascii_index(char);
      }
      if( char == "S" ) return 1;
      if( char == "E" ) return 26;
    }
    
    while(true){
      // find vertex in heap with shortest distance
      var shorty = shortest(heap);
      var steps = shorty[1];
      var y = shorty[2];
      var x = shorty[3];

      // visited?
      if( visited[y][x] ) continue;
      visited[y][x] = True;

      // if current vertex (y,x) is same as END, then done
      if( y == end[1] and x == end[2] ){
        print.line(steps);
        break;
      }

      // add neighbors to heap
      for(neighbor in neighbors(y,x)){
        heap.push([steps+1,neighbor[1],neighbor[2]]);
      }
    }
	}

	function part2() {
    var lines = fileRead('./day12-part1.txt').listToArray( chr(10), false, true);
    // y,x coordinates with true/false values 
    variables.visited = [];
    // y,x coordinates
    variables.grid = [];
    for(row in lines){
      variables.grid.push(row.listToArray(""))
      var visitedrow = [];
      var headrow = [];
      for(col in row.listToArray("")){
        visitedrow.push(false);
      }
      variables.visited.push(visitedrow);
    }



    variables.n = grid.len();
    variables.m = grid[1].len();

    // get coordinates for start and end
    for(i in util.range(n)){
      for(j in util.range(m)){
        var char = grid[i][j];
        if( refind("S",char) ){
          var start = [i,j];
        }else if( refind("E",char)){
          var end = [i,j];
        }
      }
    }

    // keeps track of shortest distance from Start and neighbors
    // (distance, y, x) 
    // starting at END 
    variables.heap = util.hashset([[ 0,end[1], end[2] ]]);

    function neighbors(numeric y, numeric x){
      var hood = [];
      for(d in variables.directions){
        var yy = arguments.y + d[1];
        var xx = arguments.x + d[2];
        
        // make sure its within the grid
        print.line(yy);
        if( yy >= 0 and yy < n and xx >= 0 and xx < m ){
          continue;
        }

        // limit the check on the height to 1 hence the >= and -1
        if( height(grid[yy][xx]) >= (height(grid[y][x]) -1) ){
          hood.push([yy,xx]);
        }
      }
      return hood;
    }

    function shortest(heap){
      var distance = util.infinity();
      var shortest = [];
      for(v in heap.toArray()){
        if ( v[1] < distance ){
          distance = v[1];
          shortest = v;
        }
      }
      return shortest;
    }

    function height(char){
      if( refind(char,util.ascii("lowercase")) ){
        return util.ascii_index(char);
      }
      if( char == "S" ) return 1;
      if( char == "E" ) return 26;
    }
    
    while(true){
      // find vertex in heap with shortest distance
      var shorty = shortest(heap);
      var steps = shorty[1];
      var y = shorty[2];
      var x = shorty[3];

      // visited?
      if( visited[y][x] ) continue;
      visited[y][x] = True;

      // break if we reach START == 0, done
      if( height(grid[y][x]) == 0){
        print.line(steps);
        break;
      }

      // add neighbors to heap
      for(neighbor in neighbors(y,x)){
        heap.push([steps+1,neighbor[1],neighbor[2]]);
      }
    }
	}
}
    
