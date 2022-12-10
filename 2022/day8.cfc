
component {

  variables.rows = fileRead('./day08-part1.txt').listToArray(chr(13) & chr(10));
  variables.trees = setTreeGrid(variables.rows);
  variables.gridH = trees.len();
  variables.gridW = trees[1].len();

	function part1() {
    var visible = 0;
    // traverse the tree grid == left to right, top to bottom
    for(var x = 1; x <= gridW; x++){
      for(var y = 1; y <= gridH; y++){
        var t = tree(x,y);
        // left
        if( x == 1 || trees[y].slice(1,x-1).max() < t ) {
          /* print.line("(#x#,#y#)"); */
          visible++; 
        }else 
        // right
        if( x == gridW ||  trees[y].slice(x+1,gridW-x).max() < t ) {
          /* print.line("(#x#,#y#)"); */
          visible++;
        }else
        // up
        if( y == 1 || trees.slice(1,y-1).map( (t,i) => return t[x] ).max() < t ) {
          /* print.line("(#x#,#y#)"); */
          visible++;
        }else
        // down
        if( y == gridH || trees.slice(y+1,gridH-y).map( (t,i) => return t[x] ).max() < t ) {
          /* print.line("(#x#,#y#)"); */
          visible++;
        }
      }
    }
    print.line(visible); 
	}

  function setTreeGrid(array rows){
    var treeGrid = []
    for(var i = 1; i <= rows.len(); i++){
      var columns = rows[i].listToArray("");
      treeGrid.push(columns);
    }
    return treeGrid;
  }

  function tree(numeric x, numeric y){
    return variables.trees[y][x];
  }

	function part2() {
    var answer = 0;
    var directions = [[0,1],[0,-1],[1,0],[-1,0]]; // up, down, right, left
    // traverse the tree grid == left to right, top to bottom
    for(var x = 1; x <= gridW; x++){
      for(var y = 1; y <= gridH; y++){
        var t = tree(x,y);
        var score = 1; // will be multiplied 
        // scan the 4 directions
        for(d in directions){
          var dx = d[1] + x;
          var dy = d[2] + y;
          var dist = 0;
          // while tree is within the 
          while (dx >= 1 && dx <= gridW && dy >= 1 && dy <= gridH && tree(dx,dy) < t){
            dist++;
            dx += d[1];
            dy += d[2];
            if( dx >= 1 && dx <= gridW && dy >= 1 && dy <= gridH && tree(dx,dy) >= t ){
              dist++;
            }
          }
          score *= dist;
        }
        answer = max(score,answer);
      }
    }
    print.line(answer);
	}

}
    
