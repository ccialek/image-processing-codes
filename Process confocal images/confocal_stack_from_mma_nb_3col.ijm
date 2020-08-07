// Processing macro code for formatting images from the Confocal scope images 
// from SlideBook 
//
// Reorder a tif image with 13z and 4ch 
// (NOTE: Any time information needs to be averaged beforehand)  
// (This can be done in a mathematica code, or by using a single-timepoint image) 


macro "confocal" {
	z=15;
	newImg=getTitle;
	run("Make Substack...", "  slices=1-75-3");
	run("Enhance Contrast", "saturated=0.35");
	Wred=getTitle;
	
	selectWindow(newImg);
	run("Make Substack...", "  slices=2-75-3");
	run("Enhance Contrast", "saturated=0.35");
	Wgreen=getTitle;
	
	selectWindow(newImg);
	run("Make Substack...", "  slices=3-75-3");
	run("Enhance Contrast", "saturated=0.35");
	Wblue=getTitle;
	
	run("Merge Channels...", "c1=[" + Wred + "] c2=[" + Wgreen + "] c3=[" + Wblue + "] create");
	//run("Brightness/Contrast...");

	myImg=getTitle;
	//close();
}