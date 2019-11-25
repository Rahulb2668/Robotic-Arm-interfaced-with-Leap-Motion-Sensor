


import processing.serial.*;

import de.voidplus.leapmotion.*;

LeapMotion leap;

Serial my_port;

String cmd;

void setup()
{
  
 size(850,600,P3D);
 background(255);
 leap = new LeapMotion(this);
 String portName = Serial.list()[1];
 //println()
 my_port = new Serial(this,portName,9600);
 
}
//Function for end-effector gripper


void draw()
{
  background(255);
  for(Hand hand: leap.getHands())
  {
    int hand_id = hand.getId();
    PVector hand_position = hand.getPosition();
    PVector hand_direction = hand.getDirection();                                        
    float hand_roll = hand.getRoll();
    float hand_pitch = hand.getPitch();
    float strength = hand.getGrabStrength();
    

    int hand_yposavg=0;
    int hand_yawavg=0;
    int strengthavg=0;
    int palm_posavg=0;
    int hand_xposavg =0;
    
  int motion= 0 ;  
  boolean f1 = hand.getIndexFinger().isExtended();
  boolean f2 = hand.getMiddleFinger().isExtended();
  boolean f3 = hand.getThumb().isExtended();
  boolean f4 = hand.getPinkyFinger().isExtended();
  boolean f5 = hand.getRingFinger().isExtended();
  
  
  if (f1 == true & f2 == false & f3 == false & f4 == false & f5== false)
  {
   motion = 1; 
   print("forward");
  }
  if(f1 == true & f2 == true & f3 == false & f4 == false & f5== false )
  {
   motion = 2;
  print("reverse");
  }
  if(f1 == true & f2 == false & f3 == false & f4 == true & f5== false)
  {
    motion = 3;
    print("Right");
  }
  if(f1 == false & f2 == false & f3 == true & f4 == true & f5== false)
  {
    motion = 4;
    print("left");
  }
  if(f1 == true & f2 == true & f3 == true & f4 == true & f5== true||f1 == false & f2 == false & f3 == false & f4 == false & f5== false)
  {
    motion = 5;
    print("stop");
  }
    
  // Gripper Servo
  
   for(int i=0;i<200;i++)
   {
     strength = hand.getGrabStrength();
     strengthavg = strengthavg+int(strength);
   }
   strengthavg = strengthavg/200;
   //println("Strength of grab is ", strengthavg);
     
  //Wrist Servo
  
  for(int i=0;i<200;i++)
   {
     float palm_pos  = hand.getPitch();
     palm_posavg = palm_posavg+int(palm_pos);
   }
    palm_posavg = palm_posavg/200;
    //println(palm_posavg);
    if (palm_posavg>70)
      {
        palm_posavg = 100;
          }
    if (palm_posavg<-70)
       {
         palm_posavg  =-100;
          }
   
  ////  Y Servo
  
  for(int i=0;i<200;i++)
   {
     float hand_ypos= hand.getPosition().y;
     hand_yposavg = hand_yposavg+int(hand_ypos);
   } 
   hand_yposavg = hand_yposavg/200;
  // println(hand_yposavg);
    if (hand_yposavg>520)
      {
        hand_yposavg = 600;
          }
    if (hand_yposavg<190)
       {
         hand_yposavg =150;
          }
  
  ////X Servo
  
  for(int i=0;i<200;i++)
   {
     float hand_xpos= hand.getPalmPosition().z;
     hand_xposavg = hand_xposavg+int(hand_xpos);
   }
   
   hand_xposavg = hand_xposavg/200;
   //println(hand_xposavg);
    if (hand_xposavg>95)
      {
        hand_xposavg = 105;
          }
    if (hand_xposavg<-15)
       {
         hand_xposavg =-25;
       }
  
  
  ////Base Servo
   
   for(int i=0;i<200;i++)
   {
     float hand_yaw = hand.getYaw();
     hand_yawavg = hand_yawavg+int(hand_yaw);
      }
    hand_yawavg = hand_yawavg/200;
    //println(hand_yawavg);
    if (hand_yawavg>50)
      {
        hand_yawavg = 65;
        //println(hand_yawavg);
          }
    if (hand_yawavg<-70)
       {
         hand_yawavg  =-80;
         //println(hand_yawavg);
          }
    
   strengthavg = int(map(strengthavg,0,1,180,40));
   palm_posavg = int(map(palm_posavg,100,-100,40,180));
   hand_yposavg  =int(map(hand_yposavg,150,600,90,180));
   hand_xposavg = int(map(hand_xposavg,-25,105,0,170));
   hand_yawavg = int(map(hand_yawavg,-80,65,0,180));
   
   String cmd = "a"+hand_yawavg+"b"+hand_xposavg+"c"+hand_yposavg+"d"+palm_posavg+"e"+strengthavg+"f"+ motion ;
   my_port.write(cmd);
   delay(1000);
   println(cmd);
   
     
  }        
}
