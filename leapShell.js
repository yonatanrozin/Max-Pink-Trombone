const {spawn} = require('child_process');
const {getDict, post, outlet} = require('max-api');
const fs = require('fs');

let consonants;

const cGroups = [
	["T", "F", "G/NG", "S"],
	["N", "M", "L", "R"],
	["D", "B", "H", "K"],
];

let con;
let dir;

const vowels = [
	[
		[17.75, 2.05, 0.8], [20.275, 2.05, 0.6], [21.6, 2.05, 0.4]
	], 
	[
		[12.75, 2.2, 1.5], [20.85, 2.27, 1.5], [29, 2.05, 1.5]
	], 
	[
		[16.65, 3.17, 1.5], [20.5, 3.5, 1.5], [27.1, 2.66, 1.5]
	],
]

getDict("consonants").then(res => {consonants = res});

const pyLeapMotion = spawn("python3", ["./pyLeapMotion.py"], {stdio: "pipe"});
		
pyLeapMotion.stdout.on("data", async function(msg) {
		
	if (!consonants) return;
	
	const dataIn = JSON.parse(String(msg));
		
	if (!dataIn.num) return;
	
	if (dataIn.val == 0) {
		dir = "f";
		const r = Math.round(map(dataIn.r, -0.5, 0.5, 0, cGroups.length - 1, true));
		con = cGroups[r][dataIn.num - 1];
	}
	else if (dataIn.val == 1) {
		dir = "b";
		const r = Math.round(map(dataIn.r, -0.5, 0.5, 0, cGroups.length - 1, true));
		con = cGroups[r][dataIn.num - 1];
	}
	
	if (!dir || !con) return;
		
	const cons = consonants[con];
	const phon = cons[dir] || cons.f;
	const {frames, adj} = phon;
	const frameI = Math.floor((1 - dataIn.val) * (frames.length - 1));
	const frame = frames[frameI];

	const vowelOut = getVowel(dataIn.x, dataIn.z);
	
	if (adj && frame.ta) {
		vowelOut[0] = map(frame.ta, 0, 1, vowelOut[0], adj.i, true);
		vowelOut[1] = map(frame.ta, 0, 1, vowelOut[1], adj.d, true);
	}
	outlet("tract", "tongueIndex", vowelOut[0]);
	outlet("tract", "tongueDiameter", vowelOut[1]);
	outlet("tract", "lipDiameter", vowelOut[2]);
	
	outlet("tract", "constrictionIndex", frame.ci);
	outlet("tract", "constrictionDiameter", frame.cd + 0.3);
	outlet("tract", "velumTarget", frame.v);	
	outlet("tract", "noiseIntensity", frame.n);
	
	outlet("glottis", "intensity", frame.i);
	outlet("glottis", "tensenessMult", frame.t);
	
	outlet("data", frame);
});

function getVowel(x, z) {
		
	//get vowel data (tongue index, diameter + lip diameter)
	const vx = map(x, -100, 100, 0, 2, true);
	const vy = map(z, -100, 100, 0, 2, true);
	
	const interpValX = vx % 1;
	const interpValY = vy % 1;
	
	const vix1 = Math.floor(vx);
	const vix2 = vix1 == 2 ? vix1 : vix1 + 1;
	
	const viy1 = Math.floor(vy);
	const viy2 = viy1 == 2 ? viy1 : viy1 + 1;
		
	const v11 = vowels[viy1][vix1];
	const v12 = vowels[viy1][vix2];
	const v21 = vowels[viy2][vix1];
	const v22 = vowels[viy2][vix2];
	
	const vowelOut = [];
	
	for (var i = 0; i < 3; i++) {
		const vix1 = map(interpValX, 0, 1, v11[i], v12[i], true);
		const vix2 = map(interpValX, 0, 1, v21[i], v22[i], true);
	
		vowelOut[i] = map(interpValY, 0, 1, vix1, vix2, true);
	}
	
	return vowelOut;
}


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

function constrain(n, low, high) {
  return Math.max(Math.min(n, high), low);
};