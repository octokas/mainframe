*>**********************************************************************************************************************************
*> EVENODD Write  a program to display the number of even and odd numbers , sum of even numbers and odd numbers between 1 to 100. *
*>**********************************************************************************************************************************

       IDENTIFICATION DIVISION.                                    
       PROGRAM-ID. EVENODD.  
       AUTHOR. 	KASKA MISKOLCZI.
        
       ENVIRONMENT DIVISION.                                    
       CONFIGURATION SECTION.
	   SOURCE-COMPUTER. 
	   OBJECT-COMPUTER.
	   
       INPUT-OUTPUT SECTION.
       
       DATA DIVISION.
       FILE SECTION.
                                                     
       WORKING-STORAGE SECTION.                                    
       01 EVEN-ODD.                                                
           05 NUM        PIC 9(1) OCCURS 100 TIMES.                
       77 SUM-EVEN       PIC 9(4) VALUE 0.                         
       77 SUM-ODD        PIC 9(4) VALUE 0.                         
       77 IDX            PIC 9(3) VALUE 1.                         
       77 QUO            PIC 9(3).                                 
       77 REM            PIC 9(3).                                 
       PROCEDURE DIVISION.                                         
       MAIN-PARA.                                                  
            PERFORM COMP-PARA.                                   
            STOP RUN.    
            
        COMP-PARA.                                               
            PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > 100      
               DIVIDE IDX BY 2 GIVING QUO REMAINDER REM          
               IF REM = 0                                        
                  COMPUTE SUM-EVEN = SUM-EVEN + IDX              
               ELSE                                              
                  COMPUTE SUM-ODD = SUM-ODD  + IDX               
               END-IF                                            
            END-PERFORM.   
            
            DISPLAY "Even SUM: ", SUM-EVEN.                        
            DISPLAY "Odd SUM: ", SUM-ODD.
            
        END PROGRAM EVENODD.