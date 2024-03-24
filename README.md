# Max-Trombone
A headless Max/MSP port of the fantastic [Pink Trombone](https://dood.al/pinktrombone/) vocal synthesizer.

## Usage
- ```git clone``` this repo into a local folder of your choice or download ZIP file.
- "root" patch is [```Max_Trombone.maxpat```](https://github.com/yonatanrozin/Max-Trombone/blob/main/Max_Trombone.maxpat). Simply open it and enable audio or incorporate it into an existing patch!
- Use the [kslider] or [pictslider] at the top to manipulate the pitch and intensity of the generated voice. This will behave identically to the horizontal "keyboard" at the bottom of the original Pink Trombone interface. The patch will also accept MIDI notes through the [midiIn] object. Make sure the object is listening on the correct channel!
- The original GUI has been re-created in the [jsui] object, and can be interacted with identically with the mouse to move the tongue and reshape the tract.
  - __Note: the GUI only moves while audio is enabled in the patcher!__
- Or, manipulate the tract values directly. See "manipulating tract diameters" below.

## Patch details
### [p Glottis]
The Glottis object produces a raw "glottal source", the sound produced by the human vocal cords before passing through the mouth. You can manipulate the fundamental frequency of the voice as well as its "tenseness": a timbral property anywhere between a soft whisper and a loud "strained" color.
- Inlet 1 (signal) sets voice frequency.
  - Modulate the signal (probably with a sine wave) to create vibrato effects.
- Inlet 2 (float 0-1) sets voice tenseness
  - 0 is a soft whisper, 1 is loud and "strained". Default "natural" sound is around 0.6.
- Outlet 1 (signal) is the raw glottal signal.
  - Route this signal through an EQ (or experiment with other effects) to create voices with different timbres (feminine voices, etc). Note that stronger filters may cause sonic artifacts in the Tract.
- Outlet 2 (signal) is a noise modulator value, which should be connected directly to inlet 2 of [p Tract].
### [p Tract]
The Tract object receives the glottal source and filters it according to a set of "diameters" specifying the shape of the vocal tract, which is affected mainly by the position of the tongue and lips. However, these filters can be applied to any audio source, creating a vocoder-like effect.
- Inlet 1 (signal) should receive the audio source to be filtered. This will be the glottal output from [p Glottis] by default, but will work with any audio signal (with varying degrees of success).
- Inlet 2 (signal) should receive the noise modulator from [p Glottis] if you're filtering the glottal source. If not, it should remain unconnected.
- Inlet 3 receives messages to manipulate certain vocal tract parameters:
  - ```n <int>``` sets vocal tract length. Default length is 44, while shorter lengths produce younger, more feminine voices (together with higher frequencies and optionally EQ on the raw glottal output)
  - ```tongue <float> <float>``` moves the "tongue".
#### Manipulating tract diameters
The tract "diameters" are an array of values that specify the shape of the vocal tract, which is mainly affected by the position of the tongue and lips. In the GUI, the tract diameters are a product of 2 sets of values:
- the "index" and "diameter" (location and height along the curve of the GUI) of the tongue, which can be moved around the "tongue control" area,
- the index and diameter of the cursor, which will create a temporary "constriction" in the tract diameters while the mouse button is held.
To manipulate these values:
- Send [jsui] a message:
  - ```constrictionIndex <value>``` or ```constrictionDiameter <value>``` will simulate a mouse being held at the specified index/diameter. Use -1 as the value to simulate the mouse being released.
  - ```tongueIndex <value>``` or ```tongueDiameter <value>``` will set the tongue position.
  - The [jsui] will stream tongue and constriction information out its 2 outlets, respectively. You can click around the UI and print the values to get them.
- Perform waveshaping on the tract by writing values to [buffer~ targetDiameter], a buffer storing "target" diameter values.
  - The "current" diameter values move smoothly towards these target values to prevent pops.
  - You can also write values to [buffer~ diameter] to change the current diameter values instantly, but you must write those same values to targetDiameter as well or else they'll simply move back to the previous value.
## Notice
This patch is based heavily on the original [Pink Trombone](https://dood.al/pinktrombone/), created by Neil Thapen and released under the [MIT License](https://opensource.org/license/mit).
