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
  
  void display() {
    stroke(255,140,0);
    strokeWeight(2);
    line(n1.pos.x, n1.pos.y, n2.pos.x, n2.pos.y);
  }
  
  
  
  void calcSpringForce(){
    float x = Ks * ( (n1.pos.x - n2.pos.x) - restLength );
    float y = Ks * ( (n1.pos.y - n2.pos.y) - restLength );
    n1.springForce = new PVector(x,y);
    n2.springForce = new PVector(-x,-y);
    //Fs = Ks (d - L)
  }
  
  
  public String toString(){
    return "" + n1 + " " + n2;
  }
  
}