#include <SoftwareSerial.h>
#include<Servo.h>

SoftwareSerial mySerial(8,13);
Servo servo1;
Servo servo2;
Servo servo3;
Servo servo4;
Servo servo5;

char reval;
int aval=0;
int bval,cval,dval,eval,fval;

//Initial Positions

int servo1Ipos = 90;
int servo2Ipos = 10;
int servo3Ipos = 150;
int servo4Ipos = 100;
int servo5Ipos = 120;

// Servo previous Positions
int servo1ppos; 
int servo2ppos;
int servo3ppos;
int servo4ppos;
int servo5ppos;


void setup()
{
  Serial.begin(9600);
  mySerial.begin(9600);

  servo1.attach(11);
  servo2.attach(5);
  servo3.attach(6);
  servo4.attach(9);
  servo5.attach(10);

    pinMode(7,OUTPUT);
    pinMode(4,OUTPUT);
    pinMode(3,OUTPUT);
    pinMode(2,OUTPUT);
aval = servo1Ipos;
bval = servo2Ipos;
cval = servo3Ipos;
dval = servo4Ipos;
eval = servo5Ipos; 
  servo1.write(servo1Ipos);
//    delay(100);
  servo1ppos = servo1Ipos;
  servo2.write(servo2Ipos);
//    delay(100);
  servo2ppos = servo2Ipos;
  servo3.write(servo3Ipos);
//    delay(100);
  servo3ppos = servo3Ipos;
//    delay(100);
  servo4.write(servo4Ipos);
//    delay(100);
  servo4ppos = servo4Ipos;
  servo5.write(servo5Ipos);
//    delay(100);
  servo5ppos = servo5Ipos; 

}

void loop()
{
  fval = 0;
  
  if(mySerial.available()>0)
  {
    
    reval = mySerial.read();
    
   if (reval == 'a' && reval !='b')
    {
      Serial.print("a");
      aval = mySerial.parseInt();
      Serial.println(aval);
    }
    if(reval == 'b' && reval != 'c')
    {
      Serial.print("b");
      bval = mySerial.parseInt();
      Serial.println(bval);
    }
    if(reval == 'c' && reval != 'd')
    {
      Serial.print("c");
      cval = mySerial.parseInt();
      Serial.println(cval);
    }
    if(reval == 'd' && reval != 'e')
    {
      Serial.print("d");
      dval = mySerial.parseInt();
      Serial.println(dval);
    }
    if(reval == 'e' && reval != 'f')
    {
      Serial.print("e");
      eval = mySerial.parseInt();
      Serial.println(eval);
    }
    if(reval == 'f' && reval != 'a')
    {
      Serial.print("f");
      fval = mySerial.parseInt();
      Serial.println(fval);
    }
    switch(fval)
    {
      case 1:
         digitalWrite(7,HIGH);
         digitalWrite(4,LOW);           /// forward
         digitalWrite(3,HIGH);
         digitalWrite(2,LOW);
         fval = 0;
      break;
      case 2:
         digitalWrite(7,LOW);
         digitalWrite(4,HIGH);           /// reverse
         digitalWrite(3,LOW);
         digitalWrite(2,HIGH);
         fval = 0;
      break;
      case 3:
          digitalWrite(7,HIGH);
          digitalWrite(4,LOW);
          digitalWrite(3,LOW);          // right
          digitalWrite(2,HIGH);
          fval = 0;
      break;
      case 4:
          digitalWrite(4,HIGH);
          digitalWrite(7,LOW);
          digitalWrite(2,LOW);          // left
          digitalWrite(3,HIGH);
          fval = 0;
      break;
      case 5:
          digitalWrite(7,LOW);
          digitalWrite(4,LOW);
          digitalWrite(2,LOW);          // stop
          digitalWrite(3,LOW);
          fval = 0;
      break;
    }
   servo5.write(eval);
   servo5ppos = eval;
   
   servo1.write(aval);
//   delay(200);
   servo1ppos = aval;
   
   servo2.write(bval);
//   delay(200);
   servo2ppos = bval;
   
   servo3.write(cval);
//   delay(200);
   servo3ppos = cval;
   
   servo4.write(dval);
//   delay(200);
   servo4ppos = dval;

 }
}
