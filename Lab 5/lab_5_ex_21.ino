// n - 4-bit representation of number 1
int n1 = 2;
int n2 = 5;
int n3 = 10;
int n4 = 13;

// m - 4-bit representation of number 2
int m1 = 3;
int m2 = 4;
int m3 = 11;
int m4 = 12;

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

        Serial.println("What is your input B?");
        int num2 = Serial.parseInt();
        Serial.print("Your input B is ");
        Serial.println(num2);

        int sum = num1 + num2; // computed sum
        Serial.print("The sum of inputs is ");
        Serial.println(sum);

        Serial.print("In binary it is ");
        for (int i = 3; i >= 0; i--) {
            Serial.print(bitRead(sum, i));
        }
        Serial.println();
        Serial.println("The sum is displayed with LEDs");
      
      	// add first number by bits for 4-bit adder
      	digitalWrite(n1, bitRead(num1, 0));
      	digitalWrite(n2, bitRead(num1, 1));
      	digitalWrite(n3, bitRead(num1, 2));
      	digitalWrite(n4, bitRead(num1, 3));
      
      	// add second number by bits for 4-bit adder
      	digitalWrite(m1, bitRead(num2, 0));
      	digitalWrite(m2, bitRead(num2, 1));
      	digitalWrite(m3, bitRead(num2, 2));
      	digitalWrite(m4, bitRead(num2, 3));
      
        Serial.println();
      	shouldReadInput = true;
    }
}