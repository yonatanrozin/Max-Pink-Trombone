# Max Pink Trombone
A Max/MSP port of the fantastic [Pink Trombone](https://dood.al/pinktrombone/) vocal synthesizer.

__Demo video coming soon__

## Installation
- ```git clone``` this repo into a local folder of your choice or download the ZIP file.
- The "main" patch is [```Max_Trombone.maxpat```](https://github.com/yonatanrozin/Max-Trombone/blob/main/Max_Trombone.maxpat). Simply open it and enable audio or incorporate it into an existing patch!

## Overview
This patcher is a 1:1 port of the Pink Trombone vocal synthesizer into Max/MSP. The goal of this port is to leverage the incredible real-time voice synthesis of Pink Trombone inside the powerful and flexible interface of Max/MSP for the creation of experimental live performances that explore procedural speech generation. By default, this patcher works identically to the online version:
- _Recommended: view patcher in presentation mode to view only interactive objects_
- Use the ```[kslider]``` or ```[pictslider]``` to manipulate the pitch and intensity of the generated voice. This will behave identically to the horizontal "keyboard" at the bottom of the original Pink Trombone GUI. 
- The original interface has been re-created in the ```[jsui]``` (with slightly reduced visuals), and can be interacted with identically with the mouse to move the tongue and reshape the tract.
- Adjust the tract length using the "Tract N" dial. This will produce voices with higher formants than the male default. This feature exists in the original code, but is not accessible in the original GUI.

### New features
- MIDI input
  - Send MIDI notes to change voice pitch and tenseness
- Tract waveshaping
  - Write values directly to tract buffer - create unnatural tract shapes, explore unnatural speech patterns (see "buffers" section)
- Separate Glottis and Tract audio processes
  - Filter raw glottal source with EQ to create unique voice timbres
  - Replace glottal source with a different audio source entirely - make any audio source talk! (see "non-glottal source" section)

### Coming soon
- Polyphony - control an entire Pink Trombone chorus using MIDI
- A tool for recording/playback of speech values
- A tool for generating sequences of constriction/tongue values for speech automation
- Max4Live plugin - record/manipulate speech values from Ableton Live

## Patch details

### ```[gen~ glottis_processor]```
The glottis processor produces a raw "glottal source": the sound produced by the human vocal cords before passing through the mouth; and an "aspiration" signal: white noise added to the glottal source to simulate the sound of breath. Aspiration gets louder with lower tenseness values.

#### Params
Send a message to inlet 1 to change param values: ```<paramName> <value>``` (ex: "tenseness 0.5")
- tenseness (0-1): voice tenseness, a timbral property between an unpitched whisper and a harsh, strained sound. A "natural" speaking voice is around 0.6, but it may vary depending on the voice frequency.
- intensity (0-1): volume of air flow through the "tract". This is a timbral property, and shouldn't be treated as just a gain value. Ramp the value smoothly between 0 and 1 to start and stop the voice (such as between words, etc.)

#### Inlets/outlets
- Inlet 1 (signal) sets voice frequency (in Hz).
  - Modulate the signal (probably with a sine wave LFO) to create vibrato effects. Experiment with different LFO frequencies and amplitudes to vary vibrato frequency and intensity. A constant frequency value will produce a robotic sound, so it's recommended to modulate the frequency at least a little bit.
- Outlet 1 (signal) outputs the raw glottal source.
  - Optionally, route this signal through an EQ (or some other effect/filter?) to create voices with different timbres ("feminine" voices, etc).
  - Alternatively, replace the glottal source with an entirely different audio source and leave this outlet unconnected (see "using non-glottal source")
- Outlet 2 (signal) outputs aspiration noise resulting from low tenseness values. You should combine (+~) this signal with your audio source (glottis or other) before inputting to the tract.
- Outlet 3 (signal) outputs a noise modulator signal, a variable shared between the glottis and tract. The signal should be connected directly to inlet 2 of ```[gen~ tract_processor]```.

### ```[gen~ tract_processor]```
The vocal tract processor filters an audio source according to a set of tract "diameters" specifying the vocal tract shape, which is affected mainly by the position of the tongue and lips. By default, this audio source is the glottal output, which is the combined signal of the glottal source and aspiration noise, but you may choose to replace the glottal source with a different audio signal (see "using non-glottal source"). By manipulating the shape of the vocal tract over time, you can create speech patterns.

#### Params
Send a message to inlet 1 to change param values: ```<paramName> <value>``` (ex: "velumTarget 0.3")
- n (int 30-44) - the vocal tract length, in segments. This property significantly affects the timbre of the voice. The default value 44 will simulate an average adult male tract, while lower values will simulate younger, more "female" tracts. This will produce voices with higher vowel formants, especially when combined with higher glottis frequencies and maybe an EQ.
- tongueIndex, tongueDiameter: set the position and height, respectively, of the "tongue" along the curve of the vocal tract. In the GUI, you can change these values by clicking around the "tongue control" area. Changing the position of the tongue will affect the "vowel" produced by the voice.
- constrictionIndex, constrictionDiameter: set the position and height, respectively, of a simulated mouse being held above the GUI at a specific point. This will produce a "constriction" at the specified point, which is key in producing most consonants. In the GUI, you can produce constrictions by clicking/dragging the mouse around the oral cavity. Set constrictionIndex to 0 to remove the constriction.
- velumTarget (0.01-0.4): sets the diameter of the velum, a small airway connecting the oral cavity and the nasal cavity. Click/drag the mouse around the nasal cavity to open it. It's closed by default.
- movementSpeed (float, min 0, default 15): sets the speed (in cm/s??) at which the tract diameter values will ramp smoothly when the tongue or constriction values change.

#### Inlets/outlets
- Inlet 1 receives the audio source to be filtered. By default, this will be the sum of the first 2 outlets of ```[p Glottis]``` (source and aspiration), but you may replace the glottal source (outlet 1) with any other audio source (```[adc~]```, etc.) to create a vocoder-like effect. See "using non-glottal source" for more info.
- Inlet 2 receives the noise modulator signal from the third outlet of ```[gen~ glottis_processor]```.

### ```[jsui]```
The ```[jsui]``` renders an interactive GUI identical to the original Pink Trombone and can automatically generate messages to control tract processor param values. __The GUI does not update visuals while audio in your patcher is turned off!__
- Input an int to inlet 1 to set the visual tract length. This value must always be equal to the tract processor's internal "n" param value. The GUI will adjust the n value of the tract processor automatically when connected, so you don't need to send a separate message for each object.
- Outlet 1 should be connected to inlet 1 of ```[gen~ tract_processor]``` to allow the GUI to control vocal tract param values automatically.
- Print/view messages from outlets 2 and 3 to see tongue and constriction positions, respectively, when changed.

### Using non-glottal audio source
The audio processes of the original Pink Trombone glottis and tract objects have been split into separate modules. By default, the glottis processor produces a glottal signal which is fed into the tract processor for filtering. However, you can replace the glottal signal with any other audio source to create a vocoder-like effect, without the need for a separate vocal signal. You can make any audio source talk, using the GUI to change the filter or by simulating mouse interaction using the tract processor param values. To replace the glottal source with your own audio source:
- Disconnect outlet 1 of ```[gen~ glottis_processor]```. It will remain unconnected.
- Connect your custom audio source and outlet 2 of the glottis processor to the 2 inlets of a ```[+~]``` object.
- Connect the outlet of ```[+~]``` to inlet 1 of ```[gen~ tract_processor]```.
You will no longer have as much control over the "tenseness" of your audio source (although you can certainly simulate it, probably using lowpass filters), but you will now be able to create speech using your custom audio source by manipulating the tract processor the same way you would before.

### Buffers
Pink Trombone uses many internal Float64Arrays in the calculation of audio sample values. In Max, most of these Float64Arrays are re-created using gen ```Data``` operators and Max buffers. The only 2 buffers you should ever write values to manually are ```[buffer~ diameter]``` and ```[buffer~ targetDiameter]```, which specify the shape of the vocal tract. ```[buffer~ diameter]``` contains the "current" tract diameters, while ```[buffer~ targetDiameter]``` stores a set of target values. The values in each index of diameter ramp smoothly towards the corresponding value in targetDiameter to prevent pops in the produced sound. To manipulate the vocal tract manually (waveshaping?, etc.):
- Write values to ```[buffer~ targetDiameter]```. Observe in ```[jsui]``` how the current values ramp smoothly towards the new values.
- Alternatively, write values to ```[buffer~ diameter]``` to set the current diameter values instantly with no ramp if you'd like, though this may result in audio pops. __You must ALSO write the same values to targetDiameter or they'll just return to their previous values.__
- Be aware! Setting diameter values directly may result in tract shapes that are neither achievable in the original Pink Trombone GUI nor producible naturally in a human mouth. This may cause unnatural-sounding "speech" patterns.

## Notice
This patch is based heavily and exclusively on the original [Pink Trombone](https://dood.al/pinktrombone/), created by Neil Thapen and released under the [MIT License](https://opensource.org/license/mit). A copy of the original code and the license are included in this repository [here](https://github.com/yonatanrozin/Max-Pink-Trombone/blob/main/Pink_Trombone_Original.html).