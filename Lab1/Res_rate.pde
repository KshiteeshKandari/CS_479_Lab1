XYChart respChart;
FloatList respChartX;
FloatList respChartY;

int cc;
////////////
float lastReading = 0.0;
float currentReading = 0.0;
float threshold_resp = 5.0;
int breathCount = 0;
float maxValue = 0.0;
//int respiratoryRate = 0;
ArrayList<Float> valList = new ArrayList<Float>();
ArrayList<Integer> respiratoryRates = new ArrayList<Integer>();
float maxXValue = 20;
float lastXValue = 0;



void resp_graph_setup() {
  respChart = new XYChart(this);
  respChartX = new FloatList();
  respChartY = new FloatList();
  respChart.setData(respChartX.array(), respChartY.array());
  
  respChart.showXAxis(true);
  respChart.showYAxis(true);
  respChart.setMinY(0);
  
  respChart.setYFormat("00");
  respChart.setXFormat("0");
  
  //respChart.setPointColour(0);
  int initialLineColor = color(0); // light jog
  respChart.setPointSize(1);
  respChart.setLineWidth(2);

  cc = 0;
}


void res_rate_draw(){
  
  background(169, 209, 245);
  home_button();
  
  if (myPort.available() > 0) {
      // Read the latest sensor data
      
     
      
       
      // Calculate the difference between current and last readings
      float diff = currentReading - lastReading;
      
      
      //println(diff);
      if (abs(diff) > threshold_resp) {
        // Increment the count of peaks, which corresponds to breaths
        breathCount++;
         
         // Check for inhalation and exhalation
        if (isInhalation && currentReading < lastReading) {
          isInhalation = false;
          exhalationTime = millis() - startTime;
        } else if (!isInhalation && currentReading > lastReading) {
          isInhalation = true;
          inhalationTime = millis() - startTime;
        }
  
        startTime = millis();

          
       
      }
      //if (isLocalMaxima(valList)) {
      //breathCount++;
      //// Clear the list after detecting a local maxima
      //valList.clear();
      //}
      lastReading = currentReading;
      
    }
    
    float timeElapsedInSeconds = millis() / 1000.0;
    respiratoryRate = int (breathCount / (timeElapsedInSeconds / 60)); // Convert to breaths per minute
    respiratoryRates.add(respiratoryRate);
   
    stroke(0);
  respChart.draw(15, 15, width - 30, height - 30);

  fill(0);
  //rect(500, 200, 0, 0);
  
  fill(0);
  textSize(20);
  //text("User's Heart Beat", 70, 30);
  
  //for (int i = 0; i < respChartX.size() - 1; i++) {
  //  int lineColor = Color_lines(respChartY.get(i));
  //  stroke(0);
  //  strokeWeight(2);
  //}
  
   displayRespiratoryRate();

}



void res_rate_serialEvent(float val) {
  valList.add(val);
  currentReading = val;
  
   cc++;
  
  respChartX.append(cc);
  respChartY.append(currentReading);
  
  if (respChartX.size() > 7 && respChartY.size() > 7) {
    respChartX.remove(0);
    respChartY.remove(0);
  }
  
  //lineChart.setData(lineChartX.array(), lineChartY.array());
  //lineChart.setLineColor(pointColor);

  respChart.setData(lineChartX.array(), lineChartY.array());
}

void displayRespiratoryRate() {
  textSize(24);
  fill(0);
  text("Respiratory Rate: " + respiratoryRate + " breaths per minute", 200, 50);
  
  textSize(16);
  text("Inhalation Time: " + nf(inhalationTime / 1000, 1, 2) + " seconds", 200, 80);
  text("Exhalation Time: " + nf(exhalationTime / 1000, 1, 2) + " seconds", 200, 110);
}

boolean isLocalMaxima(ArrayList<Float> values) {
  if (values.size() < 3) {
    return false;
  }

  int lastIndex = values.size() - 1;
  float lastValue = values.get(lastIndex);
  float secondLastValue = values.get(lastIndex - 1);
  float thirdLastValue = values.get(lastIndex - 2);

  // Check if the last value is greater than both the second last and third last values
  return lastValue > secondLastValue && lastValue > thirdLastValue;
}
