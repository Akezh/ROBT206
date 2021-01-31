int red = 13;
int yellow = 12;
int green = 11;

// cross traffic light 2 pins
int r = 7;
int y = 6;
int g = 5;

void setup()
{
  pinMode(red, OUTPUT);
  pinMode(yellow, OUTPUT);
  pinMode(green, OUTPUT);
  
  pinMode(r, OUTPUT);
  pinMode(y, OUTPUT);
  pinMode(g, OUTPUT);
}

void loop()
{
  activateRed();
}

void activateRed() {
  digitalWrite(red, HIGH);
  digitalWrite(g, HIGH);
  delay(3000);
  blinker(g);
  
  digitalWrite(red, LOW);
  digitalWrite(g, LOW);
  activateYellow();
}

void activateYellow() {
  digitalWrite(yellow, HIGH);
  digitalWrite(y, HIGH);
  delay(1000); 
  
  digitalWrite(yellow, LOW);
  digitalWrite(y, LOW);
  activateGreen();
}

void activateGreen() {
  digitalWrite(green, HIGH);
  digitalWrite(r, HIGH);
  delay(3000); 
  blinker(green);
  
  digitalWrite(green, LOW);
  digitalWrite(r, LOW);
  activateYellow2();
}

void activateYellow2() {
  digitalWrite(yellow, HIGH);
  digitalWrite(y, HIGH);
  delay(1000); 
  
  digitalWrite(yellow, LOW);
  digitalWrite(y, LOW);
  activateRed();
}

void blinker(int trafficLight) {
  for (int i = 0; i < 4; i++) {
    digitalWrite(trafficLight, HIGH);
    delay(500); 
    digitalWrite(trafficLight, LOW);
    delay(250); 
  }
}