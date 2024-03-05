XYChart lineChart;
FloatList lineChartX;
FloatList lineChartY;

//
int counTer = 0;
float rst = 0.0;
float avgBeat = 0.0;
//bpm calculations

float inByte = 0;
int BPM = 0;
int beat_old = 0;
float[] beats = new float[500];  // Used to calculate average BPM
int beatIndex;
float threshold = 500.0;  //Threshold at which BPM calculation occurs
boolean belowThreshold = true;



ArrayList<Integer> peakTimes = new ArrayList<Integer>();
//

int count;
int pointColor = 0;

void graph_setup() {
  lineChart = new XYChart(this);
  lineChartX = new FloatList();
  lineChartY = new FloatList();
  lineChart.setData(lineChartX.array(), lineChartY.array());
  
  lineChart.showXAxis(true);
  lineChart.showYAxis(true);
  lineChart.setMinY(0);
  
  lineChart.setYFormat("00");
  lineChart.setXFormat("0");
  
  //lineChart.setPointColour(0);
  int initialLineColor = color(187, 226, 236); // light jog
  lineChart.setPointSize(5);
  lineChart.setLineWidth(2);

  count = 0;
}

void graph_draw() {
  //background(185,160,217);
  //int pointColor = 0;
  background(0);
  textSize(9);
  
  stroke(pointColor);
  lineChart.draw(15, 15, width - 30, height - 30);

  
  fill(0);
  rect(500, 200, 0, 0);
  
  fill(120);
  textSize(20);
  text("User's Heart Beat", 70, 30);
  
  
  resting_heartRate(val);
  
  
  home_button();
  fill(255);
  //text("Blood Oxygen Levels: " + oxy+ "%", width-300, height-100);
  //text("Confidence Level: " + confidence, width-300, height-80);
  
  fill(0,191,255);
  //text("Resting HeartRate: " + avgBeat + "BPM",width-900,height-80);
  if (frameCount % 120 == 0) { // Assuming 60 FPS, adjust according to your actual frame rate
        BPM = calculateBPM(); // Update BPM based on the peaks detected in the last 60 seconds
        //println("Current BPM: " + BPM); // Optionally print it to the console for debugging
    }

    // Display the BPM on the screen
    fill(255); // White color for text
    text("BPM: " + BPM, 10, height - 10); // Position the text at the bottom left

  noFill();
  
   // Apply the moving average filter to smooth the data
 // Adjust window size as needed for smoothing
  
  // Draw the ECG graph as a continuous line
  stroke(255, 0, 0); // Set the stroke color to red
  strokeWeight(2); // Set the stroke weight to match the ECG's line thickness
  noFill();
 
  

  
  
}

void resting_heartRate(float val){
  while (counTer < 10){
    rst += val;
    counTer++;
  }
  if(counTer == 10){
  avgBeat = rst / 10;
  }
  else{
  avgBeat = 0.0;}
  
  //print(counTer);
  
}

void graph_serialEvent(float valx, float oxy) {
  count++;
  
  lineChartX.append(count);
  lineChartY.append(valx);
  
  if (lineChartX.size() > 50 && lineChartY.size() > 50) {
    lineChartX.remove(0);
    lineChartY.remove(0);
  }
  
  //lineChart.setData(lineChartX.array(), lineChartY.array());
  
  int pointColor = Color_lines(val);
  lineChart.setPointColour(pointColor);
  //lineChart.setLineColor(pointColor);


  lineChart.setData(lineChartX.array(), lineChartY.array());
  //oxyLevels.append(oxy);
  
  
   // BPM calculation check
   if (valx > threshold && belowThreshold) {
        belowThreshold = false;
        peakTimes.add(millis());
    } else if (valx < threshold) {
        belowThreshold = true;
    }
  
    BPM = calculateBPM();
 
     
  
  //print(oxy);
}



int Color_lines(float heartbeatValue) {
  if (heartbeatValue > .80*(220-22)) {
    return color(154, 3, 30); // peak_performance
  } else if (heartbeatValue >= 90 && heartbeatValue <= 110) {
    return color(227, 100, 20); // fat_burn
  } else if (heartbeatValue >= 80 && heartbeatValue < 90) {
    return color(101, 183, 65); // cardioworkout
  } else {
    return color(187, 226, 236); // light jog
  }
}

//////calculate BPM
int calculateBPM() {
    int currentTime = millis();
    // Remove peaks that are more than 60 seconds old
    peakTimes.removeIf(time -> (currentTime - time) > 60000);
    // The size of peakTimes now represents the number of peaks in the last 60 seconds
    return peakTimes.size();
}
