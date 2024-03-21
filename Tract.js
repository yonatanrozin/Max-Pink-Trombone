var TractParams = new Dict("TractParams");
var AudioSystem = new Dict("AudioSystem");

var diameter = new Buffer("diameter"); //
var targetDiameter = new Buffer("targetDiameter");
var restDiameter = new Buffer("restDiameter");
var L = new Buffer("L");
var R = new Buffer("R");
var reflection = new Buffer("reflection");
var newReflection = new Buffer("newReflection");
var junctionOutputR = new Buffer("junctionOutputR");
var junctionOutputL = new Buffer("junctionOutputL");
var A = new Buffer("A");

var noseR = new Buffer("noseR");
var noseL = new Buffer("noseL");
var noseJunctionOutputR = new Buffer("noseJunctionOutputR");
var noseJunctionOutputL = new Buffer("noseJunctionOutputL");
var noseReflection = new Buffer("noseReflection");
var noseDiameter = new Buffer("noseDiameter");
var noseA = new Buffer("noseA");

var reflectionLRN = new Buffer("reflectionLRN");
var newReflectionLRN = new Buffer("newReflectionLRN");


function init(n) {
		
		
	//879-884
	TractParams.set("n", n);
	TractParams.set("bladeStart", Math.floor(10 * n/44));
    TractParams.set("tipStart", Math.floor(32 * n/44));
    TractParams.set("lipStart", Math.floor(39 * n/44));  

	diameter.send("sizeinsamps", n);
	restDiameter.send("sizeinsamps", n);
	targetDiameter.send("sizeinsamps", n);
	
	//886-893
  	for (var i = 0; i < n; i++) {
        var d = 0;
        if (i < 7 * n / 44-0.5) d = 0.6;
        else if (i < 12 * n / 44) d = 1.1;
        else d = 1.5;

		diameter.poke(1, i, d);
		targetDiameter.poke(1, i, d);
		restDiameter.poke(1, i, d);
    }

	//894-900
	R.send("sizeinsamps", n);
	L.send("sizeinsamps", n);
	reflection.send("sizeinsamps", n+1);
	newReflection.send("sizeinsamps", n+1);
	junctionOutputR.send("sizeinsamps", n+1);
	junctionOutputL.send("sizeinsamps", n+1);
	A.send("sizeinsamps", n);

	var noseLength = Math.floor(28 * n/44);
	
	//903-911
	TractParams.set("noseLength", noseLength); 
	TractParams.set("noseStart", n - noseLength + 1); 
	
	noseR.send("sizeinsamps", noseLength);
	noseL.send("sizeinsamps", noseLength);
	noseJunctionOutputL.send("sizeinsamps", noseLength + 1);
	noseJunctionOutputR.send("sizeinsamps", noseLength + 1);
	noseReflection.send("sizeinsamps", noseLength + 1);
	noseDiameter.send("sizeinsamps", noseLength);
	noseA.send("sizeinsamps", noseLength);
	
	//913-921
	for (var i = 0; i < noseLength; i++) {
        var dia;
        var d = 2 * (i / noseLength);
        if (d < 1) dia = 0.4 + 1.6 * d;
		else dia = 0.5 + 1.5 * (2 - d);
        dia = Math.min(dia, 1.9);
        noseDiameter.poke(0, i, dia);
    }   

	//922
	reflectionLRN.send("fill", 0);
	newReflectionLRN.send("fill", 0);

	calculateReflections();	
	calculateNoseReflections();
	
	noseDiameter.poke(0, 0, TractParams.get("velumTarget"));	
}

//958
function calculateReflections() {
	
	var n = TractParams.get("n");	
				
    for (var i = 0; i < n; i++) 
    {
        //this.A[i] = this.diameter[i]*this.diameter[i]; //ignoring PI etc.
		A.poke(0, i, diameter.peek(0, i) * diameter.peek(0, i));
    }

    for (var i = 1; i < n; i++)
    {
        //this.reflection[i] = this.newReflection[i];
		reflection.poke(0, i, newReflection.peek(0, i));
		
        //if (this.A[i] == 0) this.newReflection[i] = 0.999; //to prevent some bad behaviour if 0
        //else this.newReflection[i] = (this.A[i-1]-this.A[i]) / (this.A[i-1]+this.A[i]); 
		if (A.peek(0, i) == 0) newReflection.poke(0, i, 0.999);
		else newReflection.poke(0, i, ( A.peek(0, i-1) - A.peek(0, i) ) / ( A.peek(0, i-1) + A.peek(0, i) ));
    }

	reflectionLRN.poke(0, 0, newReflectionLRN.peek(0, 0));
	reflectionLRN.poke(0, 1, newReflectionLRN.peek(0, 1));
	reflectionLRN.poke(0, 2, newReflectionLRN.peek(0, 2));
	
	var noseStart = TractParams.get("noseStart");

    //var sum = this.A[this.noseStart]+this.A[this.noseStart+1]+this.noseA[0];	
	var sum = A.peek(0, noseStart) + A.peek(0, noseStart + 1) + noseA.peek(0, 0);
	
    //this.newReflectionLeft = (2*this.A[this.noseStart]-sum)/sum;
	newReflectionLRN.poke(0, 0, (2 * A.peek(0, noseStart) - sum) / sum);

    //this.newReflectionRight = (2*this.A[this.noseStart+1]-sum)/sum;   
	newReflectionLRN.poke(0, 1, (2 * A.peek(0, noseStart + 1) - sum) / sum);

    //this.newReflectionNose = (2*this.noseA[0]-sum)/sum;    
	newReflectionLRN.poke(0, 2, (2 * noseA.peek(0, 0) - sum) / sum);
}

//979
function calculateNoseReflections() {
	var noseLength = TractParams.get("noseLength");
		
	for (var i = 0; i < noseLength; i++) {
		// this.noseA[i] = this.noseDiameter[i]*this.noseDiameter[i]; 
		noseA.poke(0, i, noseDiameter.peek(0, i) * noseDiameter.peek(0, i));
	}
	for (var i = 1; i < noseLength; i++) {
		//this.noseReflection[i] = (this.noseA[i-1]-this.noseA[i]) / (this.noseA[i-1]+this.noseA[i]); 
		noseReflection.poke(0, i, (noseA.peek(0, i-1) - noseA.peek(0, i)) / ( noseA.peek(0, i-1) + noseA.peek(0, i)));
	}
}

function finishBlock() {
	reshapeTract();
	calculateReflections();
}

//930
function reshapeTract() {
	var amount = 512/AudioSystem.get("sampleRate") * 15;
	var noseStart = TractParams.get("noseStart");
	var tipStart = TractParams.get("tipStart");
	
	for (var i = 0; i < TractParams.get("n"); i++) {
		var d = diameter.peek(0, i);
		var td = targetDiameter.peek(0, i);
		
		var slowReturn;
		if (i < noseStart) slowReturn = 0.6;
		else if (i >= tipStart) slowReturn = 1.0; 
		else slowReturn = 0.6+0.4*(i-noseStart)/(tipStart-noseStart);
		
		this.diameter.poke(0, i, moveTowards(d, td, slowReturn*amount, 2*amount));

	}
}
 
//80
function moveTowards(current, target, amountUp, amountDown) {
    if (current<target) return Math.min(current+amountUp, target);
    else return Math.max(current-amountDown, target);
}