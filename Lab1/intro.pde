

///
import controlP5.*;

ControlP5 cp5;
///




void intro_draw() {
  boolean i1Clicked= false;
  boolean i2Clicked= false;
  boolean i3Clicked= false;
  
  PImage img;
  PImage b1;
  PImage b2;
  PImage b3;

  pushStyle();
  
  //
  
  cp5 = new ControlP5(this);
  
  //cp5.addButton("buttonA")
  //   .setPosition(175,275)
  //   .setImages(loadImage("b1.png"), loadImage("b2.png"), loadImage("b3.png"))
  //   .updateSize();
  
  //
  img = loadImage("BG1.png");
  b1 = loadImage("b1.png");
  b2 = loadImage("b2.png");
  b3 = loadImage("b3.png");
  
  
  background(img);
  
  //background(152,190,100);
  fill(255);
  textSize(22);
  textAlign(CENTER, CENTER);
  
  
  image(b1,width/8,height/3,100,100);
  text("S to see the heartbeat", 170, 150);
  if (mouseX > width/8 && mouseX < width/8 + 100 && mouseY > height/3 && mouseY < height/3 +100) {
     if (mousePressed) {
        i1Clicked = true;  // Set the imageClicked variable to true
      }
  }
  if (i1Clicked){tab = "graph";}
  
  
  
  image(b2,440,height/3,100,100);
  text("A to see the CardioZones", width/2, 150);
   if (mouseX > 440 && mouseX < 540 && mouseY > height/3 && mouseY < height/3 +100) {
     if (mousePressed) {
        i2Clicked = true;  // Set the imageClicked variable to true
      }
  }
  if (i2Clicked){tab = "high_low";}
  
  image(b3,750,height/3,100,100);
  text("D to see the Meditation", width-170, 150);
     if (mouseX > 750 && mouseX < 850 && mouseY > height/3 && mouseY < height/3 +100) {
     if (mousePressed) {
        i3Clicked = true;  // Set the imageClicked variable to true
      }
  }
  if (i3Clicked){tab = "rest";}
  
  
  popStyle();
}
