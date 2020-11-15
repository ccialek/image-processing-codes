macro "20f color combine" {
	//Post-processes a FLEXIE *UN-ARMED* piezo Z-stack image
	//This code post-processes a three-dimensional video. 
	//The end result is that .tiff plus a MaxZ .tiff open in the program. 
	
	
	//setBatchMode(true);

	newImg=getTitle;
	run("Make Substack...", "  slices=1-60-3");
	run("Enhance Contrast", "saturated=0.35");
	Wred=getTitle;
	
	newImg=getTitle;
	run("Make Substack...", "  slices=2-60-3");
	run("Enhance Contrast", "saturated=0.35");
	Wgrn=getTitle;
	
	newImg=getTitle;
	run("Make Substack...", "  slices=3-60-3");
	run("Enhance Contrast", "saturated=0.35");
	Wblu=getTitle;

	run("Merge Channels...", "red=[" + Wred + "] green=[" + Wgreen + "] blue=[" + Wblue + "] gray=*None*");
	run("Re-order Hyperstack ...", "channels=[Channels (c)] slices=[Frames (t)] frames=[Slices (z)]");
}