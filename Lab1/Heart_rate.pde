int BPM = 0;
int beat_old = 0;
float[] beats = new float[500];  // Used to calculate average BPM
int beatIndex;
float threshold = 620.0;  //Threshold at which BPM calculation occurs
boolean belowThreshold = true;

void calculateBPM () 
{
  int beat_new = millis();    // get the current millisecond
  int diff = beat_new - beat_old;    // find the time between the last two beats
  float currentBPM = 60000 / diff;    // convert to beats per minute
  beats[beatIndex] = currentBPM;  // store to array to convert the average
  float total = 0.0;
  for (int i = 0; i < 500; i++){
    total += beats[i];
  }
  BPM = int(total / 500);
  beat_old = beat_new;
  beatIndex = (beatIndex + 1) % 500;  // cycle through the array instead of using FIFO queue
  }
  float calculateBaselineHeartbeat() {
  float total = 0.0;
  for (int i = 0; i < 500; i++) {
    total += beats[i];
  }
  return total / 500;
}

void heart_rate_draw() {
  background(169, 209, 245);
  generateRandomData();
  drawGraph();
  home_button();
}

void generateRandomData() {
  // Generate random heart rate data
  for (int i = 0; i < 500; i++) {
    beats[i] = random(300, 700); // Generate random BPM values between 50 and 150
  }
}


void drawGraph() {
  float graphWidth = width - 40; // Width of the graph area
  float graphHeight = height - 40; // Height of the graph area
  float xSpacing = graphWidth / 500; // Spacing between points on the x-axis
  float yScale = graphHeight / 200; // Scaling factor for the y-axis
  
  // Draw x-axis
  stroke(0);
  line(20, height - 20, width - 20, height - 20);
  
  // Draw y-axis
  line(20, 20, 20, height - 20);
  
  // Draw graph line
  noFill();
  beginShape();
  stroke(255, 0, 0); // Set color to red
  for (int i = 0; i < 500; i++) {
    float x = 20 + i * xSpacing;
    float y = height - 20 - beats[i] * yScale; // Invert y-axis
    vertex(x, y);
  }
  endShape();
}
