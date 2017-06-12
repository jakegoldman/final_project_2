import controlP5.*;

Network network;
float zoomFactor;
float tX, tY;
boolean toHighlight;
PFont font;
ControlP5 cp5;
String input; //textbox input
float Rep_Force;
float Spring_Force;
int clusternum = 70; //change this number from 1 - 1320 to visualize different cluster (1 is largest cluster, 1320 is smallest);
boolean pause = false;

void setup() {
  size(1200, 700);
  font = createFont("arial", 20);
  cp5 = new ControlP5(this);//"this" lets u run whatever method u put after cp5
  Rep_Force = 1;
  Spring_Force = 0.0000001;
  input = "placeholder";
  makeWidgets();
  network = new Network(clusternum);
  background(100);
  zoomFactor = 1;
  tX = 0;
  tY = 0;
}

void makeWidgets() {
  cp5.addSlider("Rep_Force").setPosition(20, 20).setRange(0.01, 100);
  cp5.addSlider("Spring_Force").setPosition(20, 50).setRange(0.0000001, 0.0001);
  cp5.addTextfield("protein").setPosition(20, 80).setSize(200,40).setAutoClear(false);
  cp5.addBang("search").setPosition(20, 140).setSize(40,10);
  cp5.addTextfield("cluster").setPosition(20,200).setSize(30,20);
  cp5.addBang("switchCluster").setPosition(20,240).setSize(30,10);
}

void search() {
  input = cp5.get(Textfield.class, "protein").getText();
  println("the textbox says:");
  println(input);
}

void switchCluster(){
  String clusterInput = cp5.get(Textfield.class, "cluster").getText();
  try{
    int num = Integer.parseInt( clusterInput );
    if(num >= 1 && num <= 1320){
      clusternum = num;
      setup();
    }
  } catch( NumberFormatException e ){
    
  }
}


void draw() {
  background(100);
  pushMatrix();
  scale(zoomFactor);
  translate(tX, tY);
  network.update();
  popMatrix(); 
  fill(0);
  textSize(10);
  text("The current cluster is: " + clusternum, 20, 280);
  text("Please input a number from 1-1320 to change clusters", 20, 290); // error message for putting in an invalid cluster
  if( pause ){
    textSize(50);
    fill(255,0,0);
    text("PAUSED", 1000, 50);
  }
}

void keyPressed() {
  if (key == 'q') {//quits program
    exit();
  }
  if (key == 'r') {//returns to default view
    zoomFactor = 1;
    tX = 0;
    tY = 0;
    Rep_Force = 1;
    Spring_Force = 0.0000001; 
  }
  if (key == ' ') { //pauses the program
    pause = !pause;
  }   
}


void mouseWheel(MouseEvent event) {//change degree of zoom towards mouse
  println("mouse be wheeling");
  float e = event.getCount();
  zoomFactor += e / 100.0;
  tX = tX - e/100.0 * mouseX;
  tY = tY - e/100.0 * mouseY;
}

//void mouseClicked() {
//  toHighlight = true;
//}