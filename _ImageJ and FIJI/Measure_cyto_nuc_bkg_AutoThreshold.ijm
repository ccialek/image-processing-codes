//2019 03 02
//Requires a 2-channel 1-z 1-frame image

macro "Trying to batch macro automate accumulation per cell analysis" { 
	//Change "macro" to "function" (above) when making a batch
	imageID=getTitle; //from my macros for non-batch (??)
	// imageID = getImageID(); //From batch function
	print(imageID);
	run("Duplicate...", "duplicate");
	selectImage(imageID);
	run("Split Channels");

	//Turn the channels into variables... 
	imageIDc1 = "C1-" + imageID;
	imageIDc2 = "C2-" + imageID;

	//Take intensities of background in both channels at 2 differnet corners...
	selectImage(imageIDc1);
	makeRectangle(0, 0, 50, 50);
	run("Measure");
	makeRectangle(0, 462, 50, 512);
	run("Measure");
	makeRectangle(0, 0, 512, 512);
	//bkgdc1a = getResult("Mean");
	selectImage(imageIDc2);
	makeRectangle(0, 0, 50, 50);
	run("Measure");
	makeRectangle(0, 462, 50, 512);
	run("Measure");
	//bkgdc1b = getResult("Mean");
	makeRectangle(0, 0, 512, 512);	


	selectImage(imageIDc1); //choose the channel you want to make a mask of
	makeRectangle(0, 0, 512, 512);

	//make cyto mask...
	run("Duplicate...", " ");
	run("Gaussian Blur...", "sigma=2");   // Blur your image to get better selection
	//run("Auto Threshold", "method=Default white");
	setAutoThreshold("Huang");
	//run("Create Selection");
	//run("Make Inverse");
	run("Create Mask");
	run("Create Selection");
	run("Make Inverse");
	roiManager("Add");
	cytomask=getTitle;
	//optional: save mask here?
	//close();
	//close();


	//make nuc mask...
	selectImage(imageIDc1); //choose the channel you want to make a mask of
	//makeRectangle(0, 0, 512, 512);
	roiManager("Deselect");
	run("Duplicate...", " ");
	run("Gaussian Blur...", "sigma=2");   // Blur your image to get better selection
	run("Auto Threshold", "method=Default white");
	run("Create Selection");
	run("Make Inverse");
	roiManager("Add");
	nucmask=getTitle;
	//optional: save mask here?
	//close();
	//close();
	
	//msr nuc and cyto in channel1 img: 
	selectImage(imageIDc1);
	roiManager("Select", 0);
	run("Measure");
	roiManager("Select", 1);
	run("Measure");
	
	
	//msr nuc and cyto in channel2 img: 
	selectImage(imageIDc2);
	roiManager("Select", 0);
	run("Measure");
	roiManager("Select", 1);
	run("Measure");


	//clean up...
	roiManager("Deselect");
	//roiManager("Delete");
	//add closing windows
	selectImage(nucmask);
	//close();
	selectImage(cytomask);

	//close channels: 
	selectImage(imageIDc1);
	close();
	selectImage(imageIDc2);
	close();
	//selectImage(imageID);
	close();


	close();
	close();
	close();
}