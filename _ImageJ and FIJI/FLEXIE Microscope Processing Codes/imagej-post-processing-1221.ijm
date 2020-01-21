macro "1221PP" {

	//This code post-processes a three-dimensional video. 
  //Videos created by FIXIE have 2 channels for the readouts of the two cameras, 
  //making 2 frames per timepoint and adding a blank image in red when no laser is firing.
  //This code sorts out the FIXIE image data and the end result is 
  //a 3 color image (with Z information) and a MaxZ projection.
  //NOTE: Don't use the MaxZ projection if you can reduce background by making a 
  //min-MAX, taking fewer than the total image's Z frames for the MaxZ. 
  
	//The end result is that .tiff plus a MaxZ .tiff open in the program. 
	//USE FOR 20f videos for fast imaging!!!! 
  
  //USER INFO: 
  //Change "slices=' to fit your specific imaging, if different.
	
	
	newImgID = getTitle; 
	run("Make Substack...", " channels=1 slices=4-522-2"); 
	Wred = getTitle;
	
	selectWindow(newImgID);
	run("Make Substack...", " channels=2 slices=3-522-2"); 
	Wgreen = getTitle; 
	
	selectWindow(newImgID);
	run("Make Substack...", " channels=2 slices=4-522-2"); 
	Wblue = getTitle; 

	run("Merge Channels...", "red=[" + Wred + "] green=[" + Wgreen + "] blue=[" + Wblue + "] gray=*None*");
	//at this point, you have a merged 3-color 13z. 
	run("Enhance Contrast", "saturated=0.35");
	selectWindow("Merged");
	run("Z Project...", "projection=[Max Intensity] all");
	
	//saveAs("Tiff", "E:\\Experiments\\20171221_TA_TL_Intensities\\temp.tif");
