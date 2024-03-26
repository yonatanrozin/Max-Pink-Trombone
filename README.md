# Max Pink Trombone
A Max/MSP port of the fantastic [Pink Trombone](https://dood.al/pinktrombone/) vocal synthesizer.

__Demo video coming soon!__

## Installation
- ```git clone``` this repo into a local folder of your choice or download the ZIP file.
- The "main" patch is [```Max_Trombone.maxpat```](https://github.com/yonatanrozin/Max-Trombone/blob/main/Max_Trombone.maxpat). Simply open it and enable audio or incorporate it into an existing patch!

## Usage
_Recommended: view patcher in presentation mode to see only interactive objects._
- Use the ```[kslider]``` or ```[pictslider]``` at the top to manipulate the pitch and intensity of the generated voice. This will behave identically to the horizontal "keyboard" at the bottom of the original Pink Trombone GUI. 
- The patch will also accept MIDI note input through ```[midiIn]```. Make sure the object is listening on the correct channel!
- The original GUI has been re-created in ```[jsui]```, and can be interacted with identically with the mouse to move the tongue and reshape the tract.
- Alternatively, manipulate the tract values directly. See "manipulating tract diameters" below.

## Patch details

### ```[p Glottis]```
The Glottis produces a raw "glottal source", the sound produced by the human vocal cords before passing through the mouth. You can manipulate the fundamental frequency of the voice as well as its "tenseness": a timbral property anywhere between a soft whisper and a loud "strained" color. Low tenseness values will produce a second signal containing pitchless aspiration noise.
- Inlet 1 (signal) sets voice frequency.
  - Modulate the signal (probably with a sine wave LFO) to create vibrato effects.
- Inlet 2 (float 0-1) sets voice tenseness
  - 0 is a soft whisper, 1 is loud and "strained". Default "natural" sound is around 0.6.
- Outlet 1 (signal) is the raw glottal source.
  - Optionally, route this signal through an EQ (or some other effect/filter?) to create voices with different timbres (feminine voices, etc).
  - Alternatively, you may choose to use a different audio source entirely and leave this outlet unconnected.
- Outlet 2 (signal) is aspiration noise resulting from low tenseness values. You'll typically add this signal to the glottal source before routing to the tract. Alternatively, you may choose to use only the aspiration signal and replace the glottal source with any other audio source to make it "talk".
- Outlet 3 (signal) is a noise modulator value which should be connected directly to inlet 2 of ```[gen~ tract_processor]```.

### Vocal Tract
The vocal tract filters an audio source according to a set of tract "diameters" specifying the vocal tract shape, which is affected mainly by the position of the tongue and lips. By default, this audio source is the glottal output, which is the combined signal of the glottal source and aspiration noise, but you may choose to keep only the aspiration and replace the glottal source with any other audio signal. By manipulating the shape of the vocal tract precisely over time, you can create speech patterns.
- ```[gen~ tract_processor]``` does the actual sound filtering.
- ```[jsui]``` handles manipulating the shape of the vocal tract through mouse interaction or by simulating mouse interaction through a series of abstracted values.

#### ```[gen~ tract_processor]```
The tract processor filters an inputted audio source according to the values inside ```[buffer~ diameter]```. These values can be manipulated through a series of values that simulate mouse interaction (see ```[jsui]``` info below) or by writing diameter values directly (see "Buffers" section below).
- Inlet 1 receives the audio source to be filtered. By default, this will be the sum of the first 2 outlets of ```[p Glottis]``` (source and aspiration), but you may replace the glottal source (outlet 1) with any other audio source (```[adc~]```, etc.) to create a vocoder-like effect.
- Inlet 2 should receive the noise modulator signal from the third outlet of ```[p Glottis]```.
- Inlet 3 receives the Max equivalent of the "fricative filter", which produces filtered white noise heard in fricative consonants such as V and S. This filter is recreated in Max using ```[noise~] -> [/~ 2] -> [reson~ 1 1000 0.5]```.

#### ```[jsui]```
The ```[jsui]``` renders an interactive GUI identical to the original Pink Trombone and contains functions that can manipulate properties of the vocal tract to create speech. The length of the vocal tract in segments ("n") determines the length of these arrays and significantly affects the timbre of the voice. The default length of 44 will produce a "male" voice while shorter lengths will produce "younger", more "feminine" voices, especially when coupled with a higher glottis frequency and an EQ on the glottal source (before adding aspiration). The tract length can be manipulated by sending a message to ```[jsui]```:
- ```init <int>``` to set tract length. This currently may produce a short high-pitched noise, so avoid doing this while audio is turned on. (fix coming soon)
Tract diameters are abstracted by 2 sets of values:
- the "index" and "diameter" (location and height along the curve of the GUI) of the tongue, which can be moved around the "tongue control" area,
- the index and diameter of the cursor while the mouse button is held, creating a temporary "constriction" in the tract.
To manipulate these values:
- Interact with ```[jsui]``` with the mouse, which will behave identically to the original Pink Trombone, OR:
- Send ```[jsui]``` a message:
  - ```constrictionIndex <float>``` or ```constrictionDiameter <float>``` will simulate a mouse being held at the specified index/diameter. Use -1 for either value to simulate the mouse being released.
  - ```tongueIndex <float>``` or ```tongueDiameter <float>``` will set the tongue position.
  - The ```[jsui]``` will stream tongue and constriction information out its 2 outlets, respectively. You can click around the UI and print the outputted values to record them.
- __coming soon__: docs on using ```[line]``` to automate sequences of these values to create speech
 
#### Buffers
Pink Trombone uses many internal Float64Arrays in the calculation of audio sample values. In Max, these Float64Arrays are re-created using ```[buffer~]```s. You shouldn't ever write values manually to most of these buffers. The only 2 you should ever write values to are ```[buffer~ diameter]``` and ```[buffer~ targetDiameter]```, which specify the shape of the vocal tract. ```[buffer~ diameter]``` contains the "current" tract diameters, while ```[buffer~ targetDiameter]``` stores a set of target values. The values in each index of diameter ramp smoothly towards the corresponding value in targetDiameter to prevent pops in the produced sound. To manipulate the vocal tract manually (waveshaping?, etc.):
- Write values to ```[buffer~ targetDiameter]```. Observe in ```[jsui]``` how the current values ramp smoothly towards the new values.
- Alternatively, write values to ```[buffer~ diameter]``` to set the current diameter values directly, with no ramp. __You must ALSO write the same values to targetDiameter or they'll just return to their previous values.__
Be aware that setting diameter values directly may result in tract shapes that are neither achievable in the original Pink Trombone GUI, nor producible naturally in a human mouth. This may cause unnatural-sounding "speech" patterns, but will probably sound cool regardless.

## Coming soon
- Polyphony - manipulate multiple voices at once!
- A tool for generating tongue/constriction sequences for speech automation
- Max4Live?

## Notice
This patch is based heavily and exclusively on the original [Pink Trombone](https://dood.al/pinktrombone/), created by Neil Thapen and released under the [MIT License](https://opensource.org/license/mit).
