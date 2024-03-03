int BPM = 0;
int beat_old = 0;
float[] beats = new float[500];  // Used to calculate average BPM
int beatIndex = 0; // Initialize beatIndex to 0
float threshold = 620.0;  //Threshold at which BPM calculation occurs
boolean belowThreshold = true;

//void setup() {
//  // Add setup code if necessary
//  size(200, 200); // Adjust the canvas size according to your needs
//}

//void draw() {
//  // Add draw code if necessary
//  int randomSignal = int(random(300, 701)); // Generate random signal between 300 and 700
//  calculateBPM(randomSignal); // Call calculateBPM with the random signal
//  println("Current BPM: " + BPM); // Print the calculated BPM
//}

void calculateBPM(int signal) {
  int scaled_millis = millis() * 200; // Scale millis() to make it slower
  int diff = scaled_millis - beat_old;    // find the time between the last two beats
  float currentBPM = 60000.0 / diff;    // convert to beats per minute
  beats[beatIndex] = currentBPM;  // store to array to convert the average
  float total = 0.0;
  for (int i = 0; i < 500; i++) {
    total += beats[i];
  }
  BPM = int(total / min(500, beatIndex + 1)); // Only consider the most recent BPM values
  // Clamp BPM value to a reasonable range
  BPM = constrain(BPM, 30, 300); // Adjust these values as needed
  beat_old = scaled_millis;
  beatIndex = (beatIndex + 1) % 500;  // cycle through the array instead of using FIFO queue
}


void heart_rate_draw(){
  
background(169, 209, 245);
home_button();

}
