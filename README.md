Jerome Freudenberg and Jake Goldman

Period 6

*Team Name*: The Goldbergs

Algorithm credits go to Michael J. McGuffin; retrieved from http://profs.etsmtl.ca/mmcguffin/research/2012-mcguffin-simpleNetVis/mcguffin-2012-simpleNetVis.pdf

Libraries used: controlp5

Important Notes:
- Only critical components are in our UML diagram (no helpers or visual elements)



**Brief Description**:

    Our project is a protein network visualization. The journal Nature published an article on May 17 titled *Architecture of the human
interactome defines protein communities and disease networks* (http://www.nature.com/nature/journal/v545/n7655/full/nature22366.html). The
paper examines a variety of protein interactions and includes a dataset of around 56,000 examples. The paper also details 1320 clusters of these proteins, grouping them together based on shared traits. Our project will allow the user to visualize any of the individual protein clusters.
    The first aspect of our project is a Java program that takes in the two complex datasets (named ProteinInteractionList.csv and
cluster.csv) and converts them into one, easily readable dataset to be used with the main program. The next part is a Processing program
that reads the new dataset and represents it visually using a Force-Node algorithm, in which each protein is represented as a node and 
each interaction as an edge. The point of this model is to visualize the data in an easy-to-comprehend way. Each node starts at a random 
position, and then adjusts its position according to several forces. The edges are modeled as springs, with a spring constant and rest 
length, and apply an attractive force onto their nodes. However, every node exerts a repelling force on each other node, also based on a 
constant. This creates a model in which, over time, the nodes gradually move towards an ideal position until they reach equilibrium.




**Features/Bugs** (as of 6/11/17):

*Features*:

-Working Visualization

-Zoom Function using the mouse wheel (press 'r' to return to normal)

-Mousing over a node highlights it and displays its name

-Quit the program with the 'q' key

-Sliders in the top left corner can be used to modify the constants used in the model (warning: this can drastically affect the model)

-Search feature allowing the user to search for a specific protein. This highlights the node, displays its name, and highlights its edges as well.

-Choose a cluster using the cluster textbox (the default is cluster 70)

-Pause all movement using the spacebar (other features still work)


*Bugs*:

-Sometimes nodes are pushed too far against edge of screen

-The mouse coordinates do not translate with the zoom (this means highlighting doesn't work when using zoom)

-The protein name is displayed underneath edge making it hard to read

-We have not yet found a combination of constants that causes the system to reach equilibrium. Feel free to experiment with the sliders in an attempt to fix this bug (please let us know if you do...)

-After the sliders are used, the initial position cannot be restored

-Nodes can behave unpredictably when they colide



**Directions on compiling code**:

1. Install controlp5 library
2. Run processing sketch (make sure it is the latest version: v1)
3. Examine network



**Instructions on using program**:

1. Press run and the network will appear
2. Hover over a node to see the protein name
3. Scroll/mousewheel to zoom in and out
4. The first slider on the top left adjusts the repel force (will push nodes farther apart).
5. The second slider adjusts the spring force (will pull nodes closer together).
6. Use the first textbox to search for a specific protein within the cluster.
7. If you want to reset the zoom and forces press the 'r' key.
8. If you want to pause all movement, press spacebar
9. If you want to quit the program, press 'q'.
10. If you want to examine a different cluster, use the textbox and pick a different number. Cluster 1 is the largest one (76 proteins) and cluster 1320 is the smallest (3 proteins).





**Development Log** (as of 6/11/17):

6/2/17: Finalized plan together in class

6/3/17: Jerome worked on class skeleton and outlined the classes Node, Network, and the main

6/4/17: Jake examined the class skeleton and noted some problems and concerns

6/5/17: We discussed the skeleton in class

6/5/17: Jake added Edge class into skeleton and reworked class structure

6/6/17: Jake started and Jerome finished a program to create a new file that
	consolidates the data. Jake made a binary search tree to make traversing
	nodes easier. Also finalized the program's structure.

6/7/17: Jake got the program to read in the dataset and initialize the proteins/edges

6/8/17: Jerome fixed numerous bugs that were preventing the program from running
	At this point it runs, but computation increases with time.
	Jerome added a zoom feature.
	Jerome added a highlight with protein name when mouseover feature.

6/9/17: Jake modified display so that nodes appear on top of edges.

6/11/17: Jerome added force sliders and search feature using the controlp5 library.

6/11/17: Jake modified the visual layout, added cluster switching, and added a pause feature.
		 Jake created a new UML diagram to better reflect our final project.
