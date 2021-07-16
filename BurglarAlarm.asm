PIR EQU P3.5          //equates P3.5 to PIR
RS EQU P2.7           //equates P2.7 to RS
RW EQU P2.6           //equates P2.6 to RW
E  EQU P2.5           //equates P2.5 ot E
ORG 00H               //origin

MOV DPTR,#LUT         //loads DPTR with starting address of LUT   
SETB P3.5             //sets P3.5 as input port for PIR sensor
CLR P2.0              //sets 2.0 as output port for alarm
MOV R7,#00D           //loads R7 with 00D

ACALL SPLIT      //calls SPLIT subroutine
MAIN:ACALL DINT       //calls DINT subroutine
     ACALL TEXT1      //calls TEXT1 subroutine
     ACALL LINE2      //calls LINE2 subroutine
     ACALL TEXT2      //calls TEXT2 subroutine
     ACALL TEXT3      //calls TEXT3 subroutine
     ACALL NUM        //calls NUM subroutine
HERE:JNB PIR,HERE     //loops here until PIR output is HIGH
     SETB P2.0        //sets P2.0 (alarm ON)
     INC R7           //increments R7 (No: of intrusions)
     ACALL SPLIT      //calls SPLIT subroutine
	 ACALL DINT       //calls DINT subroutine
     ACALL TEXT1      //calls TEXT1 subroutine
     ACALL LINE2      //calls LINE2 subroutine
     ACALL TEXT4      //calls TEXT4 subroutine
     ACALL TEXT3      //calls TEXT3 subroutine
     ACALL NUM        //calls NUM subroutine
     
HERE1:JB PIR,HERE1    //loops here PIR output is LOW  
      CLR P2.0        //clears P2.0 (alarm OFF)
SJMP MAIN             //jumps to MAIN loop

SPLIT:MOV A,R7        //moves the value in R7 to A
      MOV B,#10D      //loads B with 10D
      DIV AB          //divides A with B
      MOV R6,B        //moves the remainder to R6
      MOV B,#10D      //loads B with 10D
      DIV AB          //divides A with B
      MOV R5,B        //moves the remainder to R5
      MOV R4,B        //moves the quotient to R4
      RET             //returns from subroutine
	  
 TEXT1: MOV A,#73D    //ascii of I in decimal
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#78D            //ascii of N in decimal
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#84D            //ascii of T in decimal
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#82D            //ascii of R in decimal
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#85D            //ascii of U in decimal
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#68D            //ascii of D in decimal
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#69D            //ascii of E in decimal
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#82D            //ascii of R in decimal
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#32D            //ascii of space in decimal
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#65D            //ascii of A in decimal
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#76D            //ascii of L in decimal
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#65D            //ascii of A in decimal
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#82D            //ascii of R in decimal
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#77D            //ascii of M in decimal
ACALL DISPLAY         //calls DISPLAY subroutine
RET                   //returns from subroutine
    
     
 TEXT2: MOV A,#83D    //ascii of S in decimal
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#67D            //ascii of C in decimal
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#65D            //ascii of A in decimal
ACALL DISPLAY         //calls DISPLAY subroutine  
MOV A,#78D            //ascii of N in decimal
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#78D            //ascii of N in decimal
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#73D            //ascii of I in decimal 
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#78D            //ascii of N in decimal
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#71D            //ascii of G in decimal
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#46D            //ascii of . in decimal
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#46D            //ascii of . in decimal
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#32D            //ascii of space in decimal
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#32D            //ascii of space in decimal
ACALL DISPLAY         //calls DISPLAY subroutine
RET                   //returns from subroutine

TEXT3: MOV A,#73D     //ascii of I in decimal 
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#78D            //ascii of N in decimal 
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#84D            //ascii of T in decimal 
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#82D            //ascii of R in decimal 
ACALL DISPLAY         //calls DISPLAY subroutine
RET                   //returns from subroutine

TEXT4: MOV A,#65D     //ascii of A in decimal 
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#76D            //ascii of L in decimal 
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#69D            //ascii of E in decimal 
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#82D            //ascii of R in decimal 
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#84D            //ascii of ! in decimal 
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#33D            //ascii of ! in decimal 
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#33D            //ascii of ! in decimal 
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#33D            //ascii of ! in decimal 
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#33D            //ascii of ! in decimal 
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#32D            //ascii of space in decimal 
ACALL DISPLAY         //calls DISPLAY subroutine
MOV A,#32D            //ascii of space in decimal 
ACALL DISPLAY         //calls DISPLAY subroutine
RET                   //returns from subroutine
 
  NUM:MOV A,R4        //moves 1st digit to A
    ACALL ASCII       //calls ASCII subroutine
    ACALL DISPLAY     //calls DISPLAY subroutine
    MOV A,R5          //moves 2nd digit to A 
    ACALL ASCII       //calls ASCII subroutine
    ACALL DISPLAY     //calls DISPLAY subroutine
    MOV A,R6          //moves last digit to A
    ACALL ASCII       //calls ASCII subroutine
    ACALL DISPLAY     //calls DISPLAY subroutine
    RET               //return subroutine
  
 DINT:MOV A,#0FH      //loads a with 0FH
    ACALL CMD         //calls CMD subroutine
    MOV A,#01H        //loads a with 01H
    ACALL CMD         //calls CMD subroutine
    MOV A,#06H        //loads a with 06H
    ACALL CMD         //calls CMD subroutine
    MOV A,#81H        //loads a with 81H
    ACALL CMD         //calls CMD subroutine
    MOV A,#3CH        //loads a with 3CH
    ACALL CMD         //calls CMD subroutine
    RET               //return from subroutine

LINE2:MOV A,#0C0H     //loads a with 0C0H 
    ACALL CMD         //calls CMD subroutine
    RET               //return from subroutine

CMD: MOV P0,A         //loads P0 with A
    CLR RS            //clears RS pin
    CLR RW            //clears RW pin
    SETB E            //sets E pin
    CLR E             //clears E pin
    ACALL DELAY       //calls DELAY subroutine
    RET               //return from subroutine

DISPLAY:MOV P0,A      //loads P0 with A   
    SETB RS           //sets RS pin
    CLR RW            //clears RW pin
    SETB E            //sets E pin
    CLR E             //clears E pin
    ACALL DELAY       //calls DELAY subroutine
    RET               //return from subroutine

DELAY: CLR E              //clears E
    CLR RS                //clears RS
    SETB RW               //sets RW
    MOV P0,#0FFh          //writes P0 with all 1's
    SETB E                //sets E
    MOV A,P0              //moves P0 to A
    JB ACC.7,DELAY        //jumps to label DELAY when ACC.7 is set
    CLR E                 //clears E
    CLR RW                //clears RW
    RET                   //return from subroutine

ASCII: MOVC A,@A+DPTR     //overwrites A with ascii of data in A 
       RET                //return from subroutine      
    
LUT: DB  48D              //ascii of 0
     DB  49D              //ascii of 1
     DB  50D              //ascii of 2
     DB  51D              //ascii of 3  
     DB  52D              //ascii of 4
     DB  53D              //ascii of 5
     DB  54D              //ascii of 6
     DB  55D              //ascii of 7 
     DB  56D              //ascii of 8
     DB  57D              //ascii of 9
   
    END                   //END statement