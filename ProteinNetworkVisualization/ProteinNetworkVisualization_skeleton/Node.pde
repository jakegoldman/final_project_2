class Node {
  PVector pos, rForce; //position and repel force
  Edge[] neighbors; //nodes it is connected to
  int degreeOfConnectivity; //# of connections
  Node[] all; //
  
  
  
  Node(int x, int y) {
    pos = new PVector (x, y);
    pos.x = 0;
    pos.y = 0;
  }
  
  void repel(Node other) {
    //repel force
  }
    
    
  }
  
  
  
  
}