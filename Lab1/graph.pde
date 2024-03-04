XYChart lineChart;
FloatList lineChartX;
FloatList lineChartY;

//
int counTer = 0;
float rst = 0.0;
float avgBeat = 0.0;
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
  for (int i = 0; i < lineChartX.size() - 1; i++) {
    int lineColor = Color_lines(lineChartY.get(i));
    stroke(lineColor);
    strokeWeight(2);
    line(
      map(i, 0, lineChartX.size() - 1, 15, width - 30),
      map(lineChartY.get(i), 0, lineChart.getMaxY(), height, 15),
      map(i + 1, 0, lineChartX.size() - 1, 15, width - 30),
      map(lineChartY.get(i + 1), 0, lineChart.getMaxY(), height, 15)
    );
  }
  resting_heartRate(val);
  
  
  home_button();
  fill(255);
  text("Blood Oxygen Levels: " + oxy+ "%", width-300, height-100);
  //text("Confidence Level: " + confidence, width-300, height-80);
  text("HeartBeat: " + val + " BPM", width-900, height-100);
  fill(0,191,255);
  text("Resting HeartRate: " + avgBeat + "BPM",width-900,height-80);
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
  
  if (lineChartX.size() > 7 && lineChartY.size() > 7) {
    lineChartX.remove(0);
    lineChartY.remove(0);
  }
  
  //lineChart.setData(lineChartX.array(), lineChartY.array());
  
  int pointColor = Color_lines(val);
  lineChart.setPointColour(pointColor);
  //lineChart.setLineColor(pointColor);

  lineChart.setData(lineChartX.array(), lineChartY.array());
  //oxyLevels.append(oxy);
  
  
  
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
