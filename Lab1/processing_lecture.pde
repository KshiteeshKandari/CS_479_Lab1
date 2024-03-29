import processing.serial.*;
import org.gicentre.utils.stat.*;
//import processing.sound.*;


String input1 = "73 12 23\n";
Serial myPort;

String tab = "intro";

float val;
float oxy;
float confidence;
int respiratoryRate = 0;

float inhalationTime = 0.0;
float exhalationTime = 0.0;
boolean isInhalation = false; 
float lowestValue = Float.MAX_VALUE;
float peakValue = Float.MIN_VALUE;
float startTime = 0.0;


void setup() {
  String portName = Serial.list()[1];
  print(Serial.list());
  myPort = new Serial(this, portName, 115200);
  myPort.bufferUntil('\n');
  
  size(986, 540);
  
  
  graph_setup();
  high_low_setup();
  resp_graph_setup();
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
    
    //print(values[0]);
    //print(" ");
    //println(values[1]);
   if (values[0].equals("!") || values[0].equals(null)) {
      values[0] = "100"; // Replace with "0"
    }
    
    if (values[1].equals(null)) {
      values[1] = "100"; // Replace with "0"
    }
    val = float(values[0]);
    oxy = float(values[1]);
    
    
    //confidence = float(values[2]);
    
    //////////////////////
    //tempVal = trim(tempVal);
    //float val = float(tempVal);
    high_low_serialEvent(val,oxy);
    graph_serialEvent(val,oxy);
    stressed_out_serialEvent(val);
    res_rate_serialEvent(oxy);
    //println(val);
  }
  else{print("error here");}
  //float newHeartbeatValue = random(60, 120);
  //graph_serialEvent(newHeartbeatValue);
}
