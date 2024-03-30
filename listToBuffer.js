var targets = new Buffer("targetDiameter");

function list() {
	for (var i in arguments) {
		targets.poke(0, Number(i), Number(arguments[i]));
	}
}