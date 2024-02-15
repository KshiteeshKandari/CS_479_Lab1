import processing.serial.*;
import org.gicentre.utils.stat.*;

Serial myPort;

String tab = "intro";

void setup() {
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 115200);
  myPort.bufferUntil('\n');
  
  size(986, 540);
  
  high_low_setup();
  graph_setup();
}

void draw() {
  if (tab == "intro")
    intro_draw();
  
  else if (tab == "high_low")
    high_low_draw();
    
  else if (tab == "graph")
    graph_draw();
}

void serialEvent(Serial myPort) {
  String tempVal = myPort.readStringUntil('\n');
  
  if (tempVal != null) {
    tempVal = trim(tempVal);
    float val = float(tempVal);
    high_low_serialEvent(val);
    graph_serialEvent(val);
    println(val);
  }
}