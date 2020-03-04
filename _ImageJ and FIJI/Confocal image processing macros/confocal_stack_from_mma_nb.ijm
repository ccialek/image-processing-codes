//Reorder a image with 13z and 4ch  
macro "confocal" {
	run("Stack to Hyperstack...", "order=xyczt(default) channels=4 slices=13 frames=1 display=Composite");
	newImg=getTitle;
	
	run("Make Substack...", "channels=1 slices=1-13");
	run("Enhance Contrast", "saturated=0.01");
	//setMinAndMax(1300, 55000);
	Wred=getTitle;

	selectWindow(newImg);
	run("Make Substack...", "channels=2 slices=1-13");
	run("Enhance Contrast", "saturated=0.01");
	Wgreen=getTitle;

	selectWindow(newImg);
	run("Make Substack...", "channels=3 slices=1-13");
	run("Enhance Contrast", "saturated=0.01");
	Wblue=getTitle;

	selectWindow(newImg);
	run("Make Substack...", "channels=4 slices=1-13");
	run("Enhance Contrast", "saturated=0.0001");
	Wpurp=getTitle;

	run("Merge Channels...", "red=[" + Wred + "] green=[" + Wgreen + "] blue=[" + Wblue + "] gray=[" + Wpurp + "]");

	newImg=getTitle;
	close();
}