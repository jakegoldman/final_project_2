Jerome Freudenberg
Jake Goldman

Team Name: The Goldbergs

Algorithm cred to Michael J. McGuffin; retrieved from http://profs.etsmtl.ca/mmcguffin/research/2012-mcguffin-simpleNetVis/mcguffin-2012-simpleNetVis.pdf

Libraries used: controlp5

Features/Bugs (as of 6/8/17):

Features:
-Visualization works
-zoom in on mouse using mousewheel (rest with 'r' key)
-highlight a node by mousing over; also displays protein name
-quit program with 'q' key


Bugs:
-Sometimes nodes are pushed too far against edge of screen

-****Computation increases after program runs for a longer time, especially with
	     the larger clusters.**** (but only on Jerome's computer?)
	     
-the mouse coordinates do not translate with the zoom


Development Log (as of 6/8/17):

6/2/17: Finalized plan together in class

6/3/17: Jerome worked on class skeleton and outlined the classes Node, Network, and the main

6/4/17: Jake examined the class skeleton and noted some problems and concerns

6/5/17: We discussed the skeleton in class

6/5/17: Jake added Edge class into skeleton and reworked class structure

6/6/17: Jake started and Jerome finished a program to create a new file that
	consolidates the data. Jake made a binary search tree to make traversing
	nodes easier. Also finalized the program's structure.

6/7/17: Jake succeeded in getting the information read from the file, but the
	program does not run.

6/8/17: Jerome fixed numerous bugs that were preventing the program from running
	At this point it runs, but computation increases with time.
	Jerome added a zoom feature.
	Jerome added a highlight with protein name when mouseover feature.

6/9/17: Jake modified display so that nodes appear on top of edges.

6/11/17: Jerome added sliders using the controlp5 library.