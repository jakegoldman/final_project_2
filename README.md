Jerome Freudenberg

Jake Goldman

Period 6

*Team Name*: The Goldbergs

Algorithm cred to Michael J. McGuffin; retrieved from http://profs.etsmtl.ca/mmcguffin/research/2012-mcguffin-simpleNetVis/mcguffin-2012-simpleNetVis.pdf

Libraries used: controlp5


**Brief description**:

Our project is a protein network visualization. The journal Nature published an article on May 17 titled Architecture of the human interactome defines protein communities and disease networks. (http://www.nature.com/nature/journal/v545/n7655/full/nature22366.html) The paper examines protein interaction and includes a dataset of around 56000 proteins interactions with each other. The paper also details 1320 clusters of these proteins, which we visualized, since the entire dataset was too large to compute. Our program lets the user choose a cluster and examine the network graph of that cluster, with various interactive features.




**Features/Bugs** (as of 6/8/17):

Features:

-Visualization works

-zoom in on mouse using mousewheel (reset with 'r' key)

-highlight a node by mousing over; also displays protein name

-quit program with 'q' key

-modify force constants in top left corner using sliders

-search for a specific protein in textbox (make sure it is uppercase). This highlightes the node, displays its name, and highlights the edges as well.


Bugs:

-Sometimes nodes are pushed too far against edge of screen

-****Computation increases after program runs for a longer time, especially with
	     the larger clusters.**** (but only on Jerome's computer?)
	     
-the mouse coordinates do not translate with the zoom

-modifying sliders will make it move rapidly without slowing down

-protein name is displayed underneath edge making it hard to read




**Directions on compiling code**:

1. Install controlp5 library
2. Run processing sketch (make sure it is the latest version: v1)
3. Examine network



**Instructions on using program**:

1. Press run and the network will appear
2. Hover over node to see protein name
3. Scroll/mousewheel to zoom in and out
4. The first slider on the top left adjusts the repel force (nodes farther apart).
5. The second slider adjusts the spring force (nodes closer together).
6. Use the textbox to search for a specific protein.
7. If you want to reset the zoom and forces press the 'r' key.
8. If you want to quit the program, press 'q'.
9. If you want to examine a different cluster, go into the code and change the variable clusternum in the setup function (line 22).






**Development Log** (as of 6/11/17):

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

6/11/17: Jerome added force sliders and search feature using the controlp5 library.