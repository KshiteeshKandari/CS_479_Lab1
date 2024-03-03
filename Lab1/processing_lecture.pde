import processing.serial.*;
import org.gicentre.utils.stat.*;
//import processing.sound.*;


//String input1 = "73 12 23\n";
Serial myPort;

String tab = "intro";

float val;
float oxy;
float confidence;


void setup() {
  String portName = Serial.list()[1];
  print(Serial.list());
  myPort = new Serial(this, portName, 115200);
  myPort.bufferUntil('\n');
  
  size(986, 540);
  
  
  graph_setup();
  high_low_setup();
}

void draw() {
  
  //serialEvent(input1);
  if (tab == "intro")
    intro_draw();
  
  else if (tab == "high_low")
    high_low_draw();
    
  else if (tab == "graph")
    graph_draw();
  
  else if (tab == "rest")
    rest_draw();
  
  else if (tab == "heart")
    heart_rate_draw();
    
  else if (tab == "resp")
    res_rate_draw();
   
   
}

void serialEvent(Serial myPort) {
  String tempVal = myPort.readStringUntil('\n');
  
   //print(tempVal);
  
  
  if (tempVal != null) {
    
    ///////////////////////
    String[] values = split(tempVal, ' '); 
    val = float(values[0]);
    oxy = float(values[1]);
    confidence = float(values[2]);
    
    //////////////////////
    //tempVal = trim(tempVal);
    //float val = float(tempVal);
    high_low_serialEvent(val,oxy);
    graph_serialEvent(val,oxy);
    stressed_out_serialEvent(val);
    //println(val);
  }
  //float newHeartbeatValue = random(60, 120);
  //graph_serialEvent(newHeartbeatValue);
}
