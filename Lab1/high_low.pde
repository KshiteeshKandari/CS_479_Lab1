float high_HR;
float low_HR;
//------------------------------------------------------------
int restingHeartRate;
int[] heartRateData;
int timeInterval; // Time interval in seconds for data collection
int[] zoneCounts = new int[3]; 


int  peak_performance , fat_burn , cardio , jogg;
int startTimer;
float lastBeatVal;
PImage work_out;
//-------------------------------------------------------------

void high_low_setup() {
  high_HR = Integer.MIN_VALUE;
  low_HR = Integer.MAX_VALUE;
  
  //---------------------------Ash----------------------
  
  //restingHeartRate = int(random(60, 81));
  
  peak_performance = fat_burn = cardio = jogg = 0;
  startTimer = second();
  lastBeatVal = 0;
  
  restingHeartRate = 60;
  timeInterval = 30;
  
  
  //calculateZones();
  high_low_draw();
  //-----------------------------------------------------------
}

void high_low_draw() {
  
  //draw a card around the graph
  
  float cardWidth = 500;
  float cardHeight = 250;
  float cardX = 200 - cardWidth / 2;
  float cardY = (height / 2) - cardHeight / 2 + 20;
  //
 work_out = loadImage("workout.jpg");
 
 h_font = createFont("h_font.ttf",12);
 textFont(h_font);  
 /////////
 background(work_out);
 
 //card values
  fill(249,215,232,255);
  stroke(0);
  strokeWeight(0.1);
  rect(cardX, cardY, cardWidth, cardHeight);
 ////
 
  zone_bars("Peak Performance", peak_performance, color(154, 3, 30), 160, 180);
  zone_bars("Cardio Workout", fat_burn, color(227, 100, 20), 160, 240);
  zone_bars("Intense Fat Burn", cardio, color(101, 183, 65), 160, 300);
  zone_bars("Resting/Recovery", jogg, color(187, 226, 236), 160, 360);

 
 
  fill(0);
  text("Total Time Active: "+ millis()/1000 + " seconds", width/2, 20);
  text("Peak Performance Mode Time: " +  peak_performance + " seconds", 20, 50);
  text("Cardio Workout Time: " +  fat_burn + " seconds", 20, 80);
  text("Intense Fat Burn Time: " +  cardio + " seconds", 20, 110);
  text("Resting/Recovery Time: " + jogg + " seconds", 20, 140);
  
  
  
  //check with random values // comment this out and go to high_low serial event to check with incoming heartbeat
  //float newHeartbeatValue = random(60, 120);
  //zone_time(lastBeatVal, newHeartbeatValue);
  //lastBeatVal = newHeartbeatValue;
  /////
  
  
  home_button();
  

}

void zone_bars(String label, int time, color col, int x, int y) {
  fill(col);
  rect(x, y, time, 40);
  fill(0);
  text(label, x - 120, y + 25);
  text(time + " s", x + time + 5, y + 25);
}


void zone_time(float last_heart_beat, float curr_heart_beat) {
  int currentTime = second();
  int elapsedTime;

//handle time so it doesnt go negative
  if (currentTime >= startTimer) {
    elapsedTime = currentTime - startTimer;
  } else {
    // 
    elapsedTime = (60 - startTimer) + currentTime;
  }
  
  

  if (last_heart_beat > .8*(220-22)) { //cardiac zone 1
    peak_performance += elapsedTime;
  } else if (last_heart_beat >= .7*(220-22) && last_heart_beat <= .8*(220-22)) { //cardiac zone 2
    cardio += elapsedTime;
  } else if (last_heart_beat >= .6*(220-22) && last_heart_beat < .7*(220-22)) {//cardiac zone 3 
    fat_burn += elapsedTime;
  } else { //cardiac zone 4
    jogg += elapsedTime;
  }

  startTimer = currentTime; // restart timer
}

//

void high_low_serialEvent(float val) {
  
  //comment this in
  zone_time(lastBeatVal, val);
  lastBeatVal = val;
  /////////////////////
  
  if (val < low_HR)
    low_HR = val;
    
  if (val > high_HR)
    high_HR = val;
}
