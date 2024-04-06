inlets = 1;
outlets = 3;

setinletassist(0, '(int) tract length "n"');
setoutletassist(0, "Messages for gen~");
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

var voice = 1;

function msg_int(newN) {
	tractN = newN;
 	bladeStart = Math.floor(10 * tractN/44);
 	tipStart = Math.floor(32 * tractN/44);
 	lipStart = Math.floor(39 * tractN/44);
 	noseLength = Math.floor(28 * tractN/44);
	noseStart = tractN - noseLength + 1;
	outlet(0, "target", voice);
	outlet(0, ["n"], newN);
}

//var diameter = new Buffer("diameter." + voice);
var targetDiameter = new Buffer("targetDiameter");
var noseDiameter = new Buffer("noseDiameter." + voice);
var diameter = new Buffer("diameter." + voice);

function target(voiceNum) {
	voice = voiceNum;
	diameter = new Buffer("diameter." + voice);
	noseDiameter = new Buffer("noseDiameter." + voice);
}

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
var tIndex = 12.9;
var tDiameter = 2.43;

var cIndex = 0;
var cDiameter = 5;

var drawTask = new Task(function() {mgraphics.redraw()});
drawTask.interval = 1000/60;
drawTask.repeat();

//1231 (TractUI.draw())
function paint() {
	with (mgraphics) {
		mgraphics.select_font_face("Arial bold");

		drawTongueControl();

		//oral cavity background
		set_source_rgba(fillColor);
		tMoveTo(1, 0);
		for (var i = 0; i < tractN; i++) {
			tLineTo(i, diameter.peek(0, i));
		}
		for (var i = tractN - 1; i >= 2; i--) 
			tLineTo(i, 0);  
		close_path();
		fill();
				
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
		for (var i = 2; i < tractN; i++) 
			tLineTo(i, diameter.peek(0, i));
		tMoveTo(1, 0);
		for (var i = 2; i <= noseStart - 2; i++) 
			tLineTo(i, 0);
	    tMoveTo(noseStart + velumAngle - 2, 0);
	    for (var i = noseStart + Math.ceil(velumAngle) - 2; i < tractN; i++) 
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
            tLineTo(i, diameter.peek(0, i));
        }

		for (var i = 2; i < noseLength; i++) {
			tMoveTo(i+noseStart, -noseOffset); 
			tLineTo(i+noseStart, -noseOffset - noseDiameter.peek(0, i) * 0.9);
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
	
	x = x/cnvWidth * widthOrig;
	y = y/cnvHeight * heightOrig;
	
	var index = getIndex(x,y);
	var dia = getDiameter(x,y);
	
	if (button == 0) {
		tongueTouch = false;
		index = 0;
	}
	
	handleTouch(index, dia, button);
}

function handleTouch(index, dia, button) {
	
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
	
	//1596
	var velumTarget = 0.01;
	
	if (index > noseStart && dia < -noseOffset) velumTarget = 0.4;	
	
	outlet(2, [
		Number(index.toFixed(2)),
		Number(dia.toFixed(2))
	]);
	
	outlet(0, "target", voice);
	outlet(0, "velumTarget", velumTarget);
	outlet(0, "constrictionIndex", index);
	outlet(0, "constrictionDiameter", dia);
	outlet(0, "tongueIndex", tIndex);
	outlet(0, "tongueDiameter", tDiameter);
	
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
	tIndex = val;
	outlet(0, "tongueIndex", tIndex);

}

function tongueDiameter(val) {
	tDiameter = val;
	outlet(0, "tongueDiameter", tDiameter);

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