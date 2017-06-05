class Network {

  Node[] input;
  Node[] xSorted;
  Node[] ySorted;
  float Kr; //repel constant 
  float Ks; //spring constant
  float springL; //spring rest length

  Network(String fileName) {
    //scanner into input
    //random pos init for each Node
  }

  void repelForce() {
    //each node calls Node.repel() on every other node
  }

  void springForce() {
    //for every node:
    //spring force between neighbors
  }

  void update() {
    //update positions
    //using repelForce() and
    //springForce()
  }

  void highlightNode() {
    //mousePressed
    //compares xSorted to mouseX and ySorted to mouseY
    //uses binary search
  }

  void highlightHub() {
    //highlights nodes with most connections
  }
}