# Instructions on running ImageJ / FIJI codes 

### 1. create_substack.ijm 

**Purpose:** Post-processing 3-color images from FIXIE microscope in a click. The microscope in the Stasevich lab 
     exports 3-color images as 2-color integrated image stacks (3 channels in RGB and a 4th extra channel). This 
     code turns these images into a 3-color image, discarding the extra 4th channel. 

**Input file:** 3-channel unprocessed microscopy images from FIXIE with Z and time information 

**Output file:** RGB processed image with Z and time information 

**Run the code:**

**->** Load the macro into ImageJ or FIJI (drag and drop) 

**->** Hit "Run" or ctrl+r / command+r for PC/mac 
