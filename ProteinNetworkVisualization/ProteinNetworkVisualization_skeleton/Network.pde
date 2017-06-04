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
    //Fr = Kr/d^2
  }
  
  void springForce() {
    //for every node:
    //spring force between neighbors
    //Fs = Ks(d - L);
    
    
  }
  
  
  
  
  
  
}