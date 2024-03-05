PImage b4;
boolean i4Clicked= false;

boolean stressed = false;
PImage s;
PImage r;
PFont font;

float scaleFactor = 1.0;
float scalingSpeed = 0.02;

//SoundFile stressed_music; // Tyler - I comment out the sound stuff because I didn't have the library






void rest_draw() {
  
  res_rate_draw();

  float shakeFactor = sin(frameCount * scalingSpeed);

  // Apply the scaling factor to the image size
  float scaledWidth = (s.width / 2) * (0.02 + shakeFactor);
  float scaledHeight = (s.height / 2) * (0.02 + shakeFactor);
  
  font = createFont("C.ttf", 50);
  pushStyle();
   background(169, 209, 245);
   
  //implement breathing rate
  //stress
  if (respiratoryRate > 15){stressed = true;}
  else{stressed = false;}
  //==============================
  if(stressed){
    image(s, width / 2 - scaledWidth / 2, height / 2 - scaledHeight / 2, scaledWidth, scaledHeight);
    fill(255, 105, 105);
    textFont(font);
    text("Caution!! You are Stressed", (width / 2) - 200, 480);
    textFont(h_font);
  }
  else {
    image(r, width / 2 - scaledWidth / 2, height / 2 - scaledHeight / 2, scaledWidth, scaledHeight);
    fill(255, 245, 224);
    textFont(font);
    text("Relaxed!", (width / 2) - 70, 480);
    textFont(h_font);
  }
  //==============================

  home_button();
  println(respiratoryRate);
}

void keyPressed() {
  // Toggle the boolean value when any key is pressed
  stressed = !stressed;
  print("0 and 1");
}


void stressed_out_serialEvent(float val){
  //float stressed_heart_rate;
  //float resting_heart_rate = 65;
  //stressed_heart_rate = (resting_heart_rate*0.25) + resting_heart_rate; // 25% increase in heart rate. I don't know what normal stressed heart rate is comared to resting heart rate.
  //if (val >= stressed_heart_rate){

  if (val >= .65 * (220-22)){ // can swap this with the 4 lines above^^ This is just if you have a heart rate above 75, you're stressed.
    stressed = true;
  }
  else{
    stressed = false;
  }

  
}
