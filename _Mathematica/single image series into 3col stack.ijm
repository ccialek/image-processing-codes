myimg=getTitle;

run("Make Substack...", "  slices=1");
selectWindow( myimg);
run("Make Substack...", "  slices=2");
selectWindow(myimg);
run("Make Substack...", "  slices=3");
run("Merge Channels...", "c1=[Substack (1)] c2=[Substack (2)] c3=[Substack (3)] create");