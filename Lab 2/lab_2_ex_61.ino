int sensorPin = A0; //select the input pin for the light sensor
int sensorValue = 0; //variable to store the value coming from the sensor
int ledpin = 11;

void setup() {
  // declare the ledPin as an OUTPUT:
  Serial. begin (9600);
  pinMode (ledpin, OUTPUT);
  pinMode (sensorPin, INPUT);
}

void loop() {
  sensorValue = analogRead(sensorPin);
  Serial.print("Light = ");
  Serial.println(sensorValue);
  analogWrite(ledpin, 255- sensorValue/2 - 20);
  delay(1000);
}