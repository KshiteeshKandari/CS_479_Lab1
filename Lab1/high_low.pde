float high_HR;
float low_HR;

void high_low_setup() {
  high_HR = Integer.MIN_VALUE;
  low_HR = Integer.MAX_VALUE;
}

void high_low_draw() {
  
 
 
  pushStyle();
  background(169, 209, 245);
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
