// Processing macro code for formatting images from the Confocal scope images 
// from SlideBook 
//
// Reorder a tif image with 13z and 4ch 
// (NOTE: Any time information needs to be averaged beforehand)  
// (This can be done in a mathematica code, or by using a single-timepoint image) 


macro "confocal" {
	z=15;
	run("Stack to Hyperstack...", "order=xyczt(default) channels=4 slices=13 frames=1 display=Composite");
	newImg=getTitle;
	
	run("Make Substack...", "channels=1 slices=1-" + z);
	run("Enhance Contrast", "saturated=0.01");
	//setMinAndMax(1300, 55000);
	Wred=getTitle;

	selectWindow(newImg);
	run("Make Substack...", "channels=2 slices=1-" + z);
	run("Enhance Contrast", "saturated=0.01");
	Wgreen=getTitle;

	selectWindow(newImg);
	run("Make Substack...", "channels=3 slices=1-" + z);
	run("Enhance Contrast", "saturated=0.01");
	Wblue=getTitle;

	//selectWindow(newImg);
	//run("Make Substack...", "channels=4 slices=1-" + z);
	//run("Enhance Contrast", "saturated=0.0001");
	//Wpurp=getTitle;

	run("Merge Channels...", "red=[" + Wred + "] green=[" + Wgreen + "] blue=[" + Wblue + "] gray=[" + Wpurp + "]");

	newImg=getTitle;
	close();
}