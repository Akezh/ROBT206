int ledPin = 11;	// LED pin init
int brightnessSwitchPin = 7;  // auto brightness switch
int callSwitchPin = 8;	// call switch

bool brightnessOn = false;  // brightness state 
bool callSwitchOn = false;  // call state
// state that defines whether the user is calling or inactive
bool userIsCallingOrInactive = false;  

// Initialization of sensors and tools
int potPin = A0;
int potVal = 0;

int triggerPin = 6;
int echoPin = 5;
double cm;	// temporary current distance between the user and phone

int lightSensorPin = A1;
int lightVal;

// Function to get the distance between the object and distance sensor
long readUltrasonicDistance()
{
  pinMode(triggerPin, OUTPUT);  // Clear the trigger
  digitalWrite(triggerPin, LOW);
  delayMicroseconds(2);
  // Sets the trigger pin to HIGH state for 10 microseconds
  digitalWrite(triggerPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(triggerPin, LOW);
  pinMode(echoPin, INPUT);
  // Reads the echo pin, and returns the sound wave travel time in microseconds
  return pulseIn(echoPin, HIGH);
}

void setup()
{
  pinMode(ledPin, OUTPUT);
  pinMode(brightnessSwitchPin, INPUT);
  pinMode(callSwitchPin, INPUT);
  pinMode(lightSensorPin, INPUT);
  Serial.begin(9600);
}

void loop() {
  if (userIsCallingOrInactive) {
  	digitalWrite(ledPin, LOW);
  }
  
  // Check the brightness mode
  int readBrightnessSwitch = digitalRead(brightnessSwitchPin);
  if (readBrightnessSwitch == HIGH) {
    // if button was pressed, update the mode
    brightnessOn = !brightnessOn;
  	delay(100);
  }
  
  // Check the call mode
  int readCallSwitch = digitalRead(callSwitchPin);
  if (readCallSwitch == HIGH) {
    // if button was pressed, update the mode
    callSwitchOn = !callSwitchOn;
  	delay(100);
  }
  
  
  // Enter the bottom loop only if user is not talking
  if (!userIsCallingOrInactive) {
    if (brightnessOn) {
      // LED control by Ambient Light Sensor
      lightVal = analogRead(lightSensorPin);
      analogWrite(ledPin, lightVal/2);
    } else {
      // LED control by Potentiometer
      potVal = analogRead(potPin);
      analogWrite(ledPin, 255-potVal/4);
      // Serial.println(potVal);
    }
    delay(100);
  }
  
  
  if (callSwitchOn) {
    // Distance sensor
    cm = 0.01723 * readUltrasonicDistance();
    if (cm <= 20 || cm >= 100) {
       // if the phone is too close or too distant, turn off the led
       digitalWrite(ledPin, LOW);
       userIsCallingOrInactive = true;
    } else {
      userIsCallingOrInactive = false;
    }
    delay(100);
  } else {
      userIsCallingOrInactive = false;
  }
  
  Serial.print("Call is ");
  Serial.println(callSwitchOn);
  Serial.print("Bright is ");
  Serial.println(brightnessOn);
}

