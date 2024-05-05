outlets = 3;

setoutletassist(0, "messages to glottis");
setoutletassist(1, "messages to tract");
setoutletassist(2, "current [consonant, position, direction]");

var dir = "f";
var cons;

var phonemes = JSON.parse(new Dict("phonemes").stringify());
var {vowels, consonants, wheels, triangles} = phonemes;
	


function dictionary(e) {
	
	const hand = new Dict(e);
					
	var vX = Math.min(1, Math.max(-1, hand.get("x")/100));
	var vY = Math.min(1, Math.max(-1, hand.get("z")/-100));
		
	const cPos = 1 - hand.get("val");
		
	if (cPos % 1 == 0) {
		dir = cPos ? "f" : "b";
		const wI = Math.round(Math.min(Math.max(0, hand.get("r")/.4 + 1), 2));
		const cWheel = wheels[wI];
		cons = cWheel[[2, 0, 1, 3, 4][hand.get("num")]];
	}
	
	if (!cons) return;
	
	
	const cData = consonants[cons];
	
	const frames = cData[dir] || cData.f;
	const frame = frames[Math.round(cPos * (frames.length-1))]
	
	if (cData.vowel_adj) {
		vX = map(frame.a, 0, 1, vX, cData.vowel_adj.x, true);
        vY = map(frame.a, 0, 1, vY, cData.vowel_adj.y, true);
	}
		
	const vDiameters = getVowelDiameters(vX,vY);
	const cDiameters = frame.d;
	
	const totalDiameters = cDiameters.map(function(v, i) {
		return v == null ? vDiameters[i] : Math.min(v, vDiameters[i])
	})
		
	new Buffer("targetDiameter").poke(0, 0, totalDiameters);
			
	outlet(0, "intensity", frame.i);
	outlet(1, "velumTarget", frame.v);
	outlet(0, "tensenessMult", frame.t);
	
	outlet(2, cons, cPos, dir);
}

function getVowelDiameters(x, y) {
	
	var ti;
	

    for (var i = 0; i < triangles.length; i++) {
        var t = triangles[i];
        const [[x1, y1], [x2, y2], [x3, y3]] = t.map(function(v) {
            return [vowels[v].x, vowels[v].y];
        });

        // Compute the barycentric coordinates
        const denominator = (y2 - y3) * (x1 - x3) + (x3 - x2) * (y1 - y3);
        const a = ((y2 - y3) * (x - x3) + (x3 - x2) * (y - y3)) / denominator;
        const b = ((y3 - y1) * (x - x3) + (x1 - x3) * (y - y3)) / denominator;
        const c = 1 - a - b; 

        // Check if the point is inside the triangle
        if (a >= 0 && b >= 0 && c >= 0) {
            ti = i;
            break;
        }
    }

	const triangle = triangles[ti].map(function(v) {
		return vowels[v];
	});
	
	const [p1, p2, p3] = triangle.map(function(p) {
		return [p.x, p.y];
	});
	
	 const lambda1 =
        ((p2[1] - p3[1]) * (x - p3[0]) +
            (p3[0] - p2[0]) * (y - p3[1])) /
        ((p2[1] - p3[1]) * (p1[0] - p3[0]) + (p3[0] - p2[0]) * (p1[1] - p3[1]));
    const lambda2 =
        ((p3[1] - p1[1]) * (x - p3[0]) +
            (p1[0] - p3[0]) * (y - p3[1])) /
        ((p3[1] - p1[1]) * (p2[0] - p3[0]) + (p1[0] - p3[0]) * (p2[1] - p3[1]));
    const lambda3 = 1 - lambda1 - lambda2;

	const tIndex =
        lambda1 * triangle[0].index + 
		lambda2 * triangle[1].index + 
		lambda3 * triangle[2].index;
    const tDiameter =
        lambda1 * triangle[0].diameter +
        lambda2 * triangle[1].diameter +
        lambda3 * triangle[2].diameter;	

	const n = 44;
	const bladeStart = 10;
    const tipStart = 32;
    const lipStart = 39;

	const restDiameter = [];
	
    for (var i = 0; i < n; i++) {
        var diameter = 0;
        if (i < 7 * n / 44-0.5) diameter = 0.6;
        else if (i < 12 * n / 44) diameter = 1.1;
        else diameter = 1.5;
        restDiameter[i] = diameter;
    }

    for (var i = bladeStart; i < lipStart; i++) {
        var t = 1.1 * Math.PI*(tIndex - i)/(tipStart - bladeStart);
        var fixedTongueDiameter = 2+(tDiameter-2)/1.5;
        var curve = (1.5 - fixedTongueDiameter + 1.7) * Math.cos(t);
        if (i == bladeStart-2 || i == lipStart-1) curve *= 0.8;
        if (i == bladeStart || i == lipStart-2) curve *= 0.94;               
        restDiameter[i] = 1.5 - curve;
    }

	for (var i = 37; i < 44; i++) {
		var lipDiametersAtI = triangle.map(function(v) {
			
        	if (v.constriction) {
				return v.constriction[i];
            } else return restDiameter[i];
       	});

		var compositeLipDiameterAtI =
			lambda1 * lipDiametersAtI[0] +
			lambda2 * lipDiametersAtI[1] +
    		lambda3 * lipDiametersAtI[2];

		restDiameter[i] = compositeLipDiameterAtI;
	}
	
	
	return restDiameter;
	
}

function constrain(n, low, high) {
    return Math.max(Math.min(n, high), low);
};
  
function map(n, start1, stop1, start2, stop2, withinBounds) {
    const newval = (n - start1) / (stop1 - start1) * (stop2 - start2) + start2;
    if (!withinBounds) {
        return newval;
    }
    if (start2 < stop2) {
        return constrain(newval, start2, stop2);
    } else {
        return constrain(newval, stop2, start2);
    }
};