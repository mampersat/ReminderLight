/* Reminder Light
 * --------------
 * When the device is moved it will blink for 2 hrs
 * Alerting whomever comes along that it was moved recently
 *
 * Created 2011
 * by: M@
 * http://Mampersat.com
 * Has no battery saving techniques
 */

const int buttonPin = 2;     
const int ledPin =  13;      

const unsigned long solidTime = 3000;      // Time to stay light after activation
const unsigned long blinkTime = 3600;   // Time to blink
const unsigned long blinkRate = 500;       // Time between blinks
const unsigned long blinkSpan = 200;       // Time on in a blink

int buttonState = 0;        
int lastButtonState = buttonState;
unsigned long startTime = 0;

void setup() {
  pinMode(ledPin, OUTPUT);      
  pinMode(buttonPin, INPUT);     
}

void loop(){
  
  buttonState = digitalRead(buttonPin);

  if (buttonState != lastButtonState)
  {
    startTime = millis();
    lastButtonState = buttonState;
  }
  
  if (startTime)
  {
    if (millis() < (startTime + solidTime) )
    {
      digitalWrite(ledPin, HIGH); 
    }
    else if (millis() > (startTime + solidTime +blinkTime ) )
    {
      digitalWrite(ledPin, LOW);
      startTime = 0;
    }
    else 
    {
      // Use modulus operator to control steady blinking
      if ( (millis() - startTime - solidTime) % (blinkRate *2) < blinkSpan ) 
      {
        digitalWrite(ledPin, HIGH);
      }
      else
      {
        digitalWrite(ledPin, LOW);
      }
    }
  }
}
