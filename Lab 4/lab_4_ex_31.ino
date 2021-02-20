int A = 8;
int B = 9;
int C = 10;
int D = 11;

void setup()
{
  pinMode(A, OUTPUT);
  pinMode(B, OUTPUT);
  pinMode(C, OUTPUT);
  pinMode(D, OUTPUT);
  digitalWrite(A, LOW);
  digitalWrite(B, LOW);
  digitalWrite(C, LOW);
  digitalWrite(D, LOW);
}

void loop()
{
  // Task to print 201797896
  printTwo();
  printZero();
  printOne();
  printSeven();
  printNine();
  printSeven();
  printEight();
  printNine();
  printSix();
  delay(1000);
}

void printZero() {
  turnOffAll();
  delay(1000);
}

void printOne() {
  turnOffAll();
  digitalWrite(A, HIGH);
  delay(1000);
}

void printTwo() {
  turnOffAll();
  digitalWrite(B, HIGH);
  delay(1000);
}

void printSix() {
  turnOffAll();
  digitalWrite(B, HIGH);
  digitalWrite(C, HIGH);
  delay(1000);
}

void printSeven() {
  turnOffAll();
  digitalWrite(A, HIGH);
  digitalWrite(B, HIGH);
  digitalWrite(C, HIGH);
  delay(1000);
}

void printEight() {
  turnOffAll();
  digitalWrite(D, HIGH);
  delay(1000);
}

void printNine() {
  turnOffAll();
  digitalWrite(D, HIGH);
  digitalWrite(A, HIGH);
  delay(1000);
}

void turnOffAll() {
  digitalWrite(A, LOW);
  digitalWrite(B, LOW);
  digitalWrite(C, LOW);
  digitalWrite(D, LOW);
}