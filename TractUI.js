inlets = 0;
outlets = 2;
setoutletassist(0, "Tongue index/diameter");
setoutletassist(1, "Constriction index/diameter");

mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var tractParams = new Dict("TractParams");

var diameter = new Buffer("diameter");
var targetDiameter = new Buffer("targetDiameter");
var restDiameter = new Buffer("restDiameter");
var noseDiameter = new Buffer("noseDiameter");

var widthOrig = 490;
var heightOrig = 520;

var cnvWidth = box.rect[2] - box.rect[0];
var cnvHeight = box.rect[3] - box.rect[1];

var cnvAreaScale = Math.sqrt(Math.pow(cnvWidth, 2) + Math.pow(cnvHeight, 2)) / Math.sqrt(Math.pow(600, 2) + Math.pow(600, 2));

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
var cIndex = -1;
var cDiameter = -1;

var drawTask = new Task(function() {mgraphics.redraw()});
drawTask.interval = 1000/60;
drawTask.repeat();

//1231 (TractUI.draw())
function paint() {
	with (mgraphics) {
		mgraphics.select_font_face("Arial bold");

		var n = tractParams.get("n");
		drawTongueControl();

		//oral cavity background
		set_source_rgba(fillColor);
		tMoveTo(1, 0);
		for (var i = 0; i < n; i++) {
			tLineTo(i, diameter.peek(0, i));
		}
		for (var i = n - 1; i >= 2; i--) 
			tLineTo(i, 0);  
		close_path();
		fill();
		
		//nose
		var noseStart = tractParams.get("noseStart");
		var noseLength = tractParams.get("noseLength");
		
		set_source_rgba(fillColor);
        tMoveTo(noseStart, - noseOffset);
        for (var i = 1; i < noseLength; i++) 
			tLineTo(i+noseStart, -noseOffset - noseDiameter.peek(0, i) * 0.9);
		for (var i = noseLength - 1; i >= 1; i--) 
			tLineTo(i+noseStart, -noseOffset);  
		close_path();
		fill();
		
		//velum
		var velum = noseDiameter.peek(0, 0);
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
		tMoveTo(1, diameter.peek(0, 0));
		for (var i = 2; i < n; i++) 
			tLineTo(i, diameter.peek(0, i));
		tMoveTo(1, 0);
		for (var i = 2; i <= noseStart - 2; i++) 
			tLineTo(i, 0);
	    tMoveTo(noseStart + velumAngle - 2, 0);
	    for (var i = noseStart + Math.ceil(velumAngle) - 2; i < n; i++) 
			tLineTo(i, 0);   
		stroke();
		
		tMoveTo(noseStart, -noseOffset);
        for (var i = 1; i < noseLength; i++) 
			tLineTo(i + noseStart, -noseOffset - noseDiameter.peek(0, i) * 0.9);
		tMoveTo(noseStart + velumAngle, -noseOffset);
        for (var i = Math.ceil(velumAngle); i < noseLength; i++) 
			tLineTo(i + noseStart, -noseOffset);
		stroke();
		
		tMoveTo(noseStart - 2, 0);
        tLineTo(noseStart, -noseOffset);
        tMoveTo(noseStart + velumAngle - 2, 0);
        tLineTo(noseStart + velumAngle, -noseOffset);  

		stroke();
		
		// white text
		set_source_rgba(1,1,1,1);

		set_line_width(1 * cnvAreaScale);
        set_font_size(20 * cnvAreaScale);
        drawText(n * 0.10, 0.425, "throat");         
        drawText(n * 0.71, -1.8, "nasal");
        drawText(n * 0.71, -1.3, "cavity");
        set_font_size(22 * cnvAreaScale);        
        drawText(n * 0.6, 0.9, "oral");    
        drawText(n * 0.7, 0.9, "cavity"); 
	}
}

//1465 (TractUI.drawTongueControl())
function drawTongueControl() {
	with (mgraphics) {
		
		var tongueLowerIndexBound = tractParams.get("bladeStart") + 2;
		var tongueUpperIndexBound = tractParams.get("tipStart") - 3;
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
		var angle = angleOffset + tractParams.get("tongueIndex") * angleScale * Math.PI / (tractParams.get("lipStart") - 1);
		var r = radius - UIScale * tractParams.get("tongueDiameter");
		var x = (originX - r * Math.cos(angle)) / widthOrig * cnvWidth;
        var y = (originY - r * Math.sin(angle)) / heightOrig * cnvHeight;

		set_line_width(4 * cnvAreaScale);
		arc(x, y, 18 * cnvAreaScale, 0, Math.PI*2);
		stroke();
		
		set_font_size(17 * cnvAreaScale);
		drawText(tractParams.get("n") * 0.18, 3, "tongue control", true);   

	}
}

function drawCircle(i, d, radius) {
	var angle = angleOffset + i * angleScale * Math.PI / (tractParams.get("lipStart") - 1);
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
		var angle = angleOffset + index * angleScale * Math.PI / (tractParams.get("lipStart") - 1);
		
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
		
		for (var i = 2; i < tractParams.get("n") - 1; i++) {
            tMoveTo(i, 0);
            tLineTo(i, diameter.peek(0, i));
        }

		for (var i = 2; i < tractParams.get("noseLength"); i++) {
			tMoveTo(i+noseStart, -noseOffset); 
			tLineTo(i+noseStart, -noseOffset - noseDiameter.peek(0, i) * 0.9);
		}
		stroke_with_alpha(0.3);
	}
}

//1167 (TractUI.moveTo())
function tMoveTo(i, d) {
	const lipStart = tractParams.get("lipStart");
	
	var angle = angleOffset + i * angleScale * Math.PI / (lipStart - 1);
	var r = radius - UIScale * d
	mgraphics.move_to(
		(originX - r*Math.cos(angle)) / widthOrig * cnvWidth, 
		(originY - r*Math.sin(angle)) / heightOrig * cnvHeight
	);
}

//1177 (TractUI.lineTo())
function tLineTo(i, d) {
	const lipStart = tractParams.get("lipStart");
	
	var angle = angleOffset + i * angleScale * Math.PI / (lipStart - 1);
	var r = radius - UIScale * d
	mgraphics.line_to(
		(originX - r*Math.cos(angle)) / widthOrig * cnvWidth, 
		(originY - r*Math.sin(angle)) / heightOrig * cnvHeight
	);
}

//1554 (TractUI.handleTouches())
function onclick(x,y) {
	x2 = x/cnvWidth * widthOrig;
	y2 = y/cnvHeight * heightOrig;
	
	var tongueLowerIndexBound = tractParams.get("bladeStart") + 2;
	var tongueUpperIndexBound = tractParams.get("tipStart") - 3;
	var index = getIndex(x2, y2);
	var diameter = getDiameter(x2, y2);
	
	tongueTouch = 
		index >= tongueLowerIndexBound - 4 && index <= tongueUpperIndexBound + 4 && 
		diameter >= innerTongueControlRadius - 0.5 && diameter <= outerTongueControlRadius + 0.5;
		
	ondrag(x,y,1);
}

function ondrag(x,y,button) {
			
	if (button == 0) {
		tongueTouch = false;
		outlet(1, [-1,-1]);
	}
	
	x = x/cnvWidth * widthOrig;
	y = y/cnvHeight * heightOrig;
	
	var index = getIndex(x,y);
	var dia = getDiameter(x,y);
	
	handleTouch(index, dia, button);
}

function handleTouch(index, dia, button) {
	
	if (index == -1 || dia == -1) {
		setRestDiameter();
		return;
	};
	
	var tongueLowerIndexBound = tractParams.get("bladeStart") + 2;
	var tongueUpperIndexBound = tractParams.get("tipStart") - 3;
	var tongueIndexCentre = (tongueLowerIndexBound + tongueUpperIndexBound) / 2;
	var tipStart = tractParams.get("tipStart");
	
	//1577
	if (tongueTouch) {
		var fromPoint = (outerTongueControlRadius - dia) / 
			(outerTongueControlRadius - innerTongueControlRadius);
		fromPoint = Math.max(0, Math.min(fromPoint, 1));
		fromPoint = Math.pow(fromPoint, 0.58) - 0.2*(fromPoint*fromPoint-fromPoint);
		tractParams.set("tongueDiameter", 
			Math.max(innerTongueControlRadius, Math.min(dia, outerTongueControlRadius)));
		var out = fromPoint * 0.5 * (tongueUpperIndexBound-tongueLowerIndexBound);
		tractParams.set("tongueIndex", Math.max(tongueIndexCentre-out, Math.min(index, tongueIndexCentre+out)));
	}
	
	setRestDiameter();
	
	if (button) outlet(1, [
		Number(index.toFixed(2)),
		Number(dia.toFixed(2))
	]);
	else return;
	
	//1596
	tractParams.set("velumTarget", 0.01);
	if (index > tractParams.get("noseStart") && dia < -noseOffset)
		tractParams.set("velumTarget", 0.4);
		
	if (dia < -0.85-noseOffset) return;
	dia -= 0.3;
	index -= 1;
	
	if (dia < 0) dia = 0;
	var width = 2;
    if (index < 25) width = 10;
    else if (index >= tipStart) width= 5;
    else width = 10 - 5*(index-25) / (tipStart-25);

	if (index >= 2 && index < tractParams.get("n") && dia < 3) {
		var intIndex = Math.round(index);
		for (var i = -Math.ceil(width) - 1; i < width + 1; i++) {
			if (intIndex+i < 0 || intIndex+i >= tractParams.get("n")) continue;
			var relpos = (intIndex+i) - index;
			relpos = Math.abs(relpos) - 0.5;
			var shrink;
            if (relpos <= 0) shrink = 0;
            else if (relpos > width) shrink = 1;
            else shrink = 0.5*(1 - Math.cos(Math.PI * relpos / width));
			if (dia < targetDiameter.peek(0, intIndex + i))
				targetDiameter.poke(0, intIndex+i, dia + (targetDiameter.peek(0, intIndex+i) - dia) * shrink);
		}
	}
}

function setRestDiameter() {
	
	var bladeStart = tractParams.get("bladeStart");
	var lipStart = tractParams.get("lipStart");
	var tipStart = tractParams.get("tipStart");
	
	for (var i = bladeStart; i < lipStart; i++) { 
        var t = 1.1 * Math.PI*(tractParams.get("tongueIndex") - i)/(tipStart - bladeStart);
        var fixedTongueDiameter = 2+(tractParams.get("tongueDiameter")-2)/1.5;
        var curve = (1.5-fixedTongueDiameter+1.7)*Math.cos(t);
        if (i == bladeStart-2 || i == lipStart-1) curve *= 0.8;
        if (i == bladeStart || i == lipStart-2) curve *= 0.94;               
        restDiameter.poke(0, i, 1.5 - curve);
    }
	targetDiameter.poke(0, 0, restDiameter.peek(0, 0, 44));
	
	outlet(0, [
		Number(tractParams.get("tongueIndex").toFixed(2)), 
		Number(tractParams.get("tongueDiameter").toFixed(2))
	]);

}

function getIndex(x,y) {
	var xx = x - originX; 
	var yy = y - originY;
	var angle = Math.atan2(yy,xx);
	while (angle> 0) angle -= 2*Math.PI;
	return (Math.PI + angle - angleOffset)*tractParams.get("lipStart") / (angleScale*Math.PI);
}

function getDiameter(x,y) {
	var xx = x-originX; 
	var yy = y-originY;
    return (radius-Math.sqrt(xx*xx + yy*yy)) / UIScale;
}

function tongueIndex(val) {
	tractParams.set("tongueIndex", val);
	setRestDiameter();
}

function tongueDiameter(val) {
	tractParams.set("tongueDiameter", val);
	setRestDiameter();
}

function constrictionIndex(val) {
	cIndex = val;
	handleTouch(cIndex, cDiameter, 1);
}

function constrictionDiameter(val) {
	cDiameter = val;
	handleTouch(cIndex, cDiameter, 1);
}

function onresize() {
		
	cnvWidth = box.rect[2] - box.rect[0];
	
	box.size(cnvWidth, cnvWidth * (widthOrig/heightOrig));
	
	cnvHeight = box.rect[3] - box.rect[1];
	
	cnvAreaScale = Math.sqrt(Math.pow(cnvWidth, 2) + Math.pow(cnvHeight, 2)) / Math.sqrt(Math.pow(600, 2) + Math.pow(600, 2));
}