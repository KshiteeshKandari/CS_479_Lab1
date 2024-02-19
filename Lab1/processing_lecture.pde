import processing.serial.*;
import org.gicentre.utils.stat.*;
//import processing.sound.*;



Serial myPort;

String tab = "intro";


void setup() {
  String portName = Serial.list()[0];
  print(Serial.list()[0]);
  myPort = new Serial(this, portName, 115200);
  myPort.bufferUntil('\n');
  
  size(986, 540);
  
  
  graph_setup();
  high_low_setup();
}

void draw() {
  if (tab == "intro")
    intro_draw();
  
  else if (tab == "high_low")
    high_low_draw();
    
  else if (tab == "graph")
    graph_draw();
  
  else if (tab == "rest")
    rest_draw();
}

void serialEvent(Serial myPort) {
  String tempVal = myPort.readStringUntil('\n');
  
  if (tempVal != null) {
    tempVal = trim(tempVal);
    float val = float(tempVal);
    high_low_serialEvent(val);
    graph_serialEvent(val);
    stressed_out_serialEvent(val);
    println(val);
  }
  //float newHeartbeatValue = random(60, 120);
  //graph_serialEvent(newHeartbeatValue);
}
