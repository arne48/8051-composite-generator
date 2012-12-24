.ORG 0x00
;;;;CONTROL-REGISTER;;;;;;
MOV 	R0,#10 ;V-BLANKING-COUNTER
MOV 	R4,#242;LINE-COUNTER & LOOP-COUNTER ;MAYBE 241/242
MOV 	DPTR, #FRAMEBUFF;POSITION OF THE FRAMEBUFFER IN FLASH
MOV 	B,#0;OFFSET FOR FRAMEBUFFER
;;;;/CONTROL-REGISTER;;;;;;

;;;;INIT_PORTS
CLR	P0.0
CLR	P1.0
;;;;/INIT_PORTS

;;;;V-SYNC PATTER;;;;
VSYNC:
ACALL	SHORT_PULSE
ACALL	SHORT_PULSE
ACALL	SHORT_PULSE
ACALL	SHORT_PULSE
ACALL	SHORT_PULSE
ACALL	SHORT_PULSE
ACALL	LONG_PULSE
ACALL	LONG_PULSE
ACALL	LONG_PULSE
ACALL	LONG_PULSE
ACALL	LONG_PULSE
ACALL	LONG_PULSE
ACALL	SHORT_PULSE
ACALL	SHORT_PULSE
ACALL	SHORT_PULSE
ACALL	SHORT_PULSE
ACALL	SHORT_PULSE
ACALL	SHORT_PULSE
NOP
NOP
NOP
;;;;;; VERTICAL-BLANKING ;;;;;;;;
MOV 	R0,#10
V_BLANK:
CLR	P0.0
MOV 	R4,#6
ACALL 	BROAD
SETB	P0.0
MOV 	R4,#115
V_BLANKL:
DJNZ 	R4,V_BLANKL
NOP
DJNZ 	R0,V_BLANK

V_BLANK_LAST:
CLR	P0.0
MOV 	R4,#6
ACALL 	BROAD
SETB	P0.0
MOV 	R4,#112
V_BLANKL_LAST:
DJNZ 	R4,V_BLANKL_LAST
MOV 	R4,#242
NOP
NOP
LJMP 	SCAN_LINE

;;;;SHORT-PULSE PATTERN;;;;
SHORT_PULSE:
CLR	P0.0
CLR	P1.0
NOP
NOP
NOP
NOP		
NOP
NOP		
NOP
SETB 	P0.0
NOP
MOV 	R4,#54
SHORT_PULSEL:
DJNZ 	R4, SHORT_PULSEL
NOP
NOP
NOP
RET


;;;;LONG-PULSE PATTERN;;;;
LONG_PULSE:
CLR	P0.0
CLR	P1.0
MOV 	R4,#50
LONG_PULSEL:
DJNZ 	R4,LONG_PULSEL
NOP	
NOP
NOP			
NOP
SETB	P0.0	
NOP				
MOV 	R4,#6
BROAD:
DJNZ 	R4,BROAD
NOP
RET


;;;;DRAW ONE LINE;;;;
SCAN_LINE:
NOP			;Front Porch	
NOP
NOP
NOP
NOP
CLR	P0.0 	
MOV 	R1,#8		;H-Sync pulse
H_SYNC_LOOP:
DJNZ	R1, H_SYNC_LOOP
NOP
SETB	P0.0
MOV	R1,#7		;Back Porch
BACK_PORCH_LOOP:
DJNZ	R1, BACK_PORCH_LOOP
NOP
NOP			;'Active Display' period
SETB	P1.0		;Start with short white peak
MOV	A,B
MOVC	A,@DPTR+A	;+A==Work-Around because the leak of a direct transfer from DPTR to A
MOV	P1,A		;First Bit will appear on P1.0
RR	A		;Shift A to get next Pixel-State (White||Black)
MOV	P1,A		;Second Bit will appear on P1.0
RR	A		;Do-Again for 10bytes
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV 	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
INC	DPTR
MOV	A,B
MOVC	A,@DPTR+A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV 	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
INC	DPTR
MOV	A,B
MOVC	A,@DPTR+A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV 	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
INC	DPTR
MOV	A,B
MOVC	A,@DPTR+A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV 	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
INC	DPTR
MOV	A,B
MOVC	A,@DPTR+A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV 	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
INC	DPTR
MOV	A,B
MOVC	A,@DPTR+A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV 	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
INC	DPTR
MOV	A,B
MOVC	A,@DPTR+A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV 	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
INC	DPTR
MOV	A,B
MOVC	A,@DPTR+A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV 	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
INC	DPTR
MOV	A,B
MOVC	A,@DPTR+A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV 	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
INC	DPTR
MOV	A,B
MOVC	A,@DPTR+A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
RR	A
MOV 	P1,A
RR	A
MOV	P1,A
RR	A
MOV	P1,A
INC	DPTR
NOP
NOP
NOP
NOP
NOP
DJNZ	R4,NO_SYNC		;If not at frame-end just start over with next line
MOV 	DPTR, #FRAMEBUFF	;If 242th line write start of framebuffer back to DPTR
AJMP	VSYNC			;initiate VSYNC
NO_SYNC:			
CLR	P1.0 			;If no sync need clean-up Port-States
SETB	P0.0			;If no sync need clean-up Port-States
LJMP 	SCAN_LINE		;Do next line
.END

;;;;ALLOCATE FRAMEBUFFER IN FLASH;;;;
FRAMEBUFF:
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 192
.DB 15
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 192
.DB 15
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 192
.DB 15
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 96
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 96
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 96
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 48
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 48
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 48
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 24
.DB 0
.DB 0
.DB 0
.DB 128
.DB 2
.DB 0
.DB 0
.DB 0
.DB 0
.DB 24
.DB 0
.DB 0
.DB 0
.DB 128
.DB 2
.DB 0
.DB 0
.DB 0
.DB 0
.DB 24
.DB 0
.DB 0
.DB 0
.DB 128
.DB 2
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 0
.DB 0
.DB 0
.DB 0
.DB 7
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 0
.DB 0
.DB 0
.DB 0
.DB 7
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 0
.DB 0
.DB 0
.DB 0
.DB 7
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 0
.DB 0
.DB 0
.DB 0
.DB 2
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 0
.DB 0
.DB 0
.DB 0
.DB 2
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 0
.DB 0
.DB 0
.DB 0
.DB 2
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 224
.DB 125
.DB 239
.DB 189
.DB 122
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 224
.DB 125
.DB 239
.DB 189
.DB 122
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 224
.DB 125
.DB 239
.DB 189
.DB 122
.DB 0
.DB 0
.DB 0
.DB 0
.DB 24
.DB 32
.DB 85
.DB 41
.DB 133
.DB 74
.DB 0
.DB 0
.DB 0
.DB 0
.DB 24
.DB 32
.DB 85
.DB 41
.DB 133
.DB 74
.DB 0
.DB 0
.DB 0
.DB 0
.DB 24
.DB 32
.DB 85
.DB 41
.DB 133
.DB 74
.DB 0
.DB 0
.DB 0
.DB 0
.DB 48
.DB 32
.DB 85
.DB 47
.DB 189
.DB 122
.DB 30
.DB 0
.DB 0
.DB 0
.DB 48
.DB 32
.DB 85
.DB 47
.DB 189
.DB 122
.DB 30
.DB 0
.DB 0
.DB 0
.DB 48
.DB 32
.DB 85
.DB 47
.DB 189
.DB 122
.DB 30
.DB 0
.DB 0
.DB 0
.DB 96
.DB 32
.DB 85
.DB 33
.DB 161
.DB 10
.DB 0
.DB 0
.DB 0
.DB 0
.DB 96
.DB 32
.DB 85
.DB 33
.DB 161
.DB 10
.DB 0
.DB 0
.DB 0
.DB 0
.DB 96
.DB 32
.DB 85
.DB 33
.DB 161
.DB 10
.DB 0
.DB 0
.DB 0
.DB 0
.DB 192
.DB 239
.DB 85
.DB 225
.DB 189
.DB 122
.DB 0
.DB 0
.DB 0
.DB 0
.DB 192
.DB 239
.DB 85
.DB 225
.DB 189
.DB 122
.DB 0
.DB 0
.DB 0
.DB 0
.DB 192
.DB 239
.DB 85
.DB 225
.DB 189
.DB 122
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 1
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 1
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 1
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 1
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 1
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 1
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 248
.DB 7
.DB 0
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 248
.DB 7
.DB 0
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 248
.DB 7
.DB 0
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 0
.DB 0
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 0
.DB 0
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 0
.DB 0
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 0
.DB 0
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 0
.DB 0
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 0
.DB 0
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 0
.DB 0
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 0
.DB 0
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 0
.DB 0
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 0
.DB 0
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 0
.DB 0
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 0
.DB 0
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 248
.DB 151
.DB 247
.DB 158
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 248
.DB 151
.DB 247
.DB 158
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 248
.DB 151
.DB 247
.DB 158
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 148
.DB 148
.DB 146
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 148
.DB 148
.DB 146
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 148
.DB 148
.DB 146
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 148
.DB 148
.DB 146
.DB 120
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 148
.DB 148
.DB 146
.DB 120
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 148
.DB 148
.DB 146
.DB 120
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 148
.DB 148
.DB 146
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 148
.DB 148
.DB 146
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 148
.DB 148
.DB 146
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 148
.DB 151
.DB 146
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 148
.DB 151
.DB 146
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 148
.DB 151
.DB 146
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 248
.DB 23
.DB 148
.DB 190
.DB 1
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 248
.DB 23
.DB 148
.DB 190
.DB 1
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 248
.DB 23
.DB 148
.DB 190
.DB 1
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 4
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 4
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 4
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 128
.DB 7
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 128
.DB 7
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 128
.DB 7
.DB 0
.DB 0
.DB 0
.DB 0
.DB 248
.DB 1
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 248
.DB 1
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 248
.DB 1
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 4
.DB 0
.DB 0
.DB 0
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 4
.DB 0
.DB 0
.DB 0
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 4
.DB 0
.DB 0
.DB 0
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 4
.DB 0
.DB 0
.DB 0
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 4
.DB 0
.DB 0
.DB 0
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 4
.DB 0
.DB 0
.DB 0
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 6
.DB 0
.DB 0
.DB 0
.DB 224
.DB 3
.DB 0
.DB 0
.DB 0
.DB 0
.DB 6
.DB 0
.DB 0
.DB 0
.DB 224
.DB 3
.DB 0
.DB 0
.DB 0
.DB 0
.DB 6
.DB 0
.DB 0
.DB 0
.DB 224
.DB 3
.DB 0
.DB 0
.DB 0
.DB 0
.DB 2
.DB 0
.DB 0
.DB 0
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 2
.DB 0
.DB 0
.DB 0
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 2
.DB 0
.DB 0
.DB 0
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 194
.DB 3
.DB 0
.DB 0
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 194
.DB 3
.DB 0
.DB 0
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 194
.DB 3
.DB 0
.DB 0
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 2
.DB 250
.DB 194
.DB 23
.DB 128
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 2
.DB 250
.DB 194
.DB 23
.DB 128
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 2
.DB 250
.DB 194
.DB 23
.DB 128
.DB 128
.DB 0
.DB 0
.DB 0
.DB 0
.DB 2
.DB 138
.DB 94
.DB 244
.DB 158
.DB 188
.DB 3
.DB 0
.DB 0
.DB 0
.DB 2
.DB 138
.DB 94
.DB 244
.DB 158
.DB 188
.DB 3
.DB 0
.DB 0
.DB 0
.DB 2
.DB 138
.DB 94
.DB 244
.DB 158
.DB 188
.DB 3
.DB 0
.DB 0
.DB 0
.DB 6
.DB 250
.DB 210
.DB 23
.DB 146
.DB 164
.DB 0
.DB 0
.DB 0
.DB 0
.DB 6
.DB 250
.DB 210
.DB 23
.DB 146
.DB 164
.DB 0
.DB 0
.DB 0
.DB 0
.DB 6
.DB 250
.DB 210
.DB 23
.DB 146
.DB 164
.DB 0
.DB 0
.DB 0
.DB 0
.DB 12
.DB 9
.DB 82
.DB 16
.DB 146
.DB 164
.DB 0
.DB 0
.DB 0
.DB 0
.DB 12
.DB 9
.DB 82
.DB 16
.DB 146
.DB 164
.DB 0
.DB 0
.DB 0
.DB 0
.DB 12
.DB 9
.DB 82
.DB 16
.DB 146
.DB 164
.DB 0
.DB 0
.DB 0
.DB 0
.DB 248
.DB 248
.DB 210
.DB 23
.DB 190
.DB 188
.DB 0
.DB 0
.DB 0
.DB 0
.DB 248
.DB 248
.DB 210
.DB 23
.DB 190
.DB 188
.DB 0
.DB 0
.DB 0
.DB 0
.DB 248
.DB 248
.DB 210
.DB 23
.DB 190
.DB 188
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 128
.DB 7
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 128
.DB 7
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 128
.DB 7
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 128
.DB 4
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 128
.DB 4
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 8
.DB 128
.DB 4
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 120
.DB 133
.DB 4
.DB 120
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 120
.DB 133
.DB 4
.DB 120
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 120
.DB 133
.DB 4
.DB 120
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 72
.DB 133
.DB 4
.DB 72
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 72
.DB 133
.DB 4
.DB 72
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 72
.DB 133
.DB 4
.DB 72
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 72
.DB 135
.DB 183
.DB 123
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 72
.DB 135
.DB 183
.DB 123
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 72
.DB 135
.DB 183
.DB 123
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 120
.DB 132
.DB 148
.DB 10
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 120
.DB 132
.DB 148
.DB 10
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 120
.DB 132
.DB 148
.DB 10
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 132
.DB 148
.DB 122
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 132
.DB 148
.DB 122
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 132
.DB 148
.DB 122
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 7
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 7
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 7
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 37
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 37
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 37
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 33
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 33
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 33
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 249
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 249
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 249
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 33
.DB 0
.DB 128
.DB 8
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 33
.DB 0
.DB 128
.DB 8
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 33
.DB 0
.DB 128
.DB 8
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 240
.DB 165
.DB 247
.DB 157
.DB 59
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 240
.DB 165
.DB 247
.DB 157
.DB 59
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 240
.DB 165
.DB 247
.DB 157
.DB 59
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 37
.DB 86
.DB 149
.DB 42
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 37
.DB 86
.DB 149
.DB 42
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 37
.DB 86
.DB 149
.DB 42
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 37
.DB 83
.DB 149
.DB 42
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 37
.DB 83
.DB 149
.DB 42
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 37
.DB 83
.DB 149
.DB 42
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 165
.DB 87
.DB 189
.DB 42
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 165
.DB 87
.DB 189
.DB 42
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 165
.DB 87
.DB 189
.DB 42
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 192
.DB 3
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 192
.DB 3
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 192
.DB 3
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 224
.DB 99
.DB 70
.DB 62
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 224
.DB 99
.DB 70
.DB 62
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 224
.DB 99
.DB 70
.DB 62
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 34
.DB 100
.DB 33
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 34
.DB 100
.DB 33
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 34
.DB 100
.DB 33
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 34
.DB 84
.DB 33
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 34
.DB 84
.DB 33
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 34
.DB 84
.DB 33
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 34
.DB 68
.DB 33
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 34
.DB 68
.DB 33
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 16
.DB 34
.DB 68
.DB 33
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 35
.DB 68
.DB 48
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 35
.DB 68
.DB 48
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 35
.DB 68
.DB 48
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 224
.DB 35
.DB 68
.DB 62
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 224
.DB 35
.DB 68
.DB 62
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 224
.DB 35
.DB 68
.DB 62
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 224
.DB 110
.DB 70
.DB 238
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 224
.DB 110
.DB 70
.DB 238
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 224
.DB 110
.DB 70
.DB 238
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 96
.DB 216
.DB 67
.DB 134
.DB 1
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 96
.DB 216
.DB 67
.DB 134
.DB 1
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 96
.DB 216
.DB 67
.DB 134
.DB 1
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0
.DB 0