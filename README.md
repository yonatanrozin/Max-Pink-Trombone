# Max-Trombone
A headless port of the fantastic Pink Trombone vocal synthesizer for Max/MSP.

__This port is still incomplete! Glottis vibrato, fricative noise, transients, targetDiameter not yet implemented.__

## Usage
- Simply ```git clone``` this repo into a local folder of your choice
- "root" patch is [```Max_Trombone.maxpat```](https://github.com/yonatanrozin/Max-Trombone/blob/main/Max_Trombone.maxpat). Simply open it and enable audio or incorporate it into an existing patch!

## Features
- Glottis and Tract are now separate modules. You can EQ the raw glottal output to create voices with different timbral properties (feminine voices, etc.), or use a different audio source entirely to use the Tract module as a "vocoder".
