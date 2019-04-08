# User Information on running ImageJ / FIJI codes 

### 1. create_substack.ijm 

**Purpose:** Post-processing all of the images in a folder to make a substack of the first 24 timepoints. 

**Input file:** RGB 3-channel microscopy images from FIXIE, may have varying frame lengths of movies 

**Output file:** RGB 3-channel microscopy images of the same length (24 frames) 

**Run the code:**

  **->** Copy all text in `create_substack.ijm ` 

  **->** Paste into macro batch window (to open, `FIJI -> Process -> Batch -> Macro...`) 

  **->** Select appropriate input and output directories 

  **->** *Note:* To avoid errors, add a `File name contains: ` to select only certian files (ex: .tif) 

  **->** Hit `Run` 




### 2. imagej-post-processing-1221.ijm

**Purpose:** Post-processing 3-color images from FIXIE microscope in a click. The microscope in the Stasevich lab 
     exports 3-color images as 2-color integrated image stacks (3 channels in RGB and a 4th extra channel). This 
     code turns these images into a 3-color image, discarding the extra 4th channel. 

**Input file:** 3-channel unprocessed microscopy images from FIXIE with Z and time information 

**Output file:** RGB processed image with Z and time information 

**Run the code:**

  **->** Load the macro into ImageJ or FIJI (drag and drop) 

  **->** Hit `Run` or ctrl+r / command+r for PC/mac 
