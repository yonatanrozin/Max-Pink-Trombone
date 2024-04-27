const {spawn} = require('child_process');
const Max = require('max-api');
const fs = require('fs');

const pyLeapMotion = spawn("python", ["./leapc-python-bindings/pyLeapMotion.py"], {stdio: "pipe"});
		
pyLeapMotion.stdout.on("data", async function(msg) {
	
	const dataIn = JSON.parse(String(msg));
			
	Max.outlet(dataIn);
		
});