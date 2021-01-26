int red = 13;
int yellow = 12;
int green = 11;

void setup()
{
  pinMode(red, OUTPUT);
  pinMode(yellow, OUTPUT);
  pinMode(green, OUTPUT);
}

void loop()
{
  activateRed();
}

void activateRed() {
  digitalWrite(red, HIGH);
  delay(5000); 
  digitalWrite(red, LOW);
  
  activateYellow();
}

void activateYellow() {
  digitalWrite(yellow, HIGH);
  delay(1000); 
  digitalWrite(yellow, LOW);
  
  activateGreen();
}

void activateGreen() {
  digitalWrite(green, HIGH);
  delay(5000); 
  blinker(green);
  
  activateRed();
}

void blinker(int trafficLight) {
  for (int i = 0; i < 4; i++) {
    digitalWrite(trafficLight, HIGH);
    delay(500); 
    digitalWrite(trafficLight, LOW);
    delay(300); 
  }
}
