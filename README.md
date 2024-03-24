# Max-Trombone
A headless Max/MSP port of the fantastic [Pink Trombone](https://dood.al/pinktrombone/) vocal synthesizer.

__This port is still incomplete! Transients not yet implemented.__

## Usage
- Simply ```git clone``` this repo into a local folder of your choice
- "root" patch is [```Max_Trombone.maxpat```](https://github.com/yonatanrozin/Max-Trombone/blob/main/Max_Trombone.maxpat). Simply open it and enable audio or incorporate it into an existing patch!
- Use the [kslider] or [pictslider] at the top to manipulate the pitch and intensity of the generated voice. This will behave identically to the horizontal "keyboard" at the bottom of the original Pink Trombone interface.
- The original GUI has been re-created in the [jsui] object, and can be interacted with identically with the mouse.
- Alternatively, manipulate the tract diameters array directly by clicking around the [waveform] object or by manually writing values to [buffer~ targetDiameter]. This will create value sets that are not producible in the original Pink Trombone interface and not naturally reproducible in the human mouth, which may lead to unnatural-sounding voice timbres.

## Patch details
### [p Glottis]
- Inlet 1 (signal) sets frequency
  - Use sine waves (or any other values oscillating around 1) to create vibrato effects.
- Inlet 2 (float 0-1) sets voice tenseness
  - 0 is a whisper, 1 is strained, "natural" sound is around 0.6
- Outlet 1 (signal) is the raw glottal signal, before being filtered by the tract.
  - Route this signal through an EQ (or experiment with other effects) to create voices with different timbres (feminine voices, etc.)
- Outlet 2 (signal) is the noise modulator value. This should be connected directly to inlet 2 of [p Tract].
### [p Tract]
- Inlet 1 (signal) should receive the glottal output from [p Glottis].
  - Or, input any other audio signal to apply vocal tract filtering to it for a vocoder-like effect.
- Inlet 2 (signal) should receive the noise modulator from [p Glottis].
- Inlet 3 receives messages to manipulate certain vocal tract parameters:
  - ```n <int>``` sets vocal tract length. Default length is 44, while shorter lengths produce younger, more feminine voices (together with higher frequencies and optionally EQ on the raw glottal output)
  - ```tongue <float> <float>``` moves the "tongue".
 
## Notice
This patch is based heavily on the original [Pink Trombone](https://dood.al/pinktrombone/), created by Neil Thapen and released under the [MIT License].
