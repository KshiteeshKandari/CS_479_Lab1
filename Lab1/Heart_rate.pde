
int consecutiveFailures = 0;
float tolerance = 1.0;


void heart_rate_draw(){
  
  res_rate_draw();
  background(169, 209, 245);

  float inhalationTimeM = inhalationTime;  
  float exhalationTimeM = exhalationTime;
  
  float expectedInhalationTime = exhalationTimeM / 3;
  float expectedExhalationTime = 3 * inhalationTimeM;
  
 
  
  text(consecutiveFailures, width/3,height/3);
  
   if (abs(inhalationTime - expectedInhalationTime) > tolerance || abs(exhalationTime - expectedExhalationTime) > tolerance) {
    consecutiveFailures++;
    
    // Check if the pattern is not met for three consecutive breaths
    if (consecutiveFailures >= 3) {
      activateIndicator();  // Activate the indicator on your interface
    }
  } else {
    consecutiveFailures = 0;  
    // Reset the counter if the pattern is met
     fill(0, 255, 0);  // Red color for illustration
      ellipse(width/2, height/2, 50, 50);
  }
  delay(1000);

  home_button();
}


void activateIndicator() {
  // Replace this function with the code to activate your indicator
  // For example, you can change the color of a shape, display a warning message, etc.
  fill(255, 0, 0);  // Red color for illustration
  ellipse(width/2, height/2, 50, 50);  // Display a red circle as an indicator
}
