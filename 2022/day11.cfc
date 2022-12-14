
component {

  variables.util = new Utils();

	function part1() {
    var monkeys = getMonkeyData();
    for(_ in util.range(20)){
      for( m in monkeys ){
        for(item in m.items){
          /* print.line(evaluate("#item# #m.operation# #m.factor#")).toConsole();  */
          var newItem = evaluate("#item# #m.operation# #m.factor#")
          if( newItem % m.denominator == 0 ){
            monkeys[m.truemonkey+1].items.push(newItem);
          }else{
            monkeys[m.falsemonkey+1].items.push(newItem);
          }
          m.inspections++;
        }
        m.items = [];
      }
    }
    var totals = monkeys.map( function(m){ return m.inspections }).sort("numeric");
    print.line(totals);
    print.line(totals[totals.len()] * totals[totals.len()-1]);
	}

  function getMonkeyData(){
    var data = fileRead('./day11-part1.txt').listToArray( chr(10) & chr(10), false, true);
    var monkey_data = [];
    for( d in data ){
      var txtcommands = d.listToArray(chr(10));
      var commands = {};
      for(ins in txtcommands){
        ins = ins.trim();
        if(ins.left(1) == "M"){
          commands.append({ "next": [] });
          commands.append({ "inspections": 0 });
        }
        if(ins.left(1) == "S"){
          commands.append({ "items": rematch("[0-9]+",ins).map((n) => int(n)) });
        }
        if(ins.left(1) == "O"){
          o = ins.listToArray(" ");
          oper = o[o.len()-1];
          f = o[o.len()];
          factor = (f == "old")? 2 : int(f);
          operation = (f == "old")? "^" : oper ;
          commands.append({ "operation": operation, "factor": factor });
        }
        if(ins.left(1) == "T"){
          commands.append({ "denominator": int(rematch("[0-9]+",ins)[1]) });
        }
        if(ins.left(4) == "If t"){
          commands.append({ "truemonkey": int(rematch("[0-9]+",ins)[1]) });
        }
        if(ins.left(4) == "If f"){
          commands.append({ "falsemonkey": int(rematch("[0-9]+",ins)[1]) });
        }
      }
      monkey_data.push(commands);
    }
    /* print.line(monkey_data.len()); */
    return monkey_data;
  }

	function part2() {
    var monkeys = getMonkeyData();
    var big_mod = 0;
    for(monkey in monkeys){
      big_mod *= m.denominator;
    }
    for(_ in util.range(20)){
      for( m in monkeys ){
        for(item in m.items){
          /* print.line(evaluate("#item# #m.operation# #m.factor#")).toConsole();  */
          var newItem = evaluate("#item# #m.operation# #m.factor#")
          newItem = newItem % big_mod;
          if( newItem % m.denominator == 0 ){
            monkeys[m.truemonkey+1].items.push(newItem);
          }else{
            monkeys[m.falsemonkey+1].items.push(newItem);
          }
          m.inspections++;
        }
        m.items = [];
      }
    }
    var totals = monkeys.map( function(m){ return m.inspections }).sort("numeric");
    print.line(totals);
    print.line(totals[totals.len()] * totals[totals.len()-1]); 
  }
}
    
