class Node {
  PVector pos; //position
  Node[] neighbors; //nodes it is connected to
  String protein;
  
    Node(String name, int x, int y) {
    pos = new PVector (x, y);
    pos.x = 0;
    pos.y = 0;
    protein = name;
  }
  
  void repel(Node other) {
    //repel force
  }
    
    
  }
  
  
  
  
}