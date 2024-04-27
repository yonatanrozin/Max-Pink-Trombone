outlets = 1;

var noseDiameter = new PolyBuffer("noseDiameter");
var diameter = new PolyBuffer("diameter");

var voiceCount;

function voices(num) {
	
	if (num == voiceCount) return;
	voiceCount = num;
	
	outlet(0, "voices", num);
			
	noseDiameter.clear();
	diameter.clear();
	
	for (var i = 0; i < num; i++) {
		
		diameter.appendempty(0);
		diameter.send(i+1, "sizeinsamps", 44);
		
		noseDiameter.appendempty(0);
		noseDiameter.send(i+1, "sizeinsamps", 28);
	}
}