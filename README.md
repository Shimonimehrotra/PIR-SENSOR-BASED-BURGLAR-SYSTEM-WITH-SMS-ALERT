# PIR-SENSOR-BASED-BURGLAR-SYSTEM-WITH-SMS-ALERT

## Abstract

The aim of this project is to detect the presence of an intruder and raise an alarm as well as send an SMS alert to a given mobile number. 

The project involves 5 main components: The AT89S52 microcontroller, which is a cheap, commercially available variant of the 8051 microcontroller, PIR motion sensor, LCD Module, Buzzer and GSM Module.

The circuit senses the intrusion using a PIR sensor and sends an SMS to a given number, using a GSM module. The number of intrusions taken place is also displayed on an LCD display. 

The 8051 microcontroller is used for monitoring the PIR sensor and sending the alert message using the GSM module. An alarm is also raised when the intrusion occurs via the sounding of a buzzer.


## Methodology

Output pin of the PIR sensor is connected to P3.5 of the microcontroller. Data pins (D0 to D7) of the LCD module are connected to Port 0 of the microcontroller. Each pin of Port 0 is pulled up using a 10K x 8 resistor network. Port 0 of the 8051 is open drain  and has no internal pull up resistor. So we need external pull-up resistors to make it work properly as output pins. Control pins (RS, RW and E) of the LCD module are connected to P2.7, P2.6 and P2.5 of the microcontroller respectively. 


The LCD module we are using here is LM044L. Resistor R4 is used for setting the contrast of the display. Push button switch S2, capacitor C11 and resistor R6 are associated with the reset circuit. Capacitor C11 is used to debounce the push button switch. The C11 actually by-passes the vibrations produced when the push button switch is pressed. If C11 is not used, the microcontroller will read all the vibrations as key presses and the system will perform multiple resets. Crystal X1 and capacitors C8, C10 are associated with the clock circuitry. The baud rate used for serial communication in this project is 9600. So the crystal needs to be exactly 11.0592 MHz for getting this baud rate.

## Circuit Diagram

![Screenshot 2021-07-16 175305](https://user-images.githubusercontent.com/58876793/125946806-c574e2a4-bbc1-4e7b-b03f-46dbebdddff5.jpg)




