var voiceParams = new Dict("VoiceParams");

//PT 786
function setupWaveform(lambda) {

	Rd = 3 * (1 - voiceParams.get("tenseness"));
		    
    if (Rd < 0.5) Rd = 0.5;
    if (Rd > 2.7) Rd = 2.7;

    var Ra = -0.01 + 0.048 * Rd;
    var Rk = 0.224 + 0.118 * Rd;
    var Rg = (Rk / 4) * (0.5 + 1.2 * Rk) / (0.11 * Rd - Ra * (0.5 + 1.2 * Rk));
    
    var Ta = Ra;
    var Tp = 1 / (2 * Rg);
    var Te = Tp + Tp * Rk; 
    
    var epsilon = 1 / Ta;
    var shift = Math.exp(-epsilon * (1-Te));
    var Delta = 1 - shift; 
       
    var RHSIntegral = (1 / epsilon) * (shift - 1) + (1-Te) * shift;
    RHSIntegral = RHSIntegral/Delta;
    
    var totalLowerIntegral = -(Te-Tp)/2 + RHSIntegral;
    var totalUpperIntegral = -totalLowerIntegral;
    
    var omega = Math.PI / Tp;
    var s = Math.sin(omega * Te);

    var y = -Math.PI * s * totalUpperIntegral / (Tp*2);
    var z = Math.log(y);
    var alpha = z / (Tp/2 - Te);
    var E0 = -1 / (s * Math.exp(alpha * Te));

	outlet(0, "alpha", alpha);
	outlet(0, "E0", E0);
	outlet(0, "epsilon", epsilon);
	outlet(0, "shift", shift);
	outlet(0, "Delta", Delta);
	outlet(0, "Te", Te);
	outlet(0, "omega", omega);

}