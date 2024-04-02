var diameter = new PolyBuffer("diameter");
var targetDiameter = new PolyBuffer("targetDiameter");
var noseDiameter = new PolyBuffer("noseDiameter");

function init(num) {
			
	diameter.clear();
	targetDiameter.clear();
	noseDiameter.clear();
	
	for (var i = 0; i < 5; i++) {
		diameter.appendempty(0);
		diameter.send(i+1, "sizeinsamps", 44);
		
		targetDiameter.appendempty(0);
		targetDiameter.send(i+1, "sizeinsamps", 44);
		
		noseDiameter.appendempty(0);
		noseDiameter.send(i+1, "sizeinsamps", 28);
	}
	
}