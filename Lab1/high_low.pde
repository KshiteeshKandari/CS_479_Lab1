float high_HR;
float low_HR;
//------------------------------------------------------------
//int restingHeartRate;
//int[] heartRateData;
//int timeInterval; // Time interval in seconds for data collection
//int[] zoneCounts = new int[3]; 
//-------------------------------------------------------------

void high_low_setup() {
  high_HR = Integer.MIN_VALUE;
  low_HR = Integer.MAX_VALUE;
  
  //---------------------------Ash----------------------
  
  //restingHeartRate = 60;
  //timeInterval = 30;
  
  //// Initialize heartRateData array with random values for testing
  //heartRateData = new int[timeInterval];
  //for (int i = 0; i < timeInterval; i++) {
  //  heartRateData[i] = restingHeartRate + int(random(-5, 6)); // Simulate small variations
  //}
  
  //calculateZones();
  //drawGraph();
  //-----------------------------------------------------------
}

void high_low_draw() {
  
 
 
  pushStyle();
  //background(169, 209, 245);
  background(185,160,217);
  String output = "LOW HR: " + low_HR + "  HIGH HR: " + high_HR;
  textSize(30);
  fill(204, 102, 0);
  textAlign(CENTER, CENTER);
  text(output, width/2, 90);
  popStyle();
  
  home_button();
  

}

void high_low_serialEvent(float val) {
  if (val < low_HR)
    low_HR = val;
    
  if (val > high_HR)
    high_HR = val;
}
