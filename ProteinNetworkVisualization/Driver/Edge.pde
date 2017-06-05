class Edge{
  
  Node n1, n2; // two nodes for the edge
  float Ks; // spring constant
  float restLength;
  
  Edge(Node a, Node b, float Ks, float restLength){
    n1 = a;
    n2 = b;
    this.Ks = Ks;
    this.restLength = restLength;
    calcSpringForce();
  }
  
  
  void calcSpringForce(){
    float x = Ks * ( (n1.pos.x - n2.pos.x) - restLength );
    float y = Ks * ( (n1.pos.y - n2.pos.y) - restLength );
    n1.springForce = new PVector(x,y);
    n2.springForce = new PVector(-x,-y);
  }
  
  
  
}