#include <SparkFun_Bio_Sensor_Hub_Library.h>
#include <Wire.h>

int fsrPin = 1;  //A1 reading
int fsrReading;

void setup() {
  // initialize the serial communication:
  Serial.begin(115200);
  pinMode(10, INPUT);  // Setup for leads off detection LO +
  pinMode(11, INPUT);  // Setup for leads off detection LO -
}

void loop() {
  //ECG
  if ((digitalRead(10) == 1) || (digitalRead(11) == 1)) {
    Serial.println("0");
  } else {
    // send the value of analog input 0:
    Serial.print(analogRead(A0));
  }

  //reading respriatory rate
  fsrReading = analogRead(fsrPin);
  Serial.print(" ");
  Serial.println(fsrReading);
  delay(100);
}