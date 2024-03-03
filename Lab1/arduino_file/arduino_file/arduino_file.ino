#include <SparkFun_Bio_Sensor_Hub_Library.h>
#include <Wire.h>

// No other Address options.
#define DEF_ADDR 0x55

// Reset pin, MFIO pin
const int resPin = 4;
const int mfioPin = 5;

// buzzer
// const int buzzer = 12;
int buzzcounter = 0;

// Takes address, reset pin, and MFIO pin.
SparkFun_Bio_Sensor_Hub bioHub(resPin, mfioPin); 

#define MIN_VALUE 10
#define MAX_VALUE 30

// Define the number of points in the sine wave
#define NUM_POINTS 100

bioData body;
void setup(){

  Serial.begin(115200);

  Wire.begin();
  int result = bioHub.begin();
  // if (!result)
  //   Serial.println("Sensor started!");
  // else
  //   Serial.println("Could not communicate with the sensor!!!");

  // Serial.println("Configuring Sensor...."); 
  int error = bioHub.configBpm(MODE_ONE); // Configuring just the BPM settings. 
  // if(!error){
  //   Serial.println("Sensor configured.");
  // }
  // else {
  //   Serial.println("Error configuring sensor.");
  //   Serial.print("Error: "); 
  //   Serial.println(error); 
  // }
  // pinMode(buzzer, OUTPUT);
  // Data lags a bit behind the sensor, if you're finger is on the sensor when
  // it's being configured this delay will give some time for the data to catch
  // up. 
  delay(4000); 

}

void loop(){

 

  // Print the generated value
    // Information from the readBpm function will be saved to our "body"
    // variable.  
    // body = bioHub.readBpm();
    // // Serial.print("Heartrate: ");
    Serial.print((int) random(70, 90));
    // // Serial.print(body.heartRate); 
    Serial.print(" ");
    // // Serial.print(body.oxygen);
    // Serial.println(finalValue);
    // Serial.print(" ");
    // Serial.println(body.confidence);
    Serial.println((int) random(70, 90));
    // if (body.heartRate > .60 * (220-22)){ // change value to "stressed heart rate". currently set to 0 to test
    //   if (buzzcounter < 2){
    //     tone(buzzer, 250);
    //     delay (200);
    //     noTone(buzzer);
    //     delay (5);
    //     buzzcounter++;
    //   }
    //   else {
    //     noTone(buzzer);
    //   }
    // }
    // else {
    //   buzzcounter = 0;
    //   noTone(buzzer);
    // }
    // Serial.print("Confidence: ");
    // Serial.println(body.confidence); 
    // Serial.print("Oxygen: ");
    // Serial.println(body.oxygen); 
    // Serial.print("Status: ");
    // Serial.println(body.status); 
    delay(500); // Slowing it down, we don't need to break our necks here.
}