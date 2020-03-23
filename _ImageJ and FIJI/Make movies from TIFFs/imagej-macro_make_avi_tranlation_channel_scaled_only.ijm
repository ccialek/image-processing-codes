/*
 * Macro template to process multiple images in a folder
 */

#@ File (label = "Input directory", style = "directory") input
#@ File (label = "Output directory", style = "directory") output
#@ String (label = "File suffix", value = ".tif") suffix


processFolder(input);

// function to scan folders/subfolders/files to find files with correct suffix
function processFolder(input) {
	list = getFileList(input);
	list = Array.sort(list);
	for (i = 0; i < list.length; i++) {
		if(File.isDirectory(input + File.separator + list[i]))
			processFolder(input + File.separator + list[i]);
		if(endsWith(list[i], suffix))
			processFile(input, output, list[i]);
	}
}

function processFile(input, output, file) {
	//This function runs on each file sequentially
	
	open(input+"/"+file);
	newImgID = getTitle; 
	print(newImgID);
	run("Split Channels");
	close();
	run("Fire");
	run("AVI... ", "compression=JPEG frame=6.5 save=/Users/ccialek/Desktop/test/"+newImgID+".avi");
	close();
	close();
	
	print("Processing: " + input + File.separator + file);
	print("Saving to: " + output);
	//The log shows each file opened, closed, saved 
}
