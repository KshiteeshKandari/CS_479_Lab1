

///
import controlP5.*;

ControlP5 cp5;
///




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
  //boolean i4Clicked= false;
    
  PImage img;
  PImage b1;
  PImage b2;
  PImage b3;
  //PImage b4;

  pushStyle();
  
  //
  
  cp5 = new ControlP5(this);
  
  //
  img = loadImage("BG1.png");
  b1 = loadImage("b1.png");
  b2 = loadImage("b2.png");
  b3 = loadImage("b3.png");
  //b4 = loadImage("b4.png");
  
  
  background(img);
  
  //background(152,190,100);
  fill(0);
  textSize(22);
  textAlign(CENTER, CENTER);
  
  
  image(b1,width/8,height/3,100,100);
  text("HeartBeat Graph", 170, 150);
  if (mouseX > width/8 && mouseX < width/8 + 100 && mouseY > height/3 && mouseY < height/3 +100) {
     if (mousePressed) {
        i1Clicked = true;  // Set the imageClicked variable to true
      }
  }
  if (i1Clicked){tab = "graph";}
  
  
  
  image(b2,440,height/3,100,100);
  text("CardioZones", width/2, 150);
   if (mouseX > 440 && mouseX < 540 && mouseY > height/3 && mouseY < height/3 +100) {
     if (mousePressed) {
        i2Clicked = true;  // Set the imageClicked variable to true
      }
  }
  if (i2Clicked){tab = "high_low";}
  
  image(b3,750,height/3,100,100);
  text("Meditation", width-170, 150);
     if (mouseX > 750 && mouseX < 850 && mouseY > height/3 && mouseY < height/3 +100) {
     if (mousePressed) {
        i3Clicked = true;  // Set the imageClicked variable to true
      }
  }
  if (i3Clicked){tab = "rest";}
  
  

  
  
  popStyle();
}
