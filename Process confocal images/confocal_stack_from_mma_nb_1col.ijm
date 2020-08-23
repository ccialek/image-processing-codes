// Processing macro code for formatting images from the Confocal scope images 
// from SlideBook 
//
// Reorder a tif image with 13z and 4ch 
// (NOTE: Any time information needs to be averaged beforehand)  
// (This can be done in a mathematica code, or by using a single-timepoint image) 

macro "confocal" {
	run("Stack to Hyperstack...", "order=xyczt(default) channels=4 slices=13 frames=1 display=Composite");
	newImg=getTitle;

	selectWindow(newImg);
	run("Make Substack...", "channels=2 slices=1-13");
	run("Enhance Contrast", "saturated=0.01");
	Wgreen=getTitle;

	run("Merge Channels...", "red=[none] green=[" + Wgreen + "] blue=[none] gray=[none]");

	newImg=getTitle;
	close();
}