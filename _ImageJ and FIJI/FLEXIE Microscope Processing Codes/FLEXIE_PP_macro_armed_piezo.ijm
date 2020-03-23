macro "Stasevich Post-Processing" {
	//Use this code for *FULL-SPEED* FLEXIE imaging imaged with an armed piezo
	//This code post-processes a three-dimensional video. 
	//The end result is that .tiff plus a MaxZ .tiff open in the program. 
	
	frames = 50
	channels = 3
	slices = 11
	//change this input as needed. Don't change x or w. 
	
	x = frames * slices
	w = x * slices
	//print(w)
	aslice = " + 4 + "
	
	//W + color is the name of a window that slices out just that channel.
	
	Wred=getTitle;
	run("Make Substack...", " channels=1 slices="aslice""); 
	//run("Make Substack...", " channels=1 slices=4-[" + w + "]-2"); 
	Wgreen=getTitle;
	run("Make Substack...", " channels=2 slices=3-"w"-2"); 
	Wblue=getTitle;
	
	run("Make Substack...", " channels=2 slices=4-w-2"); 
	run("Merge Channel…", "red=[" + Wred + "] green=[" + Wgreen + "] blue=[" + Wblue + "] gray=*None*");
	
	//at this point, the three channels should be merged together... 
	//run("Stack to Hyperstack...", "order=xyczt(default) channels=1 slices=" + channels + " frames=" + x + " display=Color");
	newimgID = getImageID();
	//run("Re-order Hyperstack ...", "channels=[Slices (z)] slices=[Channels (c)] frames=[Frames (t)]");
	run("Stack to Hyperstack...", "order=xyczt(default) channels=3 slices="
		+ slices + " frames=" + frames + " display=Composite");
	newimgID = getImageID();
	print("Processing complete")
	}
	