component {

variables.util = new util();

function parse_coordinates(){
	var input = fileRead("./day5-input.txt").listToArray(chr(13) & chr(10));
	var lines = [];
	for( i in input ){
		c = i.listToArray(" ").deleteAt(2);
		line = [];
		line.append(c[1].listToArray(","));
		line.append(c[2].listToArray(","));
		lines.append(line);
	}
	return lines;
}
function createGrid(required numeric max_x, required numeric  max_y){
	//[
	//	[ 0,0,0,0,0,0 ],
	//	[ 0,0,0,0,0,0 ],
	//	[ 0,0,0,0,0,0 ]
	//]
	var grid = [];
	row = ArrayNew().set(1,max_x,0);
	for(var i = 1; i <= max_y; i++){
		grid.append(row);
	}
	return grid;
}
function part1() {
	var lines = parse_coordinates();
	// discard lines that are not horizontal or vertical
	var hv_lines = [];
	for( line in lines ){
		if( line[1][1] == line[2][1] or line[1][2] == line[2][2] ){
			hv_lines.append(line);
		}
	}
	// grid: find boundaries of the grid
	var max_x = 0;
	var max_y = 0;
	for( line in hv_lines ){
		max_x = [max_x, line[1][1], line[2][1]].max();
		max_y = [max_y, line[1][2], line[2][2]].max(); 
	}
	// grid: create a grid from 0,0 to max_x, max_y
	var grid = createGrid(max_x, max_y);
	var j = 1;
	for( li in lines ){
		if( j == 1 ){
			var start = end = li;
			// mark the vertical lines
			if( start[1][1] == end[2][1] ){
				bottom	= [ start[1][2], end[2][2] ].min();
				top		= [ start[1][2], end[2][2] ].max();
				var range = util.num_range(bottom,top);
				for( y in range ){
					print.line( grid[start[1][1]][y] );
					grid[start[1][1]][y] += 1;
					print.line( grid[start[1][1]][y] );
				}
			
			// mark the horizontal lines
			}else if( start[1][2] == end[2][2] ){
				left	= [ start[1][1], end[2][1] ].min();
				right	= [ start[1][1], end[2][1] ].max();
				var range = util.num_range(left,right);
				for( x in range ){
					grid[x][start[1][2]] += 1;
				}
			}
		}
		j += 1;
	}
	var danger_points = 0;
	for( row in grid ){
		for( p in row ){
			danger_points += (p >= 2);
		}
	}
	//print.line(danger_points);
}

function part2() {
	var lines = parse_coordinates();
	print.line(util.num_range());
}


}

