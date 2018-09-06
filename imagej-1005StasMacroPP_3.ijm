macro "Stasevich Post-Processing" {
	//This code post-processes a three-dimensional video. 
	//The end result is that .tiff plus a MaxZ .tiff open in the program. 
	
	
	//setBatchMode(true);

	newImg=getTitle;
	run("Make Substack...", " channels=1 slices=2-26-2"); 
	run("Enhance Contrast", "saturated=0.35");
	//run("Make Substack...", " channels=1 slices=2–26-2”); 
	Wred=getTitle;

	selectWindow(newImg);
	run("Make Substack...", "channels=2 slices=1-26-2");
	run("Enhance Contrast", "saturated=0.35");
	Wgreen=getTitle;

	selectWindow(newImg);
	run("Make Substack...", "channels=2 slices=2-26-2");
	run("Enhance Contrast", "saturated=0.35");
	Wblue=getTitle;

	run("Merge Channels...", "red=[" + Wred + "] green=[" + Wgreen + "] blue=[" + Wblue + "] gray=*None*");

	//run("Stack to Hyperstack...", "order=xyczt(default) channels=3 slices=13 frames=36 display=Composite");
	newimgID = getImageID();

	//print("Congratulations")
	}
	