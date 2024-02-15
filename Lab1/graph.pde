XYChart lineChart;
FloatList lineChartX;
FloatList lineChartY;

int count;

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
  
  lineChart.setPointColour(color(180, 50, 100, 100));
  lineChart.setPointSize(5);
  lineChart.setLineWidth(2);
  
  count = 0;
}

//void home_button(){
//  b4 = loadImage("b4.png");
//  image(b4,width-50,0,50,50);
  
//  if (mouseX > width-50 && mouseX < width && mouseY > 0 && mouseY <50) {
//     if (mousePressed) {
//        i4Clicked = true;  // Set the imageClicked variable to true
//      }
//  }
//  if (i4Clicked){tab = "intro";}
//  i4Clicked= false;
//}

void graph_draw() {
  background(185,160,217);
  textSize(9);
  
  lineChart.draw(15, 15, width - 30, height - 30);
  fill(200);
  rect(500, 200, 0, 0);
  
  fill(120);
  textSize(20);
  text("User's Heart Beat", 70, 30);
  
  home_button();
  

}

void graph_serialEvent(float val) {
  count++;
  
  lineChartX.append(count);
  lineChartY.append(val);
  
  if (lineChartX.size() > 7 && lineChartY.size() > 7) {
    lineChartX.remove(0);
    lineChartY.remove(0);
  }
  
  lineChart.setData(lineChartX.array(), lineChartY.array());
}
