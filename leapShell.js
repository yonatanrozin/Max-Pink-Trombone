const {spawn} = require('child_process');
const Max = require('max-api');
const path = require('path');
const fs = require('fs');

const pyLeapMotion = spawn("python", ["./leapc-python-bindings/tracking_event_example.py"], {stdio: "pipe"});

pyLeapMotion.stdout.on("data", async function(msg) {
			
	await Max.setDict("handInfo", JSON.parse(String(msg)));
	Max.outlet("bang");
		
});