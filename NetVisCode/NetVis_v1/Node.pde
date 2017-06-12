class Node implements Comparable<Node> {
  
  String protein;
  PVector pos; //position
  PVector repForce; // sum of repelling force from all other nodes
  float Kr; // constant for the repForce
  PVector springForce; // spring force to act on it
  color inside;
  boolean highlighted; //if selected
  int size;
  
  
  Node(String name, int x, int y, float Kr) {
    //println(x);
    pos = new PVector (x, y);
    println(pos);
    protein = name;
    this.Kr = Kr;
    repForce = new PVector(0,0);
    springForce = new PVector(0,0);
    inside = color(128,0,128);
    size = 15;
    //println(pos.x);
  }
  
  
  void display() {
    fill(inside);//color
    stroke(inside);
    if (highlighted) {
      fill(50, 255, 50);
    }
    //println(pos);
    ellipse(pos.x, pos.y, size, size); //10 is the size
    if (highlighted) {
      highlight();
    }
    //println(pos.x);
  }
  
  void update() {
    //if (repForce.x + repForce.y < 0.0001 && 
      //  springForce.x + springForce.y < 0.0001) {
     // return;
    //}
    pos = pos.add(repForce);
    pos = pos.add(springForce);
    if(pos.x < 0) {
      pos.x = 0;
    }
    if(pos.x > width) {
      pos.x = width;
    }
    if(pos.y < 0) {
      pos.y = 0;
    }
    if(pos.y > height) {
      pos.y = height;
    }
    //if(toHighlight) {
      float dx = (mouseX - tX) - (pos.x);
      float dy = (mouseY - tY) - (pos.y);
      inside = color (128, 0, 128);
      if (abs(dx) < size/2.0 &&
          abs(dy) < size/2.0) {
            highlight();
          }
    //}
  }
 
  
  PVector repel (Node other) {//calculates repel force
    PVector ans = new PVector(10,10);
    float dx = other.pos.x - pos.x;
    //println(other.pos.x);
    //println(pos.x);
    float dy = other.pos.y - pos.y;
    if (dx != 0 || dy != 0) {
      float distance = getDist(other);
      ans.x = (Rep_Force / (distance * distance)) * dx/distance;
      //println("ansx" + ans.x);
      ans.y = (Rep_Force / (distance * distance)) * dy/distance;
      //println("ansy" + ans.y);
    }
    else {
      //println("dx or dy was 0");
    }
    return ans;
  }
  
  
  public String toString(){
    return protein;
  }
  
  
  public int compareTo(Node other){
    return protein.compareTo(other.protein);
  }
  
  
  float getDist(Node other) {
    return pos.dist( other.pos );
  }
 
  int getDegree() {
    //return numConnections
    return 0;
  }
  
  void highlight() {
     inside = color(50, 255, 50);
     fill(0);
     text(protein,pos.x + size + 2, pos.y + size + 2);
  }
  
  
  
}