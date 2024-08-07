inlets = 1;
outlets = 3;

setinletassist(0, 'Tract param messages');
setoutletassist(0, "Tract param messages");
setoutletassist(1, "Tongue index + diameter when changed");
setoutletassist(2, "Constriction index + diameter when changed");

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var tractN = 44;
var bladeStart = 10;
var tipStart = 32;
var lipStart = 39;
var noseLength = 28;
var noseStart = tractN - noseLength + 1;

var noseDiameter = new Float64Array(28);
var velum = 0.01;

var widthOrig = 520;
var heightOrig = 520;

var cnvWidth = box.rect[2] - box.rect[0];
var cnvHeight = box.rect[3] - box.rect[1];

var cnvAreaScale = Math.sqrt(Math.pow(cnvWidth, 2) + 
	Math.pow(cnvHeight, 2)) / Math.sqrt(Math.pow(600, 2) + 
	Math.pow(600, 2));

var angleOffset = -0.24;
var angleScale = 0.64;
var radius = 298;
var UIScale = 60;
var originX = 300;
var originY = 449;
var noseOffset = 0.8;
var innerTongueControlRadius = 2.05;
var outerTongueControlRadius = 3.5;

var fillColor = [255/255, 192/255, 203/255, 1];
var lineColor = [192/255, 112/255, 198/255, 1]
var orchidColor = [218/255, 112/255, 214/255, 1];
var palePinkColor = [255/255, 238/255, 245/255, 1];

var tongueTouch = false;

var tIndex = 12.9;
var tDiameter = 2.43;
var cIndex = 0;
var cDiameter = 5;
var lDiameter = 1.5;

var voiceTargets = jsarguments[1] ? jsarguments.slice(1) : [0];
	
var targetDiameter = new Float64Array(44);
getDiameters();

n(tractN);

function target() {
	voiceTargets = arguments;
	mgraphics.redraw();
}

getDiameters();

function getDiameters() {
			
	for (var i=0; i < tractN; i++) {
        var d = 0;
        if (i<7*tractN/44-0.5) d = 0.6;
        else if (i<12*this.n/44) d = 1.1;
        else d = 1.5;
		targetDiameter[i] = d;
    }

	//inscribe tongue position
	
	for (var i = bladeStart; i < lipStart; i++) {
        var t = 1.1 * Math.PI * (tIndex - i)/(tipStart - bladeStart);
        var fixedTongueDiameter = 2+(tDiameter-2)/1.5;
        var curve = (1.5-fixedTongueDiameter + 1.7)*Math.cos(t);
        if (i == bladeStart-2 || i == lipStart-1) curve *= 0.8;
        if (i == bladeStart || i == lipStart-2) curve *= 0.94;               
		targetDiameter[i] = 1.5 - curve;
    }

	//inscribe lip constriction
	var dia = lDiameter;
	var ind = tractN - 2;
	
	if (dia<0) dia = 0;         

	var width = 5/44 * tractN;

	if (ind >= 2 && ind < tractN && dia < 3) {
        var intIndex = Math.round(ind);
        for (var i = -Math.ceil(width)-1; i<width+1; i++) {   
            if (intIndex+i < 0 || intIndex+i >= tractN) continue;
            var relpos = (intIndex+i) - ind;
            relpos = Math.abs(relpos)-0.5;
			var shrink;
			if (relpos <= 0) shrink = 0;
			else if (relpos > width) shrink = 1;
			else shrink = 0.5*(1-Math.cos(Math.PI * relpos / width));
			if (dia < targetDiameter[intIndex + i]) {
				targetDiameter[intIndex + i] = dia + (targetDiameter[intIndex + i]-dia)*shrink;
			}
		}
	}
	
	//inscribe constriction
	if (cDiameter < -0.85 - 0.8) return;
	
	var dia = cDiameter - 0.3;
	var ind = cIndex - 1;
	
	if (dia<0) dia = 0;         

	var width = 2;
	if (ind < 25) width = 10;
	else if (ind >= tipStart) width= 5;
    else width = 10 - 5*(ind-25)/(tipStart-25);

	if (ind >= 2 && ind < tractN && dia < 3) {
        var intIndex = Math.round(ind);
        for (var i = -Math.ceil(width)-1; i<width+1; i++) {   
            if (intIndex+i < 0 || intIndex+i >= tractN) continue;
            var relpos = (intIndex+i) - ind;
            relpos = Math.abs(relpos)-0.5;
			var shrink;
			if (relpos <= 0) shrink = 0;
			else if (relpos > width) shrink = 1;
			else shrink = 0.5*(1-Math.cos(Math.PI * relpos / width));
			if (dia < targetDiameter[intIndex + i]) {
				targetDiameter[intIndex + i] = dia + (targetDiameter[intIndex+i]-dia)*shrink;
			}
		}
	}
	
	mgraphics.redraw();
}



//1231 (TractUI.draw())
function paint() {
	with (mgraphics) {
						
		select_font_face("Arial Bold");
		
		move_to(3, 12);
		text_path("(" +
			Object.keys(voiceTargets)
				.map(function(i) {return voiceTargets[i] || "all"})
				.join(",") + ")");
		fill();

		drawTongueControl();

		//oral cavity background
		set_source_rgba(fillColor);
		tMoveTo(1, 0);
		for (var i = 0; i < tractN; i++) {
			tLineTo(i, targetDiameter[i]);
		}
		for (var i = tractN - 1; i >= 2; i--) 
			tLineTo(i, 0);  
		close_path();
		fill();
				
		set_source_rgba(fillColor);
        tMoveTo(noseStart, - noseOffset);
        for (var i = 1; i < noseLength; i++) 
			tLineTo(i+noseStart, -noseOffset - noseDiameter[i] * 0.9);
		for (var i = noseLength - 1; i >= 1; i--) 
			tLineTo(i+noseStart, -noseOffset);  
		close_path();
		fill();
		
		//velum
		//var velum = noseDiameter[0];
        var velumAngle = velum * 4;

		set_source_rgba(fillColor);
		tMoveTo(noseStart-2, 0);
		tLineTo(noseStart, -noseOffset);
        tLineTo(noseStart + velumAngle, -noseOffset);
        tLineTo(noseStart + velumAngle - 2, 0);
		close_path();
		stroke_preserve();
		fill();
		
		drawAmplitudes(noseStart);
		
		//lines
		set_line_width(5 * cnvAreaScale);
		set_source_rgba(lineColor);
		tMoveTo(1, targetDiameter[i]);
		for (var i = 2; i < tractN; i++) 
			tLineTo(i, targetDiameter[i]);
		tMoveTo(1, 0);
		for (var i = 2; i <= noseStart - 2; i++) 
			tLineTo(i, 0);
	    tMoveTo(noseStart + velumAngle - 2, 0);
	    for (var i = noseStart + Math.ceil(velumAngle) - 2; i < tractN; i++) 
			tLineTo(i, 0);   
		stroke();
		
		tMoveTo(noseStart, -noseOffset);
        for (var i = 1; i < noseLength; i++) 
			tLineTo(i + noseStart, -noseOffset - noseDiameter[i] * 0.9);
		tMoveTo(noseStart + velumAngle, -noseOffset);
        for (var i = Math.ceil(velumAngle); i < noseLength; i++) 
			tLineTo(i + noseStart, -noseOffset);
		stroke();
		
		tMoveTo(noseStart - 2, 0);
        tLineTo(noseStart, -noseOffset);
        tMoveTo(noseStart + velumAngle - 2, 0);
        tLineTo(noseStart + velumAngle, -noseOffset);  

		stroke();
		
		set_source_rgba(1,1,1,1);
		set_line_width(1 * cnvAreaScale);
        set_font_size(20 * cnvAreaScale);
        drawText(tractN * 0.10, 0.425, "throat");         
        drawText(tractN * 0.71, -1.8, "nasal");
        drawText(tractN * 0.71, -1.3, "cavity");
        set_font_size(22 * cnvAreaScale);        
        drawText(tractN * 0.6, 0.9, "oral");    
        drawText(tractN * 0.7, 0.9, "cavity"); 
	}
}

//1465 (TractUI.drawTongueControl())
function drawTongueControl() {
	with (mgraphics) {
		
		var tongueLowerIndexBound = bladeStart + 2;
		var tongueUpperIndexBound = tipStart - 3;
		var tongueIndexCentre = (tongueLowerIndexBound + tongueUpperIndexBound) / 2;

		set_source_rgba(palePinkColor);
		set_line_cap("butt");
		set_line_join("round");
		set_line_width(45 * cnvAreaScale);
		
		tMoveTo(tongueLowerIndexBound, innerTongueControlRadius);
		for (var i = tongueLowerIndexBound + 1; i <= tongueUpperIndexBound; i++) 
			tLineTo(i, innerTongueControlRadius);
		tLineTo(tongueIndexCentre, outerTongueControlRadius);

		close_path();
		stroke_preserve();
		fill();
		
		var a = innerTongueControlRadius;
		var c = outerTongueControlRadius;
		var b = (a+c) / 2;
		var r = 3;
		
		set_source_rgba(orchidColor);
		
		//tongue control dots, but locations are incorrect?
		/*
		drawCircle(tongueIndexCentre, a, r);
        drawCircle(tongueIndexCentre - 4.25, a, r);
        drawCircle(tongueIndexCentre - 8.5, a, r);
        drawCircle(tongueIndexCentre + 4.25, a, r);
        drawCircle(tongueIndexCentre + 8.5, a, r);
        drawCircle(tongueIndexCentre - 6.1, b, r);    
        drawCircle(tongueIndexCentre + 6.1, b, r);  
        drawCircle(tongueIndexCentre, b, r);  
        drawCircle(tongueIndexCentre, c, r);
		*/
		
		//circle for tongue position
		var angle = angleOffset + tIndex * angleScale * Math.PI / (lipStart - 1);
		var r = radius - UIScale * tDiameter;
		var x = (originX - r * Math.cos(angle)) / widthOrig * cnvWidth;
        var y = (originY - r * Math.sin(angle)) / heightOrig * cnvHeight;

		set_line_width(4 * cnvAreaScale);
		arc(x, y, 18 * cnvAreaScale, 0, Math.PI*2);
		stroke();
		
		set_font_size(17 * cnvAreaScale);
		drawText(tractN * 0.18, 3, "tongue control", true);   

	}
}

function drawCircle(i, d, radius) {
	var angle = angleOffset + i * angleScale * Math.PI / (lipStart - 1);
    var r = radius - UIScale * d; 
    mgraphics.arc(
		(originX - r * Math.cos(angle)) / widthOrig * cnvWidth, 
		(originY - r * Math.sin(angle)) / heightOrig * cnvHeight, 
		radius, 0, 2*Math.PI
	);
	mgraphics.fill();
}

function drawText(index, dia, text, straight) {
	with (mgraphics) {
		var angle = angleOffset + index * angleScale * Math.PI / (lipStart - 1);
		
    	var r = radius - UIScale * dia; 

        save();
		
		tx = (originX-r*Math.cos(angle))/widthOrig * cnvWidth;
		ty = (originY-r*Math.sin(angle))/heightOrig * cnvHeight + 2;

        move_to(tx,ty);
		if (!straight) rotate(angle - Math.PI/2);
		rel_move_to(-text_measure(text)[0]/2, 0);
		
		text_path(text);
		fill();

        restore();
	}
	
}

//1441 (TractUI.drawAmplitudes())
function drawAmplitudes(noseStart) {
	with (mgraphics) {
		set_source_rgba(orchidColor);
		
		set_line_width(Math.max(1, cnvAreaScale));
		
		for (var i = 2; i < tractN - 1; i++) {
            tMoveTo(i, 0);
            tLineTo(i, targetDiameter[i]);
        }

		for (var i = 2; i < noseLength; i++) {
			tMoveTo(i+noseStart, -noseOffset); 
			tLineTo(i+noseStart, -noseOffset - noseDiameter[i] * 0.9);
		}
		stroke_with_alpha(0.3);
	}
}

//1167 (TractUI.moveTo())
function tMoveTo(i, d) {
	
	var angle = angleOffset + i * angleScale * Math.PI / (lipStart - 1);
	var r = radius - UIScale * d
	mgraphics.move_to(
		(originX - r*Math.cos(angle)) / widthOrig * cnvWidth, 
		(originY - r*Math.sin(angle)) / heightOrig * cnvHeight
	);
}

//1177 (TractUI.lineTo())
function tLineTo(i, d) {
	
	var angle = angleOffset + i * angleScale * Math.PI / (lipStart - 1);
	var r = radius - UIScale * d
	mgraphics.line_to(
		(originX - r*Math.cos(angle)) / widthOrig * cnvWidth, 
		(originY - r*Math.sin(angle)) / heightOrig * cnvHeight
	);
}

//1554 (TractUI.handleTouches())
function onclick(x,y) {
	
	//outlet(0, "noiseIntensity", 1);
	
	x2 = x/cnvWidth * widthOrig;
	y2 = y/cnvHeight * heightOrig;
	
	var tongueLowerIndexBound = bladeStart + 2;
	var tongueUpperIndexBound = tipStart - 3;
	var index = getIndex(x2, y2);
	var dia = getDiameter(x2, y2);
	
	tongueTouch = 
		index >= tongueLowerIndexBound - 4 && index <= tongueUpperIndexBound + 4 && 
		dia >= innerTongueControlRadius - 0.5 && dia <= outerTongueControlRadius + 0.5;
	
	ondrag(x,y,1);
}

function ondrag(x,y,button) {
		
	//if (!button) outlet(0, "noiseIntensity", 0);
		
	x = x/cnvWidth * widthOrig;
	y = y/cnvHeight * heightOrig;
	
	var index = getIndex(x,y);
	var dia = getDiameter(x,y);
	
	if (button == 0) {
		tongueTouch = false;
		index = 0;
		dia = 0;
	}
	
	handleTouch(index, dia, button);
}

function handleTouch(index, dia, button) {
		
	cIndex = index;
	cDiameter = dia;
		
	var tongueLowerIndexBound = bladeStart + 2;
	var tongueUpperIndexBound = tipStart - 3;
	var tongueIndexCentre = (tongueLowerIndexBound + tongueUpperIndexBound) / 2;
	
	//1577
	if (tongueTouch) {
		var fromPoint = (outerTongueControlRadius - dia) / 
			(outerTongueControlRadius - innerTongueControlRadius);
		fromPoint = Math.max(0, Math.min(fromPoint, 1));
		fromPoint = Math.pow(fromPoint, 0.58) - 0.2*(fromPoint*fromPoint-fromPoint);
		tDiameter = Math.max(innerTongueControlRadius, Math.min(dia, outerTongueControlRadius));
		var out = fromPoint * 0.5 * (tongueUpperIndexBound-tongueLowerIndexBound);
		
		tIndex = Math.max(tongueIndexCentre-out, Math.min(index, tongueIndexCentre+out));
		
		outlet(1, [
			Number(tIndex.toFixed(2)),
			Number(tDiameter.toFixed(2))
		]);
	}
	
	getDiameters();

	//1596
	velum = 0.01;
	
	if (index > noseStart && dia < -noseOffset) velum = 0.4;	
	
	outlet(2, [
		Number(index.toFixed(2)),
		Number(dia.toFixed(2))
	]);
	
	for (var i in voiceTargets) {
		outlet(0, "target", voiceTargets[i]);
		outlet(0, "velumTarget", velum);
		outlet(0, "constrictionIndex", index);
		outlet(0, "constrictionDiameter", dia);
		outlet(0, "tongueIndex", tIndex);
		outlet(0, "tongueDiameter", tDiameter);
		outlet(0, "lipDiameter", lDiameter);
	}
}

function getIndex(x,y) {
	var xx = x - originX; 
	var yy = y - originY;
	var angle = Math.atan2(yy,xx);
	while (angle> 0) angle -= 2*Math.PI;
	return (Math.PI + angle - angleOffset)*lipStart / (angleScale*Math.PI);
}

function getDiameter(x,y) {
	var xx = x-originX; 
	var yy = y-originY;
    return (radius-Math.sqrt(xx*xx + yy*yy)) / UIScale;
}

function tongueIndex(val) {
	tIndex = val / 44 * tractN;
	for (var i in voiceTargets) {
		outlet(0, "target", voiceTargets[i]);
		outlet(0, "tongueIndex", tIndex);
	}
	getDiameters();
}

function tongueDiameter(val) {
	tDiameter = val;
	for (var i in voiceTargets) {
		outlet(0, "target", voiceTargets[i]);
		outlet(0, "tongueDiameter", tDiameter);
	}
	getDiameters();
}

function constrictionIndex(val) {
	cIndex = val/44 * tractN;
	handleTouch(cIndex, cDiameter, 1);
}

function constrictionDiameter(val) {
	cDiameter = val;
	handleTouch(cIndex, cDiameter, 1);
}

function lipDiameter(l) {
	lDiameter = l;
	handleTouch(cIndex, cDiameter, 1);
}

function velumTarget(v) {
	velum = v;
	for (var i in voiceTargets) {
		outlet(0, "target", voiceTargets[i]);
		outlet(0, "velumTarget", v);
	}
}	

function noiseIntensity(ni) {
	for (var i in voiceTargets) {
		outlet(0, "target", voiceTargets[i]);
		outlet(0, "noiseIntensity", ni);
	}
}


function n(newN) {
	tractN = newN;
 	bladeStart = Math.floor(10 * tractN/44);
 	tipStart = Math.floor(32 * tractN/44);
 	lipStart = Math.floor(39 * tractN/44);
 	noseLength = Math.floor(28 * tractN/44);
	noseStart = tractN - noseLength + 1;
	
	noseDiameter = new Float64Array(noseLength);
	targetDiameter = new Float64Array(newN);

	for (var i=0; i < noseLength; i++) {
		var dia;
    	var d = 2 * (i/noseLength);
    	if (d<1) dia = 0.4+1.6*d;
    	else dia = 0.5+1.5*(2-d);
    	dia = Math.min(dia, 1.9);
    	noseDiameter[i] = dia;
	}   
	
	getDiameters();
	
	for (var i in voiceTargets) {
		outlet(0, "target", voiceTargets[i]);
		outlet(0, "n", newN);
  	}
}

function onresize() {
		
	cnvWidth = box.rect[2] - box.rect[0];	
	cnvHeight = box.rect[3] - box.rect[1];

	box.size(cnvWidth, cnvWidth);
	cnvAreaScale = Math.sqrt(Math.pow(cnvWidth, 2) + Math.pow(cnvHeight, 2)) / Math.sqrt(Math.pow(600, 2) + Math.pow(600, 2));
}