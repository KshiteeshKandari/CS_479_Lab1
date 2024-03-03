float lastReading = 0.0;
float currentReading = 0.0;
float threshold_resp = 5.0;
int breathCount = 0;
float maxValue = 0.0;
int respiratoryRate = 0;
ArrayList<Integer> respiratoryRates = new ArrayList<Integer>(); 

void res_rate_draw(){
  
background(169, 209, 245);
home_button();

if (myPort.available() > 0) {
    // Read the latest sensor data
    
    // Calculate the difference between current and last readings
    float diff = currentReading - lastReading;
    println(diff);
    
    // if (currentReading > maxValue) {
    //  maxValue = currentReading;
    //}
    // Check if the difference exceeds the threshold, indicating a peak
    if (abs(diff) > threshold_resp) {
      // Increment the count of peaks, which corresponds to breaths
      breathCount++;
      //print(breathCount);
    }
    //if (currentReading < maxValue - threshold) {
    //  // Increment the count of peaks, which corresponds to breaths
    //  breathCount++;
    //  print(breathCount);
    //  // Reset the maximum value for the next peak
    //  maxValue = 0.0;
    //}
    
    //// Update lastReading with the currentReading for the next iteration
    lastReading = currentReading;
  }
  
  float timeElapsedInSeconds = millis() / 1000.0;
  respiratoryRate = int (breathCount / (timeElapsedInSeconds / 60)); // Convert to breaths per minute
  respiratoryRates.add(respiratoryRate);
  
  
 displayRespiratoryRate();

}

void res_rate_serialEvent(float val){
 currentReading = val;
 //print(currentReading);
}

void displayRespiratoryRate() {
  // Calculate respiratory rate based on the count of peaks and the time elapsed
  
  stroke(0);
  for (int i = 0; i < respiratoryRates.size() - 1; i++) {
    // Draw a line between successive respiratory rates
    line(i, height - respiratoryRates.get(i), i + 1, height - respiratoryRates.get(i + 1));
  }
  
  // Display the respiratory rate
  textSize(24);
  fill(255);
  text("Respiratory Rate: " + respiratoryRate + " breaths per minute", 20, 50);
  
  
}
