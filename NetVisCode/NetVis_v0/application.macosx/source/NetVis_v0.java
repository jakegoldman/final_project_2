import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.Random; 
import java.util.Arrays; 
import java.util.Scanner; 
import java.io.FileNotFoundException; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class NetVis_v0 extends PApplet {

Network network;
float zoomFactor;
float tX, tY;
boolean toHighlight;


public void setup() {
  
  network = new Network(70);
  background(100);
  zoomFactor = 1;
  tX = 0;
  tY = 0;
}

public void draw() {
  background(100);
  pushMatrix();
  scale(zoomFactor);
  translate(tX, tY);
  network.update();
  popMatrix(); 
}

public void keyPressed() {
  if (key == 'q') {//quits program
    exit();
  }
  if (key == 'r') {//returns to default view
    zoomFactor = 1;
    tX = 0;
    tY = 0;
  }
}


public void mouseWheel(MouseEvent event) {//change degree of zoom towards mouse
  println("mouse be wheeling");
  float e = event.getCount();
  zoomFactor += e / 100.0f;
  tX = tX - e/100.0f * mouseX;
  tY = tY - e/100.0f * mouseY;
}

//void mouseClicked() {
//  toHighlight = true;
//}
class BinarySearchTree {

  class Nodule {
  
    Node data;
    Nodule left;
    Nodule right;
  
    Nodule(Node data){
      this.data = data;
    }
  }
  
  
  Nodule root;


  BinarySearchTree() {
  }
  
  

  public void add(Node prot){
    Nodule toAdd = new Nodule( prot );
    if( root==null ){
      root = toAdd;
      return;
    }
    
    Nodule current = root;
    Nodule parent = null;
    
    while(true){
      parent = current;
      if( prot.compareTo( current.data ) < 0 ){        
        current = current.left;
        if( current == null ){
          parent.left = toAdd;
          return;
        }
      } else {
        current = current.right;
        if( current == null ){
          parent.right = toAdd;
          return;
        }
      }
    }
  }
  
  

  public Node find(Node prot){
    Nodule current = root;
    while( current!=null ) {
      if( current.data.protein.equals(prot.protein) ) {
        return current.data;
      } else if( current.data.compareTo( prot ) > 0 ) {
        current = current.left;
      } else {
        current = current.right;
      }
    }
    return null;
  }
  
  
}
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
  
  public void display() {
    stroke(255,140,0);
    strokeWeight(1.4f);
    line(n1.pos.x, n1.pos.y, n2.pos.x, n2.pos.y);
  }
   
  
  public void calcSpringForce(){
    float x = Ks * ( (n1.pos.x - n2.pos.x) - restLength );
    float y = Ks * ( (n1.pos.y - n2.pos.y) - restLength );
    n1.springForce = n1.springForce.add(new PVector(-x/2,-y/2));
    n2.springForce = n2.springForce.add(new PVector(x/2, y/2));
    //Fs = Ks (d - L)
  }
  
  
  public String toString(){
    return "" + n1 + " " + n2;
  }
  
}





class Network{
  
  ArrayList<Node> nodes = new ArrayList<Node>();
  ArrayList<Edge> edges = new ArrayList<Edge>();
  float Kr = 1;
  float Ks = 0.00000001f;
  float restLength = 50;
 
  
  Network(int targetCluster){
    Table table = loadTable( "clusterNew.csv", "header" );
    
    // iterate through each row
    BinarySearchTree bst = new BinarySearchTree();
    for( TableRow row : table.rows() ){
      int cluster = row.getInt("cluster");
      if(cluster == targetCluster){   // if this interaction is within the cluster
        
        String p1 = row.getString("SymbolA");
        String p2 = row.getString("SymbolB");
        Random random = new Random();
        Node n1 = new Node( p1, 350 + random.nextInt(501), 100 + random.nextInt(501), Kr );
        //println(350 + random.nextInt(501));
        Node n2 = new Node( p2, 350 + random.nextInt(501), 100 + random.nextInt(501), Kr );
        
        Node bstRes1 = bst.find(n1); // the result of trying to find the node in the list of current nodes
        Node bstRes2 = bst.find(n2);
        
        if( bstRes1 == null && bstRes2 == null){
          bst.add(n1);
          bst.add(n2);
          nodes.add(n1);
          nodes.add(n2);
          edges.add( new Edge( n1, n2, Ks, restLength ) );
        } else if (bstRes1 == null){
          bst.add(n1);
          nodes.add(n1);
          edges.add( new Edge( n1, bstRes2, Ks, restLength ) );
        } else if (bstRes2 == null){
          bst.add(n2);
          nodes.add(n2);
          edges.add( new Edge( bstRes1, n2, Ks, restLength ) );
        } else {
          edges.add( new Edge( bstRes1, bstRes2, Ks, restLength) );
        }
        
      }
    }
    
    // System.out.println( nodes );
    // System.out.println( edges );
  }
  
  
  
  
  public void setRepForce() {
    for (int i = 0; i < nodes.size(); i++) {
      PVector repForce = new PVector(0,0);
      for (int j = 0; j < nodes.size(); j++) {
        if (nodes.get(i) != nodes.get(j)) {
          //println(repForce);
          repForce.add(nodes.get(i).repel(nodes.get(j)));
        }
      }
      nodes.get(i).repForce = repForce;
    }
  }
  
  
  public void setSpringForce(){
    //for( Edge e : edges ){
    for(int i = 0; i < edges.size(); i++) {
      edges.get(i).calcSpringForce();
    }
  }
  
  
  public void update(){
    background(100);
    setRepForce();
    setSpringForce();
    for( Node n : nodes ){
      println("repF" + n.repForce);
      println("repS" + n.springForce);
      n.update();
      n.display();
    }
    for( Edge e : edges ){
      e.display();
    }
  }
  
}
class Node implements Comparable<Node> {
  
  String protein;
  PVector pos; //position
  PVector repForce; // sum of repelling force from all other nodes
  float Kr; // constant for the repForce
  PVector springForce; // spring force to act on it
  int inside;
  Node[] neighbors; //nodes it is connected to
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
  
  
  public void display() {
    fill(inside);//color
    //println(pos);
    ellipse(pos.x, pos.y, size, size); //10 is the size
    //println(pos.x);
  }
  
  public void update() {
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
      if (abs(dx) < size/2.0f &&
          abs(dy) < size/2.0f) {
            inside = color(50, 255, 50);
            fill(0);
            text(protein,pos.x + size + 2, pos.y + size + 2);
          }
    //}
  }
 
  
  public PVector repel (Node other) {//calculates repel force
    PVector ans = new PVector(10,10);
    float dx = other.pos.x - pos.x;
    //println(other.pos.x);
    //println(pos.x);
    float dy = other.pos.y - pos.y;
    if (dx != 0 || dy != 0) {
      float distance = getDist(other);
      ans.x = (Kr / (distance * distance)) * dx/distance;
      println("ansx" + ans.x);
      ans.y = (Kr / (distance * distance)) * dy/distance;
      println("ansy" + ans.y);
    }
    else {
      println("dx or dy was 0");
    }
    return ans;
  }
  
  
  public String toString(){
    return protein;
  }
  
  
  public int compareTo(Node other){
    return protein.compareTo(other.protein);
  }
  
  
  public float getDist(Node other) {
    return pos.dist( other.pos );
  }
 
  public int getDegree() {
    //return numConnections
    return 0;
  }
  
  public void highlight() {
    //change color + other stuff
  }
  
  
  
}
  public void settings() {  size(1200, 700); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "NetVis_v0" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
