component {
	function num_range(required numeric from,required numeric to){
		return createObject("java", "org.apache.commons.lang.math.IntRange").init(from,to).toArray();
	}
}
