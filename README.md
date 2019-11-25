# Robotic-Arm-interfaced-with-Leap-Motion-Sensor
Using leap motion sensor to control a arduino based 6 DOF robotic arm

In mostly every field of robotics 5 or 6-dof robotic arm is utilized in making our task easier, the robots do not 
require any human interaction but in some cases robots are to be manually controlled to perform certain tasks which 
were not programmed initially. Bomb disposing, space and military mission and medical rehabilitation require manual 
controlled robots to perform real timeoperations.

With some reference and all i managed make a robotic arm with 6DOF arduino based interfaced which can be controlled 
using leap motion controller.

The basic principle is that collecting raw, pitch, yaw, x y and z position data of our hand using leap motion
sensor and mapping those values to corresponding angles of servos and sending those values to arduino using serial 
communications.

Leap sensor will start detecting hand and its movement of arm, wrist and fingers. When the hand does any
movement it will detect the movement and process itsmovement and send it to motors working at our robotic
arm for wrist to fingers movement. The hand movementwill be transmitted wirelessly to our robotic arm. 
Wireless communication will help in distance communication here i am using zigbee for the communication.

The values from the leap motion sensor is sent to the zigbee and the arduino receives the signal and using servo library 
writes the value to the servos

For collecting data from the leap motion sensor, processing software is used.
