Fixing the arrangement of pictures that got messed up from FIXIE misfiring problem (happened when I was testing out the long timeframe code for the first time, ONE TIME problem hopefully!) 
(1) Run this code on all images in file
(2) Run accompanying imagej macro to give the pictures channels (I couldn't figure out how to do this in imagej...)

1: Finding messy files:


myMessyFiles = 
  FileNames["MAX_TL*", 
   "/Volumes/MINI 1/temp_to_tansfer20171115_16_TA and TL 14h/"];
Length@myMessyFiles

20

mymovie = myMessyFiles[[20]]

"/Volumes/MINI 1/temp_to_tansfer20171115_16_TA and TL \
14h/MAX_TL44_dies_early_mess.tif"

If[DirectoryQ@(DirectoryName[mymovie] <> "Fixed_mess/") == False, 
  CreateDirectory@(DirectoryName[mymovie] <> "Fixed_mess/")];
analysisFolder = 
  DirectoryName[mymovie] <> "Fixed_mess/" <> 
   StringDrop[StringDelete[mymovie, DirectoryName[mymovie]], -4];

2: Fixing messy files:


myColMovie = Import[mymovie] // Partition[#, 3] & // Transpose;
myReds = myColMovie[[1, All]];
myGreens = {
    Table[myColMovie[[All, j]]; 
     a = (PixelValue[myColMovie[[2, j]], Table[{i, i}, {i, All, All, 1}]] // 
        Median );
     b = (PixelValue[myColMovie[[3, j]], Table[{i, i}, {i, All, All, 1}]] // 
        Median) ;
     If[a >= b, myColMovie[[2, j]] , myColMovie[[3, j]] ],
     {j, 1, 28, 1}]
    } // Flatten;
myBlues = {
    Table[myColMovie[[All, j]]; 
     a = (PixelValue[myColMovie[[2, j]], Table[{i, i}, {i, All, All, 1}]] // 
        Median );
     b = (PixelValue[myColMovie[[3, j]], Table[{i, i}, {i, All, All, 1}]] // 
        Median) ;
     If[a <= b, myColMovie[[2, j]] , myColMovie[[3, j]] ],
     {j, 1, 28, 1}]
    } // Flatten;
myColMovieFixed = {myReds, myGreens, myBlues};
Export[analysisFolder <> "_fixed.tif", myColMovieFixed // Flatten, "TIFF"]

"/Volumes/MINI 1/temp_to_tansfer20171115_16_TA and TL \
14h/Fixed_mess/MAX_TL44_dies_early_mess_fixed.tif"

