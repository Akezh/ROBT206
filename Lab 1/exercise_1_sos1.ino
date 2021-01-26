void setup()
{
  pinMode(13, OUTPUT);
}

void loop()
{
  shortSignal();
  longSignal();
  shortSignal();
}

void shortSignal() {
  for (int i = 0; i < 3; i++) {
	digitalWrite(13, HIGH);
  	delay(500); // Wait for 1000 millisecond(s)
  	digitalWrite(13, LOW);
  	delay(500); // Wait for 1000 millisecond(s)
  }
}

void longSignal() {
  for (int i = 0; i < 3; i++) {
	digitalWrite(13, HIGH);
  	delay(2000); // Wait for 1000 millisecond(s)
  	digitalWrite(13, LOW);
  	delay(500); // Wait for 1000 millisecond(s)
  }
}

