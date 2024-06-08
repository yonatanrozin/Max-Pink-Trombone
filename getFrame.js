outlets = 2;

setoutletassist(0, "messages for glottis");
setoutletassist(1, "messages for tract/jsui");
setoutletassist(2, "messages for jsui");

var r = new Dict("speech")
var recs = JSON.parse(r.stringify());


function frame(rec, pos) {
	const frames = recs[rec];
	if (!frames) return;
	
	const i = Math.floor(pos * (frames.length - 1));
	const f = frames[i];	
	
	post(JSON.stringify(f), "\n");
			
	outlet(0, "target", 0);
	outlet(0, "intensity", f.i);
	outlet(0, "tensenessMult", f.t);
	
	outlet(1, "constrictionIndex", f.ci);
	outlet(1, "constrictionDiameter", f.cd + 0.3);
	outlet(1, "tongueIndex", f.ti);
	outlet(1, "tongueDiameter", f.td);
}

function dictionary() {
	r = new Dict("speech")
	recs = JSON.parse(r.stringify());
}