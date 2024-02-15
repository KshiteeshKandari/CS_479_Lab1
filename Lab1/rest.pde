PImage b4;
boolean i4Clicked= false;


void rest_draw() {
  pushStyle();
  background(200);
  b4 = loadImage("b4.png");
  
  
  image(b4,width-50,0,50,50);
  
  if (mouseX > width-50 && mouseX < width && mouseY > 0 && mouseY <50) {
     if (mousePressed) {
        i4Clicked = true;  // Set the imageClicked variable to true
      }
  }
  if (i4Clicked){tab = "intro";}
  
  
}
