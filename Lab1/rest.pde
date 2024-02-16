PImage b4;
boolean i4Clicked= false;

boolean stressed = false;
PImage s;
PImage r;
PFont font;

float scaleFactor = 1.0;
float scalingSpeed = 0.02;

SoundFile stressed_music;






void rest_draw() {
  
  //stressed_music = new SoundFile(this, "stressed_music.mp3");
  //stressed_music.play();
  
  float shakeFactor = sin(frameCount * scalingSpeed);

  // Apply the scaling factor to the image size
  float scaledWidth = (s.width /2) * (0.02 + shakeFactor);
  float scaledHeight = (s.height /2) * (0.02 + shakeFactor);
  
  font = createFont("C.ttf",50);
  pushStyle();
  //background(255, 204, 231);
    background(169, 209, 245);
    
  ///============================
  if(stressed){
  image(s, width / 2 - scaledWidth / 2, height / 2 - scaledHeight / 2, scaledWidth, scaledHeight);
  fill(255, 105, 105);
  textFont(font);
  text("Caution!! You are Stressed", width/2, 480);
  textFont(h_font);
  
  stressed = true;
  }
  //==============================
  
  
   ///============================
  if(!stressed){
  image(r, width / 2 - scaledWidth / 2, height / 2 - scaledHeight / 2, scaledWidth, scaledHeight);
  fill(255, 245, 224);
  textFont(font);
  text("Relaxed!", width/2, 480);
  textFont(h_font);
  }
  //==============================
  home_button();
  
  
}

void keyPressed() {
  // Toggle the boolean value when any key is pressed
  stressed = !stressed;
}
