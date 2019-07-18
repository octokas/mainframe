IDENTIFICATION DIVISION.
PROGRAM-ID CASHREGISTER.
AUTHOR. KASKA MISKOLCZI.
*>********************************************************************************
*>  Program simulates cash register when adding items to a calculated sheet. *
*>********************************************************************************

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SOURCE-COMPUTER. 
OBJECT-COMPUTER.

INPUT-OUTPUT SECTION.
FILE-CONTROL.
               
DATA DIVISION.
FILE SECTION.
					   
WORKING-STORAGE SECTION.
      01  WS-FIELDS.
           05  FILLER   PIC X(30) VALUE 'WORKING STORAGE STARTS HERE'.
           05  WS-DISCOUNT PIC V99 VALUE .20.
           05  WS-ITEM-PRICE   PIC 999V99.
           05  WS-QUANTITY  PIC 99  VALUE ZEROES.
           05  WS-TOTAL-QUANT  PIC 999.
           05  WS-ITEM-TOTAL   PIC 9999V99.
           05  WS-TOTAL-SALE   PIC 9999V99.
           05  WS-TOT-WITH-DISC   PIC 9999V99.
           05  WS-DESCRIPTION  PIC X(20).
           05  WS-USER-RESPONSE   PIC X.
           88 MORE-ITEMS VALUE 'Y'.
           88 DONE    VALUE 'N'.

      01  WS-DATE.
           05  WS-YEAR PIC 99.
           05  WS-MONTH PIC 99.
           05  WS-DAY   PIC 99.
		   
		   
      01  HEADING-LINE.
           05 FILLER  PIC X(16) VALUE 'ITEM DESCRIPTION'.
           05 FILLER  PIC X(20) VALUE SPACES.
           05 FILLER  PIC X(11)  VALUE 'PRICE'.
           05 FILLER  PIC X(2) VALUE SPACES.
           05 FILLER  PIC X(11)  VALUE 'QUANTITY'.
           05 FILLER  PIC X(2) VALUE SPACES.
           05 FILLER  PIC X(11)  VALUE 'TOTAL'.
			
      01  DETAIL-LINE.
           05 FILLER  PIC X(5) VALUE SPACES.
           05 DET-DESCRIPTION  PIC X(20).
           05 FILLER  PIC X(5) VALUE SPACES.
           05 DET-PRICE  PIC $,$$9.99.
           05 FILLER  PIC X(3) VALUE SPACES.
           05 DET-QUANTITY  PIC Z9.
           05 FILLER  PIC X(3) VALUE SPACES.
           05 DET-ITEM-TOTAL   PIC $$,$$9.99.
	
      01  DETAIL-TOTAL-LINE1.
           05 FILLER  PIC X(46)   VALUE SPACES.
           05 FILLER  PIC X(10)   VALUE "==========".
           
      01  DETAIL-TOTAL-LINE.
           05 FILLER  PIC X(19)   VALUE "    TOTAL QUANITY: ".
           05 DET-TOTAL-QUANT  PIC 999. 
           05 FILLER  PIC XX.
           05 FILLER  PIC X(23)   VALUE "TOTAL BEFORE DISCOUNT: ".
           05 FILLER  PIC X(1) VALUE SPACES.
           05 DET-TOT-SALES PIC $$,$$$,$$9.99.
           05 FILLER  PIC X(3) VALUE SPACES.

      01  DETAIL-TOTAL-DISC.
           05 FILLER  PIC X(24)   VALUE SPACES.
           05 FILLER  PIC X(23)   VALUE "TOTAL WITH DISCOUNT: ".
           05 FILLER  PIC X(1) VALUE SPACES.
           05 DET-TOT-DISC  PIC $$,$$$,$$9.99.
           05 FILLER  PIC X(3) VALUE SPACES.	

      PROCEDURE DIVISION.
           0100-START.
              DISPLAY " ".
              DISPLAY " ".
              DISPLAY " ".
              DISPLAY " ".
              DISPLAY "Welcome to Miskolczi Pets!".
              SET WS-USER-RESPONSE TO 'Y'.
              PERFORM 0200-PROCESS-ITEMS THRU 0200-END 
              UNTIL DONE.

              PERFORM 0290-PRINT-TOTAL.
              PERFORM 0300-STOP-RUN.
           0100-END.	
           
           0200-PROCESS-ITEMS.
              DISPLAY "Enter item description: ".
              ACCEPT WS-DESCRIPTION.
              DISPLAY "Enter item price (99.99): ".
              ACCEPT WS-ITEM-PRICE.
              DISPLAY "Enter quantity: ".
              ACCEPT WS-QUANTITY.

              MOVE WS-DESCRIPTION TO DET-DESCRIPTION.
              MOVE WS-ITEM-PRICE TO DET-PRICE.
              MOVE WS-QUANTITY TO DET-QUANTITY.

              COMPUTE WS-ITEM-TOTAL = WS-ITEM-PRICE * WS-QUANTITY.
              COMPUTE WS-TOTAL-SALE = WS-TOTAL-SALE + WS-ITEM-TOTAL.
              COMPUTE WS-TOTAL-QUANT = WS-TOTAL-QUANT + WS-QUANTITY.
              
              MOVE WS-ITEM-TOTAL TO DET-ITEM-TOTAL.
              DISPLAY DETAIL-LINE.

              DISPLAY "Do you have more items?(Y/N)".
              ACCEPT WS-USER-RESPONSE.
           0200-END.

           0290-PRINT-TOTAL. 			
              DISPLAY DETAIL-TOTAL-LINE1.
              MOVE WS-TOTAL-QUANT TO DET-TOTAL-QUANT.
              MOVE WS-TOTAL-SALE TO DET-TOT-SALES.
                 IF WS-TOTAL-SALE > 100 THEN
                    COMPUTE WS-TOT-WITH-DISC = WS-TOTAL-SALE - (WS-TOTAL-SALE * WS-DISCOUNT)
                    MOVE WS-TOT-WITH-DISC TO DET-TOT-DISC
                 ELSE 
                    MOVE WS-TOTAL-SALE TO DET-TOT-DISC
                 END-IF.
              DISPLAY DETAIL-TOTAL-LINE.
              DISPLAY DETAIL-TOTAL-DISC.
           0290-END.
           0300-STOP-RUN.
      STOP RUN.
    END PROGRAM CASHREGISTER.

*> TODO need to figure out why error comes up with 88: Error: SET target is invalid - 'WS-USER-RESPONSE'