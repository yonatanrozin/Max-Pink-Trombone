# Max-Trombone
A headless Max/MSP port of the fantastic [Pink Trombone](https://dood.al/pinktrombone/) vocal synthesizer.

## Usage
- ```git clone``` this repo into a local folder of your choice or download the ZIP file.
- The "main" patch is [```Max_Trombone.maxpat```](https://github.com/yonatanrozin/Max-Trombone/blob/main/Max_Trombone.maxpat). Simply open it and enable audio or incorporate it into an existing patch!
- Use the [kslider] or [pictslider] at the top to manipulate the pitch and intensity of the generated voice. This will behave identically to the horizontal "keyboard" at the bottom of the original Pink Trombone GUI. 
- The patch will also accept MIDI note input through the [midiIn] object. Make sure the object is listening on the correct channel!
- The original GUI has been re-created in the [jsui] object, and can be interacted with identically with the mouse to move the tongue and reshape the tract.
  - __The graphics will only update while audio is enabled in the patcher!__
- Alternatively, manipulate the tract values directly. See "manipulating tract diameters" below.

## Patch details

### [p Glottis]
The Glottis object produces a raw "glottal source", the sound produced by the human vocal cords before passing through the mouth. You can manipulate the fundamental frequency of the voice as well as its "tenseness": a timbral property anywhere between a soft whisper and a loud "strained" color.
- Inlet 1 (signal) sets voice frequency.
  - Modulate the signal (probably with a sine wave LFO) to create vibrato effects.
- Inlet 2 (float 0-1) sets voice tenseness
  - 0 is a soft whisper, 1 is loud and "strained". Default "natural" sound is around 0.6.
- Outlet 1 (signal) is the raw glottal source.
  - Route this signal through an EQ (or some other effect/filter?) to create voices with different timbres (feminine voices, etc).
- Outlet 2 (signal) is aspiration noise resulting from low tenseness values. You'll typically add this signal to the glottal source before inputting to the tract, but you may choose to use only the aspiration signal and replace the glottal source with any other audio source to make it "talk".
- Outlet 3 (signal) is a noise modulator value which should be connected directly to inlet 2 of [p Tract].

### [p Tract]
The Tract object receives an audio source and filters it according to a set of "diameters" specifying the shape of the vocal tract, which is affected mainly by the position of the tongue and lips. By default, this audio source is the glottal output, which is the combined signal of the glottal source and aspiration noise, but you may choose to keep only the aspiration and replace the glottal source with any other audio signal.
- Inlet 1 (signal) should receive the audio source to be filtered. This will be the glottal output from [p Glottis] by default, but will work with any audio signal (with varying degrees of success).
- Inlet 2 (signal) should receive the noise modulator signal from [p Glottis].
- Inlet 3 receives messages to manipulate certain vocal tract parameters:
  - ```n <int>``` sets vocal tract length. Default length is 44, while shorter lengths produce "younger", more "feminine"-sounding voices. Higher frequencies and an EQ on the glottal source can reinforce this effect.
  - ```tongue <float> <float>``` moves the "tongue".

#### Manipulating tract diameters
The tract "diameters" are an array of values that specify the shape of the vocal tract, which is mainly affected by the position of the tongue and lips. In the GUI, the tract diameters are abstracted by 2 sets of values used to calculate them:
- the "index" and "diameter" (location and height along the curve of the GUI) of the tongue, which can be moved around the "tongue control" area,
- the index and diameter of the cursor while the mouse button is held, creating a temporary "constriction" in the tract.
To manipulate these values:
- Send [jsui] a message:
  - ```constrictionIndex <float>``` or ```constrictionDiameter <float>``` will simulate a mouse being held at the specified index/diameter. Use -1 for either value to simulate the mouse being released.
  - ```tongueIndex <float>``` or ```tongueDiameter <float>``` will set the tongue position.
  - The [jsui] will stream tongue and constriction information out its 2 outlets, respectively. You can click around the UI and print the outputted values to record them.
- Perform waveshaping on the tract by writing values to [buffer~ targetDiameter], a buffer storing "target" diameter values.
  - The "current" diameter values move smoothly towards these target values to prevent pops.
  - Alternatively, you may instead write values to [buffer~ diameter] to change the current diameter values instantly, but you must also write those same values to targetDiameter to prevent them from immediately returning to their previous values.
  - Writing diameter values directly may create vocal tract shapes that are neither producible in the original Pink Trombone GUI or in a real human mouth. This will probably result in unnatural vocal effects.

## Notice
This patch is based heavily on the original [Pink Trombone](https://dood.al/pinktrombone/), created by Neil Thapen and released under the [MIT License](https://opensource.org/license/mit).