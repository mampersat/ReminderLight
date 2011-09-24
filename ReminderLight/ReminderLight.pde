/*
  Button
 
 Turns on and off a light emitting diode(LED) connected to digital  
 pin 13, when pressing a pushbutton attached to pin 2. 
 
 
 The circuit:
 * LED attached from pin 13 to ground 
 * pushbutton attached to pin 2 from +5V
 * 10K resistor attached to pin 2 from ground
 
 * Note: on most Arduinos there is already an LED on the board
 attached to pin 13.
 
 
 created 2005
 by DojoDave <http://www.0j0.org>
 modified 28 Oct 2010
 by Tom Igoe
 
 This example code is in the public domain.
 
 http://www.arduino.cc/en/Tutorial/Button
 */

// constants won't change. They're used here to 
// set pin numbers:
const int buttonPin = 2;     // the number of the pushbutton pin
const int ledPin =  13;      // the number of the LED pin

//unsigned long remindTime = 60000; //1 min
unsigned long remindTime = 7200000;
unsigned long switchTime = 5000;

boolean triggered = false;
unsigned long triggeredTime = 0;

// variables will change:
int buttonState = 0;         // variable for reading the pushbutton status

void setup() {
  // initialize the LED pin as an output:
  pinMode(ledPin, OUTPUT);      
  // initialize the pushbutton pin as an input:
  pinMode(buttonPin, INPUT);     
}

void loop(){

  buttonState = digitalRead(buttonPin);

  // check if the pushbutton is pressed.
  // if it is, the buttonState is HIGH:
  if (buttonState == HIGH) {     
    triggered = true;
    triggeredTime = millis();
    digitalWrite(ledPin, HIGH);
  }
  
  if (triggered)
  {
    blink();
    return;
  }
  
  if (buttonState == LOW)
  {
    digitalWrite(ledPin, LOW); 
  }
}

void blink() {
  
  unsigned long elapsed = millis() - triggeredTime;
  
  if (elapsed > remindTime)
  {
    triggered = false;
    return;
  }
  
  if (elapsed < switchTime)
  {
    digitalWrite(ledPin, HIGH);
    return;
  }
  
  if ((elapsed / 40) %50 )
  {
    digitalWrite(ledPin, LOW);
  }
  else
  {
    digitalWrite(ledPin, HIGH);
  }
}

