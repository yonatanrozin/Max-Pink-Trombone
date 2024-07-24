# Max Pink Trombone
<<<<<<< HEAD
A Max/MSP port of the fantastic [Pink Trombone](https://dood.al/pinktrombone/) vocal synthesizer.

__THESE DOCS ARE SLIGHTLY OUTDATED FOR THE POLYPHONIC VERSION!!! UPDATED DOCS COMING SOON__
=======
A Max/MSP port of the fantastic [Pink Trombone](https://dood.al/pinktrombone/) vocal synthesizer, made by Neil Thapen.
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848

## Installation
- ```git clone``` this repo into a local folder of your choice or download the ZIP file.
- The "main" patch is [```Max_Trombone.maxpat```](https://github.com/yonatanrozin/Max-Trombone/blob/main/Max_Trombone.maxpat). Simply open it and enable audio or incorporate it into an existing patch!

## Overview
This patcher is essentially a 1:1 port of the Pink Trombone vocal synthesizer into Max/MSP. The goal of this port is to leverage the incredible real-time voice synthesis of Pink Trombone inside the powerful and flexible interface of Max/MSP for the creation of experimental live performances that explore procedural speech generation. By default, this patcher works and sounds identically to the online version, with a few added features:

### New features
<<<<<<< HEAD
- Separate Glottis and Tract audio processes
=======
- Polyphony
  - Control an entire Pink Trombone chorus!
- MIDI input
  - Control your voice(s) with a MIDI keyboard and map knobs, sliders, etc. to expressive parameters.
- Separate Glottis and Tract audio objects
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
  - Filter raw glottal source with EQ to create unique voice timbres
  - Replace glottal source with a different audio source entirely - make any audio source talk!

<<<<<<< HEAD
### Coming soon
- MIDI input
- A tool for recording/playback of speech values
- A tool for generating sequences of constriction/tongue values for speech automation
- Max4Live plugin - record/manipulate speech values from Ableton Live
=======
### Coming soon (eventually)
- Voice presets - choose between a number of pre-created vocal timbres
- Max4Live plugin - record/manipulate speech values from an Ableton Live set
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848

## Usage
Load the main patcher, enable audio, press on some keys on the [kslider] (or input some MIDI notes) and click around the GUI. The patcher will route notes to individual voices polyphonically, provided there are enough [poly~] voices enabled (10 by default). 

<<<<<<< HEAD
Look inside ```[poly~ MPT_Voice]``` for audio processing objects

### ```[gen~ glottis_processor]```
The glottis processor produces a raw "glottal source": the sound produced by the human vocal cords before passing through the mouth; and an "aspiration" signal: white noise added to the glottal source to simulate the sound of breath. Aspiration gets louder with lower tenseness values.
=======
### [poly~ MPT_Voice]
MPT_Voice is a patcher that produces a single Pink Trombone voice. It contains (among other things) 2 [gen~] patches that control the voice glottis and tract. Each gen~ patch includes adjustable parameters that control the voice's timbral properties and produce speech.
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848

#### [gen~ glottis_processor]
To set glottis param values, input a message ```<param> <value>``` to inlet 1 of MPT_Voice. You'll want to first input ```target <voiceNumber>``` to specify which voice you're manipulating. You can accomplish both in a single message using ```target <voiceNum>, <param> <value>```.

<<<<<<< HEAD
#### Inlets/outlets
- Inlet 1 (signal) sets voice frequency (in Hz).
  - Modulate the signal (probably with a sine wave LFO) to create vibrato effects. Experiment with different LFO frequencies and amplitudes to vary vibrato frequency and intensity. A constant frequency value will produce a robotic sound, so it's recommended to modulate the frequency at least a little bit.
- Inlet 2 (signal) receives the aspiration noise - filtered white noise used to simulate the sound of "breathiness" in the synthesized voice. In Pink Trombone, this is half-amplitude white noise filtered through a 500Hz, .5Q bandpass filter.
- Outlet 1 (signal) outputs the raw glottal source.
  - Optionally, route this signal through an EQ (or some other effect/filter?) to create voices with different timbres ("feminine" voices, etc).
  - Alternatively, replace the glottal source with an entirely different audio source and leave this outlet unconnected (see "using non-glottal source")
- Outlet 2 (signal) outputs aspiration noise resulting from low tenseness values. You should combine (+~) this signal with your audio source (glottis or other) before inputting to the tract.
- Outlet 3 (signal) outputs a noise modulator signal, a variable shared between the glottis and tract. The signal should be connected directly to inlet 2 of ```[gen~ tract_processor]```.
=======
##### Params
- frequency (in Hz) - sets the fundamental frequency of the voice
- vibratoFrequency (in hz) - sets the frequency of vibrato - an LFO that modulates the fundamental frequency
- vibratoAmount (unit??) - sets the intensity (amplitude) of the vibrato. Should be a very small number (default is 0.02, anything above 0.1 starts to sound ridiculous).
- tenseness (0-1) - a timbral quality between an unpitched whisper (0) and a harsh, strained tone (1)
- tensenessMult (0-1) - a multiplier of tenseness values to be manipulated during production of unpitched consonants (P, F, S, etc).
- intensity (0-1) - the volume of the pitched component of the produced voice. Set to 0 to silence the voice.
- useCustomSource (0 or 1) - if 0 (default), will synthesize a raw vocal cord signal to filter into speech. Otherwise, will use a custom glottal signal inputted to the 3rd inlet of MPT_Voice for a vocoder-like effect. (see "using custom glottal source" below)
>>>>>>> 86347bf17b6d40b4105620ad049970806f986848

#### [gen~ tract_processor]

To set tract param values, input a message ```<param> <value>``` to inlet 2 of MPT_Voice. You'll want to first input ```target <voiceNumber>``` to specify which voice you're manipulating. You can accomplish both in a single message using ```target <voiceNum>, <param> <value>```.

__If using the [jsui], input the messages into inlet 1 of the jsui instead, otherwise the GUI won't accurately reflect the current shape of the vocal tract! The JSUI will "forward" any inputted messages to the vocal tract.__

##### Params
- n (30-44) - the length of the vocal tract, in segments. Default is 44, shorter tracts produce "younger", more "feminine" voices, though anything below 38 will start to sound alien.
Tongue index + diameter are used to move the base of the "tongue" around inside the tract, allowing for the production of different vowels.
- tongueIndex (0-n) - the horizontal position (as a segment #) of the center of the base of the "tongue". This moves the tongue back and forth inside the mouth. In default-lengthed tracts, the number moves between 12 and 29.
- tongueDiameter (2-3.5) - the vertical position of the base of the "tongue".
Constriction index + diameter are used to control the tip of the "tongue", which is used to constrict the flow of air at various points within the tract and produce most consonants.
- constrictionIndex (0-n) - the horizontal position (as a segment #) of the tip of the "tongue"
- constrictionDiameter (0+) - the vertical position of the tip of the "tongue". At 0, the tongue will touch the roof of the mouth and block the flow of air entirely. At values above 0 below 0.3, the narrow constriction will cause turbulence in the air flow, resulting in white noise characteristic of consonants such as F and S.
- lipDiameter (0-1.5) - the diameter of the lips. At 0, the mouth is fully closed. Typically stays at 1.5 but smaller values produce the vowels O and U together with the correct tongue index/diameter.
- velumTarget (0.01-0.4) - sets the width of the velum, a narrow passageway between the oral and nasal tracts. Closed by default and opens to produce consonants where the oral tract is blocked, such as M, N and NG.

### [jsui]
The JSUI renders an interactive GUI identical to that found in the original Pink Trombone. It produces messages for the MPT_Voice tract when interacted with. __If using messages manually to manipulate the vocal tract and you want those changes to be reflected in the GUI, you must send those messages to inlet 1 of the jsui instead!__

<<<<<<< HEAD
=======
- Outlet 1 will produce tract param messages when interacted with. It should ALWAYS remain connected directly to inlet 2 of MPT_Voice. 
- Outlet 2 will output the position of the base of the tongue (tongueIndex + tongueDiameter) when moved. This serves no purpose other than allowing you to view the values, should you want to note them. Connect to inlet 2 of a message object to view, or remain unconnected.
- Outlet 3 will output the constriction position (constrictionIndex + constrictionDiameter) when moved. This serves no purpose other than allowing you to view the values, should you want to note them. Connect to inlet 2 of a message object to view, or remain unconnected.

#### Setting GUI voice targets
By default, the [jsui] will manipulate all [poly~] voices simultaneously, causing them all to speak together. You can change these targets by inputting a message ```target <# # #>``` to the jsui. The message can include as many voice numbers as needed.
- Ex: to control voices 3 and 4 with a single jsui, use ```target 3 4```. To return to controlling all voices, use ```target 0```.

You can use multiple [jsui]s, each controlling a different section of your chorus. They must each be connected to inlet 2 of MPT_Voice.

### Using custom glottal source
By default, the glottis gen patch will synthesize a raw vocal cord signal using the specified frequency, intensity, tenseness and vibrato values. However, this signal can be replaced with any audio source of your choice to make it talk, producing a similar effect to a vocoder without the need for inputting a separate vocal signal. Note that the frequency glottis param will not have any effect on the custom source, but the tenseness and intensity params will.

- Connect your audio signal to inlet 3 of MPT_Voice
- Input a message ```target <voiceNumber>, useCustomSource 1``` to inlet 1 of MPT_Voice to switch the specified voice to the custom source. (use 0 to target all voices)
  - Use ```target <voiceNumber>, useCustomSource 0``` to return to the default glottal source. 

There is currently no way to input multiple custom sources to different voices within a single [poly~] object. If you want 2 different voices with 2 different custom sources, you'll need to use multiple [poly~] objects.

>>>>>>> 86347bf17b6d40b4105620ad049970806f986848
## Notice
This patch is based heavily and exclusively on the original [Pink Trombone](https://dood.al/pinktrombone/), created by Neil Thapen and released under the [MIT License](https://opensource.org/license/mit). A copy of the original code and the license are included in this repository [here](https://github.com/yonatanrozin/Max-Pink-Trombone/blob/main/Pink_Trombone_Original.html).
