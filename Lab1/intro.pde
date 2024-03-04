

///
import controlP5.*;




ControlP5 cp5;
///

PFont h_font;


void home_button(){
  b4 = loadImage("b4.png");
  image(b4,width-50,0,50,50);
  
  if (mouseX > width-50 && mouseX < width && mouseY > 0 && mouseY <50) {
     if (mousePressed) {
        i4Clicked = true;  // Set the imageClicked variable to true
      }
  }
  if (i4Clicked){tab = "intro";}
  i4Clicked= false;
}

void intro_draw() {
  
  int headerHeight = 200;  // Height of the translucent header
  int headerAlpha = 255;
  
  fill(50, 150, 200, headerAlpha);  // Header color with transparency
  rect(0, 0, width, headerHeight);
  
  boolean i1Clicked= false;
  boolean i2Clicked= false;
  boolean i3Clicked= false;
  boolean i4Clicked= false;
  boolean i5Clicked = false;
    
  PImage img;
  PImage b1;
  PImage b2;
  PImage b3;
  PImage b5;
  PImage b6;

  //PImage b4;

  pushStyle();
  
  //
  
  cp5 = new ControlP5(this);
  
  //
  img = loadImage("BG1.png");
  b1 = loadImage("b1.png");
  b2 = loadImage("b2.png");
  b3 = loadImage("b3.png");
  s = loadImage("s.png");
  r = loadImage("r.png");
  b5 = loadImage("lungs.png");
  b6 = loadImage("hrm.png");
  
  //b4 = loadImage("b4.png");
  
  
  
  
  background(img);
  
  //background(152,190,100);
  fill(0);
  textSize(22);
  textAlign(CENTER, CENTER);
  
  h_font = createFont("h_font.ttf",22);
  textFont(h_font);
  
  image(b1,width/8,height/5,100,100);
  text("HeartBeat Graph", 170, height/5 -40);
  if (mouseX > width/8 && mouseX < width/8 + 100 && mouseY > height/5 && mouseY < height/5 +100) {
     if (mousePressed) {
        i1Clicked = true;  // Set the imageClicked variable to true
      }
  }
  if (i1Clicked){tab = "graph";}
  
  
  
  image(b2,440,height/5,100,100);
  text("CardioZones", width/2, height/5 - 40);
   if (mouseX > 440 && mouseX < 540 && mouseY > height/5 && mouseY < height/5 +100) {
     if (mousePressed) {
        i2Clicked = true;  // Set the imageClicked variable to true
      }
  }
  if (i2Clicked){tab = "high_low";}
  
  image(b3,750,height/5,100,100);
  text("Meditation", width-170, height/5- 40);
     if (mouseX > 750 && mouseX < 850 && mouseY > height/5 && mouseY < height/5 +100) {
     if (mousePressed) {
        i3Clicked = true;  // Set the imageClicked variable to true
      }
  }
  if (i3Clicked){tab = "rest";}
  
  
  image(b5,width/4,height/2,100,100);
  text("Respiratory Rate", width/4-90, height/2+45);
     if (mouseX > width/4 && mouseX < width/4 + 100 && mouseY > height/2 && mouseY < height/2 +100) {
     if (mousePressed) {
        i4Clicked = true;  // Set the imageClicked variable to true
      }
  }
  if (i4Clicked){tab = "resp";}
  
  image(b6,width - 400 ,height/2,100,100);
  text("Heart Rate", width - 240, height/2+45);
     if (mouseX > width - 400 && mouseX < width - 400 + 100 && mouseY > height/2 && mouseY < height/2 +100) {
     if (mousePressed) {
        i5Clicked = true;  // Set the imageClicked variable to true
      }
  }
  if (i5Clicked){tab = "heart";}
  
  
  popStyle();
}
