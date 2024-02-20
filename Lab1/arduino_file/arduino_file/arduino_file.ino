void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
}

void loop() {
  // put your main code here, to run repeatedly:
  Serial.print((int) random(70, 120));
  Serial.print(" ");
  Serial.print((int) random(80, 130));
  Serial.print(" ");
  Serial.println((int) random(90, 140));

  delay(500);
}