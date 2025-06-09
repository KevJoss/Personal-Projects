STACK SEGMENT PARA STACK
	DB 64 DUP (' ')
STACK ENDS


DATA SEGMENT PARA 'DATA'

	FIRST_RUN DB 1                 											; Flag to determine the first execution

;	General variables for window characteristics
	WINDOW_WIDTH DW 140h													; The width of window (320 px)
	WINDOW_HEIGHT DW 0C8h													; The height of window (200 px)
	WINDOW_BOUNDS DW 6														; Anticipation range at the edges (6)
	WINDOW_BOUND_TOP DW 16													; Anticipation range at the top edge (16)

;	Time variables for the game
	TIME_AUX DB 0															; Checking variable for the pass of the time
	GAME_ACTIVE DB 1														; Is the game active? (1 -> Yes and 0 -> No)
	MAIN_MENU DB 0															; The index of main menu (0 -> main menu, 1 -> game)
	WIN_GAME DB 0															; Condition if the player wins (0 -> no wins, 1 -> win)
	
;	UI varaibles for the game
	TEXT_PLAYER_LIFES DB 'x3','$'											; Text with the player lifes
	TEXT_GAME_BLOCKS DB '00', '$'											; Number of destroyed blocks
	TEXT_TITLE_GAME DB 'ARKANOID BY KEV','$'								; Text for the UI design (Title of the game)
	TEXT_GAME_OVER_TITLE DB 'GAMER OVER', '$'								; Game over Title
	TEXT_GAME_OVER_MOTIVATION DB 'Dont give up :)', '$'						; Extra text for game over title
	TEXT_GAME_OVER_PLAY_AGAIN DB 'Press R to play again', '$'				; Text for restar game
	TEXT_GAME_OVER_BACK_MENU DB 'Press M to exit main menu', '$'			; Text to exit main menu
	TEXT_MAIN_MENU_TITLE_GAME DB 'ARKANOID', '$'							; Text for main menu (Title of game)
	TEXT_MAIN_MENU_TITLE_START DB 'Start game - S KEY', '$'					; Text for main menu (Start game)
	TEXT_WIN_SCREEN_VICTORY DB 'VICTORY', '$'								; Text for victory
	TEXT_WIN_SCREEN_CONGRATS DB 'Congratulations!!', '$'					; Text for victory
	TEXT_WIN_SCREEN_GG DB 'GG WP :)', '$'									; Text for vitory
	TEXT_WIN_SCREEN_MENU DB	'Press M to exit main menu', '$'				; Text for victory
	GAME_LIFES DB 3															; Total of lifes of the game 
	DESTROYED_BLOCKS DB 0													; Total of destroyed blocks
	PADDLE_UI_WIDTH DW 020h 												; Decorative paddle (width) for UI lifes (32)
	PADDLE_UI_HEIGH DW 07h													; Decorative paddle (heigh) for UI lifes (7)
	PADDLE_UI_X DW 08h														; X coord on the window for decorative paddle (8)
	Y_PADDLE_UI DW 08h														; Y coordinate on the window for decorative paddle (8) 
	
;	Ball variables for the game
	BALL_ORIGINAL_X DW 0A0h													; X initial	coordinate for ball game (160)	
	BALL_ORIGINAL_Y DW 096h													; Y initial coordinate for ball game (150)
    BALL_X DW 0A0H															; X coordinate for ball game 
	BALL_Y DW 096H															; Y coordinate for ball game
	OLD_BALL_X DW 0A0h             											; Previous coordinate of the ball on X
	OLD_BALL_Y DW 096h             											; Previous coordinate of the ball on Y
	BALL_SIZE DW 06h														; Size of the ball (6x6 px)
	BALL_ORIGINAL_VELOCITY_X DW 08h											; X initial velocity
	BALL_ORIGINAL_VELOCITY_Y DW 05h											; Y initial velocity
	BALL_VELOCITY_X DW 08h													; X (horizontal velocity)
	BALL_VELOCITY_Y DW 05h													; Y (vertical velocity)
	
;	Paddle variables for the game
	PADDLE_X DW 08Ch														; X coordinate of the paddle 
	OLD_PADDLE_X DW 08Ch           											; Previous coordinate of the paddle on X
	PADDLE_Y DW 0B7h														; Y coordinate of the paddle (183)
	PADDLE_ORIGINAL_X DW 08Ch												; X initial cooordinate of the paddle (140)
	PADDLE_WIDTH DW 40h														; Width of the paddle 
	PADDLE_HEIGHT DW 07h													; Height of the paddle
	PADDLE_VELOCITY DW 25h													; Paddle movement speed
	

;   Block variables for each row

; 	First row of blocks
    NUM_BLOCKS DW 10                            							; Total of blocks in first row: 10 blocks
    BLOCKS_X DW 00h, 20h, 40h, 60h, 80h, 0A0h, 0C0h, 0E0h, 100h, 120h		; X coordinate for all rows of blocks (0, 32, 64, 96, 128, 160, 192, 224, 256, 288)
    BLOCK_Y DW 1Eh                           								; Y coordinate for first row (30)
    BLOCK_COLOR DB 04h                          							; Color of first row (RED)
    BLOCK_WIDTH DW 19h                      								; Width blocks 
    BLOCK_HEIGHT DW 0Fh                       								; Heigh blocks
    BLOCKS_ACTIVE DB 10 DUP(1)                  							; State array of first row blocks
    
; 	Second row of blocks
    NUM_BLOCKS2 DW 10                           							; Total of blocks in second row: 10 blocks
    BLOCKS_X2   DW 00h, 20h, 40h, 60h, 80h, 0A0h, 0C0h, 0E0h, 100h, 120h  
    BLOCK_Y2    DW 32h                          							; Y coordinate for second row (50)
    BLOCK_COLOR2 DB 09h                         							; Color of second row (LIGHT BLUE)
    BLOCKS_ACTIVE2 DB 10 DUP(1)                 							; State array of second row blocks
	
; 	Third row of blocks
	NUM_BLOCKS3 DW 10                           							; Total of blocks in third row: 10 blocks
	BLOCKS_X3   DW 00h, 20h, 40h, 60h, 80h, 0A0h, 0C0h, 0E0h, 100h, 120h 
	BLOCK_Y3    DW 46h                         							 	; Y coordinate for third row (70)
	BLOCK_COLOR3 DB 0Eh                         							; Color of third row (YELLOW)
	BLOCKS_ACTIVE3 DB 10 DUP(1)                 							; State array of third row blocks

; 	Fourth row of blocks
	NUM_BLOCKS4 DW 10                           							; Total of blocks in fourth row: 10 blocks
	BLOCKS_X4   DW 00h, 20h, 40h, 60h, 80h, 0A0h, 0C0h, 0E0h, 100h, 120h  	
	BLOCK_Y4    DW 5Ah                          							; Y coordinate for fourth row (90)
	BLOCK_COLOR4 DB 0Dh                         							; Color of fourth row (MAGENTA)
	BLOCKS_ACTIVE4 DB 10 DUP(1)                 							; State array of fourth row blocks
	
;	Variables for Power-ups in game

; 	Power-up (Paddle expansion) variables
	POWERUP_PADDLE_ACTIVE DB 0        										; 0=Not active, 1=Active
	POWERUP_PADDLE_TIMER DW 0        										; Duration of power up
	PADDLE_NORMAL_WIDTH DW 40h       										; Saving the original width of paddle
	
;	Variables for sound
	SOUND_DURATION DW 0001h 												; Sound duration 
	BEEP_FREQ_HIGH DW 0900h 												; High frequency (for collisions with paddle)
	BEEP_FREQ_LOW DW 0300h 													; Low frequency (for collisions with blocks)
	BEEP_FREQ_MED DW 0600h 													; Medium frequency (for collisions with walls)
	
DATA ENDS

CODE SEGMENT PARA 'CODE'
	
	MAIN PROC FAR
	ASSUME CS:CODE,DS:DATA,SS:STACK											; Identify each segment of 8086 architecture
	PUSH DS          														; Save actua DS value in stack
	SUB AX, AX       														; Clean AX register
	PUSH AX          														; Put 0 into stack (using as a initializer)
	MOV AX, DATA     														; Load data segment into AX register
	MOV DS, AX       														; DS points to data segment
	POP AX           														; Retrieves the highest value of the stack (clears the stack)
	POP AX           														; Clears another value from the stack
		
		CHECK_TIME:															; Label for checking the pass of the time 
			CMP WIN_GAME,01h
			JE SHOW_WIN_SCREEN
			
			
			CMP GAME_ACTIVE,00h												; Checking if the game is over to display game over menu
			JE SHOW_GAME_OVER_MENU											; If is equal to zero, jump to SHOW_GAME_OVER_MENU
			
			CMP MAIN_MENU,00h												; Checking if the player is in the main menu
			JE SHOW_MAIN_MENU_GAME											; If is equal to zero, jump to SHOW_MAIN_MENU_GAME
		
			MOV AH, 2Ch														; DOS routine to obtain System Time
			INT 21h															; Interruption of previous routine
			
			CMP DL, TIME_AUX												; Checks if there was a time jump for drawing
			JE CHECK_TIME													; If equal (no time change), skip drawing cycle
			
			MOV TIME_AUX, DL												; Store current centiseconds for next comparison
			
; 			First execution: Drawing blocks
			CMP BYTE PTR [FIRST_RUN], 1										; Put 1 value into FIRST_RUN with a pointer					
			JNE NORMAL_CYCLE												; Check if is the first execution
			
; 			Only the entire screen is cleaned the first time
			CALL CLEAR_SCREEN												; Clear screen before to drawing in window
			MOV BYTE PTR [FIRST_RUN], 0										; The execution status is changed to 0
			
; 			Draw all blocks and UI for the first time
			CALL DRAW_BLOCKS
			CALL DRAW_BLOCKS2
			CALL DRAW_BLOCKS3
			CALL DRAW_BLOCKS4
			CALL DRAW_PADDLE_UI													
			JMP DRAW_MOVING_OBJECTS											; Jump to draw and movement of ball, and paddle
			
		NORMAL_CYCLE:
		
; 			Save ball position
			MOV AX, BALL_X
			MOV OLD_BALL_X, AX												; Put current X coordinate into OLD_BALL_X
			MOV AX, BALL_Y
			MOV OLD_BALL_Y, AX												; Put current Y cooordinate into OLD_BALL_Y
			
; 			Save paddle position
			MOV AX, PADDLE_X
			MOV OLD_PADDLE_X, AX											; Put current X cooordinate into OLD_PADDLE_X

; 			Delete past objects
			CALL CLEAR_BALL_AREA        									; Clears only the previous ball area
			CALL CLEAR_PADDLE_AREA      									; Deletes only the previous paddle area
			
; 			Moving objects
			CALL MOVE_BALL              									; Moving ball and detect collisions
			CALL MOVE_PADDLE            									; Moving paddle
			
			CALL CHECK_POWERUP_TIMER     									; Check the power-up timer
			CALL DETECT_WIN

; 		Draw moving objects		
		DRAW_MOVING_OBJECTS:
			CALL DRAW_BALL              									; Draw new ball position
			CALL DRAW_PADDLE            									; Draw new paddle position
			CALL DRAW_UI													; Draw the UI with the points
			
			JMP CHECK_TIME													; Jump to a new time step
			
;		Show game over screen
		SHOW_GAME_OVER_MENU:
			CALL DRAW_GAME_OVER_MENU										; Calling the drawing menu game over
			JMP CHECK_TIME													; Jump to a new time step
			
;		Show main menu screen
		SHOW_MAIN_MENU_GAME:
			CALL MAIN_MENU_UI												; Calling the drawing main menu screen
			JMP CHECK_TIME													; Jump to a new time step
			
		SHOW_WIN_SCREEN:
			CALL WIN_SCREEN													; Calling the drawing win screen
			
			JMP CHECK_TIME													; Jump to a new time step
			
		RET
	MAIN ENDP
	
;	Procedure to detect win
	
	DETECT_WIN PROC NEAR
		PUSH AX                                   ; Save registers
		PUSH BX
		PUSH CX
		PUSH DI
		
		MOV WIN_GAME, 1                           ; Assume win condition
		
		MOV CX, 010h									; Total number of blocks to check
		MOV DI, OFFSET BLOCKS_ACTIVE              ; Point to blocks array
		
	CHECK_NEXT_BLOCK_WIN:
		CMP BYTE PTR [DI], 1                      ; Is block active? (1)
		JNE BLOCK_DESTROYED                       ; If not active, continue checking
		
		MOV WIN_GAME, 0                           ; Clear win flag
		JMP END_WIN_CHECK                         ; Exit early - no need to check more
		
	BLOCK_DESTROYED:
		INC DI                                    ; Move to next block
		LOOP CHECK_NEXT_BLOCK_WIN                 ; Continue until all blocks checked
		
		
	END_WIN_CHECK:
		POP DI                                    ; Restore registers
		POP CX
		POP BX
		POP AX
		RET
	DETECT_WIN ENDP
	
;	Procedure to verify the collision with the blocks	
	
	CHECK_BLOCK_COLLISION PROC NEAR
	PUSH CX                                									; Save CX register on stack
    PUSH SI                                									; Save SI pointer on stack
    PUSH DI                                									; Save DI pointer on stack
    
; 	Initialize counters and pointers
    MOV CX, NUM_BLOCKS                     									; Set counter to total number of blocks
    MOV SI, OFFSET BLOCKS_X                									; SI points to X-positions array
    MOV DI, OFFSET BLOCKS_ACTIVE           									; DI points to block active status array
    
    MOV AX, 0                              									; Default return value = 0 (no collision)
    
; 	Check each block in the array
    CHECK_NEXT_BLOCK:
    
; 	Check if current block is active
    MOV AL, [DI]                           									; Get active status from array
    CMP AL, 0                             									; Compare with 0 (destroyed)
    JE BLOCK_NOT_ACTIVE                    									; Skip if block is already destroyed
    
    
; 	Collision detection using AABB method
; 	Checks if rectangles overlap: ball and block
    
; 	Check if right edge of ball > left edge of block
    MOV AX, BALL_X
    ADD AX, BALL_SIZE
    CMP AX, [SI]
    JNG BLOCK_NOT_ACTIVE    
    
; 	Check if left edge of ball < right edge of block
    MOV BX, [SI]           
    ADD BX, BLOCK_WIDTH
    CMP BALL_X, BX
    JNL BLOCK_NOT_ACTIVE    

; 	Check if bottom edge of ball > top edge of block
    MOV AX, BALL_Y
    ADD AX, BALL_SIZE
    CMP AX, BLOCK_Y
    JNG BLOCK_NOT_ACTIVE    

; 	Check if top edge of ball < bottom edge of block
    MOV BX, BLOCK_Y
    ADD BX, BLOCK_HEIGHT
    CMP BALL_Y, BX
    JNL BLOCK_NOT_ACTIVE    
    
; 	Collision detected with this block
;	 	Ball fell below screen - update blocks
        UPDATE:
            INC DESTROYED_BLOCKS                      							; Decrease player lives
            CALL UPDATE_BLOCKS                   								; Update life counter display
    MOV BYTE PTR [DI], 0                   									; Mark block as destroyed

	PUSH AX                               		 							; Save AX
	MOV AX, BEEP_FREQ_LOW                  									; Load low frequency
	CALL PLAY_SOUND                        									; Play sound
	POP AX                                 									; Restore AX
    
; 	Visually clear this block (draw in background color)
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    MOV CX, [SI]                           									; Block's X position
    MOV DX, BLOCK_Y                        									; Block's Y position
    
    CLEAR_BLOCK1_VERTICAL:
        PUSH CX                            									; Save initial X
    
    CLEAR_BLOCK1_HORIZONTAL:
        MOV AH, 0Ch                        									; Function: draw pixel
        MOV AL, 00h                        									; Color: black (background)
        INT 10h																; Interruption to draw pixel in window
    
        INC CX																; Increment X position 
        MOV AX, CX
        SUB AX, [SI]
        CMP AX, BLOCK_WIDTH
        JL CLEAR_BLOCK1_HORIZONTAL         									; Continue until full width cleared
    
        POP CX                             									; Restore initial X
        INC DX                             									; Next row
        MOV AX, DX
        SUB AX, BLOCK_Y
        CMP AX, BLOCK_HEIGHT
        JL CLEAR_BLOCK1_VERTICAL           									; Continue until full height cleared
    
    POP DX
    POP CX
    POP BX
    POP AX
    
    NEG BALL_VELOCITY_Y                    									; Reverse ball's vertical direction
    
    MOV AX, 1                              									; Set return value = 1 (collision occurred)
    
    JMP EXIT_BLOCK_CHECK                   									; Exit loop after handling collision

;   Move to next block
    BLOCK_NOT_ACTIVE:
        ADD SI, 2                          									; Move to next X position (2 bytes per word)
        INC DI                             									; Move to next active status byte
        DEC CX                             									; Decrement counter
        JZ EXIT_BLOCK_LOOP                 									; If CX = 0, exit the loop
        JMP CHECK_NEXT_BLOCK               									; Unconditional jump back to start of loop
		
    EXIT_BLOCK_LOOP:
    
; 	Clean up and return
    EXIT_BLOCK_CHECK:
        POP DI                             									; Restore registers from stack
        POP SI
        POP CX
    
        RET
	CHECK_BLOCK_COLLISION ENDP
	
;	Second Row Collision Procedure
	
	CHECK_BLOCK_COLLISION2 PROC NEAR
	
		PUSH CX                            									; Save CX register on stack
		PUSH SI                            									; Save SI pointer on stack
		PUSH DI                            									; Save DI pointer on stack
		
; 		Initialize counter and pointers
		MOV CX, NUM_BLOCKS2                									; Save a counter of number total of blocks in CX
		MOV SI, OFFSET BLOCKS_X2           									; Pointer to X coordinates for blocks into second row 
		MOV DI, OFFSET BLOCKS_ACTIVE2      									; Pointer to states for blocks into second row 
		
		MOV AX, 0                          									; Default return value = 0 (no colission)
		
; 	Check each block in the array BLOCKS_X2
	CHECK_NEXT_BLOCK2:
; 		Check if the block is active 
		MOV AL, [DI]                       									; Save X coordinate into AL
		CMP AL, 0                          									; Compara si valor de activacion con 0
		JNE	CONTINUE_FLOW2               									; Skip if block is already destroyed
		
		JUMP_BLOCK_NOT_ACTIVE2:
			JMP BLOCK_NOT_ACTIVE2
			
	CONTINUE_FLOW2:
; 		Checking collision in coordinates

; 		Check if right edge of ball > left edge of block
        MOV AX, BALL_X
        ADD AX, BALL_SIZE
        CMP AX, [SI]
        JNG JUMP_BLOCK_NOT_ACTIVE2
		
	CONTINUE_FLOW_3:
        
; 		Check if left edge of ball < right edge of block
        MOV BX, [SI]           
        ADD BX, BLOCK_WIDTH
        CMP BALL_X, BX
        JNL JUMP_BLOCK_NOT_ACTIVE2    

; 		Check if bottom edge of ball > top edge of block
        MOV AX, BALL_Y
        ADD AX, BALL_SIZE
        CMP AX, BLOCK_Y2               										; Use Y position of second row
        JNG BLOCK_NOT_ACTIVE2    

; 		Check if top edge of ball < bottom edge of block
        MOV BX, BLOCK_Y2
        ADD BX, BLOCK_HEIGHT
        CMP BALL_Y, BX
        JNL BLOCK_NOT_ACTIVE2       
		
; 	Collision detected with this block
;	 	Ball fell below screen - update blocks
        UPDATE2:
            INC DESTROYED_BLOCKS                      						; Decrease player lives
            CALL UPDATE_BLOCKS                   							; Update life counter display
	MOV BYTE PTR [DI], 0               										; Mark block as destroyed
	
	PUSH AX                               		 							; Save AX
	MOV AX, BEEP_FREQ_LOW                  									; Load low frequency
	CALL PLAY_SOUND                        									; Play sound
	POP AX                                 									; Restore AX
	
		
; 	Visually clear this block (draw in background color)
	PUSH AX
	PUSH BX
	PUSH CX
	PUSH DX
		
	MOV CX, [SI]                       										; Block's X position
	MOV DX, BLOCK_Y2                   										; Block's Y position (fila 2)
		
	CLEAR_BLOCK2_VERTICAL:
		PUSH CX                        										; Save initial X
		
	CLEAR_BLOCK2_HORIZONTAL:
		MOV AH, 0Ch                    										; Function: Draw pixel in window
		MOV AL, 00h                    										; Black color
		INT 10h
		
		INC CX
		MOV AX, CX
		SUB AX, [SI]
		CMP AX, BLOCK_WIDTH
		JL CLEAR_BLOCK2_HORIZONTAL     										; Continue until full width cleared
		
		POP CX                         										; Restore initial X
		INC DX                         										; Next row
		MOV AX, DX
		SUB AX, BLOCK_Y2               										; Use Y coordinate for second row
		CMP AX, BLOCK_HEIGHT
		JL CLEAR_BLOCK2_VERTICAL       										; Continue until full heigh cleared
		
	POP DX
	POP CX
	POP BX
	POP AX
		
	NEG BALL_VELOCITY_Y                										; Reverse ball's vertical direction
    
    PUSH AX
    MOV AX, SI                         										; Calculate block index
    SUB AX, OFFSET BLOCKS_X2           										; Get offset from start of array
    SHR AX, 1                          										; Divide by 2 (for words)
    CMP AX, 4                          										; Check if 5th block (index 4)
    JNE SKIP_EXPAND_PADDLE             										; If not, skip power-up

	
    CALL ACTIVATE_PADDLE_POWERUP

    SKIP_EXPAND_PADDLE:
    POP AX
    
    
    MOV AX, 1                          										; Set return value = 1 (collision detected)
    
    JMP EXIT_BLOCK_CHECK2              										; Exit after handling collision

; 	Move to next block
    BLOCK_NOT_ACTIVE2:
        ADD SI, 2                      										; Move to next X position (2 bytes)
        INC DI                         										; Move to next active status
        DEC CX                         										; Decrement counter
        CMP CX, 0                      										; Check if done
        JE EXIT_BLOCK_CHECK2           										; Exit if all blocks checked
        JMP CHECK_NEXT_BLOCK2          										; Continue with next block
        
; 	Clean up and return
    EXIT_BLOCK_CHECK2:
        POP DI                         										; Restore registers
        POP SI
        POP CX
        
        RET
	CHECK_BLOCK_COLLISION2 ENDP
	
;	Third Row Collision Procedure

	CHECK_BLOCK_COLLISION3 PROC NEAR
	PUSH CX                            										; Save CX register to stack
    PUSH SI                            										; Save SI pointer to stack
    PUSH DI                            										; Save DI pointer to stack
    
; 	Initialize counter and pointers
    MOV CX, NUM_BLOCKS3                										; Load block count for row 3
    MOV SI, OFFSET BLOCKS_X3           										; SI points to X-positions of row 3 blocks
    MOV DI, OFFSET BLOCKS_ACTIVE3      										; DI points to active status of row 3 blocks
    
    MOV AX, 0                          										; Default return: 0 (no collision)
    
; 	Check each block in row 3
    CHECK_NEXT_BLOCK3:
	
; 		Check if block is active
        MOV AL, [DI]                   										; Get block status
        CMP AL, 0                      										; Check if destroyed (0)
        JE BLOCK_NOT_ACTIVE3           										; Skip if already destroyed
        
; 		Collision detection (AABB method)

; 		Check if ball's right edge > block's left edge
        MOV AX, BALL_X
        ADD AX, BALL_SIZE
        CMP AX, [SI]
        JNG BLOCK_NOT_ACTIVE3    
        
; 		Check if ball's left edge < block's right edge
        MOV BX, [SI]           
        ADD BX, BLOCK_WIDTH
        CMP BALL_X, BX
        JNL BLOCK_NOT_ACTIVE3    

; 		Check if ball's bottom edge > block's top edge
        MOV AX, BALL_Y
        ADD AX, BALL_SIZE
        CMP AX, BLOCK_Y3
        JNG BLOCK_NOT_ACTIVE3    

; 		Check if ball's top edge < block's bottom edge
        MOV BX, BLOCK_Y3
        ADD BX, BLOCK_HEIGHT
        CMP BALL_Y, BX
        JNL BLOCK_NOT_ACTIVE3    
        
; 	Collision confirmed with this block
;	 	Ball fell below screen - update blocks
        UPDATE3:
            INC DESTROYED_BLOCKS                      						; Decrease player lives
            CALL UPDATE_BLOCKS                   							; Update life counter display
    MOV BYTE PTR [DI], 0               										; Mark block as destroyed
	PUSH AX                               		 							; Save AX
	MOV AX, BEEP_FREQ_LOW                  									; Load low frequency
	CALL PLAY_SOUND                        									; Play sound
	POP AX                                 									; Restore AX
        

    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
        
    MOV CX, [SI]                       										; Block's X position
    MOV DX, BLOCK_Y3                   										; Block's Y position (row 3)
        
    CLEAR_BLOCK3_VERTICAL:
        PUSH CX                        										; Save X starting position
        
    CLEAR_BLOCK3_HORIZONTAL:
        MOV AH, 0Ch                    										; Function: draw pixel
        MOV AL, 00h                   										; Color: black
        INT 10h                        										; Draw black pixel
        
        INC CX                         										; Next X position
        MOV AX, CX
        SUB AX, [SI]
        CMP AX, BLOCK_WIDTH
        JL CLEAR_BLOCK3_HORIZONTAL     										; Continue until block width cleared
        
        POP CX                         										; Restore X to left edge
        INC DX                         										; Next Y row
        MOV AX, DX
        SUB AX, BLOCK_Y3               										; Calculate Y offset from block top
        CMP AX, BLOCK_HEIGHT
        JL CLEAR_BLOCK3_VERTICAL       										; Continue until block height cleared
        
    POP DX
    POP CX
    POP BX
    POP AX
        
    NEG BALL_VELOCITY_Y                										; Reverse ball's vertical direction
        
    MOV AX, 1                          										; Set return value: 1 (collision)
        
    JMP EXIT_BLOCK_CHECK3              										; Exit after handling collision

; 	Process next block
    BLOCK_NOT_ACTIVE3:
        ADD SI, 2                          									; Move to next X position (2 bytes per word)
        INC DI                             									; Move to next active status byte
        DEC CX                             									; Decrement counter
        JZ EXIT_BLOCK_LOOP3                 								; If CX = 0, exit the loop
        JMP CHECK_NEXT_BLOCK3               								; Unconditional jump back to start of loop
		
    EXIT_BLOCK_LOOP3:
	
	
; 	Cleanup and return
    EXIT_BLOCK_CHECK3:
        POP DI                         										; Restore registers
        POP SI
        POP CX
        
        RET
	CHECK_BLOCK_COLLISION3 ENDP
	
;	Fourth Row Collision Procedure
	
	CHECK_BLOCK_COLLISION4 PROC NEAR
		PUSH CX                            									; Save CX register to stack
		PUSH SI                            									; Save SI pointer to stack
		PUSH DI                            									; Save DI pointer to stack
		
; 		Initialize counter and pointers
		MOV CX, NUM_BLOCKS4                									; Load block count for row 4
		MOV SI, OFFSET BLOCKS_X4           									; SI points to X-positions of row 4 blocks
		MOV DI, OFFSET BLOCKS_ACTIVE4      									; DI points to active status of row 4 blocks
		
		MOV AX, 0                          									; Default return: 0 (no collision)
		
; 	Check each block in row 4
    CHECK_NEXT_BLOCK4:
        
; 		Check if block is active
        MOV AL, [DI]                   										; Get block status
        CMP AL, 0                      										; Check if destroyed (0)
        JE BLOCK_NOT_ACTIVE4           										; Skip if already destroyed
        
; 		Collision detection (AABB method)

; 		Check if ball's right edge > block's left edge
        MOV AX, BALL_X
        ADD AX, BALL_SIZE
        CMP AX, [SI]
        JNG BLOCK_NOT_ACTIVE4    
        
; 		Check if ball's left edge < block's right edge
        MOV BX, [SI]           
        ADD BX, BLOCK_WIDTH
        CMP BALL_X, BX
        JNL BLOCK_NOT_ACTIVE4    

; 		Check if ball's bottom edge > block's top edge
        MOV AX, BALL_Y
        ADD AX, BALL_SIZE
        CMP AX, BLOCK_Y4
        JNG BLOCK_NOT_ACTIVE4    

; 		Check if ball's top edge < block's bottom edge
        MOV BX, BLOCK_Y4
        ADD BX, BLOCK_HEIGHT
        CMP BALL_Y, BX
        JNL BLOCK_NOT_ACTIVE4    
        
; 		Collision confirmed with this block
;	 	Ball fell below screen - update blocks
        UPDATE4:
            INC DESTROYED_BLOCKS                      							; Decrease player lives
            CALL UPDATE_BLOCKS                   								; Update life counter display
		MOV BYTE PTR [DI], 0               										; Mark block as destroyed
		PUSH AX                               		 							; Save AX
		MOV AX, BEEP_FREQ_LOW                  									; Load low frequency
		CALL PLAY_SOUND                        									; Play sound
		POP AX                                 									; Restore AX
        
		PUSH AX
		PUSH BX
		PUSH CX
		PUSH DX
			
		MOV CX, [SI]                       									; Block's X position
		MOV DX, BLOCK_Y4                   									; Block's Y position (row 4)
			
    CLEAR_BLOCK4_VERTICAL:
        PUSH CX                        										; Save X starting position
        
    CLEAR_BLOCK4_HORIZONTAL:
        MOV AH, 0Ch                    										; Function: draw pixel
        MOV AL, 00h                    										; Color: black
        INT 10h                        										; Draw black pixel
        
        INC CX                         										; Next X position
        MOV AX, CX
        SUB AX, [SI]
        CMP AX, BLOCK_WIDTH
        JL CLEAR_BLOCK4_HORIZONTAL     										; Continue until block width cleared
        
        POP CX                         										; Restore X to left edge
        INC DX                        										; Next Y row
        MOV AX, DX
        SUB AX, BLOCK_Y4               										; Calculate Y offset from block top
        CMP AX, BLOCK_HEIGHT
        JL CLEAR_BLOCK4_VERTICAL       										; Continue until block height cleared
        
		POP DX
		POP CX
		POP BX
		POP AX
			
		NEG BALL_VELOCITY_Y                									; Reverse ball's vertical direction
			
		MOV AX, 1                          									; Set return value: 1 (collision)
			
		JMP EXIT_BLOCK_CHECK4              									; Exit after handling collision
		
; 	Process next block
    BLOCK_NOT_ACTIVE4:
        ADD SI, 2                          									; Move to next X position (2 bytes per word)
        INC DI                             									; Move to next active status byte
        DEC CX                             									; Decrement counter
        JZ EXIT_BLOCK_LOOP4                 								; If CX = 0, exit the loop
        JMP CHECK_NEXT_BLOCK4               								; Unconditional jump back to start of loop
		
    EXIT_BLOCK_LOOP4:
        
; 	Cleanup and return
    EXIT_BLOCK_CHECK4:
        POP DI                         										; Restore registers
        POP SI
        POP CX
        
        RET
	CHECK_BLOCK_COLLISION4 ENDP

;	Procedure to reproduce a sound
	
    PLAY_SOUND PROC NEAR
; 		Input: AX = sound frequency divisor value (higher value = lower frequency)
        PUSH BX                 											; Save registers to stack
        PUSH CX
        PUSH DX
        PUSH AX                 											; Save frequency value
        
; 		Configure PIT (Programmable Interval Timer) for sound generation
        MOV AL, 0B6h           												; Command byte: Channel 2, Mode 3 (square wave), 16-bit binary
        OUT 43h, AL            												; Send command to PIT control port (8253/8254 chip)
        
; 		Set frequency for the timer
        POP AX                 												; Retrieve frequency divisor value
        OUT 42h, AL            												; Send low byte of divisor to Channel 2 data port
        MOV AL, AH             												; Move high byte to AL
        OUT 42h, AL            												; Send high byte of divisor to Channel 2 data port
        
;	 	Enable PC speaker
        IN AL, 61h             												; Read current value from system control port
        OR AL, 03h             												; Set bits 0 & 1 (bit 0: timer gate, bit 1: speaker data)
        OUT 61h, AL            												; Write back to enable speaker output
        
; 		Delay loop to control sound duration
        MOV CX, SOUND_DURATION 												; Load outer loop counter
		DELAY_LOOP:
			PUSH CX                											; Save outer loop counter
			MOV CX, 0DDDDh         											; Set inner loop to max value (65535)
		INNER_DELAY:
			LOOP INNER_DELAY       											; Decrement CX and jump if not zero (timing delay)
			POP CX                 											; Restore outer loop counter
			LOOP DELAY_LOOP        											; Decrement outer counter and continue if not zero
        
; 		Disable PC speaker
        IN AL, 61h             												; Read current value from system control port
        AND AL, 0FCh           												; Clear bits 0 & 1 (disconnect speaker and timer)
        OUT 61h, AL           	 											; Write back to disable speaker
        
        POP DX                 												; Restore registers from stack
        POP CX
        POP BX
        RET                    												; Return to caller
    PLAY_SOUND ENDP

;	Procedure for moving ball

	MOVE_BALL PROC NEAR
	
; 	Initialize collision flag
    MOV BX, 0                                   							; 0 = no collision, 1 = collision detected
    
; 	Horizontal movement
    MOV AX, BALL_VELOCITY_X                     							; Get X velocity
    ADD BALL_X, AX                              							; Update ball X position
    
; 	Check horizontal border collisions
    MOV AX, WINDOW_BOUNDS                       							; Get left boundary
    CMP BALL_X, AX                              							; Compare ball position with left boundary
    JGE CHECK_RIGHT_BORDER                      							; If not colliding with left border, check right
    
; 	Left border collision handling
    MOV BALL_X, AX                              							; Force ball position to boundary
    NEG BALL_VELOCITY_X                         							; Reverse X velocity
    MOV BX, 1                                   							; Mark collision as handled
	
	PUSH AX                                     							; Save AX
	MOV AX, BEEP_FREQ_MED                       							; Load average frequency
	CALL PLAY_SOUND                            								; Play sound
	POP AX                                      							; Restore AX

    JMP CHECK_VERTICAL                          							; Proceed to vertical checks
    
; 	Right border collision check
    CHECK_RIGHT_BORDER:
        MOV AX, WINDOW_WIDTH                    							; Get screen width
        SUB AX, BALL_SIZE                       							; Subtract ball size
        SUB AX, WINDOW_BOUNDS                   							; Adjust for boundary
        CMP BALL_X, AX                          							; Compare with ball position
        JLE CHECK_VERTICAL                      							; If not colliding, check vertical
        
; 		Right border collision handling
        NEG BALL_VELOCITY_X                     							; Reverse X velocity
        MOV BX, 1                               							; Mark collision as handled
		PUSH AX                                     						; Save AX
		MOV AX, BEEP_FREQ_MED                       						; Load average frequency
		CALL PLAY_SOUND                            							; Play sound
		POP AX                                      						; Restore AX
    
; 	Vertical movement and collision checks
    CHECK_VERTICAL:
	
; 		Update ball Y position
        MOV AX, BALL_VELOCITY_Y                 							; Get Y velocity
        SUB BALL_Y, AX                          							; Update ball Y position (up is negative)
        
; 		Skip vertical checks if collision already processed
        CMP BX, 1                               							; Check collision flag
        JNE Continue                            							; If no collision yet, continue
        JMP EXIT_MOVE_BALL                      							; Otherwise exit
        
        Continue:
; 			Top border collision check
            MOV AX, WINDOW_BOUND_TOP            							; Get top boundary
            CMP BALL_Y, AX                      							; Compare ball position
            JGE CHECK_BOTTOM_BORDER            	 							; If not colliding, check bottom
            
; 			Top border collision handling
            MOV BALL_Y, AX                      							; Force ball position to boundary
            NEG BALL_VELOCITY_Y                 							; Reverse Y velocity
            MOV BX, 1                           							; Mark collision as handled
			
			PUSH AX                                     					; Save AX
			MOV AX, BEEP_FREQ_MED                       					; Load average frequency
			CALL PLAY_SOUND                            						; Play sound
			POP AX                                      					; Restore AX
            JMP CHECK_BLOCKS                    							; Proceed to block collision checks
        
; 	Bottom border collision check (game over condition)
    CHECK_BOTTOM_BORDER:
        MOV AX, WINDOW_HEIGHT                   							; Get screen height
        SUB AX, BALL_SIZE                       							; Subtract ball size
        SUB AX, WINDOW_BOUNDS                   							; Adjust for boundary
        CMP BALL_Y, AX                          							; Compare with ball position
        JLE CHECK_BLOCKS                        							; If not colliding, check blocks
        
;	 	Ball fell below screen - lose life
        DECREMENT_LIFES:
            DEC GAME_LIFES                      							; Decrease player lives
            CALL RESET_BALL_POSITION            							; Reset ball to starting position
            
            CALL UPDATE_LIFES                   							; Update life counter display
            
            CMP GAME_LIFES,0h                   							; Check if out of lives
            JLE GAME_OVER                       							; If no lives left, game over
            MOV BX, 1                           							; Mark collision as handled
            JMP EXIT_MOVE_BALL                  							; Exit procedure
            
            RET
            
; 		Game over handling
        GAME_OVER:                              
            MOV GAME_LIFES,03h                  							; Reset lives to 3
            CALL UPDATE_LIFES                   							; Update life display
            MOV GAME_ACTIVE,00h                 							; Set game inactive
            RET                                 
        
; 	Block collision checks
    CHECK_BLOCKS:
	
; 		Skip if collision already handled
        CMP BX, 1                               							; Check collision flag
        JE CHECK_PADDLE                         							; If collision handled, check paddle
        
; 		Check row 1 blocks
        CALL CHECK_BLOCK_COLLISION              							; Check first row blocks
        CMP AX, 1                               							; Did collision occur?
        JE BLOCK_COLLISION_FOUND                							; If yes, handle it
        
;		Check row 2 blocks
        CALL CHECK_BLOCK_COLLISION2             							; Check second row blocks
        CMP AX, 1                               							; Did collision occur?
        JE BLOCK_COLLISION_FOUND                							; If yes, handle it
        
; 		Check row 3 blocks
        CALL CHECK_BLOCK_COLLISION3             							; Check third row blocks
        CMP AX, 1                               							; Did collision occur?
        JE BLOCK_COLLISION_FOUND                							; If yes, handle it
        
;	 	Check row 4 blocks
        CALL CHECK_BLOCK_COLLISION4             							; Check fourth row blocks
        CMP AX, 1                               							; Did collision occur?
        JNE CHECK_PADDLE                        							; If no, check paddle
        
; 	Handle block collision
    BLOCK_COLLISION_FOUND:
        MOV BX, 1                               							; Mark collision as handled
        JMP EXIT_MOVE_BALL                      							; Exit procedure
        
;	Paddle collision check
    CHECK_PADDLE:
	
; 		Skip if collision already handled
        CMP BX, 1                               							; Check collision flag
        JNE CONTINUE_CHECK                      							; If no collision yet, continue
        JMP EXIT_MOVE_BALL                      							; Otherwise exit
        
    CONTINUE_CHECK:
	
; 		AABB collision detection with paddle
        MOV AX, BALL_X                          							; Ball right edge
        ADD AX, BALL_SIZE
        CMP AX, PADDLE_X                        							; Compare with paddle left edge
        JB EXIT_MOVE_BALL                       							; Exit if no collision
    
        MOV AX, PADDLE_X                        							; Paddle right edge
        ADD AX, PADDLE_WIDTH
        CMP BALL_X, AX                          							; Compare with ball left edge
        JAE EXIT_MOVE_BALL                      							; Exit if no collision
    
        MOV AX, BALL_Y                          							; Ball bottom edge
        ADD AX, BALL_SIZE
        CMP AX, PADDLE_Y                        							; Compare with paddle top edge
        JB EXIT_MOVE_BALL                       							; Exit if no collision
    
        MOV AX, PADDLE_Y                        							; Paddle bottom edge
        ADD AX, PADDLE_HEIGHT
        CMP BALL_Y, AX                          							; Compare with ball top edge
        JAE EXIT_MOVE_BALL                      							; Exit if no collision
        
; 		Collision with paddle confirmed - handle bounce

; 		Position ball above paddle to prevent getting stuck
		MOV AX, PADDLE_Y                          							; Get paddle Y position
		SUB AX, BALL_SIZE                         							; Subtract ball size to position above paddle
		MOV BALL_Y, AX                            							; Set ball's new Y position
    
; 		Play collision sound
		PUSH AX                                   							; Save AX
		MOV AX, BEEP_FREQ_HIGH                    							; Load high frequency
		CALL PLAY_SOUND                           							; Play the sound
		POP AX                                    							; Restore AX
	
; 		Reverse Y direction
		NEG BALL_VELOCITY_Y                       							; Reverse Y velocity
    
EXIT_MOVE_BALL:
    RET                                       								; Return from procedure

MOVE_BALL ENDP
	
;	Paddle movement procedure
	
	MOVE_PADDLE PROC NEAR
	PUSH AX                                     							; Save registers
    PUSH BX
    PUSH CX
    
; 	Check for keypress
    MOV AH,01h                                  							; BIOS keyboard status function
    INT 16h                                     							; Call BIOS interrupt
    JZ EXIT_PADDLE_MOVEMENT                     							; If no key pressed, exit
    
; 	Get pressed key
    MOV AH,00h                                  							; BIOS read key function
    INT 16h                                     							; Get keypress from buffer
    
; 	Check for left movement keys (A/a)
    CMP AL,61h                                  							; Compare with 'a'
    JE MOVE_PADDLE_LEFT                         
    CMP AL,41h                                  							; Compare with 'A'
    JE MOVE_PADDLE_LEFT                         
    
; 	Check for right movement keys (D/d)
    CMP AL,64h                                  							; Compare with 'd'
    JE MOVE_PADDLE_RIGHT                        
    CMP AL,44h                                  							; Compare with 'D'
    JE MOVE_PADDLE_RIGHT                        
    
; 	If not a movement key, exit
    JMP EXIT_PADDLE_MOVEMENT
    
; 	Left movement handling
    MOVE_PADDLE_LEFT:
        MOV AX,PADDLE_VELOCITY                  							; Get movement speed
        SUB PADDLE_X,AX                         							; Move paddle left
        
; 		Check left boundary
        MOV AX,PADDLE_X                         							; Get paddle position
        CMP AX,WINDOW_BOUNDS                    							; Compare with left boundary
        JL FIX_MOVE_PADDLE_LEFT                 							; If beyond boundary, fix position
        JMP EXIT_PADDLE_MOVEMENT                							; Otherwise exit
        
    FIX_MOVE_PADDLE_LEFT:
        MOV AX,WINDOW_BOUNDS                    							; Get boundary value
        MOV PADDLE_X, AX                        							; Set paddle to boundary
        JMP EXIT_PADDLE_MOVEMENT                							; Exit procedure
            
; 	Right movement handling
    MOVE_PADDLE_RIGHT:
        MOV AX, PADDLE_VELOCITY                 							; Get movement speed
        ADD PADDLE_X, AX                       								; Move paddle right
    
; 		Check right boundary
        MOV AX, PADDLE_WIDTH                    							; Get paddle width
        ADD AX, PADDLE_X                        							; Calculate right edge
        
        MOV BX, WINDOW_WIDTH                    							; Get window width
        SUB BX, WINDOW_BOUNDS                   							; Adjust for boundary
        CMP AX, BX                              							; Compare with right boundary
        JG FIX_MOVE_PADDLE_RIGHT                							; If beyond boundary, fix position
        JMP EXIT_PADDLE_MOVEMENT                							; Otherwise exit
        
    FIX_MOVE_PADDLE_RIGHT:
        MOV BX, WINDOW_WIDTH                    							; Get window width
        SUB BX, PADDLE_WIDTH                    							; Subtract paddle width
        SUB BX, WINDOW_BOUNDS                   							; Adjust for boundary
        MOV PADDLE_X, BX                        							; Set paddle to boundary
        
    EXIT_PADDLE_MOVEMENT:
        POP CX                                  							; Restore registers
        POP BX
        POP AX
        RET                                     							; Return from procedure
	MOVE_PADDLE ENDP
	
; 	Procedure to reset the ball position

	RESET_BALL_POSITION PROC NEAR
		PUSH AX
		
		MOV AX,BALL_ORIGINAL_X                      						; Get original X position
		MOV BALL_X,AX                               						; Reset ball X to original position
		MOV AX,BALL_ORIGINAL_Y                      						; Get original Y position
		MOV BALL_Y,AX                               						; Reset ball Y to original position

; 		Reset velocities to original values, direction upward
		MOV AX, BALL_VELOCITY_X                     						; Get original X velocity
		MOV BALL_VELOCITY_X, AX                     						; Reset X velocity
		MOV AX, BALL_VELOCITY_Y                     						; Get original Y velocity
		NEG AX                                      						; Make velocity upward (positive)
		MOV BALL_VELOCITY_Y, AX                     						; Set Y velocity

		POP AX
		RET                                         						; Return from procedure
	RESET_BALL_POSITION ENDP

; 	Procedure to draw blocks (first row)
	DRAW_BLOCKS PROC NEAR
		MOV CX, NUM_BLOCKS                  								; Initialize block counter
		MOV SI, OFFSET BLOCKS_X             								; SI points to array of X positions
		MOV DI, OFFSET BLOCKS_ACTIVE        								; DI points to array of block states
		
; 		Loop through all blocks
		DRAW_BLOCKS_LOOP:
			CMP CX, 0                       								; Check if all blocks processed
			JE DRAW_BLOCKS_EXIT             								; Exit if done
			
			MOV AL, [DI]                    								; Get block active status
			CMP AL, 0                       								; Check if block is destroyed
			JE NEXT_BLOCK                   								; Skip if block is inactive
			
			PUSH CX                         								; Save block counter
			
; 			Set coordinates for drawing
			MOV CX, [SI]                    								; Load X position from array
			MOV DX, BLOCK_Y                 								; Load Y position (row 1)
			
		DRAW_BLOCK_VERTICAL:
			PUSH CX                         								; Save X position
			
		DRAW_BLOCK_HORIZONTAL:
			MOV AH, 0Ch                     								; Function: draw pixel
			MOV AL, 0Ch                     								; Color: light red
			MOV BH, 00h                     								; Page number: 0
			INT 10h                        	 								; Draw pixel
			
			INC CX                          								; Next X position
			MOV AX, CX
			SUB AX, [SI]                    								; Calculate current width
			CMP AX, BLOCK_WIDTH
			JL DRAW_BLOCK_HORIZONTAL        								; Continue until block width complete
			
			POP CX                          								; Restore X to left edge
			INC DX                          								; Next Y row
			MOV AX, DX
			SUB AX, BLOCK_Y                 								; Calculate current height
			CMP AX, BLOCK_HEIGHT
			JL DRAW_BLOCK_VERTICAL          								; Continue until block height complete
			
			POP CX                          								; Restore block counter
			JMP CONTINUE_BLOCK_LOOP
			
		NEXT_BLOCK:
; 		Skip drawing for inactive blocks
			
		CONTINUE_BLOCK_LOOP:
			ADD SI, 2                       								; Move to next X position (2 bytes per word)
			INC DI                          								; Move to next active status
			DEC CX                          								; Decrement block counter
			JMP DRAW_BLOCKS_LOOP            								; Process next block
			
		DRAW_BLOCKS_EXIT:
			RET                             								; Return from procedure
	DRAW_BLOCKS ENDP
	
; 	Procedure to draw blocks (second row)
	DRAW_BLOCKS2 PROC NEAR
		MOV CX, NUM_BLOCKS2                 								; Initialize block counter for row 2
		MOV SI, OFFSET BLOCKS_X2            								; SI points to X positions for row 2
		MOV DI, OFFSET BLOCKS_ACTIVE2       								; DI points to active status for row 2
		
; 		Loop through all blocks in second row
		DRAW_BLOCKS_LOOP2:
			CMP CX, 0                       								; Check if all blocks processed
			JE DRAW_BLOCKS_EXIT2            								; Exit if done
			
			MOV AL, [DI]                    								; Get block active status
			CMP AL, 0                       								; Check if block is destroyed
			JE NEXT_BLOCK2                  								; Skip if block is inactive
			
			PUSH CX                         								; Save block counter

; 			Set coordinates for drawing
			MOV CX, [SI]                    								; Load X position from array
			MOV DX, BLOCK_Y2                								; Load Y position for row 2
			
		DRAW_BLOCK_VERTICAL2:
			PUSH CX                         								; Save X position
			
		DRAW_BLOCK_HORIZONTAL2:
			MOV AH, 0Ch                     								; Function: draw pixel
			MOV AL, BLOCK_COLOR2            								; Color for second row blocks
			MOV BH, 00h                     								; Page number: 0
			INT 10h                         								; Draw pixel
			
			INC CX                          								; Next X position
			MOV AX, CX
			SUB AX, [SI]                    								; Calculate current width
			CMP AX, BLOCK_WIDTH
			JL DRAW_BLOCK_HORIZONTAL2       								; Continue until block width complete
			
			POP CX                          								; Restore X to left edge
			INC DX                          								; Next Y row
			MOV AX, DX
			SUB AX, BLOCK_Y2                								; Calculate current height
			CMP AX, BLOCK_HEIGHT
			JL DRAW_BLOCK_VERTICAL2         								; Continue until block height complete
			
			POP CX                          								; Restore block counter
			JMP CONTINUE_BLOCK_LOOP2
			
		NEXT_BLOCK2:
; 		Skip drawing for inactive blocks
			
		CONTINUE_BLOCK_LOOP2:
			ADD SI, 2                       								; Move to next X position (2 bytes per word)
			INC DI                          								; Move to next active status
			DEC CX                          								; Decrement block counter
			JMP DRAW_BLOCKS_LOOP2           								; Process next block
			
		DRAW_BLOCKS_EXIT2:
			RET                             								; Return from procedure
	DRAW_BLOCKS2 ENDP
	
; 	Procedure to draw blocks (third row)

	DRAW_BLOCKS3 PROC NEAR
		MOV CX, NUM_BLOCKS3                 								; Initialize block counter for row 3
		MOV SI, OFFSET BLOCKS_X3            								; SI points to X positions for row 3
		MOV DI, OFFSET BLOCKS_ACTIVE3       								; DI points to active status for row 3
		
; 		Loop through all blocks in third row
		DRAW_BLOCKS_LOOP3:
			CMP CX, 0                       								; Check if all blocks processed
			JE DRAW_BLOCKS_EXIT3            								; Exit if done
			
			MOV AL, [DI]                    								; Get block active status
			CMP AL, 0                       								; Check if block is destroyed
			JE NEXT_BLOCK3                  								; Skip if block is inactive
			
			PUSH CX                         								; Save block counter
			
; 			Set coordinates for drawing
			MOV CX, [SI]                    								; Load X position from array
			MOV DX, BLOCK_Y3                								; Load Y position for row 3
			
		DRAW_BLOCK_VERTICAL3:
			PUSH CX                         								; Save X position
			
		DRAW_BLOCK_HORIZONTAL3:
			MOV AH, 0Ch                     								; Function: draw pixel
			MOV AL, BLOCK_COLOR3            								; Color for third row blocks (green)
			INT 10h                         								; Draw pixel
			
			INC CX                          								; Next X position
			MOV AX, CX
			SUB AX, [SI]                    								; Calculate current width
			CMP AX, BLOCK_WIDTH
			JL DRAW_BLOCK_HORIZONTAL3       								; Continue until block width complete
			
			POP CX                          								; Restore X to left edge
			INC DX                          								; Next Y row
			MOV AX, DX                      								; Calculate current height
			SUB AX, BLOCK_Y3                								; Get offset from top of block
			CMP AX, BLOCK_HEIGHT
			JL DRAW_BLOCK_VERTICAL3         								; Continue until block height complete
			
			POP CX                          								; Restore block counter
			JMP CONTINUE_BLOCK_LOOP3
			
		NEXT_BLOCK3:
; 		Skip drawing for inactive blocks
			
		CONTINUE_BLOCK_LOOP3:
			ADD SI, 2                       								; Move to next X position (2 bytes per word)
			INC DI                          								; Move to next active status
			DEC CX                          								; Decrement block counter
			JMP DRAW_BLOCKS_LOOP3           								; Process next block
			
		DRAW_BLOCKS_EXIT3:
			RET                             								; Return from procedure
	DRAW_BLOCKS3 ENDP

; 	Procedure to draw blocks (fourth row)

	DRAW_BLOCKS4 PROC NEAR
		MOV CX, NUM_BLOCKS4                 								; Initialize block counter for row 4
		MOV SI, OFFSET BLOCKS_X4            								; SI points to X positions for row 4
		MOV DI, OFFSET BLOCKS_ACTIVE4       								; DI points to active status for row 4
		
; 		Loop through all blocks in fourth row
		DRAW_BLOCKS_LOOP4:
			CMP CX, 0                       								; Check if all blocks processed
			JE DRAW_BLOCKS_EXIT4            								; Exit if done
			
			MOV AL, [DI]                    								; Get block active status
			CMP AL, 0                       								; Check if block is destroyed
			JE NEXT_BLOCK4                  								; Skip if block is inactive
			
			PUSH CX                         								; Save block counter
			
; 			Set coordinates for drawing
			MOV CX, [SI]                    								; Load X position from array
			MOV DX, BLOCK_Y4                								; Load Y position for row 4
			
		DRAW_BLOCK_VERTICAL4:
			PUSH CX                         								; Save X position
			
		DRAW_BLOCK_HORIZONTAL4:
			MOV AH, 0Ch                     								; Function: draw pixel
			MOV AL, BLOCK_COLOR4            								; Color for fourth row blocks
			INT 10h                         								; Draw pixel
			
			INC CX                          								; Next X position
			MOV AX, CX
			SUB AX, [SI]                    								; Calculate current width
			CMP AX, BLOCK_WIDTH
			JL DRAW_BLOCK_HORIZONTAL4       								; Continue until block width complete
			
			POP CX                          								; Restore X to left edge
			INC DX                          								; Next Y row
			MOV AX, DX                      								; Calculate current height
			SUB AX, BLOCK_Y4                								; Get offset from top of block
			CMP AX, BLOCK_HEIGHT
			JL DRAW_BLOCK_VERTICAL4         								; Continue until block height complete
			
			POP CX                          								; Restore block counter
			JMP CONTINUE_BLOCK_LOOP4
			
		NEXT_BLOCK4:
; 		Skip drawing for inactive blocks
			
		CONTINUE_BLOCK_LOOP4:
			ADD SI, 2                       								; Move to next X position (2 bytes per word)
			INC DI                          								; Move to next active status
			DEC CX                          								; Decrement block counter
			JMP DRAW_BLOCKS_LOOP4           								; Process next block
			
		DRAW_BLOCKS_EXIT4:
			RET                             								; Return from procedure
	DRAW_BLOCKS4 ENDP

	; Procedure to draw the ball
	
	DRAW_BALL PROC NEAR
		
		MOV CX,BALL_X                                						; Set starting X position
		MOV DX,BALL_Y                                						; Set starting Y position
		
		
		DRAW_BALL_HORIZONTAL:
			
			MOV AH,0Ch                               						; Function: draw pixel
			MOV AL,0Fh                               						; Color: white
			MOV BH,00h                               						; Page number: 0
			INT 10h                                  						; Draw pixel
			
			INC CX                                   						; Move to next X position
			MOV AX,CX                                						; Calculate current width
			SUB AX,BALL_X
			CMP AX,BALL_SIZE                         						; Check if reached ball width
			JNG DRAW_BALL_HORIZONTAL                 						; Continue if not completed width
			
			MOV CX,BALL_X                            						; Reset X to left edge
			INC DX                                   						; Move to next Y row
			
			MOV AX,DX                                						; Calculate current height
			SUB AX,BALL_Y
			CMP AX,BALL_SIZE                         						; Check if reached ball height
			JNG DRAW_BALL_HORIZONTAL                 						; Continue if not completed height
		
		RET                                          						; Return from procedure
	DRAW_BALL ENDP
	
; 	Procedure to clear the ball's previous position

	CLEAR_BALL_AREA PROC NEAR
		PUSH AX                                      						; Save registers
		PUSH CX
		PUSH DX
		
; 		Clear the area where ball was previously
		MOV CX, OLD_BALL_X                           						; Start at old X position
		MOV DX, OLD_BALL_Y                           						; Start at old Y position
		
		CLEAR_BALL_HORIZONTAL:
			MOV AH, 0Ch                              						; Function: draw pixel
			MOV AL, 00h                             						; Color: black (erase)
			INT 10h                                  						; Draw black pixel
			
			INC CX                                   						; Next X position
			MOV AX, CX
			SUB AX, OLD_BALL_X                       						; Calculate width covered
			CMP AX, BALL_SIZE
			JNG CLEAR_BALL_HORIZONTAL                						; Continue if not complete width
			
			MOV CX, OLD_BALL_X                       						; Reset X to left edge
			INC DX                                   						; Next Y row
			
			MOV AX, DX
			SUB AX, OLD_BALL_Y                       						; Calculate height covered
			CMP AX, BALL_SIZE
			JNG CLEAR_BALL_HORIZONTAL                						; Continue if not complete height
			
		POP DX                                       						; Restore registers
		POP CX
		POP AX
		RET                                          						; Return from procedure
	CLEAR_BALL_AREA ENDP
	
	; Procedure to draw the paddle
	
	DRAW_PADDLE PROC NEAR
		MOV CX,PADDLE_X                              						; Set starting X position
		MOV DX,PADDLE_Y                              						; Set starting Y position
		
		DRAW_PADDLE_HORIZONTAL:
			MOV AH,0Ch                               						; Function: draw pixel
			MOV AL,0Fh                               						; Color: white
			MOV BH,00h                               						; Page number: 0
			INT 10h                                  						; Draw pixel
			
			INC CX                                   						; Move to next X position
			MOV AX,CX                                						; Calculate current width
			SUB AX,PADDLE_X
			CMP AX,PADDLE_WIDTH                      						; Check if reached paddle width
			JNG DRAW_PADDLE_HORIZONTAL               						; Continue if not complete width
			
			MOV CX,PADDLE_X                          						; Reset X to left edge
			INC DX                                   						; Move to next Y row
			
			MOV AX,DX                                						; Calculate current height
			SUB AX,PADDLE_Y
			CMP AX,PADDLE_HEIGHT                     						; Check if reached paddle height
			JNG DRAW_PADDLE_HORIZONTAL               						; Continue if not complete height
		RET                                          						; Return from procedure
	DRAW_PADDLE ENDP
		
; Procedure to clear the paddle's previous position

	CLEAR_PADDLE_AREA PROC NEAR
		PUSH AX                                      						; Save registers
		PUSH CX
		PUSH DX
		
; 		Clear the area where paddle was previously
		MOV CX, OLD_PADDLE_X                         						; Start at old X position
		MOV DX, PADDLE_Y                             						; Y position doesn't change
		
		CLEAR_PADDLE_HORIZONTAL:
			MOV AH, 0Ch                              						; Function: draw pixel
			MOV AL, 00h                              						; Color: black (erase)
			INT 10h                                  						; Draw black pixel
			
			INC CX                                   						; Next X position
			MOV AX, CX
			SUB AX, OLD_PADDLE_X                     						; Calculate width covered
			CMP AX, PADDLE_WIDTH
			JNG CLEAR_PADDLE_HORIZONTAL              						; Continue if not complete width
			
			MOV CX, OLD_PADDLE_X                     						; Reset X to left edge
			INC DX                                   						; Next Y row
			
			MOV AX, DX
			SUB AX, PADDLE_Y                         						; Calculate height covered
			CMP AX, PADDLE_HEIGHT
			JNG CLEAR_PADDLE_HORIZONTAL              						; Continue if not complete height
			
		POP DX                                       						; Restore registers
		POP CX
		POP AX
		RET                                          						; Return from procedure
		
	CLEAR_PADDLE_AREA ENDP
	
	; Procedure to draw the user interface (scoreboard and title)
	
	DRAW_UI PROC NEAR

; 		Display player lives text
		MOV AH,02h                  										; Function: set cursor position
		MOV BH,00h                  										; Page number: 0
		MOV DH,01h                  										; Row: 1
		MOV DL,07h                  										; Column: 7
		INT 10h                     										; Set cursor position
		
		MOV AH,09h                  										; Function: display string
		LEA DX,TEXT_PLAYER_LIFES    										; Load address of player lives text
		INT 21h                     										; Display the string
		
; 		Display destroyed blocks
		MOV AH,02h                  										; Function: set cursor position
		MOV BH,00h                  										; Page number: 0
		MOV DH,01h                  										; Row: 1
		MOV DL,10h                  										; Column: 24
		INT 10h                     										; Set cursor position

		MOV AH,09h                  										; Function: display string
		LEA DX,TEXT_GAME_BLOCKS    											; Load address of game title text
		INT 21h                     										; Display the string
		
; 		Display game title
		MOV AH,02h                  										; Function: set cursor position
		MOV BH,00h                  										; Page number: 0
		MOV DH,01h                  										; Row: 1
		MOV DL,18h                  										; Column: 24
		INT 10h                     										; Set cursor position
		
		MOV AH,09h                  										; Function: display string
		LEA DX,TEXT_TITLE_GAME      										; Load address of game title text
		INT 21h                     										; Display the string

		RET                         										; Return from procedure
	DRAW_UI ENDP
	
	; Procedure to draw decorative paddle in UI
	
	DRAW_PADDLE_UI PROC NEAR
		MOV CX,PADDLE_UI_X                           						; Set starting X position
		MOV DX,Y_PADDLE_UI                           						; Set starting Y position
		
		DRAW_PADDLE_UI_HORIZONTAL:
			MOV AH,0Ch                               						; Function: draw pixel
			MOV AL,0Fh                               						; Color: white
			MOV BH,00h                               						; Page number: 0
			INT 10h                                  						; Draw pixel
			
			INC CX                                   						; Move to next X position
			MOV AX,CX                               						; Calculate current width
			SUB AX,PADDLE_UI_X
			CMP AX,PADDLE_UI_WIDTH                   						; Check if reached paddle width
			JNG DRAW_PADDLE_UI_HORIZONTAL            						; Continue if not complete width
			
			MOV CX,PADDLE_UI_X                       						; Reset X to left edge
			INC DX                                   						; Move to next Y row
			
			MOV AX,DX                                						; Calculate current height
			SUB AX,Y_PADDLE_UI
			CMP AX,PADDLE_UI_HEIGH                   						; Check if reached paddle height
			JNG DRAW_PADDLE_UI_HORIZONTAL            						; Continue if not complete height

		RET                                          						; Return from procedure
	DRAW_PADDLE_UI ENDP
	
; 	Procedure to update the life counter display

	UPDATE_LIFES PROC NEAR
		
		XOR AX,AX                   										; Clear AX register
		MOV AL,GAME_LIFES           										; Load current lives count into AL
		
; 		Convert decimal value to ASCII character
; 		by adding 30h (48 decimal)
; 		Example: 3 lives -> 3 + 48 = 51 (ASCII for '3')
		ADD AL,30h                  
		MOV [TEXT_PLAYER_LIFES+1], AL   									; Update the character in the lives text
																			; Assuming TEXT_PLAYER_LIFES is a string like "X lives"
		
		RET                         										; Return from procedure
	UPDATE_LIFES ENDP
	
;	Procedure to update destroyed blocks

	UPDATE_BLOCKS PROC NEAR
		PUSH AX                         									; Save registers
		PUSH BX
		PUSH DX
		
		XOR AX, AX                      									; Clear AX register
		MOV AL, DESTROYED_BLOCKS        									; Load destroyed blocks counter into AL
		
; 		Check if it's a single-digit number
		CMP AL, 10
		JL SINGLE_DIGIT                 									; If less than 10, handle as single digit
		
; 		For two digits (10-99)
		MOV BL, 10                      									; Prepare to divide by 10
		DIV BL                          									; Division: AL = AX / BL, AH = AX % BL
																			; AL contains tens, AH contains units
		
; 		Convert tens to ASCII and store
		ADD AL, 30h                     									; Convert to ASCII
		MOV [TEXT_GAME_BLOCKS], AL      									; Store first digit (tens)
		
; 		Convert units to ASCII and store
		MOV AL, AH                      									; Move remainder (units) to AL
		ADD AL, 30h                     									; Convert to ASCII
		MOV [TEXT_GAME_BLOCKS+1], AL    									; Store second digit (units)
		
		JMP END_UPDATE                  									; Jump to the end
		
	SINGLE_DIGIT:
; 		For a single digit (0-9)
		ADD AL, 30h                     									; Convert to ASCII
		MOV [TEXT_GAME_BLOCKS], '0'     									; Set '0' as first digit
		MOV [TEXT_GAME_BLOCKS+1], AL    									; Store the digit as second character
		
	END_UPDATE:
		POP DX                          									; Restore registers
		POP BX
		POP AX
		RET
	UPDATE_BLOCKS ENDP

; 	Procedure to display game over menu and handle restart

	DRAW_GAME_OVER_MENU PROC NEAR
        
		CALL CLEAR_SCREEN                										; Clear the entire screen
		
		LOOP_SCREEN:
; 			Display "GAME OVER" title
			MOV AH,02h                       									; Function: set cursor position
			MOV BH,00h                       									; Page number: 0
			MOV DH,09h                       									; Row: 9
			MOV DL,0Fh                       									; Column: 4
			INT 10h                          									; Set cursor position
			
			MOV AH,09h                       									; Function: display string
			LEA DX,TEXT_GAME_OVER_TITLE      									; Load address of game over title
			INT 21h                          									; Display the string
			
; 			Display motivational message
			MOV AH,02h                       									; Function: set cursor position
			MOV BH,00h                       									; Page number: 0
			MOV DH,0Ch                       									; Row: 12
			MOV DL,0Dh                       									; Column: 13
			INT 10h                          									; Set cursor position
			
			MOV AH,09h                       									; Function: display string
			LEA DX,TEXT_GAME_OVER_MOTIVATION 									; Load address of motivation text
			INT 21h                          									; Display the string
			
; 			Display "Play Again?" message
			MOV AH,02h                       									; Function: set cursor position
			MOV BH,00h                       									; Page number: 0
			MOV DH,0Fh                       									; Row: 15
			MOV DL,0Ah                       									; Column: 11
			INT 10h                          									; Set cursor position
			
			MOV AH,09h                       									; Function: display string
			LEA DX,TEXT_GAME_OVER_PLAY_AGAIN 									; Load address of play again text
			INT 21h                          									; Display the string
			
; 			Display "Exit main menu" message
			MOV AH,02h                       									; Function: set cursor position
			MOV BH,00h                       									; Page number: 0
			MOV DH,12h                       									; Row: 18
			MOV DL,08h                       									; Column: 8
			INT 10h                          									; Set cursor position
			
			MOV AH,09h                       									; Function: display string
			LEA DX,TEXT_GAME_OVER_BACK_MENU										; Load address of exit main menu
			INT 21h                          									; Display the string
			
			MOV AH,00h                       									; Function: get keystroke
			INT 16h                          									; Wait for key press
			
; 			Check if R or r was pressed to restart
			CMP AL,'R'
			JE RESTAR_GAME
			CMP AL,'r'
			JE RESTAR_GAME
			
			
; 			Check if M or m was pressed to restart
			CMP AL,'M'
			JE BACK_MENU
			CMP AL,'m'
			JE BACK_MENU
		
; 			If we get here, user didn't press R/r, so return the loop
			JMP LOOP_SCREEN
		
		RESTAR_GAME:
			MOV GAME_ACTIVE, 01h             									; Set game to active state
			CALL RESET_OBJECTS													; Reset all objects
			JMP END_DRAW_GAME_OVER
		
		BACK_MENU:
			MOV MAIN_MENU,00h
			MOV GAME_ACTIVE,01h
			CALL RESET_OBJECTS													; Reset all objects
			RET                              									; Return from procedure
			
		END_DRAW_GAME_OVER:
			RET
	DRAW_GAME_OVER_MENU ENDP
	
; Procedure for reset all contents

	RESET_OBJECTS PROC NEAR
			MOV FIRST_RUN, 01h               									; Set first run flag
			
			MOV POWERUP_PADDLE_ACTIVE, 0     									; Disable paddle power-up
			MOV AX, PADDLE_NORMAL_WIDTH      									; Get normal paddle width
			MOV PADDLE_WIDTH, AX            									; Restore paddle width
			MOV AX, BALL_ORIGINAL_X
			MOV BALL_X, AX
			MOV AX, BALL_ORIGINAL_Y
			MOV BALL_Y, AX
			MOV AX, BALL_ORIGINAL_VELOCITY_X
			MOV BALL_VELOCITY_X, AX
			MOV AX, BALL_ORIGINAL_VELOCITY_Y
			MOV BALL_VELOCITY_Y, AX
			MOV DESTROYED_BLOCKS, 00h
			
; 			Reset first row blocks (make all active)
			MOV CX, 10                       									; Number of blocks in row
			MOV DI, OFFSET BLOCKS_ACTIVE     									; Point to first block status
			
		RESET_BLOCKS1:
			MOV BYTE PTR [DI], 1             									; Set to 1 (active)
			INC DI                           									; Next block
			LOOP RESET_BLOCKS1               									; Repeat for all blocks
			
; 			Reset second row blocks
			MOV CX, 10                       									; Number of blocks in row
			MOV DI, OFFSET BLOCKS_ACTIVE2    									; Point to first block status
			
		RESET_BLOCKS2:
			MOV BYTE PTR [DI], 1             									; Set to 1 (active)
			INC DI                           									; Next block
			LOOP RESET_BLOCKS2              	 								; Repeat for all blocks
			
; 			Reset third row blocks
			MOV CX, 10                       									; Number of blocks in row
			MOV DI, OFFSET BLOCKS_ACTIVE3    									; Point to first block status
			
		RESET_BLOCKS3:
			MOV BYTE PTR [DI], 1             									; Set to 1 (active)
			INC DI                           									; Next block
			LOOP RESET_BLOCKS3               									; Repeat for all blocks
			
; 			Reset fourth row blocks
			MOV CX, 10                       									; Number of blocks in row
			MOV DI, OFFSET BLOCKS_ACTIVE4    									; Point to first block status
			
		RESET_BLOCKS4:
			MOV BYTE PTR [DI], 1            							 		; Set to 1 (active)
			INC DI                           									; Next block
			LOOP RESET_BLOCKS4               									; Repeat for all blocks
			
; 			Reset paddle position
			MOV AX, PADDLE_ORIGINAL_X        									; Get original paddle X position
			MOV PADDLE_X, AX                 									; Reset paddle X position
		
		RET
	RESET_OBJECTS ENDP
	
; 	Procedure to draw main menu game

	MAIN_MENU_UI PROC NEAR
		
		CALL CLEAR_SCREEN                										; Clear the entire screen
		
		MAIN_LOOP_SCREEN:
	; 		Display "ARKANOID"  game title
			MOV AH,02h                       									; Function: set cursor position
			MOV BH,00h                       									; Page number: 0
			MOV DH,0Ah                       									; Row: 10
			MOV DL,0Fh                       									; Column: 15
			INT 10h                          									; Set cursor position
			
			MOV AH,09h                       									; Function: display string
			LEA DX,TEXT_MAIN_MENU_TITLE_GAME     								; Load address of game over title
			INT 21h                          									; Display the string
			
	; 		Display 'START GAME' option
			MOV AH,02h                       									; Function: set cursor position
			MOV BH,00h                       									; Page number: 0
			MOV DH,0Eh                       									; Row: 14
			MOV DL,0Ah                       									; Column: 10
			INT 10h                          									; Set cursor position
			
			MOV AH,09h                       									; Function: display string
			LEA DX,TEXT_MAIN_MENU_TITLE_START 									; Load address of motivation text
			INT 21h                          									; Display the string
			
			MOV AH,00h                       									; Function: get keystroke
			INT 16h                          									; Wait for key press
			
; 			Check if 's' or 's' was pressed to restart
			CMP AL,'S'
			JE START_GAME
			CMP AL,'s'
			JE START_GAME
		
; 			If we get here, user didn't press S/s, so return the loop
			JMP MAIN_LOOP_SCREEN
			
			START_GAME:
				MOV MAIN_MENU, 01h             									; Active the game
		
		RET
	MAIN_MENU_UI ENDP
	
; 	Procedure to draw Win screen
	
	WIN_SCREEN PROC NEAR

		CALL CLEAR_SCREEN                										; Clear the entire screen	
		LOOP_SCREEN_WIN:
; 			Display "WIN" title
			MOV AH,02h                       									; Function: set cursor position
			MOV BH,00h                       									; Page number: 0
			MOV DH,09h                       									; Row: 9
			MOV DL,10h                       									; Column: 16
			INT 10h                          									; Set cursor position
			
			MOV AH,09h                       									; Function: display string
			LEA DX,TEXT_WIN_SCREEN_VICTORY      								; Load win text
			INT 21h                          									; Display the string
			
; 			Display congratulations
			MOV AH,02h                       									; Function: set cursor position
			MOV BH,00h                       									; Page number: 0
			MOV DH,0Ch                       									; Row: 12
			MOV DL,0Bh                       									; Column: 13
			INT 10h                          									; Set cursor position
			
			MOV AH,09h                       									; Function: display string
			LEA DX,TEXT_WIN_SCREEN_CONGRATS 									; Load address of motivation text
			INT 21h                          									; Display the string
			
; 			Display "GG WP" message
			MOV AH,02h                       									; Function: set cursor position
			MOV BH,00h                       									; Page number: 0
			MOV DH,0Fh                       									; Row: 15
			MOV DL,0Fh                       									; Column: 11
			INT 10h                          									; Set cursor position
			
			MOV AH,09h                       									; Function: display string
			LEA DX,TEXT_WIN_SCREEN_GG 											; Load address of play again text
			INT 21h                          									; Display the string
			
; 			Display "Exit main menu" message
			MOV AH,02h                       									; Function: set cursor position
			MOV BH,00h                       									; Page number: 0
			MOV DH,12h                       									; Row: 18
			MOV DL,07h                       									; Column: 8
			INT 10h                          									; Set cursor position
			
			MOV AH,09h                       									; Function: display string
			LEA DX,TEXT_WIN_SCREEN_MENU											; Load address of exit main menu
			INT 21h                          									; Display the string
			
			MOV AH,00h                       									; Function: get keystroke
			INT 16h                          									; Wait for key press
			
; 			Check if M or m was pressed to restart
			CMP AL,'M'
			JE BACK_MENU_WIN
			CMP AL,'m'
			JE BACK_MENU_WIN
			
; 			If we get here, user didn't press M/m, so return the loop
			JMP LOOP_SCREEN_WIN
			
		BACK_MENU_WIN:
			MOV MAIN_MENU,00h
			MOV GAME_ACTIVE,01h
			MOV WIN_GAME,00h
			CALL RESET_OBJECTS													; Reset all objects
			RET                              									; Return from procedure
		RET
	WIN_SCREEN ENDP 
	
; 	Procedure to activate the expanded paddle power-up

	ACTIVATE_PADDLE_POWERUP PROC NEAR
	
; 		Check if power-up is already active
		CMP POWERUP_PADDLE_ACTIVE, 1
		JE RESET_TIMER_ONLY           											; If already active, just reset the timer
		
; 		Save current width as "normal" width
		MOV AX, PADDLE_WIDTH
		MOV PADDLE_NORMAL_WIDTH, AX
		
; 		Expand paddle width (double it)
		SHL AX, 1                     											; Multiply by 2 (AX = AX * 2)
		MOV PADDLE_WIDTH, AX
		
	RESET_TIMER_ONLY:
; 		Set active flag and reset timer
		MOV POWERUP_PADDLE_ACTIVE, 1
		MOV POWERUP_PADDLE_TIMER, 90  											; Set timer value (approx. 5 seconds)
		
		RET
	ACTIVATE_PADDLE_POWERUP ENDP
	
; Procedure to check the power-up timer status

	CHECK_POWERUP_TIMER PROC NEAR
; 		Check if power-up is active
		CMP POWERUP_PADDLE_ACTIVE, 0
		JE EXIT_CHECK_TIMER          							 				; If not active, exit procedure
		
; 		Decrement timer counter
		DEC POWERUP_PADDLE_TIMER
		
; 		Check if timer reached zero
		CMP POWERUP_PADDLE_TIMER, 0
		JG EXIT_CHECK_TIMER           											; If still greater than zero, exit
		
; 		Timer reached zero, deactivate power-up
		MOV POWERUP_PADDLE_ACTIVE, 0
		
; 		Restore original paddle width
		MOV AX, PADDLE_NORMAL_WIDTH
		MOV PADDLE_WIDTH, AX
		
	EXIT_CHECK_TIMER:
		RET
		
	CHECK_POWERUP_TIMER ENDP

; Procedure to clear the screen

	CLEAR_SCREEN PROC NEAR
		MOV AH,00h                												; Set video mode function
		MOV AL,13h                												; Select video mode 13h (320x200, 256 colors)
		INT 10h                   												; Call video BIOS service
		
		MOV AH,0Bh                												; Set color palette function
		MOV BH,00h                												; Select background color
		MOV BL,00h                												; Set background to black
		INT 10h                   												; Call video BIOS service
		
		RET
	CLEAR_SCREEN ENDP
	
	
CODE ENDS
END