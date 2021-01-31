const int buttonOn = 7;
const int buttonOff = 6;
const int LED = 13;

int stateButtonOn = 0;
int stateButtonOff = 0;

void setup()
{
  pinMode(buttonOn, INPUT);
  pinMode(buttonOff, INPUT);
  pinMode(LED, OUTPUT);
}
void loop()
{
  stateButtonOn = digitalRead(buttonOn);
  stateButtonOff = digitalRead(buttonOff);
  
  if (stateButtonOn == HIGH) {
  	digitalWrite(LED, HIGH);
  }
  
  if (stateButtonOff == HIGH) {
  	digitalWrite(LED, LOW);
  }
}
