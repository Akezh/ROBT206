const int sensorPin = A0;
const int ledPin = 13;
int lightCal;
int lightVal;

void setup() {
  pinMode(sensorPin,INPUT);
  pinMode(ledPin,OUTPUT);
  
  lightCal = analogRead(sensorPin);
}

void loop() {
  lightVal = analogRead(sensorPin);
  Serial.println(lightVal);
  //analogWrite(ledPin, map(lightVal, 0, 1023, 0, 255));
  
  if (lightVal <= lightCal) {
  	digitalWrite(ledPin, HIGH);
  }
  else {
  	digitalWrite(ledPin, LOW);
  }
}