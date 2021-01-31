const int ledPin = 7 ;
const int potPin = A0;

int val = 0 ;

void setup () {
  pinMode(ledPin, OUTPUT);
  Serial.begin(9600);
}
void loop () {
  val = analogRead(potPin); // read the voltage on the pot
  digitalWrite(ledPin, HIGH);
  delay(val); // blink rate set by pot value (in milliseconds)
  digitalWrite(ledPin, LOW);
  delay(val); // turn led off for same period as it was turned on
  Serial.println(val);
}