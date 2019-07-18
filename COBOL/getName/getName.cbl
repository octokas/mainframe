*>***************************************************
*> GETNAME Write program to get username and email  *
*>***************************************************
     IDENTIFICATION DIVISION.
       PROGRAM-ID. GETNAME as "GETNAME".
	   AUTHOR. 	KASKA MISKOLCZI.

       ENVIRONMENT DIVISION.
	   CONFIGURATION SECTION.
	   SOURCE-COMPUTER. 
	   OBJECT-COMPUTER.
	   
       INPUT-OUTPUT SECTION.
              
               
       DATA DIVISION.
       FILE SECTION.
   
       WORKING-STORAGE SECTION.
       01  WS-GVNAME	PIC X(8).
       01  WS-SURNAME   PIC X(8).
       01  WS-EMAIL     PIC X(36).
   

       PROCEDURE DIVISION.
       0001-HELLO-USER.
	   
		   DISPLAY "Please enter your given name".
		   ACCEPT WS-GVNAME.
		   DISPLAY "Okay ", WS-GVNAME,.
		   DISPLAY "Please enter your surname".
		   ACCEPT WS-SURNAME.
		   DISPLAY "Awesome! Now what is your email address?".
		   ACCEPT WS-EMAIL.
		   DISPLAY "Hello ", WS-GVNAME WS-SURNAME.
		   DISPLAY "Glad we got you into the system!".
           			
           STOP RUN.
           
          END PROGRAM GETNAME.
