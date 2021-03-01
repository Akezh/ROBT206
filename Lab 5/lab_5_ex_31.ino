// n - 4-bit representation of number 1 for 4-bit adder
int n1 = 3;
int n2 = 4;
int n3 = 7;
int n4 = 8;

// m - 4-bit representation of previous state number for 4-bit adder
int m1 = 2;
int m2 = 5;
int m3 = 6;
int m4 = 9;

// p - 4-bit representation of saved number (red leds)
// Their digital values would be automatically altered after
// button press by 4-bit latch
int p1 = 10;
int p2 = 11;
int p3 = 12;
int p4 = 13;

// boolean variable which is used to wait until the first input
bool shouldReadInput = true;

void setup()
{
  pinMode(n1, OUTPUT);
  pinMode(n2, OUTPUT);
  pinMode(n3, OUTPUT);
  pinMode(n4, OUTPUT);
  pinMode(m1, OUTPUT);
  pinMode(m2, OUTPUT);
  pinMode(m3, OUTPUT);
  pinMode(m4, OUTPUT);
  
  Serial.begin(9600);
  Serial.setTimeout(100);
}

void loop()
{
    if (shouldReadInput) {
    	Serial.println("What is your input A?");
      	shouldReadInput = false;
    }
  
    while (Serial.available() > 0) {
  		int num1 = Serial.parseInt();
        Serial.print("Your input A is ");
        Serial.println(num1);
        
        // Read digital values from the pins (10-13) that save previous State in red LEDs
      	int sbit1 = digitalRead(p4);
      	int sbit2 = digitalRead(p3);
      	int sbit3 = digitalRead(p2);
      	int sbit4 = digitalRead(p1);
      	int savedBitSum = 0;
      	if (sbit1 == 1) savedBitSum += 8;
      	if (sbit2 == 1) savedBitSum += 4;
      	if (sbit3 == 1) savedBitSum += 2;
      	if (sbit4 == 1) savedBitSum += 1;
      
        Serial.print("Previous state is ");
     	Serial.println(savedBitSum);

        int sum = num1 + savedBitSum;  // computed sum with previous state
        Serial.print("The sum of inputs is ");
        Serial.println(sum);

        Serial.print("In binary it is ");
        for (int i = 4; i >= 0; i--) {
            Serial.print(bitRead(sum, i));
        }
        Serial.println();
        Serial.println("The sum is displayed with LEDs");
      
      	// add new number by bits for 4-bit adder
      	digitalWrite(n1, bitRead(num1, 0));
      	digitalWrite(n2, bitRead(num1, 1));
      	digitalWrite(n3, bitRead(num1, 2));
      	digitalWrite(n4, bitRead(num1, 3));
      
      	// add previous saved number by bits for 4-bit adder
      	digitalWrite(m1, bitRead(savedBitSum, 0));
      	digitalWrite(m2, bitRead(savedBitSum, 1));
      	digitalWrite(m3, bitRead(savedBitSum, 2));
      	digitalWrite(m4, bitRead(savedBitSum, 3));

        Serial.println();
      	shouldReadInput = true;
    }
}