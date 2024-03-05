#include <SparkFun_Bio_Sensor_Hub_Library.h>
#include <Wire.h>

// No other Address options.
#define DEF_ADDR 0x55


double amplitude = 150.0; // Half the range of the oscillation (700-400)/2
double offset = 550.0; // The midpoint value of the oscillation (700+400)/2
double frequency = 0.05; // Frequency of the sine wave
unsigned long time = 0;

// buzzer
// const int buzzer = 


void setup(){

  Serial.begin(115200);

}

void loop(){
    Serial.print((int) random(400, 700));
    
    Serial.print(" ");

    time = millis(); // Get the system time in milliseconds
    double value = offset + amplitude * sin(frequency * time * 2 * PI / 1000.0);
    Serial.println(value);
}