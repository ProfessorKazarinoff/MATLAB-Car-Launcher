//Declare pin functions on Redboard
#define stp 8
#define dir 9
#define MS1 10
#define MS2 11
#define EN  12

//Declare variables for functions
char user_input;
int x;
int y;
int state;

//Declare output pins
void setup() {
  pinMode(stp, OUTPUT);
  pinMode(dir, OUTPUT);
  pinMode(MS1, OUTPUT);
  pinMode(MS2, OUTPUT);
  pinMode(EN, OUTPUT);
  resetEDPins(); //Set step, direction, microstep and enable pins to default states
  Serial.begin(9600); //Open Serial connection for debugging
  Serial.println("Begin motor control");
  Serial.println();
  //Print function list for user selection
  Serial.println("Enter number for control option:");
  Serial.println("1. Turn at default microstep mode.");
  Serial.println();
}

//Main loop
void loop() {
  while(Serial.available()){
      user_input = Serial.read(); //Read user input and trigger appropriate function
      digitalWrite(EN, LOW); //Pull enable pin low to allow motor control
      if (user_input =='1')
      {
         StepForwardDefault();
      }
   
      else
      {
        Serial.println("Invalid option entered.");
      }
      resetEDPins();
  }
}

//Reset Easy Driver pins to default states
void resetEDPins()
{
  digitalWrite(stp, HIGH); //Keep high so drivers don't get as hot
  digitalWrite(dir, HIGH); //Keep high so drivers don't overheat
  digitalWrite(MS1, HIGH); //Keep high so drivers don't overheat
  digitalWrite(MS2, LOW); //Keep low so the motors move
  digitalWrite(EN, LOW); //Keep low so motor holds torque
}

//Default microstep mode function
void StepForwardDefault()
{
  Serial.println("Moving forward at default step mode.");
  digitalWrite(dir, LOW); //Pull direction pin low to move "forward"
 
  StepQuarterTurn();

  delay(5000); //Delay 5 seconds
  digitalWrite(dir, HIGH); //Pull direction pin high to move in "reverse"

  StepQuarterTurn();
 
  Serial.println("Enter new option");
  Serial.println();
}

void StepQuarterTurn()
{
   for(x= 1; x<100; x++)  //Loop the forward stepping enough times for motion to be visible
  {
    digitalWrite(stp,HIGH); //Trigger one step forward
    delay(1);
    digitalWrite(stp,LOW); //Pull step pin low so it can be triggered again
    delay(1);
  }
}

