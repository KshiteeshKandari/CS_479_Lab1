float high_HR;
float low_HR;
//------------------------------------------------------------
int restingHeartRate;
int[] heartRateData;
int timeInterval; // Time interval in seconds for data collection
int[] zoneCounts = new int[3]; 
//-------------------------------------------------------------

void high_low_setup() {
  high_HR = Integer.MIN_VALUE;
  low_HR = Integer.MAX_VALUE;
  
  //---------------------------Ash----------------------
  
  //restingHeartRate = int(random(60, 81));
  
  restingHeartRate = 60;
  timeInterval = 30;
  
  // Initialize heartRateData array with random values for testing
  heartRateData = new int[timeInterval];
  for (int i = 0; i < timeInterval; i++) {
    heartRateData[i] = restingHeartRate + int(random(-5, 6)); // Simulate small variations
  }
  
  
  calculateZones();
  high_low_draw();
  //-----------------------------------------------------------
}

//
void keyPressed() {
  // Generate new random heart rates when a key is pressed
  generateRandomHeartRates();
  calculateZones();
}
//

void high_low_draw() {
  
 /////////
 background(169, 209, 245);

 
 float barWidth = width / 3.5;
  
  // Draw bars for each cardiac zone
  for (int i = 0; i < zoneCounts.length; i++) {
    float x = i * barWidth + 50;
    float barHeight = map(zoneCounts[i], 0, timeInterval, 0, height - 50);
    fill(100 + i * 50, 150 - i * 50, 200 + i * 30);
    rect(x, height - barHeight - 50, barWidth, barHeight);
    
    // Display zone labels
    textAlign(CENTER);
    fill(0);
    text(getZoneLabel(i), x + barWidth/2, height - 30);
  }
 ////////
 
  //pushStyle();
  
  //background(185,160,217);
  //String output = "LOW HR: " + low_HR + "  HIGH HR: " + high_HR;
  //textSize(30);
  //fill(204, 102, 0);
  //textAlign(CENTER, CENTER);
  //text(output, width/2, 90);
  //popStyle();
  
  home_button();
  //high_low_draw();
  

}

///////////////////////////

String getZoneLabel(int index) {
  switch (index) {
    case 0:
      return "Slight Workout";
    case 1:
      return "Moderate Workout";
    case 2:
      return "Maximum Workout";
    default:
      return "";
  }
}
///////////////////////////
//////////////////////////
void calculateZones() {
  for (int i = 0; i < heartRateData.length; i++) {
    int heartRate = heartRateData[i];
    float percentIncrease = ((float) (heartRate - restingHeartRate) / restingHeartRate) * 100;
    
    if (percentIncrease < 20) {
      zoneCounts[0]++; // Slight workout
    } else if (percentIncrease >= 20 && percentIncrease <= 50) {
      zoneCounts[1]++; // Moderate workout
    } else if (percentIncrease > 50) {
      zoneCounts[2]++; // Maximum workout
    }
  }
}
/////////////////////////
void generateRandomHeartRates() {
  for (int i = 0; i < timeInterval; i++) {
    heartRateData[i] = restingHeartRate + int(random(-5, 6)); // Simulate small variations
  }
}

//

void high_low_serialEvent(float val) {
  if (val < low_HR)
    low_HR = val;
    
  if (val > high_HR)
    high_HR = val;
}
