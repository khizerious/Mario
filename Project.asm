;;COAL PROJECT
;;MARIO GAME 

;Group Members
;				Hamzah Bilal        19i-0587
;				M Talha Masood      19i-0420
;				H M Khizar Rasheed  19i-1970
;
.model large
.stack 0100h
.data

Nameing BYTE "ENTER PLAYER NAME : ",'$' 
UP BYTE "PRESS W TO MOVE CHARACTER UP",'$' 
RIGHT BYTE "PRESS D TO MOVE CHARACTER RIGHT",'$'
LEFT BYTE "PRESS A TO MOVE CHARACTER LEFT",'$' 
BACK BYTE "PRESS B TO MOVE BACK TO MENU",'$'     
Enterrr BYTE "PRESS ENTER TO CONTINUE GAME ",'$'
Instrucccc BYTE "PRESS P FOR INSTRUCTIONS OF GAME ",'$'
Escap BYTE "PRESS Escape FOR EXIT GAME ",'$'
Pausee BYTE "PRESS p TO PAUSE",'$'
UnPausee BYTE "PRESS p TO UNPAUSE THE GAME",'$'
Castleee BYTE " *** CASTLE ***",'$'
ended Byte "END",'$'
Entrance BYTE "GATE",'$'
nme byte 15 dup('$'),'$'
eye   byte "* *",'$'
MONSTER_EYE byte " @ @ ",'$'
empty byte "   ",'$'
flag byte "Pakistan ",'$'
scores byte "Scores : ",'$'
Level byte "LEVEL = ",'$'
Lives byte "LIVES = ",'$'
Loser byte "LOSER......YOU HAVE LOST ALL YOUR LIVES !!!",'$'
Winning byte "WINNER...WOW YOU HAVE COMPLETED ALL LEVELS!!!",'$'
total byte "YOUR TOTAL SCORE IS = ",'$'
life byte 51
lvl byte 49
looping byte 7
scoring byte 0
sc1 byte 0
sc2 byte 0
counter byte 6
choice byte ?
excaping byte "Press ESC for EXIT THE GAME",'$'
wannn byte "MOVING TO NEXT LEVEL,PRESS ENTER WOW YOU HAVE PASSED LEVEL : ",'$'
check byte 0
chokk byte 0
choki byte 0
;Player body cordinates
p_x1 byte 0
p_y1 byte 0
p_x2 byte 0
p_y2 byte 0
p_x3 byte 0
p_xlh byte 0
p_xlh1 byte 0
p_xrh byte 0
p_xrh1 byte 0
p_y3 byte 0
p_ylh byte 0
p_ylh1 byte 0
p_yrh byte 0
p_yrh1 byte 0
p_xrl1 byte 0
p_xrl  byte 0
p_xll byte 0
p_xll1 byte 0
p_yrl1 byte 0
p_yrl  byte 0
p_yll byte 0
p_yll1 byte 0

;Enemy Body coordinates
E_x1 byte 0
E_x2 byte 0
E_y2 byte 0
E_y1 byte 0
E_y3 byte 0
E_x3 byte 0

E_xrl byte 0
E_yrl byte 0
E_yrl1 byte 0
E_xrl1 byte 0
ene byte 15
E_xll byte 0
E_yll byte 0
E_yll1 byte 0
E_xll1  byte 0


;----------2 Enemy Body coordinates-----------------------------------
E2_x1 byte 0
E2_x2 byte 0
E2_y2 byte 0
E2_y1 byte 0
E2_y3 byte 0
E2_x3 byte 0
E2_xrl byte 0
E2_yrl byte 0
E2_yrl1 byte 0
E2_xrl1 byte 0
ene2 byte 36
E2_xll byte 0
E2_yll byte 0
E2_yll1 byte 0
E2_xll1  byte 0


;----------MONSTER Body coordinates-----------------------------------
M_x1 byte 0
M_x2 byte 0
M_y2 byte 0
M_y1 byte 0
M_xm byte 0
M_xm1 byte 0
M_ym byte 0
M_ym1 byte 0
M_y3 byte 0
M_x3 byte 0
M_xrh byte 0
M_yrh byte 0
M_yrh1 byte 0
M_xrh1 byte 0
mon byte 10
M_xlh byte 0
M_ylh byte 0
M_ylh1 byte 0
M_xlh1  byte 0

;-----------------------FireBalls---------------
f_x  byte 0
f_y byte 0
f_x1 byte 0
f_y1 byte 0

f2_x  byte 0
f2_y byte 0
f2_x1 byte 0
f2_y1 byte 0

quit byte ?
inputChar byte ?
.code

mov ax, @data
mov ds, ax


jmp page1

level_1:
	call Draw_background
	call Draw_player
	;call Draw_Enemy2
	call Draw_obstacles
	call Draw_flags
	call Draw_Level
	call Draw_Lives
	call Draw_score
	call coins
	call Main_arrowkeys	

	
level_2:
	
	call Draw_background
	call Draw_player
	call Draw_obstacles
	call Draw_flags
	call Draw_Level
	call Draw_Lives
	call Draw_score
	call coins
	call Draw_Enemy
	call Draw_Enemy2
	call Main_arrowkeys2

level_3:
	
	call Draw_background
	call Draw_player
	call Draw_Monster
	call Draw_Fireballs
	call Draw_Enemy
	call Draw_Enemy2
	call Draw_obstacles
	call Draw_Castle
	call Draw_Level
	call Draw_Lives
	call Draw_score
	call coins
	call Main_arrowkeys3
lossss:
call Draw_Lostpage
jmp exit		

	
hello:
	call Draw_hellopage

page1:

	call Draw_firstpage

	

exit:
mov ah,4ch
int 21h

Draw_firstpage proc


;-------------------------------------------------- scroll up the windows
	mov ax,0600h ; scroll window up
	mov cx,0 ; upper left corner (0,0)
	mov dx,184Fh ; lower right corner (24,79)
	mov bh,7 ; normal attribute
	int 10h  ; call BIOS


	mov ah,2 ; locate cursor at 0,0
	mov bh,0 ; video page 0
	mov dx,0 ; row 0, column 0
	int 10h

	mov ah,02 ; mode selection
	mov al,0h ; mode number i.e. it can vary but mostly use 2 or 3
	int 10h ; interrupt
;''''''''''''''''''''''''''''''''''background
	;background:
		;mov ah,06
		;mov al,0 ; no scrolling
		;mov cl,00 ; start column
		;mov ch,00 ; start y
		;mov dh,24 ; end row
		;mov dl,83; end column
		;mov bh, 01110000b
		;int 10h
		
	squar:
		; ---- printing Ground line ------
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,0 ; start col
		mov ch,24 ; start y
		mov dh,24 ; end row
		mov dl,80; end column
		mov bh,01001000b
		int 10h
		
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,0 ; start col
		mov ch,00 ; start y
		mov dh,00 ; end row
		mov dl,80; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,0 ; start col
		mov ch,0 ; start y
		mov dh,24 ; end row
		mov dl,0; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,79 ; start col
		mov ch,0 ; start y
		mov dh,24 ; end row
		mov dl,79; end column
		mov bh,01001000b
		int 10h
		
	supermario_logo:
		;S printing
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,4 ; start col
		mov ch,4 ; start y
		mov dh,4 ; end row
		mov dl,9; end column
		mov bh,01001000b
		int 10h
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,4 ; start col
		mov ch,4 ; start y
		mov dh,6 ; end row
		mov dl,4; end column
		mov bh,01001000b
		int 10h
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,4 ; start col
		mov ch,6 ; start y
		mov dh,6 ; end row
		mov dl,9; end column
		mov bh,01001000b
		int 10h
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,9 ; start col
		mov ch,6 ; start y
		mov dh,8 ; end row
		mov dl,9; end column
		mov bh,01001000b
		int 10h
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,4 ; start col
		mov ch,8 ; start y
		mov dh,8 ; end row
		mov dl,9; end column
		mov bh,01001000b
		int 10h
		;U printing
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,11 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,11; end column
		mov bh,01001000b
		int 10h
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,11 ; start col
		mov ch,8 ; start y
		mov dh,8 ; end row
		mov dl,15; end column
		mov bh,01001000b
		int 10h
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,15 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,15; end column
		mov bh,01001000b
		int 10h
		
		;p printing
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,17 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,17; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,17 ; start col
		mov ch,4 ; start y
		mov dh,4 ; end row
		mov dl,21; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,21 ; start col
		mov ch,4 ; start y
		mov dh,6 ; end row
		mov dl,21; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,17 ; start col
		mov ch,6 ; start y
		mov dh,6 ; end row
		mov dl,21; end column
		mov bh,01001000b
		int 10h
		
		;E printing
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,23 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,23; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,23 ; start col
		mov ch,4 ; start y
		mov dh,4 ; end row
		mov dl,27; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,23 ; start col
		mov ch,6 ; start y
		mov dh,6 ; end row
		mov dl,27; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,23 ; start col
		mov ch,8 ; start y
		mov dh,8 ; end row
		mov dl,27; end column
		mov bh,01001000b
		int 10h
		
		;R printing
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,29 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,29; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,29 ; start col
		mov ch,4 ; start y
		mov dh,4 ; end row
		mov dl,33; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,33 ; start col
		mov ch,4 ; start y
		mov dh,6 ; end row
		mov dl,33; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,29 ; start col
		mov ch,6 ; start y
		mov dh,6 ; end row
		mov dl,33; end column
		mov bh,01001000b
		int 10h
		mov ah,06

		mov ah,06
		mov al,0 ; no scrolling
		mov cl,31 ; start col
		mov ch,7 ; start y
		mov dh,7 ; end row
		mov dl,31; end column
		mov bh,01001000b
		int 10h
		
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,32 ; start col
		mov ch,8 ; start y
		mov dh,8 ; end row
		mov dl,32; end column
		mov bh,01001000b
		int 10h
		
		;M printing
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,38 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,38; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,41 ; start col
		mov ch,4 ; start y
		mov dh,6 ; end row
		mov dl,41; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,44 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,44; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,38 ; start col
		mov ch,4 ; start y
		mov dh,4 ; end row
		mov dl,44; end column
		mov bh,01001000b
		int 10h
		
		;a printing
	
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,46 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,46; end column
		mov bh,01001000b
		int 10h
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,50 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,50; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,46 ; start col
		mov ch,6 ; start y
		mov dh,6 ; end row
		mov dl,50; end column
		mov bh,01001000b
		int 10h
		
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,46 ; start col
		mov ch,4 ; start y
		mov dh,4 ; end row
		mov dl,50; end column
		mov bh,01001000b
		int 10h
		
		;R printing
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,52 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,52; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,52 ; start col
		mov ch,4 ; start y
		mov dh,4 ; end row
		mov dl,56; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,56 ; start col
		mov ch,4 ; start y
		mov dh,6 ; end row
		mov dl,56; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,52 ; start col
		mov ch,6 ; start y
		mov dh,6 ; end row
		mov dl,56; end column
		mov bh,01001000b
		int 10h
		mov ah,06

		mov ah,06
		mov al,0 ; no scrolling
		mov cl,54 ; start col
		mov ch,7 ; start y
		mov dh,7 ; end row
		mov dl,54; end column
		mov bh,01001000b
		int 10h
		
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,55 ; start col
		mov ch,8 ; start y
		mov dh,8 ; end row
		mov dl,55; end column
		mov bh,01001000b
		int 10h
		
		;I printing
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,60 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,60; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,58 ; start col
		mov ch,4 ; start y
		mov dh,4 ; end row
		mov dl,62; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,58 ; start col
		mov ch,8 ; start y
		mov dh,8 ; end row
		mov dl,62; end column
		mov bh,01001000b
		int 10h
		
		;O printing
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,64 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,64; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,64 ; start col
		mov ch,4 ; start y
		mov dh,4 ; end row
		mov dl,68; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,64 ; start col
		mov ch,8 ; start y
		mov dh,8 ; end row
		mov dl,68; end column
		mov bh,01001000b
		int 10h

		mov ah,06
		mov al,0 ; no scrolling
		mov cl,68 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,68; end column
		mov bh,01001000b
		int 10h

	;Enter your name printing
		
	
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,20 ; start column
		mov ch,12 ; start y
		mov dh,14 ; end row
		mov dl,58; end column
		mov bh, 01101111b
		int 10h
		
		;writing
		
		mov ah,02
		mov bh,0
		mov dh,13
		mov dl,25
		int 10h
		lea dx,Enterrr
		mov ah,09
		int 21h
		
		mov ah,02
		mov bh,0
		mov dh,23
		mov dl,0
		int 10h
		mov dl,0
		mov ah,01h
		int 21h
		cmp al,13
		je sep
		jmp supermario_logo
sep:
call soundEnter		
call Draw_secondpage		
ret
Draw_firstpage endp

Draw_secondpage proc
;-------------------------------------------------- scroll up the windows
	mov ax,0600h ; scroll window up
	mov cx,0 ; upper left corner (0,0)
	mov dx,184Fh ; lower right corner (24,79)
	mov bh,7 ; normal attribute
	int 10h  ; call BIOS


	mov ah,2 ; locate cursor at 0,0
	mov bh,0 ; video page 0
	mov dx,0 ; row 0, column 0
	int 10h

	mov ah,02 ; mode selection
	mov al,0h ; mode number i.e. it can vary but mostly use 2 or 3
	int 10h ; interrupt

		
	squar:
		; ---- printing Ground line ------
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,0 ; start col
		mov ch,24 ; start y
		mov dh,24 ; end row
		mov dl,80; end column
		mov bh,01001000b
		int 10h
		
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,0 ; start col
		mov ch,00 ; start y
		mov dh,00 ; end row
		mov dl,80; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,0 ; start col
		mov ch,0 ; start y
		mov dh,24 ; end row
		mov dl,0; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,79 ; start col
		mov ch,0 ; start y
		mov dh,24 ; end row
		mov dl,79; end column
		mov bh,01001000b
		int 10h
		
	Manu_logo:
		
		;M printing
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,30 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,30; end column
		mov bh,00011000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,33 ; start col
		mov ch,4 ; start y
		mov dh,6 ; end row
		mov dl,33; end column
		mov bh,00011000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,36 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,36; end column
		mov bh,00011000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,30 ; start col
		mov ch,4 ; start y
		mov dh,4 ; end row
		mov dl,36; end column
		mov bh,00011000b
		int 10h
		
		;E printing
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,38 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,38; end column
		mov bh,00011000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,38 ; start col
		mov ch,4 ; start y
		mov dh,4 ; end row
		mov dl,42; end column
		mov bh,00011000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,38 ; start col
		mov ch,6 ; start y
		mov dh,6 ; end row
		mov dl,42; end column
		mov bh,00011000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,38 ; start col
		mov ch,8 ; start y
		mov dh,8 ; end row
		mov dl,42; end column
		mov bh,00011000b
		int 10h
		
		;N printing
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,44 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,44; end column
		mov bh,00011000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,45 ; start col
		mov ch,4 ; start y
		mov dh,4 ; end row
		mov dl,45; end column
		mov bh,00011000b
		int 10h
		
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,46 ; start col
		mov ch,5 ; start y
		mov dh,5 ; end row
		mov dl,46; end column
		mov bh,00011000b
		int 10h
		
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,47 ; start col
		mov ch,6 ; start y
		mov dh,6 ; end row
		mov dl,47; end column
		mov bh,00011000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,48 ; start col
		mov ch,7 ; start y
		mov dh,7 ; end row
		mov dl,48; end column
		mov bh,00011000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,49 ; start col
		mov ch,8 ; start y
		mov dh,8 ; end row
		mov dl,49; end column
		mov bh,00011000b
		int 10h
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,50 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,50; end column
		mov bh,00011000b
		int 10h
		;U printing
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,52 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,52; end column
		mov bh,00011000b
		int 10h
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,52 ; start col
		mov ch,8 ; start y
		mov dh,8 ; end row
		mov dl,56; end column
		mov bh,00011000b
		int 10h
		
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,56 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,56; end column
		mov bh,00010000b
		int 10h
		
		
	;Enter your name printing
	
	
		
	
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,24 ; start column
		mov ch,11 ; start y
		mov dh,17 ; end row
		mov dl,62; end column
		mov bh, 00110001b
		int 10h
		
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,24 ; start column
		mov ch,16 ; start y
		mov dh,16 ; end row
		mov dl,62; end column
		mov bh, 10110001b
		int 10h
		
		;writing
		mov ah,02
		mov bh,0
		mov dh,12
		mov dl,26
		int 10h
		lea dx,Escap
		mov ah,09
		int 21h
	
		;writing
		mov ah,02
		mov bh,0
		mov dh,14
		mov dl,26
		int 10h
		lea dx,Instrucccc
		mov ah,09
		int 21h
		
		
		mov ah,02
		mov bh,0
		mov dh,16
		mov dl,26
		int 10h
		lea dx,Nameing
		mov ah,09
		int 21h
	
		
		;inputting
		mov ah,02
		mov bh,0
		mov dh,16
		mov dl,46
		int 10h
		mov si,offset nme
		lll:
		mov dx,[si]
		mov ah,1h
		int 21h
		cmp al,13
		je ee
		cmp al,27
		je exit
		cmp al,'p'
		je roo
		mov [si],al
		inc si
		inc counter
		
		loop lll
ee:
call soundEnter
call level_1

roo:
call soundEnter
call Draw_Instructions

ret
Draw_secondpage endp

Draw_Instructions proc
;-------------------------------------------------- scroll up the windows
	mov ax,0600h ; scroll window up
	mov cx,0 ; upper left corner (0,0)
	mov dx,184Fh ; lower right corner (24,79)
	mov bh,7 ; normal attribute
	int 10h  ; call BIOS


	mov ah,2 ; locate cursor at 0,0
	mov bh,0 ; video page 0
	mov dx,0 ; row 0, column 0
	int 10h

	mov ah,02 ; mode selection
	mov al,0h ; mode number i.e. it can vary but mostly use 2 or 3
	int 10h ; interrupt

		
	squar:
		; ---- printing Ground line ------
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,0 ; start col
		mov ch,24 ; start y
		mov dh,24 ; end row
		mov dl,80; end column
		mov bh,01001000b
		int 10h
		
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,0 ; start col
		mov ch,00 ; start y
		mov dh,00 ; end row
		mov dl,80; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,0 ; start col
		mov ch,0 ; start y
		mov dh,24 ; end row
		mov dl,0; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,79 ; start col
		mov ch,0 ; start y
		mov dh,24 ; end row
		mov dl,79; end column
		mov bh,01001000b
		int 10h
		
	
	
		
	;;;;;;;;;;;;;;;;;;;;;;;;;;
	
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,20 ; start column
		mov ch,5 ; start y
		mov dh,18 ; end row
		mov dl,58; end column
		mov bh, 01110001b
		int 10h
		
		;writing
		mov ah,02
		mov bh,0
		mov dh,7
		mov dl,22
		int 10h
		lea dx,UP
		mov ah,09
		int 21h
	
		;writing
		mov ah,02
		mov bh,0
		mov dh,9
		mov dl,22
		int 10h
		lea dx,LEFT
		mov ah,09
		int 21h
		;writing
		mov ah,02
		mov bh,0
		mov dh,11
		mov dl,22
		int 10h
		lea dx,RIGHT
		mov ah,09
		int 21h
		;writing
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,20 ; start column
		mov ch,13 ; start y
		mov dh,13 ; end row
		mov dl,58; end column
		mov bh, 11110001b
		int 10h
		mov ah,02
		mov bh,0
		mov dh,13
		mov dl,22
		int 10h
		lea dx,BACK
		mov ah,09
		int 21h
		;writing
		mov ah,02
		mov bh,0
		mov dh,15
		mov dl,22
		int 10h
		lea dx,Escap
		mov ah,09
		int 21h
		
		mov ah,02
		mov bh,0
		mov dh,23
		mov dl,0
		int 10h
		mov dl,0
		mov ah,1h
		int 21h
		cmp al,'b'
		je aa
		cmp al,27
		je exit
		jmp squar
aa:
call soundEnter
call Draw_secondpage
		
ret
Draw_Instructions endp

Main_arrowkeys proc


gameloop:


;;;;sound producing
		mov     al, 182         ; Prepare the speaker for the
        out     43h, al         ;  note.
        mov     ax,4831   ; Frequency number (in decimal)
                                ;  for middle C.
        out     42h, al         ; Output low byte.
        mov     al, ah          ; Output high byte.
        out     42h, al 
        in      al, 61h         ; Turn on note (get value from
                                ;  port 61h).
        or      al, 00000011b   ; Set bits 1 and 0.
        out     61h, al         ; Send new value.
        mov     bx, 1      ; Pause for duration of note.
pause1:
        mov     cx, 65535
pause2:
        dec     cx
        jne     pause2
        dec     bx
        jne     pause1
        in      al, 61h         ; Turn off note (get value from
                                ;  port 61h).
        and     al, 11111100b   ; Reset bits 1 and 0.
        out     61h, al

        
		;;;;checks for nexr level
		call curser1
		cmp p_xrh1,78
		je starrrt
		
		;check for scores
		cmp p_x1,10
		je scorewa
		
		cmp p_x1,31
		je scorewa
		
		cmp p_x1,50
		je scorewa
		
		cmp p_x1,11
		je scorewa
		
		cmp p_x1,30
		je scorewa
		
		cmp p_x1,52
		je scorewa
		
		cmp p_x1,12
		je scorewa
		
		cmp p_x1,32
		je scorewa
		
		cmp p_x1,54
		je scorewa
		
		cmp p_xlh,0
		je dontrun1
		
		cmp p_xlh,13
		je dontrun1
		
		cmp p_xlh,35
		je dontrun1
		
		cmp p_xlh,56
		je dontrun1
		jmp gravity
		
		scorewa:
		call Update_score
		jmp gravity

		dontrun:
		call Remove_player
		dec p_x1
		dec p_x2
		dec p_x3
		dec p_xlh
		dec p_xlh1
		dec p_xll
		dec p_xll1
		dec p_xrh
		dec p_xrh1
		dec p_xrl
		dec p_xrl1
		call Update_player
		jmp onGround
		
		right_moving:
		
		;call Remove_player
		;add	p_y1,2
		;add p_y2,2
		;add p_y3,2
		;add p_ylh,2
		;add p_ylh1,2
		;add p_yll,2
		;add p_yll1,2
		;add p_yrh,2
		;add p_yrh1,2
		;add p_yrl,2
		;add p_yrl1	,2
		;righti:
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		call Update_player
		jmp onGround
		
		dontrun1:
			call Remove_player
			inc p_x1
			inc p_x2
			inc p_x3
			inc p_xlh
			inc p_xlh1
			inc p_xll
			inc p_xll1
			inc p_xrh
			inc p_xrh1
			inc p_xrl
			inc p_xrl1
			call Update_player
			jmp onGround
		; make player fall:
		;call Remove_player
		;call Update_player
		
		
		
	;==============-----------Enemy moving inn between the pillars
	
	
	gravity:
		
	;checks for boundariess
		;first obstacles
		cmp p_x1,9
		je dontrun
		
		cmp p_xrh1,9
		je dontrun
		
		cmp p_xrl1,9
		je dontrun
		
		cmp p_x2,9
		je dontrun
		
		cmp p_x1,29
		je dontrun
		
		cmp p_xrh1,29
		je dontrun
		
		cmp p_xrl1,29
		je dontrun
		
		cmp p_x2,29
		je dontrun
		
		cmp p_x1,49
		je dontrun
		
		cmp p_xrh1,49
		je dontrun
		
		cmp p_xrl1,49
		je dontrun
		
		cmp p_x2,49
		je dontrun
		
			
		
		;cmp p_xrl1,50
		;je right_moving
		;cmp p_xrl1,51
		;je right_moving
		;cmp p_xrl1,52
		;je right_moving
		;cmp p_xrl1,53
		;je right_moving
		;cmp p_xrl1,54
		;je right_moving
		;pcmp p_xrl1,55
		;je right_moving
		
		
			
		cmp p_yrl1,23
		jge onGround
		; make player fall:
		call Remove_player
		;down
		inc p_y1
		inc p_y2
		inc p_y3
		inc p_ylh
		inc p_ylh1
		inc p_yll
		inc p_yll1
		inc p_yrh
		inc p_yrh1
		inc p_yrl
		inc p_yrl1
		;right
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		;inc scoring
		call Update_player
		call delay
		jmp gravity
		
		
	up_gravity:
		cmp p_yrl1,23
		jge onGround
		; make player fall:
		call Remove_player
		;down
		inc p_y1
		inc p_y2
		inc p_y3
		inc p_ylh
		inc p_ylh1
		inc p_yll
		inc p_yll1
		inc p_yrh
		inc p_yrh1
		inc p_yrl
		inc p_yrl1
		;right
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		call Update_player
		call delay
		jmp up_gravity
	onGround:
	; get user key input:
		
		
		mov ah,01h
		int 21h
		mov inputChar,al

		; exit game if user types 'q':
		cmp inputChar,27
		je exit
		cmp inputChar,'w'
		je moveUp
		;cmp inputChar,80
		;je moveDown
		cmp inputChar,'a'
		je moveLeft
		cmp inputChar,'d'
		je moveRight
		cmp inputChar,'p'
		je pausss
		
		
		jmp gameloop
		
		
		moveUp:
		  ;allow player to jump:
			L1:
			call Remove_player
			;up movement
			dec p_y1
			dec p_y2
			dec p_y3
			dec p_ylh
			dec p_ylh1
			dec p_yll
			dec p_yll1
			dec p_yrh
			dec p_yrh1
			dec p_yrl
			dec p_yrl1
			;right movement 
			inc p_x1
			inc p_x2
			inc p_x3
			inc p_xlh
			inc p_xlh1
			inc p_xll
			inc p_xll1
			inc p_xrh
			inc p_xrh1
			inc p_xrl
			inc p_xrl1
			call Update_player
			call soundW
			call Delay
			dec looping
			cmp looping,0
			je ending
			jmp L1
			ending:
				mov looping,7
		jmp gameloop

		;moveDown:
		;call Remove_player
		;inc p_y1
		;inc p_y2
		;inc p_y3
		;inc p_ylh
		;inc p_ylh1
		;inc p_yll
		;inc p_yll1
		;inc p_yrh
		;inc p_yrh1
		;inc p_yrl
		;inc p_yrl1	
		
		;call Update_player
		;jmp gameloop

		moveLeft:
		call Remove_player
		dec p_x1
		dec p_x2
		dec p_x3
		dec p_xlh
		dec p_xlh1
		dec p_xll
		dec p_xll1
		dec p_xrh
		dec p_xrh1
		dec p_xrl
		dec p_xrl1
		call soundA
		call Update_player
		
		jmp gameloop

		moveRight:
		call Remove_player
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		call soundD
		call Update_player
		jmp gameloop
		
		;Enemies:
	
		;incre:
		
		;call Remove_Enemy
		;inc E_x1 
		;inc E_x2 
		;;inc E_x3 
		;inc E_xrl 
		;inc E_xrl1 
		;inc E_xll 
		;inc E_xll1 
		;;call Update_Enemy
		;call delay
		;cmp E_xrl1,47
		;je decre
		;jmp gameloop
		;decre:
		;call Remove_Enemy
		;dec E_x1 
		;dec E_x2 
		;dec E_x3 
		;dec E_xrl 
		;dec E_xrl1 
		;dec E_xll 
		;dec E_xll1 
		;call Update_Enemy
		;call delay	
		;cmp E_xrl1,27
		;je incre
		;jmp gameloop
		pausss:
		call Draw_Pausepage
		call Draw_background
		call Update_player
		call Draw_obstacles
		call Draw_flags
		call Draw_Level
		call Draw_Lives
		call Draw_score
		call coins	
		jmp gameloop

		starrrt:
			inc lvl
			call Draw_hellopage
			;cmp lvl,50
			;je ll2
			
			;cmp lvl,51
			;je ll3
			;ll1:
			
			
			;ll2:
			;add scor,9
			;inc lvl
			;call Startagain
			;jmp gameloop
			;
			;ll3:
			;add scor,18
			;inc lvl
			;call Startagain
			;jmp gameloop
		

ret
Main_arrowkeys endp

Main_arrowkeys2 proc


gameloop:
;sound producing
		mov     al, 182         ; Prepare the speaker for the
        out     43h, al         ;  note.
        mov     ax,9999; Frequency number (in decimal)
                                ;  for middle C.
        out     42h, al         ; Output low byte.
        mov     al, ah          ; Output high byte.
        out     42h, al 
        in      al, 61h         ; Turn on note (get value from
                                ;  port 61h).
        or      al, 00000011b   ; Set bits 1 and 0.
        out     61h, al         ; Send new value.
        mov     bx, 1      ; Pause for duration of note.
pause1:
        mov     cx, 65535
pause2:
        dec     cx
        jne     pause2
        dec     bx
        jne     pause1
        in      al, 61h         ; Turn off note (get value from
                                ;  port 61h).
        and     al, 11111100b   ; Reset bits 1 and 0.
        out     61h, al

	;checks for enemy collosion
		;;;;;;;;;;;;;;;;;;player dead
		call Mov_Enemy
		call Mov_Enemy2
		
		e3:
		cmp p_ylh,21
		je losiii
		jmp deaddd 
		
		losiii:
		mov al,E_x1
		add	al,-1
		cmp p_xrh1,al
		je lost
		
		mov al,E_x2
		add al,1
		cmp p_xlh1,al
		je lost
		
		mov al,E2_x1
		add	al,-1
		cmp p_xrh1,al
		je lost
		
		mov al,E2_x2
		add al,1
		cmp p_xlh1,al
		je lost
		
		;;;;;;;;;;;;;;;;;;;;;;;enemy dead
		
		deaddd:
		cmp p_yrl,19
		jge diii
		jmp chpl
		
		diii:
		mov al,E_x2
		add al,-1
		cmp p_xrl1,al
		je dead
		mov al,E_x2
		cmp p_xrl1,al
		je dead
		mov al,E_x1
		cmp p_xrl1,al
		je dead
		
		mov al,E_x2
		add al,-1
		cmp p_xll1,al
		je dead
		mov al,E_x2
		cmp p_xll1,al
		je dead
		mov al,E_x1
		cmp p_xll1,al
		je dead
		
		mov al,E2_x2
		add al,-1
		cmp p_xrl1,al
		je dead2
		mov al,E2_x2
		cmp p_xrl1,al
		je dead2
		mov al,E2_x1
		cmp p_xrl1,al
		je dead2
		
		mov al,E2_x2
		add al,-1
		cmp p_xll1,al
		je dead2
		mov al,E2_x2
		cmp p_xll1,al
		je dead2
		mov al,E2_x1
		cmp p_xll1,al
		je dead2
		
		;;;;checks for nexr level
		
		
		chpl:
		cmp p_xrh1,78
		je starrrt
		
		;check for scores
		cmp p_x1,10
		je scorewa
		
		cmp p_x1,31
		je scorewa
		
		cmp p_x1,50
		je scorewa
		
		cmp p_x1,11
		je scorewa
		
		cmp p_x1,30
		je scorewa
		
		cmp p_x1,52
		je scorewa
		
		cmp p_x1,12
		je scorewa
		
		cmp p_x1,32
		je scorewa
		
		cmp p_x1,54
		je scorewa
		
		cmp p_xlh,0
		je dontrun1
		
		cmp p_xlh,13
		je dontrun1
		
		cmp p_xlh,35
		je dontrun1
		
		cmp p_xlh,56
		je dontrun1
		jmp gravity
		
		scorewa:
		call Update_score
		jmp gravity

		dontrun:
		call Remove_player
		dec p_x1
		dec p_x2
		dec p_x3
		dec p_xlh
		dec p_xlh1
		dec p_xll
		dec p_xll1
		dec p_xrh
		dec p_xrh1
		dec p_xrl
		dec p_xrl1
		call Update_player
		jmp onGround
		
		right_moving:
		
		;call Remove_player
		;add	p_y1,2
		;add p_y2,2
		;add p_y3,2
		;add p_ylh,2
		;add p_ylh1,2
		;add p_yll,2
		;add p_yll1,2
		;add p_yrh,2
		;add p_yrh1,2
		;add p_yrl,2
		;add p_yrl1	,2
		;righti:
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		call Update_player
		jmp onGround
		
		dontrun1:
			call Remove_player
			inc p_x1
			inc p_x2
			inc p_x3
			inc p_xlh
			inc p_xlh1
			inc p_xll
			inc p_xll1
			inc p_xrh
			inc p_xrh1
			inc p_xrl
			inc p_xrl1
			call Update_player
			jmp onGround
		;make player fall:
		;call Remove_player
		;call Update_player
		
		
		
	;Enemy moving inn between the pillars
	
	
	gravity:
		
	;checks for boundariess
		;first obstacles
		cmp p_x1,9
		je dontrun
		
		cmp p_xrh1,9
		je dontrun
		
		cmp p_xrl1,9
		je dontrun
		
		cmp p_x2,9
		je dontrun
		
		cmp p_x1,29
		je dontrun
		
		cmp p_xrh1,29
		je dontrun
		
		cmp p_xrl1,29
		je dontrun
		
		cmp p_x2,29
		je dontrun
		
		cmp p_x1,49
		je dontrun
		
		cmp p_xrh1,49
		je dontrun
		
		cmp p_xrl1,49
		je dontrun
		
		cmp p_x2,49
		je dontrun
		
		;cmp p_xrl1,50
		;je right_moving
		;cmp p_xrl1,51
		;je right_moving
		;cmp p_xrl1,52
		;je right_moving
		;cmp p_xrl1,53
		;je right_moving
		;cmp p_xrl1,54
		;je right_moving
		;pcmp p_xrl1,55
		;je right_moving
			
		cmp p_yrl1,23
		jge onGround
		; make player fall:
		call Remove_player
		;down
		inc p_y1
		inc p_y2
		inc p_y3
		inc p_ylh
		inc p_ylh1
		inc p_yll
		inc p_yll1
		inc p_yrh
		inc p_yrh1
		inc p_yrl
		inc p_yrl1
		;right
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		;inc scoring
		call Update_player
		call delay
		jmp gravity
		
		
	up_gravity:
		cmp p_yrl1,23
		jge onGround
		; make player fall:
		call Remove_player
		;down
		inc p_y1
		inc p_y2
		inc p_y3
		inc p_ylh
		inc p_ylh1
		inc p_yll
		inc p_yll1
		inc p_yrh
		inc p_yrh1
		inc p_yrl
		inc p_yrl1
		;right
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		call Update_player
		call delay
		jmp up_gravity
	onGround:
	; get user key input
		mov ah,01h
		int 16h
		jz gameloop
		mov ah,00h
		int 16h
		mov inputChar,al
	; exit game if user types 'q':
		cmp inputChar,27
		je exit
		cmp inputChar,'w'
		je moveUp
		;cmp inputChar,80
		;je moveDown
		cmp inputChar,'a'
		je moveLeft
		cmp inputChar,'d'
		je moveRight
		cmp inputChar,'p'
		je pausss
		jmp gameloop
		
		
		moveUp:
		  ;allow player to jump:
			L1:
			call Remove_player
			;up movement
			dec p_y1
			dec p_y2
			dec p_y3
			dec p_ylh
			dec p_ylh1
			dec p_yll
			dec p_yll1
			dec p_yrh
			dec p_yrh1
			dec p_yrl
			dec p_yrl1
			;right movement 
			inc p_x1
			inc p_x2
			inc p_x3
			inc p_xlh
			inc p_xlh1
			inc p_xll
			inc p_xll1
			inc p_xrh
			inc p_xrh1
			inc p_xrl
			inc p_xrl1
			call Update_player
			call delay
			call soundW
			dec looping
			cmp looping,0
			je ending
			jmp L1
			ending:
				mov looping,7
		jmp gameloop

		;moveDown:
		;call Remove_player
		;inc p_y1
		;inc p_y2
		;inc p_y3
		;inc p_ylh
		;inc p_ylh1
		;inc p_yll
		;inc p_yll1
		;inc p_yrh
		;inc p_yrh1
		;inc p_yrl
		;inc p_yrl1	
		
		;call Update_player
		;jmp gameloop

		moveLeft:
		call Remove_player
		dec p_x1
		dec p_x2
		dec p_x3
		dec p_xlh
		dec p_xlh1
		dec p_xll
		dec p_xll1
		dec p_xrh
		dec p_xrh1
		dec p_xrl
		dec p_xrl1
		call Update_player
		call soundA
		call delay
		jmp gameloop

		moveRight:
		call Remove_player
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		call Update_player
		call soundD
		call delay
		jmp gameloop
		
		;Enemies:
	
		;incre:
		
		;call Remove_Enemy
		;inc E_x1 
		;inc E_x2 
		;;inc E_x3 
		;inc E_xrl 
		;inc E_xrl1 
		;inc E_xll 
		;inc E_xll1 
		;;call Update_Enemy
		;call delay
		;cmp E_xrl1,47
		;je decre
		;jmp gameloop
		;decre:
		;call Remove_Enemy
		;dec E_x1 
		;dec E_x2 
		;dec E_x3 
		;dec E_xrl 
		;dec E_xrl1 
		;dec E_xll 
		;dec E_xll1 
		;call Update_Enemy
		;call delay	
		;cmp E_xrl1,27
		;je incre
		;jmp gameloop
		
		
		dead:
			call Remove_Enemy
			add scoring,5
			call Update_score
			jmp Enemy1_arrowkeys2

		dead2:
			call Remove_Enemy2
			add scoring,5
			call Update_score
			jmp Enemy2_arrowkeys2
		
		pausss:
		call Draw_Pausepage
		call Draw_background
		call Update_player
		call Update_Enemy
		call Update_Enemy2
		call Draw_obstacles
		call Draw_flags
		call Draw_Level
		call Draw_Lives
		call Draw_score
		call coins	
		jmp gameloop
		
		starrrt:
			inc lvl
			call Draw_hellopage
			;cmp lvl,50
			;je ll2
			
			;cmp lvl,51
			;je ll3
			;ll1:
			
			
			;ll2:
			;add scor,9
			;inc lvl
			;call Startagain
			;jmp gameloop
			;
			;ll3:
			;add scor,18
			;inc lvl
			;call Startagain
			;jmp gameloop
		lost:
		call Remove_player
		dec life
		cmp life,48
		je lossss
		call Draw_Lives
		call Startagain
		
ret
Main_arrowkeys2 endp



Enemy1_arrowkeys2 proc
gameloop:
		;;;;;;;sound producing
		mov     al, 182         ; Prepare the speaker for the
        out     43h, al         ;  note.
        mov     ax,9999   ; Frequency number (in decimal)
                                ;  for middle C.
        out     42h, al         ; Output low byte.
        mov     al, ah          ; Output high byte.
        out     42h, al 
        in      al, 61h         ; Turn on note (get value from
                                ;  port 61h).
        or      al, 00000011b   ; Set bits 1 and 0.
        out     61h, al         ; Send new value.
        mov     bx, 1      ; Pause for duration of note.
pause1:
        mov     cx, 65535
pause2:
        dec     cx
        jne     pause2
        dec     bx
        jne     pause1
        in      al, 61h         ; Turn off note (get value from
                                ;  port 61h).
        and     al, 11111100b   ; Reset bits 1 and 0.
        out     61h, al

	;checks for enemy collosion
		;;;;;;;;;;;;;;;;;;player dead
		call Mov_Enemy2
		
		e3:
		cmp p_ylh,21
		je losiii
		jmp deaddd 
		
		losiii:
		mov al,E2_x1
		add	al,-1
		cmp p_xrh1,al
		je lost
		
		mov al,E2_x2
		add al,1
		cmp p_xlh1,al
		je lost
		
		;;;;;;;;;;;;;;;;;;;;;;;enemy dead
		
		deaddd:
		cmp p_yrl,19
		jge diii
		jmp chpl
		
		diii:
		mov al,E2_x2
		add al,-1
		cmp p_xrl1,al
		je dead2
		mov al,E2_x2
		cmp p_xrl1,al
		je dead2
		mov al,E2_x1
		cmp p_xrl1,al
		je dead2
		
		mov al,E2_x2
		add al,-1
		cmp p_xll1,al
		je dead2
		mov al,E2_x2
		cmp p_xll1,al
		je dead2
		mov al,E2_x1
		cmp p_xll1,al
		je dead2
		
		;;;;checks for nexr level
		
		
		chpl:
		cmp p_xrh1,78
		je starrrt
		
		;check for scores
		cmp p_x1,10
		je scorewa
		
		cmp p_x1,31
		je scorewa
		
		cmp p_x1,50
		je scorewa
		
		cmp p_x1,11
		je scorewa
		
		cmp p_x1,30
		je scorewa
		
		cmp p_x1,52
		je scorewa
		
		cmp p_x1,12
		je scorewa
		
		cmp p_x1,32
		je scorewa
		
		cmp p_x1,54
		je scorewa
		
		cmp p_xlh,0
		je dontrun1
		
		cmp p_xlh,13
		je dontrun1
		
		cmp p_xlh,35
		je dontrun1
		
		cmp p_xlh,56
		je dontrun1
		jmp gravity
		
		scorewa:
		call Update_score
		jmp gravity

		dontrun:
		call Remove_player
		dec p_x1
		dec p_x2
		dec p_x3
		dec p_xlh
		dec p_xlh1
		dec p_xll
		dec p_xll1
		dec p_xrh
		dec p_xrh1
		dec p_xrl
		dec p_xrl1
		call Update_player
		jmp onGround
		
		right_moving:
		
		;call Remove_player
		;add	p_y1,2
		;add p_y2,2
		;add p_y3,2
		;add p_ylh,2
		;add p_ylh1,2
		;add p_yll,2
		;add p_yll1,2
		;add p_yrh,2
		;add p_yrh1,2
		;add p_yrl,2
		;add p_yrl1	,2
		;righti:
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		call Update_player
		jmp onGround
		
		dontrun1:
			call Remove_player
			inc p_x1
			inc p_x2
			inc p_x3
			inc p_xlh
			inc p_xlh1
			inc p_xll
			inc p_xll1
			inc p_xrh
			inc p_xrh1
			inc p_xrl
			inc p_xrl1
			call Update_player
			jmp onGround
		;make player fall:
		;call Remove_player
		;call Update_player
		
		
		
	;Enemy moving inn between the pillars
	
	
	gravity:
		
	;checks for boundariess
		;first obstacles
		cmp p_x1,9
		je dontrun
		
		cmp p_xrh1,9
		je dontrun
		
		cmp p_xrl1,9
		je dontrun
		
		cmp p_x2,9
		je dontrun
		
		cmp p_x1,29
		je dontrun
		
		cmp p_xrh1,29
		je dontrun
		
		cmp p_xrl1,29
		je dontrun
		
		cmp p_x2,29
		je dontrun
		
		cmp p_x1,49
		je dontrun
		
		cmp p_xrh1,49
		je dontrun
		
		cmp p_xrl1,49
		je dontrun
		
		cmp p_x2,49
		je dontrun
		
		;cmp p_xrl1,50
		;je right_moving
		;cmp p_xrl1,51
		;je right_moving
		;cmp p_xrl1,52
		;je right_moving
		;cmp p_xrl1,53
		;je right_moving
		;cmp p_xrl1,54
		;je right_moving
		;pcmp p_xrl1,55
		;je right_moving
			
		cmp p_yrl1,23
		jge onGround
		; make player fall:
		call Remove_player
		;down
		inc p_y1
		inc p_y2
		inc p_y3
		inc p_ylh
		inc p_ylh1
		inc p_yll
		inc p_yll1
		inc p_yrh
		inc p_yrh1
		inc p_yrl
		inc p_yrl1
		;right
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		;inc scoring
		call Update_player
		call delay
		jmp gravity
		
		
	up_gravity:
		cmp p_yrl1,23
		jge onGround
		; make player fall:
		call Remove_player
		;down
		inc p_y1
		inc p_y2
		inc p_y3
		inc p_ylh
		inc p_ylh1
		inc p_yll
		inc p_yll1
		inc p_yrh
		inc p_yrh1
		inc p_yrl
		inc p_yrl1
		;right
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		call Update_player
		call delay
		jmp up_gravity
	onGround:
	; get user key input
		mov ah,01h
		int 16h
		jz gameloop
		mov ah,00h
		int 16h
		mov inputChar,al
	; exit game if user types 'q':
		cmp inputChar,27
		je exit
		cmp inputChar,'w'
		je moveUp
		;cmp inputChar,80
		;je moveDown
		cmp inputChar,'a'
		je moveLeft
		cmp inputChar,'d'
		je moveRight
		cmp inputChar,'p'
		je pausss
		
		jmp gameloop
		
		
		moveUp:
		  ;allow player to jump:
			L1:
			call Remove_player
			;up movement
			dec p_y1
			dec p_y2
			dec p_y3
			dec p_ylh
			dec p_ylh1
			dec p_yll
			dec p_yll1
			dec p_yrh
			dec p_yrh1
			dec p_yrl
			dec p_yrl1
			;right movement 
			inc p_x1
			inc p_x2
			inc p_x3
			inc p_xlh
			inc p_xlh1
			inc p_xll
			inc p_xll1
			inc p_xrh
			inc p_xrh1
			inc p_xrl
			inc p_xrl1
			call Update_player
			call soundW
			call delay
			dec looping
			cmp looping,0
			je ending
			jmp L1
			ending:
				mov looping,7
		jmp gameloop

		;moveDown:
		;call Remove_player
		;inc p_y1
		;inc p_y2
		;inc p_y3
		;inc p_ylh
		;inc p_ylh1
		;inc p_yll
		;inc p_yll1
		;inc p_yrh
		;inc p_yrh1
		;inc p_yrl
		;inc p_yrl1	
		
		;call Update_player
		;jmp gameloop

		moveLeft:
		call Remove_player
		dec p_x1
		dec p_x2
		dec p_x3
		dec p_xlh
		dec p_xlh1
		dec p_xll
		dec p_xll1
		dec p_xrh
		dec p_xrh1
		dec p_xrl
		dec p_xrl1
		call Update_player
		call soundA
		call delay
		jmp gameloop

		moveRight:
		call Remove_player
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		call soundD
		call Update_player
		call delay
		jmp gameloop
		
		;Enemies:
	
		;incre:
		
		;call Remove_Enemy
		;inc E_x1 
		;inc E_x2 
		;;inc E_x3 
		;inc E_xrl 
		;inc E_xrl1 
		;inc E_xll 
		;inc E_xll1 
		;;call Update_Enemy
		;call delay
		;cmp E_xrl1,47
		;je decre
		;jmp gameloop
		;decre:
		;call Remove_Enemy
		;dec E_x1 
		;dec E_x2 
		;dec E_x3 
		;dec E_xrl 
		;dec E_xrl1 
		;dec E_xll 
		;dec E_xll1 
		;call Update_Enemy
		;call delay	
		;cmp E_xrl1,27
		;je incre
		;jmp gameloop

		dead2:
			call Remove_Enemy2
			add scoring,5
			inc chokk
			inc choki
			call Update_score
			jmp Enemy2_arrowkeys2
		
		pausss:
		call Draw_Pausepage
		call Draw_background
		call Update_player
		call Update_Enemy2
		call Draw_obstacles
		call Draw_flags
		call Draw_Level
		call Draw_Lives
		call Draw_score
		call coins	
		jmp gameloop
		starrrt:
			inc lvl
			call Draw_hellopage
			;cmp lvl,50
			;je ll2
			
			;cmp lvl,51
			;je ll3
			;ll1:
			
			
			;ll2:
			;add scor,9
			;inc lvl
			;call Startagain
			;jmp gameloop
			;
			;ll3:
			;add scor,18
			;inc lvl
			;call Startagain
			;jmp gameloop
		lost:
		call Remove_player
		dec life
		cmp life,48
		je lossss
		call Draw_Lives
		call Startagain
		
ret
Enemy1_arrowkeys2 endp


Enemy2_arrowkeys2 proc
gameloop:
;;;;;;;;;;;sound		
		mov     al, 182         ; Prepare the speaker for the
        out     43h, al         ;  note.
        mov     ax,9999   ; Frequency number (in decimal)
                                ;  for middle C.
        out     42h, al         ; Output low byte.
        mov     al, ah          ; Output high byte.
        out     42h, al 
        in      al, 61h         ; Turn on note (get value from
                                ;  port 61h).
        or      al, 00000011b   ; Set bits 1 and 0.
        out     61h, al         ; Send new value.
        mov     bx, 1      ; Pause for duration of note.
pause1:
        mov     cx, 65535
pause2:
        dec     cx
        jne     pause2
        dec     bx
        jne     pause1
        in      al, 61h         ; Turn off note (get value from
                                ;  port 61h).
        and     al, 11111100b   ; Reset bits 1 and 0.
        out     61h, al

	;checks for enemy collosion
		
		;;;;checks for nexr level
		
		
		chpl:
		cmp p_xrh1,78
		je starrrt
		
		;check for scores
		cmp p_x1,10
		je scorewa
		
		cmp p_x1,31
		je scorewa
		
		cmp p_x1,50
		je scorewa
		
		cmp p_x1,11
		je scorewa
		
		cmp p_x1,30
		je scorewa
		
		cmp p_x1,52
		je scorewa
		
		cmp p_x1,12
		je scorewa
		
		cmp p_x1,32
		je scorewa
		
		cmp p_x1,54
		je scorewa
		
		cmp p_xlh,0
		je dontrun1
		
		cmp p_xlh,13
		je dontrun1
		
		cmp p_xlh,35
		je dontrun1
		
		cmp p_xlh,56
		je dontrun1
		jmp gravity
		
		scorewa:
		call Update_score
		jmp gravity

		dontrun:
		call Remove_player
		dec p_x1
		dec p_x2
		dec p_x3
		dec p_xlh
		dec p_xlh1
		dec p_xll
		dec p_xll1
		dec p_xrh
		dec p_xrh1
		dec p_xrl
		dec p_xrl1
		call Update_player
		jmp onGround
		
		right_moving:
		
		;call Remove_player
		;add	p_y1,2
		;add p_y2,2
		;add p_y3,2
		;add p_ylh,2
		;add p_ylh1,2
		;add p_yll,2
		;add p_yll1,2
		;add p_yrh,2
		;add p_yrh1,2
		;add p_yrl,2
		;add p_yrl1	,2
		;righti:
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		call Update_player
		jmp onGround
		
		dontrun1:
			call Remove_player
			inc p_x1
			inc p_x2
			inc p_x3
			inc p_xlh
			inc p_xlh1
			inc p_xll
			inc p_xll1
			inc p_xrh
			inc p_xrh1
			inc p_xrl
			inc p_xrl1
			call Update_player
			jmp onGround
		;make player fall:
		;call Remove_player
		;call Update_player
		
		
		
	;Enemy moving inn between the pillars
	
	
	gravity:
		
	;checks for boundariess
		;first obstacles
		cmp p_x1,9
		je dontrun
		
		cmp p_xrh1,9
		je dontrun
		
		cmp p_xrl1,9
		je dontrun
		
		cmp p_x2,9
		je dontrun
		
		cmp p_x1,29
		je dontrun
		
		cmp p_xrh1,29
		je dontrun
		
		cmp p_xrl1,29
		je dontrun
		
		cmp p_x2,29
		je dontrun
		
		cmp p_x1,49
		je dontrun
		
		cmp p_xrh1,49
		je dontrun
		
		cmp p_xrl1,49
		je dontrun
		
		cmp p_x2,49
		je dontrun
		
		;cmp p_xrl1,50
		;je right_moving
		;cmp p_xrl1,51
		;je right_moving
		;cmp p_xrl1,52
		;je right_moving
		;cmp p_xrl1,53
		;je right_moving
		;cmp p_xrl1,54
		;je right_moving
		;pcmp p_xrl1,55
		;je right_moving
			
		cmp p_yrl1,23
		jge onGround
		; make player fall:
		call Remove_player
		;down
		inc p_y1
		inc p_y2
		inc p_y3
		inc p_ylh
		inc p_ylh1
		inc p_yll
		inc p_yll1
		inc p_yrh
		inc p_yrh1
		inc p_yrl
		inc p_yrl1
		;right
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		;inc scoring
		call Update_player
		call delay
		jmp gravity
		
		
	up_gravity:
		cmp p_yrl1,23
		jge onGround
		; make player fall:
		call Remove_player
		;down
		inc p_y1
		inc p_y2
		inc p_y3
		inc p_ylh
		inc p_ylh1
		inc p_yll
		inc p_yll1
		inc p_yrh
		inc p_yrh1
		inc p_yrl
		inc p_yrl1
		;right
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		call Update_player
		call delay
		jmp up_gravity
	onGround:
	; get user key input
		mov ah,01h
		int 16h
		jz gameloop
		mov ah,00h
		int 16h
		mov inputChar,al
	; exit game if user types 'q':
		cmp inputChar,27
		je exit
		cmp inputChar,'w'
		je moveUp
		;cmp inputChar,80
		;je moveDown
		cmp inputChar,'a'
		je moveLeft
		cmp inputChar,'d'
		je moveRight
		cmp inputChar,'p'
		je pausss
		
		jmp gameloop
		
		
		moveUp:
		  ;allow player to jump:
			L1:
			call Remove_player
			;up movement
			dec p_y1
			dec p_y2
			dec p_y3
			dec p_ylh
			dec p_ylh1
			dec p_yll
			dec p_yll1
			dec p_yrh
			dec p_yrh1
			dec p_yrl
			dec p_yrl1
			;right movement 
			inc p_x1
			inc p_x2
			inc p_x3
			inc p_xlh
			inc p_xlh1
			inc p_xll
			inc p_xll1
			inc p_xrh
			inc p_xrh1
			inc p_xrl
			inc p_xrl1
			call Update_player
			call soundW
			call delay
			dec looping
			cmp looping,0
			je ending
			jmp L1
			ending:
				mov looping,7
		jmp gameloop

		;moveDown:
		;call Remove_player
		;inc p_y1
		;inc p_y2
		;inc p_y3
		;inc p_ylh
		;inc p_ylh1
		;inc p_yll
		;inc p_yll1
		;inc p_yrh
		;inc p_yrh1
		;inc p_yrl
		;inc p_yrl1	
		
		;call Update_player
		;jmp gameloop

		moveLeft:
		call Remove_player
		dec p_x1
		dec p_x2
		dec p_x3
		dec p_xlh
		dec p_xlh1
		dec p_xll
		dec p_xll1
		dec p_xrh
		dec p_xrh1
		dec p_xrl
		dec p_xrl1
		call soundA
		call Update_player
		call delay
		jmp gameloop

		moveRight:
		call Remove_player
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		call soundD
		call Update_player
		call delay
		jmp gameloop
		
		;Enemies:
	
		;incre:
		
		;call Remove_Enemy
		;inc E_x1 
		;inc E_x2 
		;;inc E_x3 
		;inc E_xrl 
		;inc E_xrl1 
		;inc E_xll 
		;inc E_xll1 
		;;call Update_Enemy
		;call delay
		;cmp E_xrl1,47
		;je decre
		;jmp gameloop
		;decre:
		;call Remove_Enemy
		;dec E_x1 
		;dec E_x2 
		;dec E_x3 
		;dec E_xrl 
		;dec E_xrl1 
		;dec E_xll 
		;dec E_xll1 
		;call Update_Enemy
		;call delay	
		;cmp E_xrl1,27
		;je incre
		;jmp gameloop

		pausss:
		call Draw_Pausepage
		call Draw_background
		call Update_player
		call Draw_obstacles
		call Draw_flags
		call Draw_Level
		call Draw_Lives
		call Draw_score
		call coins	
		jmp gameloop
		
		starrrt:
			inc lvl
			call Draw_hellopage
			;cmp lvl,50
			;je ll2
			
			;cmp lvl,51
			;je ll3
			;ll1:
			
			
			;ll2:
			;add scor,9
			;inc lvl
			;call Startagain
			;jmp gameloop
			;
			;ll3:
			;add scor,18
			;inc lvl
			;call Startagain
			;jmp gameloop
		lost:
		call Remove_player
		dec life
		cmp life,48
		je lossss
		call Draw_Lives
		call Startagain
		
ret
Enemy2_arrowkeys2 endp




Main_arrowkeys3 proc


gameloop:
		
	;checks for enemy collosion
		;;;;;;;;;;;;;;;;;;player dead
		;;;;;;;;;;;;;;;;;;player dead
		call Mov_Enemy
		call Mov_Enemy2
		call Mov_Monster
		call Mov_Fireball12
	
		mov al,f2_y
		cmp p_y1,al
		je lossind
		
		mov al,f_y
		cmp p_y1,al
		je lossind
		
		mov al,f2_y1
		cmp p_y1,al
		je lossind
		
		mov al,f_y1
		cmp p_y1,al
		je lossind
		
		mov al,f2_y
		cmp p_y1,al
		je lossind
		
		mov al,f_y
		cmp p_y1,al
		je lossind
		jmp e3
		lossind:
		mov al,p_x2
		add al,-1
		cmp f_x,al
		je lost
		
		mov al,p_x2
		cmp f_x,al
		je lost
		
		mov al,p_x2
		add al,-2
		cmp f_x,al
		je lost
		
		mov al,p_x2
		add al,-1
		cmp f2_x,al
		je lost
		
		mov al,p_x2
		cmp f2_x,al
		je lost
		
		mov al,p_x2
		add al,-2
		cmp f2_x,al
		je lost
		e3:
		cmp p_ylh,21
		je losiii
		jmp deaddd 
		
		losiii:
		mov al,E_x1
		add	al,-1
		cmp p_xrh1,al
		je lost
		
		mov al,E_x2
		add al,1
		cmp p_xlh1,al
		je lost
		
		mov al,E2_x1
		add	al,-1
		cmp p_xrh1,al
		je lost
		
		mov al,E2_x2
		add al,1
		cmp p_xlh1,al
		je lost
		
		;;;;;;;;;;;;;;;;;;;;;;;enemy dead
		
		deaddd:
		cmp p_yrl,19
		jge diii
		jmp chpl
		
		diii:
		mov al,E_x2
		add al,-1
		cmp p_xrl1,al
		je dead
		mov al,E_x2
		cmp p_xrl1,al
		je dead
		mov al,E_x1
		cmp p_xrl1,al
		je dead
		
		mov al,E_x2
		add al,-1
		cmp p_xll1,al
		je dead
		mov al,E_x2
		cmp p_xll1,al
		je dead
		mov al,E_x1
		cmp p_xll1,al
		je dead
		
		mov al,E2_x2
		add al,-1
		cmp p_xrl1,al
		je dead2
		mov al,E2_x2
		cmp p_xrl1,al
		je dead2
		mov al,E2_x1
		cmp p_xrl1,al
		je dead2
		
		mov al,E2_x2
		add al,-1
		cmp p_xll1,al
		je dead2
		mov al,E2_x2
		cmp p_xll1,al
		je dead2
		mov al,E2_x1
		cmp p_xll1,al
		je dead2
		
		;;;;checks for nexr level
		
		
		chpl:
		cmp p_xrh1,69
		je starrrt
		
		;check for scores
		cmp p_x1,10
		je scorewa
		
		cmp p_x1,31
		je scorewa
		
		cmp p_x1,50
		je scorewa
		
		cmp p_x1,11
		je scorewa
		
		cmp p_x1,30
		je scorewa
		
		cmp p_x1,52
		je scorewa
		
		cmp p_x1,12
		je scorewa
		
		cmp p_x1,32
		je scorewa
		
		cmp p_x1,54
		je scorewa
		
		cmp p_xlh,0
		je dontrun1
		
		cmp p_xlh,13
		je dontrun1
		
		cmp p_xlh,35
		je dontrun1
		
		cmp p_xlh,56
		je dontrun1
		jmp gravity
		
		scorewa:
		call Update_score
		jmp gravity

		dontrun:
		call Remove_player
		dec p_x1
		dec p_x2
		dec p_x3
		dec p_xlh
		dec p_xlh1
		dec p_xll
		dec p_xll1
		dec p_xrh
		dec p_xrh1
		dec p_xrl
		dec p_xrl1
		call Update_player
		jmp onGround
		
		right_moving:
		
		;call Remove_player
		;add	p_y1,2
		;add p_y2,2
		;add p_y3,2
		;add p_ylh,2
		;add p_ylh1,2
		;add p_yll,2
		;add p_yll1,2
		;add p_yrh,2
		;add p_yrh1,2
		;add p_yrl,2
		;add p_yrl1	,2
		;righti:
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		call Update_player
		jmp onGround
		
		dontrun1:
			call Remove_player
			inc p_x1
			inc p_x2
			inc p_x3
			inc p_xlh
			inc p_xlh1
			inc p_xll
			inc p_xll1
			inc p_xrh
			inc p_xrh1
			inc p_xrl
			inc p_xrl1
			call Update_player
			jmp onGround
		;make player fall:
		;call Remove_player
		;call Update_player
		
		
		
	;Enemy moving inn between the pillars
	
	
	gravity:
		
	;checks for boundariess
		;first obstacles
		cmp p_x1,9
		je dontrun
		
		cmp p_xrh1,9
		je dontrun
		
		cmp p_xrl1,9
		je dontrun
		
		cmp p_x2,9
		je dontrun
		
		cmp p_x1,29
		je dontrun
		
		cmp p_xrh1,29
		je dontrun
		
		cmp p_xrl1,29
		je dontrun
		
		cmp p_x2,29
		je dontrun
		
		cmp p_x1,49
		je dontrun
		
		cmp p_xrh1,49
		je dontrun
		
		cmp p_xrl1,49
		je dontrun
		
		cmp p_x2,49
		je dontrun
		
		;cmp p_xrl1,50
		;je right_moving
		;cmp p_xrl1,51
		;je right_moving
		;cmp p_xrl1,52
		;je right_moving
		;cmp p_xrl1,53
		;je right_moving
		;cmp p_xrl1,54
		;je right_moving
		;pcmp p_xrl1,55
		;je right_moving
			
		cmp p_yrl1,23
		jge onGround
		; make player fall:
		call Remove_player
		;down
		inc p_y1
		inc p_y2
		inc p_y3
		inc p_ylh
		inc p_ylh1
		inc p_yll
		inc p_yll1
		inc p_yrh
		inc p_yrh1
		inc p_yrl
		inc p_yrl1
		;right
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		;inc scoring
		call Update_player
		call delay1
		jmp gravity
		
		
	up_gravity:
		cmp p_yrl1,23
		jge onGround
		; make player fall:
		call Remove_player
		;down
		inc p_y1
		inc p_y2
		inc p_y3
		inc p_ylh
		inc p_ylh1
		inc p_yll
		inc p_yll1
		inc p_yrh
		inc p_yrh1
		inc p_yrl
		inc p_yrl1
		;right
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		call Update_player
		call delay1
		jmp up_gravity
	onGround:
	; get user key input
		mov ah,01h
		int 16h
		jz gameloop
		mov ah,00h
		int 16h
		mov inputChar,al
	; exit game if user types 'q':
		cmp inputChar,27
		je exit
		cmp inputChar,'w'
		je moveUp
		;cmp inputChar,80
		;je moveDown
		cmp inputChar,'a'
		je moveLeft
		cmp inputChar,'d'
		je moveRight
		cmp inputChar,'p'
		je pausss
		jmp gameloop
		
		
		moveUp:
		  ;allow player to jump:
			L1:
			call Remove_player
			;up movement
			dec p_y1
			dec p_y2
			dec p_y3
			dec p_ylh
			dec p_ylh1
			dec p_yll
			dec p_yll1
			dec p_yrh
			dec p_yrh1
			dec p_yrl
			dec p_yrl1
			;right movement 
			inc p_x1
			inc p_x2
			inc p_x3
			inc p_xlh
			inc p_xlh1
			inc p_xll
			inc p_xll1
			inc p_xrh
			inc p_xrh1
			inc p_xrl
			inc p_xrl1
			call Update_player
			call delay1
			dec looping
			cmp looping,0
			je ending
			jmp L1
			ending:
				mov looping,7
		jmp gameloop

		;moveDown:
		;call Remove_player
		;inc p_y1
		;inc p_y2
		;inc p_y3
		;inc p_ylh
		;inc p_ylh1
		;inc p_yll
		;inc p_yll1
		;inc p_yrh
		;inc p_yrh1
		;inc p_yrl
		;inc p_yrl1	
		
		;call Update_player
		;jmp gameloop

		moveLeft:
		call Remove_player
		dec p_x1
		dec p_x2
		dec p_x3
		dec p_xlh
		dec p_xlh1
		dec p_xll
		dec p_xll1
		dec p_xrh
		dec p_xrh1
		dec p_xrl
		dec p_xrl1
		call Update_player
		call delay1
		jmp gameloop

		moveRight:
		call Remove_player
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		call Update_player
		call delay1
		jmp gameloop
		
		;Enemies:
	
		;incre:
		
		;call Remove_Enemy
		;inc E_x1 
		;inc E_x2 
		;;inc E_x3 
		;inc E_xrl 
		;inc E_xrl1 
		;inc E_xll 
		;inc E_xll1 
		;;call Update_Enemy
		;call delay1
		;cmp E_xrl1,47
		;je decre
		;jmp gameloop
		;decre:
		;call Remove_Enemy
		;dec E_x1 
		;dec E_x2 
		;dec E_x3 
		;dec E_xrl 
		;dec E_xrl1 
		;dec E_xll 
		;dec E_xll1 
		;call Update_Enemy
		;call delay1	
		;cmp E_xrl1,27
		;je incre
		;jmp gameloop
		
		
		dead:
			call Remove_Enemy
			add scoring,5
			call Update_score
			jmp Enemy1_arrowkeys3

		dead2:
			call Remove_Enemy2
			add scoring,5
			call Update_score
			jmp Enemy2_arrowkeys3
		
		
		pausss:
		call Draw_Pausepage
		call Draw_background
		call Update_player
		call Update_Monster
		call Update_Fireball12
		call Update_Enemy
		call Update_Enemy2
		call Draw_obstacles
		call Draw_Castle
		call Draw_Level
		call Draw_Lives
		call Draw_score
		call coins
		jmp gameloop
		starrrt:
			call Winner_page
			
		lost:
		call Remove_player
		dec life
		cmp life,48
		je lossss
		call Draw_Lives
		call Startagain
		
ret
Main_arrowkeys3 endp


Enemy1_arrowkeys3 proc
gameloop:
		;checks for enemy collosion
		;;;;;;;;;;;;;;;;;;player dead
		call Mov_Enemy2
		call Mov_Monster
		call Mov_Fireball12
		
		mov al,f2_y
		cmp p_y1,al
		je lossind
		
		mov al,f_y
		cmp p_y1,al
		je lossind
		
		mov al,f2_y1
		cmp p_y1,al
		je lossind
		
		mov al,f_y1
		cmp p_y1,al
		je lossind
		
		mov al,f2_y
		cmp p_y1,al
		je lossind
		
		mov al,f_y
		cmp p_y1,al
		je lossind
		
		
		jmp e3
		lossind:
		mov al,p_x2
		sub al,1
		cmp f_x,al
		je lost
		
		mov al,p_x2
		cmp f_x,al
		je lost
		
		mov al,p_x2
		sub al,2
		cmp f_x,al
		je lost
		
		mov al,p_x2
		sub al,1
		cmp f2_x,al
		je lost
		
		mov al,p_x2
		cmp f2_x,al
		je lost
		
		mov al,p_x2
		sub al,2
		cmp f2_x,al
		je lost
		
		mov al,p_x2
		add al,1
		cmp f_x,al
		je lost
		
		mov al,p_x2
		add al,2
		cmp f_x,al
		je lost
		
		mov al,p_x2
		add al,1
		cmp f2_x,al
		je lost
		
		mov al,p_x2
		add al,2
		cmp f2_x,al
		je lost
		
		
		
		
		mov al,p_x1
		sub al,1
		cmp f_x,al
		je lost
		
		mov al,p_x1
		cmp f_x,al
		je lost
		
		mov al,p_x1
		sub al,2
		cmp f_x,al
		je lost
		
		mov al,p_x1
		sub al,1
		cmp f2_x,al
		je lost
		
		mov al,p_x1
		cmp f2_x,al
		je lost
		
		mov al,p_x1
		sub al,2
		cmp f2_x,al
		je lost
		
		mov al,p_x1
		add al,1
		cmp f_x,al
		je lost
		
		mov al,p_x1
		add al,2
		cmp f_x,al
		je lost
		
		mov al,p_x1
		add al,1
		cmp f2_x,al
		je lost
		
		mov al,p_x1
		add al,2
		cmp f2_x,al
		je lost
		
		
		e3:
		cmp p_ylh,21
		je losiii
		jmp deaddd 
		
		losiii:
		mov al,E2_x1
		add	al,-1
		cmp p_xrh1,al
		je lost
		
		mov al,E2_x2
		add al,1
		cmp p_xlh1,al
		je lost
		
		;;;;;;;;;;;;;;;;;;;;;;;enemy dead
		
		deaddd:
		cmp p_yrl,19
		jge diii
		jmp chpl
		
		diii:
		mov al,E2_x2
		add al,-1
		cmp p_xrl1,al
		je dead2
		mov al,E2_x2
		cmp p_xrl1,al
		je dead2
		mov al,E2_x1
		cmp p_xrl1,al
		je dead2
		
		mov al,E2_x2
		add al,-1
		cmp p_xll1,al
		je dead2
		mov al,E2_x2
		cmp p_xll1,al
		je dead2
		mov al,E2_x1
		cmp p_xll1,al
		je dead2
		
		;;;;checks for nexr level
		
		
		chpl:
		cmp p_xrh1,69
		je starrrt
		
		;check for scores
		cmp p_x1,10
		je scorewa
		
		cmp p_x1,31
		je scorewa
		
		cmp p_x1,50
		je scorewa
		
		cmp p_x1,11
		je scorewa
		
		cmp p_x1,30
		je scorewa
		
		cmp p_x1,52
		je scorewa
		
		cmp p_x1,12
		je scorewa
		
		cmp p_x1,32
		je scorewa
		
		cmp p_x1,54
		je scorewa
		
		cmp p_xlh,0
		je dontrun1
		
		cmp p_xlh,13
		je dontrun1
		
		cmp p_xlh,35
		je dontrun1
		
		cmp p_xlh,56
		je dontrun1
		jmp gravity
		
		scorewa:
		call Update_score
		jmp gravity

		dontrun:
		call Remove_player
		dec p_x1
		dec p_x2
		dec p_x3
		dec p_xlh
		dec p_xlh1
		dec p_xll
		dec p_xll1
		dec p_xrh
		dec p_xrh1
		dec p_xrl
		dec p_xrl1
		call Update_player
		jmp onGround
		
		right_moving:
		
		;call Remove_player
		;add	p_y1,2
		;add p_y2,2
		;add p_y3,2
		;add p_ylh,2
		;add p_ylh1,2
		;add p_yll,2
		;add p_yll1,2
		;add p_yrh,2
		;add p_yrh1,2
		;add p_yrl,2
		;add p_yrl1	,2
		;righti:
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		call Update_player
		jmp onGround
		
		dontrun1:
			call Remove_player
			inc p_x1
			inc p_x2
			inc p_x3
			inc p_xlh
			inc p_xlh1
			inc p_xll
			inc p_xll1
			inc p_xrh
			inc p_xrh1
			inc p_xrl
			inc p_xrl1
			call Update_player
			jmp onGround
		;make player fall:
		;call Remove_player
		;call Update_player
		
		
		
	;Enemy moving inn between the pillars
	
	
	gravity:
		
	;checks for boundariess
		;first obstacles
		cmp p_x1,9
		je dontrun
		
		cmp p_xrh1,9
		je dontrun
		
		cmp p_xrl1,9
		je dontrun
		
		cmp p_x2,9
		je dontrun
		
		cmp p_x1,29
		je dontrun
		
		cmp p_xrh1,29
		je dontrun
		
		cmp p_xrl1,29
		je dontrun
		
		cmp p_x2,29
		je dontrun
		
		cmp p_x1,49
		je dontrun
		
		cmp p_xrh1,49
		je dontrun
		
		cmp p_xrl1,49
		je dontrun
		
		cmp p_x2,49
		je dontrun
		
		;cmp p_xrl1,50
		;je right_moving
		;cmp p_xrl1,51
		;je right_moving
		;cmp p_xrl1,52
		;je right_moving
		;cmp p_xrl1,53
		;je right_moving
		;cmp p_xrl1,54
		;je right_moving
		;pcmp p_xrl1,55
		;je right_moving
			
		cmp p_yrl1,23
		jge onGround
		; make player fall:
		call Remove_player
		;down
		inc p_y1
		inc p_y2
		inc p_y3
		inc p_ylh
		inc p_ylh1
		inc p_yll
		inc p_yll1
		inc p_yrh
		inc p_yrh1
		inc p_yrl
		inc p_yrl1
		;right
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		;inc scoring
		call Update_player
		call delay1
		jmp gravity
		
		
	up_gravity:
		cmp p_yrl1,23
		jge onGround
		; make player fall:
		call Remove_player
		;down
		inc p_y1
		inc p_y2
		inc p_y3
		inc p_ylh
		inc p_ylh1
		inc p_yll
		inc p_yll1
		inc p_yrh
		inc p_yrh1
		inc p_yrl
		inc p_yrl1
		;right
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		call Update_player
		call delay1
		jmp up_gravity
	onGround:
	; get user key input
		mov ah,01h
		int 16h
		jz gameloop
		mov ah,00h
		int 16h
		mov inputChar,al
	; exit game if user types 'q':
		cmp inputChar,27
		je exit
		cmp inputChar,'w'
		je moveUp
		;cmp inputChar,80
		;je moveDown
		cmp inputChar,'a'
		je moveLeft
		cmp inputChar,'d'
		je moveRight
		cmp inputChar,'p'
		je pausss
		jmp gameloop
		
		
		moveUp:
		  ;allow player to jump:
			L1:
			call Remove_player
			;up movement
			dec p_y1
			dec p_y2
			dec p_y3
			dec p_ylh
			dec p_ylh1
			dec p_yll
			dec p_yll1
			dec p_yrh
			dec p_yrh1
			dec p_yrl
			dec p_yrl1
			;right movement 
			inc p_x1
			inc p_x2
			inc p_x3
			inc p_xlh
			inc p_xlh1
			inc p_xll
			inc p_xll1
			inc p_xrh
			inc p_xrh1
			inc p_xrl
			inc p_xrl1
			call Update_player
			call delay1
			dec looping
			cmp looping,0
			je ending
			jmp L1
			ending:
				mov looping,7
		jmp gameloop

		;moveDown:
		;call Remove_player
		;inc p_y1
		;inc p_y2
		;inc p_y3
		;inc p_ylh
		;inc p_ylh1
		;inc p_yll
		;inc p_yll1
		;inc p_yrh
		;inc p_yrh1
		;inc p_yrl
		;inc p_yrl1	
		
		;call Update_player
		;jmp gameloop

		moveLeft:
		call Remove_player
		dec p_x1
		dec p_x2
		dec p_x3
		dec p_xlh
		dec p_xlh1
		dec p_xll
		dec p_xll1
		dec p_xrh
		dec p_xrh1
		dec p_xrl
		dec p_xrl1
		call Update_player
		call delay1
		jmp gameloop

		moveRight:
		call Remove_player
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		call Update_player
		call delay1
		jmp gameloop
		
		;Enemies:
	
		;incre:
		
		;call Remove_Enemy
		;inc E_x1 
		;inc E_x2 
		;;inc E_x3 
		;inc E_xrl 
		;inc E_xrl1 
		;inc E_xll 
		;inc E_xll1 
		;;call Update_Enemy
		;call delay
		;cmp E_xrl1,47
		;je decre
		;jmp gameloop
		;decre:
		;call Remove_Enemy
		;dec E_x1 
		;dec E_x2 
		;dec E_x3 
		;dec E_xrl 
		;dec E_xrl1 
		;dec E_xll 
		;dec E_xll1 
		;call Update_Enemy
		;call delay	
		;cmp E_xrl1,27
		;je incre
		;jmp gameloop

		dead2:
			call Remove_Enemy2
			add scoring,5
			inc chokk
			inc choki
			call Update_score
			jmp Enemy2_arrowkeys3
		
		
		pausss:
		call Draw_Pausepage
		call Draw_background
		call Update_player
		call Update_Monster
		call Update_Fireball12
		;call Update_Enemy
		call Update_Enemy2
		call Draw_obstacles
		call Draw_Castle
		call Draw_Level
		call Draw_Lives
		call Draw_score
		call coins
		jmp gameloop
		starrrt:
			call Winner_page
			;cmp lvl,50
			;je ll2
			
			;cmp lvl,51
			;je ll3
			;ll1:
			
			
			;ll2:
			;add scor,9
			;inc lvl
			;call Startagain
			;jmp gameloop
			;
			;ll3:
			;add scor,18
			;inc lvl
			;call Startagain
			;jmp gameloop
		lost:
		call Remove_player
		dec life
		cmp life,48
		je lossss
		call Draw_Lives
		call Startagain
		
ret
Enemy1_arrowkeys3 endp


Enemy2_arrowkeys3 proc


gameloop:
		
	;checks for enemy collosion
		;;;;;;;;;;;;;;;;;;player dead
		call Mov_Monster
		call Mov_Fireball12
	
		
		mov al,f2_y
		cmp p_y1,al
		je lossind
		
		mov al,f_y
		cmp p_y1,al
		je lossind
		
		mov al,f2_y1
		cmp p_y1,al
		je lossind
		
		mov al,f_y1
		cmp p_y1,al
		je lossind
		
		mov al,f2_y
		cmp p_y1,al
		je lossind
		
		mov al,f_y
		cmp p_y1,al
		je lossind
		
		
		jmp chpl
		lossind:
		mov al,p_x2
		sub al,1
		cmp f_x,al
		je lost
		
		mov al,p_x2
		cmp f_x,al
		je lost
		
		mov al,p_x2
		sub al,2
		cmp f_x,al
		je lost
		
		mov al,p_x2
		sub al,1
		cmp f2_x,al
		je lost
		
		mov al,p_x2
		cmp f2_x,al
		je lost
		
		mov al,p_x2
		sub al,2
		cmp f2_x,al
		je lost
		
		mov al,p_x2
		add al,1
		cmp f_x,al
		je lost
		
		mov al,p_x2
		add al,2
		cmp f_x,al
		je lost
		
		mov al,p_x2
		add al,1
		cmp f2_x,al
		je lost
		
		mov al,p_x2
		add al,2
		cmp f2_x,al
		je lost
		
		
		
		
		mov al,p_x1
		sub al,1
		cmp f_x,al
		je lost
		
		mov al,p_x1
		cmp f_x,al
		je lost
		
		mov al,p_x1
		sub al,2
		cmp f_x,al
		je lost
		
		mov al,p_x1
		sub al,1
		cmp f2_x,al
		je lost
		
		mov al,p_x1
		cmp f2_x,al
		je lost
		
		mov al,p_x1
		sub al,2
		cmp f2_x,al
		je lost
		
		mov al,p_x1
		add al,1
		cmp f_x,al
		je lost
		
		mov al,p_x1
		add al,2
		cmp f_x,al
		je lost
		
		mov al,p_x1
		add al,1
		cmp f2_x,al
		je lost
		
		mov al,p_x1
		add al,2
		cmp f2_x,al
		je lost
		
		
		
		;;;;checks for nexr level
		
		
		chpl:
		cmp p_xrh1,69
		je starrrt
		
		;check for scores
		cmp p_x1,10
		je scorewa
		
		cmp p_x1,31
		je scorewa
		
		cmp p_x1,50
		je scorewa
		
		cmp p_x1,11
		je scorewa
		
		cmp p_x1,30
		je scorewa
		
		cmp p_x1,52
		je scorewa
		
		cmp p_x1,12
		je scorewa
		
		cmp p_x1,32
		je scorewa
		
		cmp p_x1,54
		je scorewa
		
		cmp p_xlh,0
		je dontrun1
		
		cmp p_xlh,13
		je dontrun1
		
		cmp p_xlh,35
		je dontrun1
		
		cmp p_xlh,56
		je dontrun1
		jmp gravity
		
		scorewa:
		call Update_score
		jmp gravity

		dontrun:
		call Remove_player
		dec p_x1
		dec p_x2
		dec p_x3
		dec p_xlh
		dec p_xlh1
		dec p_xll
		dec p_xll1
		dec p_xrh
		dec p_xrh1
		dec p_xrl
		dec p_xrl1
		call Update_player
		jmp onGround
		
		right_moving:
		
		;call Remove_player
		;add	p_y1,2
		;add p_y2,2
		;add p_y3,2
		;add p_ylh,2
		;add p_ylh1,2
		;add p_yll,2
		;add p_yll1,2
		;add p_yrh,2
		;add p_yrh1,2
		;add p_yrl,2
		;add p_yrl1	,2
		;righti:
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		call Update_player
		jmp onGround
		
		dontrun1:
			call Remove_player
			inc p_x1
			inc p_x2
			inc p_x3
			inc p_xlh
			inc p_xlh1
			inc p_xll
			inc p_xll1
			inc p_xrh
			inc p_xrh1
			inc p_xrl
			inc p_xrl1
			call Update_player
			jmp onGround
		;make player fall:
		;call Remove_player
		;call Update_player
		
		
		
	;Enemy moving inn between the pillars
	
	
	gravity:
		
	;checks for boundariess
		;first obstacles
		cmp p_x1,9
		je dontrun
		
		cmp p_xrh1,9
		je dontrun
		
		cmp p_xrl1,9
		je dontrun
		
		cmp p_x2,9
		je dontrun
		
		cmp p_x1,29
		je dontrun
		
		cmp p_xrh1,29
		je dontrun
		
		cmp p_xrl1,29
		je dontrun
		
		cmp p_x2,29
		je dontrun
		
		cmp p_x1,49
		je dontrun
		
		cmp p_xrh1,49
		je dontrun
		
		cmp p_xrl1,49
		je dontrun
		
		cmp p_x2,49
		je dontrun
		
		;cmp p_xrl1,50
		;je right_moving
		;cmp p_xrl1,51
		;je right_moving
		;cmp p_xrl1,52
		;je right_moving
		;cmp p_xrl1,53
		;je right_moving
		;cmp p_xrl1,54
		;je right_moving
		;pcmp p_xrl1,55
		;je right_moving
			
		cmp p_yrl1,23
		jge onGround
		; make player fall:
		call Remove_player
		;down
		inc p_y1
		inc p_y2
		inc p_y3
		inc p_ylh
		inc p_ylh1
		inc p_yll
		inc p_yll1
		inc p_yrh
		inc p_yrh1
		inc p_yrl
		inc p_yrl1
		;right
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		;inc scoring
		call Update_player
		call delay1
		jmp gravity
		
		
	up_gravity:
		cmp p_yrl1,23
		jge onGround
		; make player fall:
		call Remove_player
		;down
		inc p_y1
		inc p_y2
		inc p_y3
		inc p_ylh
		inc p_ylh1
		inc p_yll
		inc p_yll1
		inc p_yrh
		inc p_yrh1
		inc p_yrl
		inc p_yrl1
		;right
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		call Update_player
		call delay1
		jmp up_gravity
	onGround:
	; get user key input
		mov ah,01h
		int 16h
		jz gameloop
		mov ah,00h
		int 16h
		mov inputChar,al
	; exit game if user types 'q':
		cmp inputChar,27
		je exit
		cmp inputChar,'w'
		je moveUp
		;cmp inputChar,80
		;je moveDown
		cmp inputChar,'a'
		je moveLeft
		cmp inputChar,'d'
		je moveRight
		cmp inputChar,'p'
		je pausss
		jmp gameloop
		
		
		moveUp:
		  ;allow player to jump:
			L1:
			call Remove_player
			;up movement
			dec p_y1
			dec p_y2
			dec p_y3
			dec p_ylh
			dec p_ylh1
			dec p_yll
			dec p_yll1
			dec p_yrh
			dec p_yrh1
			dec p_yrl
			dec p_yrl1
			;right movement 
			inc p_x1
			inc p_x2
			inc p_x3
			inc p_xlh
			inc p_xlh1
			inc p_xll
			inc p_xll1
			inc p_xrh
			inc p_xrh1
			inc p_xrl
			inc p_xrl1
			call Update_player
			call delay1
			dec looping
			cmp looping,0
			je ending
			jmp L1
			ending:
				mov looping,7
		jmp gameloop

		;moveDown:
		;call Remove_player
		;inc p_y1
		;inc p_y2
		;inc p_y3
		;inc p_ylh
		;inc p_ylh1
		;inc p_yll
		;inc p_yll1
		;inc p_yrh
		;inc p_yrh1
		;inc p_yrl
		;inc p_yrl1	
		
		;call Update_player
		;jmp gameloop

		moveLeft:
		call Remove_player
		dec p_x1
		dec p_x2
		dec p_x3
		dec p_xlh
		dec p_xlh1
		dec p_xll
		dec p_xll1
		dec p_xrh
		dec p_xrh1
		dec p_xrl
		dec p_xrl1
		call Update_player
		call delay1
		jmp gameloop

		moveRight:
		call Remove_player
		inc p_x1
		inc p_x2
		inc p_x3
		inc p_xlh
		inc p_xlh1
		inc p_xll
		inc p_xll1
		inc p_xrh
		inc p_xrh1
		inc p_xrl
		inc p_xrl1
		call Update_player
		call delay1
		jmp gameloop
		
		;Enemies:
	
		;incre:
		
		;call Remove_Enemy
		;inc E_x1 
		;inc E_x2 
		;;inc E_x3 
		;inc E_xrl 
		;inc E_xrl1 
		;inc E_xll 
		;inc E_xll1 
		;;call Update_Enemy
		;call delay
		;cmp E_xrl1,47
		;je decre
		;jmp gameloop
		;decre:
		;call Remove_Enemy
		;dec E_x1 
		;dec E_x2 
		;dec E_x3 
		;dec E_xrl 
		;dec E_xrl1 
		;dec E_xll 
		;dec E_xll1 
		;call Update_Enemy
		;call delay	
		;cmp E_xrl1,27
		;je incre
		;jmp gameloop
		
		
		
		pausss:
		call Draw_Pausepage
		call Draw_background
		call Update_player
		call Update_Monster
		call Update_Fireball12
		;'call Update_Enemy
		;'call Update_Enemy2
		call Draw_obstacles
		call Draw_Castle
		call Draw_Level
		call Draw_Lives
		call Draw_score
		call coins
		jmp gameloop
		
		starrrt:
			call Winner_page
			
		lost:
		call Remove_player
		dec life
		cmp life,48
		je lossss
		call Draw_Lives
		call Startagain
		
ret
Enemy2_arrowkeys3 endp


Draw_hellopage proc

;-------------------------------------------------- scroll up the windows
	mov ax,0600h ; scroll window up
	mov cx,0 ; upper left corner (0,0)
	mov dx,184Fh ; lower right corner (24,79)
	mov bh,7 ; normal attribute
	int 10h  ; call BIOS


	mov ah,2 ; locate cursor at 0,0
	mov bh,1 ; video page 0
	mov dx,0 ; row 0, column 0
	int 10h

	mov ah,02 ; mode selection
	mov al,0h ; mode number i.e. it can vary but mostly use 2 or 3
	int 10h ; interrupt
;''''''''''''''''''''''''''''''''''background
	;background:
		;mov ah,06
		;mov al,0 ; no scrolling
		;mov cl,00 ; start column
		;mov ch,00 ; start y
		;mov dh,24 ; end row
		;mov dl,83; end column
		;mov bh, 01110000b
		;int 10h
		
	squar:
		; ---- printing Ground line ------
		mov ah,06
		mov al,0  ; no scrolling
		mov cl,0  ; start col
		mov ch,24 ; start y
		mov dh,24 ; end row
		mov dl,80 ; end column
		mov bh,01001000b
		int 10h
		
		
		mov ah,06
		mov al,0  ; no scrolling
		mov cl,0  ; start col
		mov ch,00 ; start y
		mov dh,00 ; end row
		mov dl,80 ; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,0 ; start col
		mov ch,0 ; start y
		mov dh,24; end row
		mov dl,0 ; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0  ; no scrolling
		mov cl,79 ; start col
		mov ch,0  ; start y
		mov dh,24 ; end row
		mov dl,79 ; end column
		mov bh,01001000b
		int 10h
		
		;printing superb		
		;S printing

		mov ah,06
		mov al,0  ; no scrolling
		mov cl,24 ; start col
		mov ch,9  ; start y
		mov dh,9  ; end row
		mov dl,29 ; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0  ; no scrolling
		mov cl,24 ; start col
		mov ch,9  ; start y
		mov dh,11 ; end row
		mov dl,24  ; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,24 ; start col
		mov ch,11 ; start y
		mov dh,11 ; end row
		mov dl,29; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0  ; no scrolling
		mov cl,29 ; start col
		mov ch,11 ; start y
		mov dh,13 ; end row
		mov dl,29 ; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,24 ; start col
		mov ch,13 ; start y
		mov dh,13 ; end row
		mov dl,29; end column
		mov bh,01001000b
		int 10h
		
		;U printing
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,31 ; start col
		mov ch,9 ; start y
		mov dh,13 ; end row
		mov dl,31; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,31 ; start col
		mov ch,13 ; start y
		mov dh,13 ; end row
		mov dl,35; end column
		mov bh,01001000b
		int 10h
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,35 ; start col
		mov ch,9 ; start y
		mov dh,13 ; end row
		mov dl,35; end column
		mov bh,01001000b
		int 10h
		
		;p printing
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,37 ; start col
		mov ch,9 ; start y
		mov dh,13 ; end row
		mov dl,37; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,37 ; start col
		mov ch,11; start y
		mov dh,11 ; end row
		mov dl,41; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,41 ; start col
		mov ch,9 ; start y
		mov dh,11 ; end row
		mov dl,41; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,37 ; start col
		mov ch,9 ; start y
		mov dh,9 ; end row
		mov dl,41; end column
		mov bh,01001000b
		int 10h
		
		;E printing
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,43 ; start col
		mov ch,9 ; start y
		mov dh,13 ; end row
		mov dl,43; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,43 ; start col
		mov ch,9; start y
		mov dh,9 ; end row
		mov dl,47; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,43 ; start col
		mov ch,11 ; start y
		mov dh,11 ; end row
		mov dl,47; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,43 ; start col
		mov ch,13 ; start y
		mov dh,13 ; end row
		mov dl,47; end column
		mov bh,01001000b
		int 10h
		
		;R printing
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,49 ; start col
		mov ch,9 ; start y
		mov dh,13 ; end row
		mov dl,49; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,49 ; start col
		mov ch,9 ; start y
		mov dh,9 ; end row
		mov dl,53; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,53 ; start col
		mov ch,9 ; start y
		mov dh,11 ; end row
		mov dl,53; end column
		mov bh,01001000b
		int 10h
		
		
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,49 ; start col
		mov ch,11 ; start y
		mov dh,11 ; end row
		mov dl,53; end column
		mov bh,01001000b
		int 10h
		mov ah,06

		mov ah,06
		mov al,0 ; no scrolling
		mov cl,51 ; start col
		mov ch,12 ; start y
		mov dh,12 ; end row
		mov dl,51; end column
		mov bh,01001000b
		int 10h
		
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,52 ; start col
		mov ch,13 ; start y
		mov dh,13 ; end row
		mov dl,52; end column
		mov bh,01001000b
		int 10h
		
		;B printing
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,55 ; start col
		mov ch,9 ; start y
		mov dh,13 ; end row
		mov dl,55; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,55 ; start col
		mov ch,9; start y
		mov dh,9 ; end row
		mov dl,59; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,55 ; start col
		mov ch,11 ; start y
		mov dh,11 ; end row
		mov dl,59; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,55 ; start col
		mov ch,13 ; start y
		mov dh,13 ; end row
		mov dl,59; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,59 ; start col
		mov ch,9 ; start y
		mov dh,13 ; end row
		mov dl,59; end column
		mov bh,01001000b
		int 10h
		
		;;;;;;
		ip:
		call Curser
		mov ah,02
		mov bh,0
		mov dh,24
		mov dl,0
		int 10h
		mov dl,choice
		mov ah,1h
		int 21h
		mov choice,al
		cmp choice,13
		je srt
		cmp choice,27
		je exit
		loop ip
		srt:
		call soundEnter
		call Startagain
ret
Draw_hellopage endp


Draw_Lostpage proc

;-------------------------------------------------- scroll up the windows
	mov ax,0600h ; scroll window up
	mov cx,0 ; upper left corner (0,0)
	mov dx,184Fh ; lower right corner (24,79)
	mov bh,7 ; normal attribute
	int 10h  ; call BIOS


	mov ah,2 ; locate cursor at 0,0
	mov bh,1 ; video page 0
	mov dx,0 ; row 0, column 0
	int 10h

	mov ah,02 ; mode selection
	mov al,0h ; mode number i.e. it can vary but mostly use 2 or 3
	int 10h ; interrupt
;''''''''''''''''''''''''''''''''''background
	;background:
		;mov ah,06
		;mov al,0 ; no scrolling
		;mov cl,00 ; start column
		;mov ch,00 ; start y
		;mov dh,24 ; end row
		;mov dl,83; end column
		;mov bh, 01110000b
		;int 10h
		
	squar:
		; ---- printing Ground line ------
		mov ah,06
		mov al,0  ; no scrolling
		mov cl,0  ; start col
		mov ch,24 ; start y
		mov dh,24 ; end row
		mov dl,80 ; end column
		mov bh,01001000b
		int 10h
		
		
		mov ah,06
		mov al,0  ; no scrolling
		mov cl,0  ; start col
		mov ch,00 ; start y
		mov dh,00 ; end row
		mov dl,80 ; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,0 ; start col
		mov ch,0 ; start y
		mov dh,24; end row
		mov dl,0 ; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0  ; no scrolling
		mov cl,79 ; start col
		mov ch,0  ; start y
		mov dh,24 ; end row
		mov dl,79 ; end column
		mov bh,01000000b
		int 10h
	;loser printing
	oser:
		;L printing
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,28 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,28; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,28 ; start col
		mov ch,8 ; start y
		mov dh,8 ; end row
		mov dl,33; end column
		mov bh,01001000b
		int 10h
		
		;O printing
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,35 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,35; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,35 ; start col
		mov ch,4 ; start y
		mov dh,4 ; end row
		mov dl,39; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,35 ; start col
		mov ch,8 ; start y
		mov dh,8 ; end row
		mov dl,39; end column
		mov bh,01001000b
		int 10h

		mov ah,06
		mov al,0 ; no scrolling
		mov cl,39 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,39; end column
		mov bh,01001000b
		int 10h
		
		;S printing
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,41 ; start col
		mov ch,4 ; start y
		mov dh,4 ; end row
		mov dl,46; end column
		mov bh,01001000b
		int 10h
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,41 ; start col
		mov ch,4 ; start y
		mov dh,6 ; end row
		mov dl,41; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,41 ; start col
		mov ch,6 ; start y
		mov dh,6 ; end row
		mov dl,46; end column
		mov bh,01001000b
		int 10h
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,46 ; start col
		mov ch,6 ; start y
		mov dh,8 ; end row
		mov dl,46; end column
		mov bh,01001000b
		int 10h
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,41 ; start col
		mov ch,8 ; start y
		mov dh,8 ; end row
		mov dl,46; end column
		mov bh,01001000b
		int 10h
		
		;E printing
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,48 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,48; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,48 ; start col
		mov ch,4 ; start y
		mov dh,4 ; end row
		mov dl,52; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,48 ; start col
		mov ch,6 ; start y
		mov dh,6 ; end row
		mov dl,52; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,48 ; start col
		mov ch,8 ; start y
		mov dh,8 ; end row
		mov dl,52; end column
		mov bh,01001000b
		int 10h
		
		;R printing
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,54 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,54; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,54 ; start col
		mov ch,4 ; start y
		mov dh,4 ; end row
		mov dl,58; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,58 ; start col
		mov ch,4 ; start y
		mov dh,6 ; end row
		mov dl,58; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,54 ; start col
		mov ch,6 ; start y
		mov dh,6 ; end row
		mov dl,58; end column
		mov bh,01001000b
		int 10h
		mov ah,06

		mov ah,06
		mov al,0 ; no scrolling
		mov cl,56 ; start col
		mov ch,7 ; start y
		mov dh,7 ; end row
		mov dl,56; end column
		mov bh,01001000b
		int 10h
		
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,57 ; start col
		mov ch,8 ; start y
		mov dh,8 ; end row
		mov dl,57; end column
		mov bh,01001000b
		int 10h
		
		
		;writing
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,15 ; start column
		mov ch,10 ; start y
		mov dh,18 ; end row
		mov dl,65; end column
		mov bh, 01110100b
		int 10h
		mov ah,06
		mov al,0  ; no scrolling
		mov cl,45 ; start col
		mov ch,13  ; start y
		mov dh,16 ; end row
		mov dl,48 ; end column
		mov bh,11110100b
		int 10h
		
		mov ah,02
		mov bh,0
		mov dh,12
		mov dl,19
		int 10h
		lea dx,Loser
		mov ah,09
		int 21h
		
		mov ah,02
		mov bh,0
		mov dh,14
		mov dl,22
		int 10h
		lea dx,total
		mov ah,09
		int 21h
		
		mov ah,02
		mov bh,0
		mov dh,14
		mov dl,47
		int 10h
		mov ah,0
		mov al,scoring
		mov bl,10
		div bl
		mov sc2,ah
		mov sc1,al
		mov dl,sc1
		add dl,48
		mov ah,02h
		int 21h
		mov dl,sc2
		add dl,48
		mov ah,02h
		int 21h
		
		mov ah,02
		mov bh,0
		mov dh,16
		mov dl,35
		int 10h
		lea dx,Level
		mov ah,09
		int 21h
		mov ah,02
		mov bh,0
		mov dh,16
		mov dl,47
		int 10h
		mov dl,lvl
		mov ah,02
		int 21h
	
ret
Draw_Lostpage endp


Draw_Pausepage proc


;-------------------------------------------------- scroll up the windows
	mov ax,0600h ; scroll window up
	mov cx,0 ; upper left corner (0,0)
	mov dx,184Fh ; lower right corner (24,79)
	mov bh,7 ; normal attribute
	int 10h  ; call BIOS


	mov ah,2 ; locate cursor at 0,0
	mov bh,0 ; video page 0
	mov dx,0 ; row 0, column 0
	int 10h

	mov ah,02 ; mode selection
	mov al,0h ; mode number i.e. it can vary but mostly use 2 or 3
	int 10h ; interrupt
;''''''''''''''''''''''''''''''''''background
	;background:
		;mov ah,06
		;mov al,0 ; no scrolling
		;mov cl,00 ; start column
		;mov ch,00 ; start y
		;mov dh,24 ; end row
		;mov dl,83; end column
		;mov bh, 01110000b
		;int 10h
		
	squar:
		; ---- printing Ground line ------
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,0 ; start col
		mov ch,24 ; start y
		mov dh,24 ; end row
		mov dl,80; end column
		mov bh,01001000b
		int 10h
		
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,0 ; start col
		mov ch,00 ; start y
		mov dh,00 ; end row
		mov dl,80; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,0 ; start col
		mov ch,0 ; start y
		mov dh,24 ; end row
		mov dl,0; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,79 ; start col
		mov ch,0 ; start y
		mov dh,24 ; end row
		mov dl,79; end column
		mov bh,01001000b
		int 10h
		
		
	;;;printing un pause line
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,20 ; start col
		mov ch,10 ; start y
		mov dh,14 ; end row
		mov dl,60; end column
		mov bh,10111111b
		int 10h
		
		mov ah,02
		mov bh,0
		mov dh,12
		mov dl,25
		int 10h
		lea dx,UnPausee
		mov ah,09
		int 21h
		ip:
		mov dl,choice
		mov ah,1h
		int 21h
		mov choice,al
		cmp choice,'p'
		je srt
		cmp choice,27
		je exit
		loop ip

srt:
		
ret 
Draw_Pausepage endp

Winner_page proc

;-------------------------------------------------- scroll up the windows
	mov ax,0600h ; scroll window up
	mov cx,0 ; upper left corner (0,0)
	mov dx,184Fh ; lower right corner (24,79)
	mov bh,7 ; normal attribute
	int 10h  ; call BIOS


	mov ah,2 ; locate cursor at 0,0
	mov bh,1 ; video page 0
	mov dx,0 ; row 0, column 0
	int 10h

	mov ah,02 ; mode selection
	mov al,0h ; mode number i.e. it can vary but mostly use 2 or 3
	int 10h ; interrupt
;''''''''''''''''''''''''''''''''''background
	;background:
		;mov ah,06
		;mov al,0 ; no scrolling
		;mov cl,00 ; start column
		;mov ch,00 ; start y
		;mov dh,24 ; end row
		;mov dl,83; end column
		;mov bh, 01110000b
		;int 10h
		
	squar:
		; ---- printing Ground line ------
		mov ah,06
		mov al,0  ; no scrolling
		mov cl,0  ; start col
		mov ch,24 ; start y
		mov dh,24 ; end row
		mov dl,80 ; end column
		mov bh,01001000b
		int 10h
		
		
		mov ah,06
		mov al,0  ; no scrolling
		mov cl,0  ; start col
		mov ch,00 ; start y
		mov dh,00 ; end row
		mov dl,80 ; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,0 ; start col
		mov ch,0 ; start y
		mov dh,24; end row
		mov dl,0 ; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0  ; no scrolling
		mov cl,79 ; start col
		mov ch,0  ; start y
		mov dh,24 ; end row
		mov dl,79 ; end column
		mov bh,01000000b
		int 10h
	;Winner printing
	winner:
		;W printing
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,28 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,28; end column
		mov bh,00011000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,29 ; start col
		mov ch,8 ; start y
		mov dh,8 ; end row
		mov dl,29; end column
		mov bh,00011000b
		int 10h
		
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,30 ; start col
		mov ch,7 ; start y
		mov dh,7 ; end row
		mov dl,30; end column
		mov bh,00011000b
		int 10h
		
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,31 ; start col
		mov ch,6 ; start y
		mov dh,6 ; end row
		mov dl,31; end column
		mov bh,00011000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,32 ; start col
		mov ch,7 ; start y
		mov dh,7 ; end row
		mov dl,32; end column
		mov bh,00011000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,33 ; start col
		mov ch,8 ; start y
		mov dh,8 ; end row
		mov dl,33; end column
		mov bh,00011000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,34 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,34; end column
		mov bh,00011000b
		int 10h
		
		;I printing
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,38 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,38; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,36 ; start col
		mov ch,4 ; start y
		mov dh,4 ; end row
		mov dl,40; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,36 ; start col
		mov ch,8 ; start y
		mov dh,8 ; end row
		mov dl,40; end column
		mov bh,01001000b
		int 10h
		
		;N printing
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,42 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,42; end column
		mov bh,00011000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,43 ; start col
		mov ch,4 ; start y
		mov dh,4 ; end row
		mov dl,43; end column
		mov bh,00011000b
		int 10h
		
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,44 ; start col
		mov ch,5 ; start y
		mov dh,5 ; end row
		mov dl,44; end column
		mov bh,00011000b
		int 10h
		
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,45 ; start col
		mov ch,6 ; start y
		mov dh,6 ; end row
		mov dl,45; end column
		mov bh,00011000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,46 ; start col
		mov ch,7 ; start y
		mov dh,7 ; end row
		mov dl,46; end column
		mov bh,00011000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,47 ; start col
		mov ch,8 ; start y
		mov dh,8 ; end row
		mov dl,47; end column
		mov bh,00011000b
		int 10h
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,48 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,48; end column
		mov bh,00011000b
		int 10h
		
		;N printing
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,50 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,50; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,51 ; start col
		mov ch,4 ; start y
		mov dh,4 ; end row
		mov dl,51; end column
		mov bh,01001000b
		int 10h
		
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,52 ; start col
		mov ch,5 ; start y
		mov dh,5 ; end row
		mov dl,52; end column
		mov bh,01001000b
		int 10h
		
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,53 ; start col
		mov ch,6 ; start y
		mov dh,6 ; end row
		mov dl,53; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,54 ; start col
		mov ch,7 ; start y
		mov dh,7 ; end row
		mov dl,54; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,55 ; start col
		mov ch,8 ; start y
		mov dh,8 ; end row
		mov dl,55; end column
		mov bh,01001000b
		int 10h
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,56 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,56; end column
		mov bh,01001000b
		int 10h
		
		
		;E printing
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,58 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,58; end column
		mov bh,00011000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,58 ; start col
		mov ch,4 ; start y
		mov dh,4 ; end row
		mov dl,62; end column
		mov bh,00011000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,58 ; start col
		mov ch,6 ; start y
		mov dh,6 ; end row
		mov dl,62; end column
		mov bh,00011000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,58 ; start col
		mov ch,8 ; start y
		mov dh,8 ; end row
		mov dl,62; end column
		mov bh,00011000b
		int 10h
		
		;R printing
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,64 ; start col
		mov ch,4 ; start y
		mov dh,8 ; end row
		mov dl,64; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,64 ; start col
		mov ch,4 ; start y
		mov dh,4 ; end row
		mov dl,68; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,68 ; start col
		mov ch,4 ; start y
		mov dh,6 ; end row
		mov dl,68; end column
		mov bh,01001000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,64 ; start col
		mov ch,6 ; start y
		mov dh,6 ; end row
		mov dl,68; end column
		mov bh,01001000b
		int 10h
		mov ah,06

		mov ah,06
		mov al,0 ; no scrolling
		mov cl,66 ; start col
		mov ch,7 ; start y
		mov dh,7 ; end row
		mov dl,66; end column
		mov bh,01001000b
		int 10h
		
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,67 ; start col
		mov ch,8 ; start y
		mov dh,8 ; end row
		mov dl,67; end column
		mov bh,01001000b
		int 10h
		
		
		;writing
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,15 ; start column
		mov ch,10 ; start y
		mov dh,18 ; end row
		mov dl,65; end column
		mov bh, 01110100b
		int 10h
		mov ah,06
		mov al,0  ; no scrolling
		mov cl,45 ; start col
		mov ch,13  ; start y
		mov dh,16 ; end row
		mov dl,48 ; end column
		mov bh,11110100b
		int 10h
		
		mov ah,02
		mov bh,0
		mov dh,12
		mov dl,19
		int 10h
		lea dx,Winning
		mov ah,09
		int 21h
		
		mov ah,02
		mov bh,0
		mov dh,14
		mov dl,22
		int 10h
		lea dx,total
		mov ah,09
		int 21h
		
		mov ah,02
		mov bh,0
		mov dh,14
		mov dl,47
		int 10h
		mov ah,0
		mov al,scoring
		mov bl,10
		div bl
		mov sc2,ah
		mov sc1,al
		mov dl,sc1
		add dl,48
		mov ah,02h
		int 21h
		mov dl,sc2
		add dl,48
		mov ah,02h
		int 21h
		
		mov ah,02
		mov bh,0
		mov dh,16
		mov dl,35
		int 10h
		lea dx,Level
		mov ah,09
		int 21h
		mov ah,02
		mov bh,0
		mov dh,16
		mov dl,47
		int 10h
		mov dl,lvl
		mov ah,02
		int 21h
		jmp exit
		
	
ret
Winner_page endp


Draw_player proc

		;---------------------------------- printing the player ------------
	
	;pait
	pait:
	
		mov ah,06
		mov al,0 ; no scrolling
		add p_x1,2
		mov cl,p_x1 ; start column
		add p_y1,20
		mov ch,p_y1 ; start y
		add p_y2,22
		mov dh,p_y2 ; end row
		add p_x2,4
		mov dl,p_x2; end column
		mov bh,10011111b
		int 10h
		;eyes
		mov ah,02
		mov bh,0
		add p_y3,20
		mov dh,p_y3
		add p_x3,2
		mov dl,p_x3
		int 10h
		lea dx,eye
		mov ah,09
		int 21h


		;left hands
	hands:	
		mov ah,06
		mov al,0 ; no scrolling
		add p_xlh,1
		mov cl,p_xlh ; start column
		add p_ylh,21
		mov ch,p_ylh ; start y
		add p_ylh1,21
		mov dh,p_ylh1 ; end row
		add p_xlh1,1
		mov dl,p_xlh1; end column
		mov bh, 00110000b
		int 10h
		;right hands
		mov ah,06
		mov al,0 ; no scrolling
		add p_xrh,5
		mov cl,p_xrh ; start column
		add p_yrh,21
		mov ch,p_yrh ; start y
		add p_yrh1,21
		mov dh,p_yrh1 ; end row
		add p_xrh1,5
		mov dl,p_xrh1; end column
		mov bh, 00110000b
		int 10h

		;right leg
	legs:mov ah,06
		mov al,0 ; no scrolling
		add p_xrl,4
		mov cl,p_xrl ; start column
		add p_yrl,23
		mov ch,p_yrl ; start y
		add p_yrl1,23
		mov dh,p_yrl1 ; end row
		add p_xrl1,4
		mov dl,p_xrl1; end column
		mov bh, 00110000b
		int 10h
		
		;left leg
		mov al,0 ; no scrolling
		add p_xll,2
		mov cl,p_xll ; start column
		add p_yll,23
		mov ch,p_yll ; start y
		add p_yll1,23
		mov dh,p_yll1 ; end row
		add p_xll1,2
		mov dl,p_xll1; end column
		mov bh, 00110000b
		int 10h		
		
	
ret
Draw_player endp

Update_player proc

		;----------------------------------printing the  player
	
	;pait
	pait:
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,p_x1 ; start column
		mov ch,p_y1 ; start y
		mov dh,p_y2 ; end row
		mov dl,p_x2; end column
		mov bh,10011111b
		int 10h
		;eyes
		mov ah,02
		mov bh,0
		mov dh,p_y3
		mov dl,p_x3
		int 10h
		lea dx,eye
		mov ah,09
		int 21h


		;left hands
	hands:	
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,p_xlh ; start column
		mov ch,p_ylh ; start y
		mov dh,p_ylh1 ; end row
		mov dl,p_xlh1; end column
		mov bh, 00110000b
		int 10h
		;right hands
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,p_xrh ; start column
		mov ch,p_yrh ; start y
		mov dh,p_yrh1 ; end row
		mov dl,p_xrh1; end column
		mov bh, 00110000b
		int 10h

		;right leg
	legs:mov ah,06
		mov al,0 ; no scrolling
		mov cl,p_xrl ; start column
		mov ch,p_yrl ; start y
		mov dh,p_yrl1 ; end row
		mov dl,p_xrl1; end column
		mov bh, 00110000b
		int 10h
		
		;left leg
		mov al,0 ; no scrolling
		mov cl,p_xll ; start column
		mov ch,p_yll ; start y
		mov dh,p_yll1 ; end row
		mov dl,p_xll1; end column
		mov bh, 00110000b
		int 10h		
	
ret
Update_player endp
Remove_player proc

		;----------------------------------printing the  player
	
	;pait
	pait:
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,p_x1 ; start column
		mov ch,p_y1 ; start y
		mov dh,p_y2 ; end row
		mov dl,p_x2; end column
		mov bh,00000000b
		int 10h
		;eyes
		mov ah,02
		mov bh,0
		mov dh,p_y3
		mov dl,p_x3
		int 10h
		lea dx,empty
		mov ah,09
		int 21h


		;left hands
	hands:	
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,p_xlh ; start column
		mov ch,p_ylh ; start y
		mov dh,p_ylh1 ; end row
		mov dl,p_xlh1; end column
		mov bh,00000000b
		int 10h
		;right hands
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,p_xrh ; start column
		mov ch,p_yrh ; start y
		mov dh,p_yrh1 ; end row
		mov dl,p_xrh1; end column
		mov bh,00000000b
		int 10h

		;right leg
	legs:
	
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,p_xrl ; start column
		mov ch,p_yrl ; start y
		mov dh,p_yrl1 ; end row
		mov dl,p_xrl1; end column
		mov bh,00000000b
		int 10h
		
		;left leg
		mov al,0 ; no scrolling
		mov cl,p_xll ; start column
		mov ch,p_yll ; start y
		mov dh,p_yll1 ; end row
		mov dl,p_xll1; end column
		mov bh,00000000b
		int 10h		
		
	
ret
Remove_player endp

Draw_background proc


;-------------------------------------------------- scroll up the windows
mov ax,0600h ; scroll window up
mov cx,0 ; upper left corner (0,0)
mov dx,184Fh ; lower right corner (24,79)
mov bh,7 ; normal attribute
int 10h  ; call BIOS


mov ah,2 ; locate cursor at 0,0
mov bh,0 ; video page 0
mov dx,0 ; row 0, column 0
int 10h

mov ah,02 ; mode selection
mov al,13h ; mode number i.e. it can vary but mostly use 2 or 3
int 10h ; interrupt
;''''''''''''''''''''''''''''''''''background
	;background:
		;mov ah,06
		;mov al,0 ; no scrolling
		;mov cl,00 ; start column
		;mov ch,00 ; start y
		;mov dh,24 ; end row
		;mov dl,83; end column
		;mov bh, 01110000b
		;int 10h
		
	grounds:
		; ---- printing Ground line ------
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,0 ; start col
		mov ch,24 ; start y
		mov dh,24 ; end row
		mov dl,80; end column
		mov bh,01001000b
		int 10h
ret
Draw_background endp

Draw_obstacles proc
;;----------------------------------------obstacles
		;first one
	obstacles:	
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,10 ; start column
		mov ch,22 ; start y
		mov dh,24 ; end row
		mov dl,13; end column
		mov bh, 01100000b
		int 10h
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,11 ; start column
		mov ch,21 ; start y
		mov dh,24 ; end row
		mov dl,12; end column
		mov bh, 01110000b
		int 10h
		
		;second one
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,31 ; start column
		mov ch,20 ; start y
		mov dh,24 ; end row
		mov dl,34; end column
		mov bh, 01100000b
		int 10h
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,32 ; start column
		mov ch,19 ; start y
		mov dh,24 ; end row
		mov dl,33; end column
		mov bh, 01110000b
		int 10h
		
		;Third one
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,51 ; start column
		mov ch,20 ; start y
		mov dh,24 ; end row
		mov dl,55; end column
		mov bh, 01100000b
		int 10h
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,53 ; start column
		mov ch,19 ; start y
		mov dh,24 ; end row
		mov dl,53; end column
		mov bh, 01110000b
		int 10h
ret
Draw_obstacles endp

Draw_flags proc
	;--------------------------------printing flag000000000000000000000000000000000000000
	flagging:	
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,62 ; start column
		mov ch,7 ; start y
		mov dh,11 ; end row
		mov dl,78; end column
		mov bh, 10101111b
		int 10h
		;writing
		mov ah,02
		mov bh,0
		mov dh,9
		mov dl,67
		int 10h
		lea dx,flag
		mov ah,09
		int 21h
		
		;danda
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,78 ; start column
		mov ch,6 ; start y
		mov dh,24 ; end row
		mov dl,78; end column
		mov bh, 01100000b
		int 10h
		
ret
Draw_flags endp


Draw_Level proc

	;background
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,0 ; start column
		mov ch,0 ; start y
		mov dh,3 ; end row
		mov dl,80; end column
		mov bh, 00111111b
		int 10h
		
	;;;printing Pause line
		mov ah,02
		mov bh,0
		mov dh,01
		mov dl,60
		int 10h
		lea dx,Pausee
		mov ah,09
		int 21h
; ---- printing LEVELS line ------
		mov ah,02
		mov bh,0
		mov dh,02
		mov dl,50
		int 10h
		lea dx,Level
		mov ah,09
		int 21h
		mov dx,word ptr lvl
		mov ah,02h
		int 21h
		
		mov ah,02
		mov bh,0
		mov dh,24
		mov dl,0
		int 10h		
ret
Draw_Level endp



Draw_Lives proc
; ---- printing Lives line ------
		mov ah,02
		mov bh,0
		mov dh,02
		mov dl,30
		int 10h
		lea dx,Lives
		mov ah,09
		int 21h
		
		mov dx,word ptr life
		mov ah,02h
		int 21h
		mov ah,02
		mov bh,0
		mov dh,24
		mov dl,0
		int 10h		
ret
Draw_Lives endp
Draw_nameOfPlayer proc
		mov ah,02
		mov bh,0
		mov dh,02
		mov dl,5
		int 10h
		lea dx,nme
		mov ah,09
		int 21h
		
ret
Draw_nameOfPlayer endp
Draw_score proc
Score:

	call Draw_nameOfPlayer
	; ---- printing Score line ------
		
		mov ah,02
		mov bh,0
		mov dh,02
		mov dl,counter
		int 10h
		lea dx,scores
		mov ah,09
		int 21h
		
		mov ah,0
		mov al,scoring
		mov bl,10
		div bl
		mov sc2,ah
		mov sc1,al
		mov dl,sc1
		add dl,48
		mov ah,02h
		int 21h
		mov dl,sc2
		add dl,48
		mov ah,02h
		int 21h
		;inputting
		;cmp lvl,49
		;je l11
		;cmp lvl,50
		;je l2
		;cmp lvl,51
		;je l3
		
		;l11:
		;lea dx,sc1
		;mov ah,09
		;int 21h
		
		;jmp exitq

		;l2:
		;lea dx,sc2
		;mov ah,09
		;int 21h
		;call Draw_hellopage
		;jmp exitq

		;l3:
		;lea dx,sc3
		;mov ah,09
		;int 21h
		;jmp exitq	
			mov ah,02
		mov bh,0
		mov dh,24
		mov dl,0
		int 10h		
exitq:
ret
Draw_score endp
Update_score proc
		add scoring,3
		mov ah,02
		mov bh,0
		mov dh,02
		mov cl,counter
		add cl,9
		mov dl,cl
		int 10h
		
		mov ah,0
		mov al,scoring
		mov bl,10
		div bl
		mov sc2,ah
		mov sc1,al
		mov dl,sc1
		add dl,48
		mov ah,02h
		int 21h
		mov dl,sc2
		add dl,48
		mov ah,02h
		int 21h
		
ret
Update_score endp
Draw_Enemy proc
	;---------------------------------printing the  player-------------------
	
	;pait
		pait:
		mov ah,06
		mov al,0 ; no scrolling
		add E_x1,28
		mov cl,E_x1 ; start column
		add E_y1,21
		mov ch,E_y1 ; start y
		add E_y2,22
		mov dh,E_y2 ; end row
		add E_x2,30
		mov dl,E_x2; end column
		mov bh,11001111b
		int 10h
		;eyes
		mov ah,02
		mov bh,0
		add E_y3,21
		mov dh,E_y3
		add E_x3,28
		mov dl,E_x3
		int 10h
		lea dx,eye
		mov ah,09
		int 21h



		;right leg
	legs:
		mov ah,06
		mov al,0 ; no scrolling
		add E_xrl,29
		mov cl,E_xrl ; start column
		add E_yrl,23
		mov ch,E_yrl ; start y
		add E_yrl1,23
		mov dh,E_yrl1 ; end row
		add E_xrl1,29
		mov dl,E_xrl1; end column
		mov bh, 01110000b
		int 10h
		
			

ret
Draw_Enemy endp


Remove_Enemy proc
	;----------------------------------printing the  player
	
	;pait
		pait:
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,E_x1 ; start column
		mov ch,E_y1 ; start y
		mov dh,E_y2 ; end row
		mov dl,E_x2; end column
		mov bh,00000000b
		int 10h
		;eyes
		mov ah,02
		mov bh,0
		mov dh,E_y3
		mov dl,E_x3
		int 10h
		lea dx,empty
		mov ah,09
		int 21h



		;right leg
	legs:
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,E_xrl ; start column
		mov ch,E_yrl ; start y
		mov dh,E_yrl1 ; end row
		mov dl,E_xrl1; end column
		mov bh, 00000000b
		int 10h
		
			

ret
Remove_Enemy endp


Update_Enemy proc
	;----------------------------------printing the  player
	
	;pait
		pait:
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,E_x1 ; start column
		mov ch,E_y1 ; start y
		mov dh,E_y2 ; end row
		mov dl,E_x2; end column
		mov bh,11001111b
		int 10h
		;eyes
		mov ah,02
		mov bh,0
		mov dh,E_y3
		mov dl,E_x3
		int 10h
		lea dx,eye
		mov ah,09
		int 21h



		;right leg
	legs:
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,E_xrl ; start column
		mov ch,E_yrl ; start y
		mov dh,E_yrl1 ; end row
		mov dl,E_xrl1; end column
		mov bh, 01110000b
		int 10h
		
			

ret
Update_Enemy endp

Draw_Enemy2 proc
	;---------------------------------printing the  player-------------------
	
	;pait
		pait:
		mov ah,06
		mov al,0 ; no scrolling
		add E2_x1,48
		mov cl,E2_x1 ; start column
		add E2_y1,21
		mov ch,E2_y1 ; start y
		add E2_y2,22
		mov dh,E2_y2 ; end row
		add E2_x2,50
		mov dl,E2_x2; end column
		mov bh,11001111b
		int 10h
		;eyes
		mov ah,02
		mov bh,0
		add E2_y3,21
		mov dh,E2_y3
		add E2_x3,48
		mov dl,E2_x3
		int 10h
		lea dx,eye
		mov ah,09
		int 21h



		;right leg
	legs:
		mov ah,06
		mov al,0 ; no scrolling
		add E2_xrl,49
		mov cl,E2_xrl ; start column
		add E2_yrl,23
		mov ch,E2_yrl ; start y
		add E2_yrl1,23
		mov dh,E2_yrl1 ; end row
		add E2_xrl1,49
		mov dl,E2_xrl1; end column
		mov bh, 01110000b
		int 10h
		
			

ret
Draw_Enemy2 endp


Remove_Enemy2 proc
	;----------------------------------printing the  player
	
	;pait
		pait:
		mov ah,06
		mov al,0     ; no scrolling
		mov cl,E2_x1 ; start column
		mov ch,E2_y1 ; start y
		mov dh,E2_y2 ; end row
		mov dl,E2_x2 ; end column
		mov bh,00000000b
		int 10h
		;eyes
		mov ah,02
		mov bh,0
		mov dh,E2_y3
		mov dl,E2_x3
		int 10h
		lea dx,empty
		mov ah,09
		int 21h



		;right leg
	legs:
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,E2_xrl ; start column
		mov ch,E2_yrl ; start y
		mov dh,E2_yrl1 ; end row
		mov dl,E2_xrl1; end column
		mov bh, 00000000b
		int 10h
		
			

ret
Remove_Enemy2 endp


Update_Enemy2 proc
	;----------------------------------printing the  player
	
	;pait
		pait:
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,E2_x1 ; start column
		mov ch,E2_y1 ; start y
		mov dh,E2_y2 ; end row
		mov dl,E2_x2; end column
		mov bh,11001111b
		int 10h
		;eyes
		mov ah,02
		mov bh,0
		mov dh,E2_y3
		mov dl,E2_x3
		int 10h
		lea dx,eye
		mov ah,09
		int 21h



		;right leg
	legs:
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,E2_xrl ; start column
		mov ch,E2_yrl ; start y
		mov dh,E2_yrl1 ; end row
		mov dl,E2_xrl1; end column
		mov bh, 01110000b
		int 10h
		
			

ret
Update_Enemy2 endp

coins proc

		
		
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,10 ; start column
		mov ch,15 ; start y
		mov dh,16 ; end row
		mov dl,10; end column
		mov bh, 01010000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,11 ; start column
		mov ch,15 ; start y
		mov dh,15 ; end row
		mov dl,12; end column
		mov bh, 00100000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,30 ; start column
		mov ch,15 ; start y
		mov dh,16 ; end row
		mov dl,30; end column
		mov bh, 01010000b
		int 10h
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,31 ; start column
		mov ch,15 ; start y
		mov dh,15 ; end row
		mov dl,32; end column
		mov bh, 00100000b
		int 10h
		
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,52 ; start column
		mov ch,15 ; start y
		mov dh,16 ; end row
		mov dl,52; end column
		mov bh, 01010000b
		int 10h
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,53 ; start column
		mov ch,15 ; start y
		mov dh,15 ; end row
		mov dl,54; end colum
		mov bh, 00100000b
		int 10h
		
ret
coins endp

delay proc
MOV     CX, 01H
MOV     DX, 2140H
MOV     AH, 86H
INT     15H
ret

delay endp
delay1 proc
MOV     CX, 01H
MOV     DX, 2140H
MOV     AH, 86H
INT     15H
ret

delay1 endp
Mov_Enemy proc
		Enemies:
		mov dl,E_xrl1
		cmp ene,dl
		je incre
		decre:
		call Remove_Enemy
		dec E_x1 
		dec E_x2 
		dec E_x3 
		dec E_xrl 
		dec E_xrl1 
		dec E_xll 
		dec E_xll1 
		call Update_Enemy
		call delay
		jmp et
		incre:
		inc ene
		call Remove_Enemy
		inc E_x1 
		inc E_x2 
		inc E_x3 
		inc E_xrl 
		inc E_xrl1 
		inc E_xll 
		inc E_xll1 
		call Update_Enemy
		call delay
		cmp ene,28
		je tool
		jmp et
		
		tool:
		mov ene,15
et:
ret 
Mov_Enemy endp

Mov_Enemy2 proc
		Enemies:
		mov dl,E2_xrl1
		cmp ene2,dl
		je incre
		decre:
		call Remove_Enemy2
		dec E2_x1 
		dec E2_x2 
		dec E2_x3 
		dec E2_xrl 
		dec E2_xrl1 
		dec E2_xll 
		dec E2_xll1
		
		call Update_Enemy2
		call delay
		jmp et
		incre:
		inc ene2
		call Remove_Enemy2
		inc E2_x1 
		inc E2_x2 
		inc E2_x3 
		inc E2_xrl 
		inc E2_xrl1 
		inc E2_xll 
		inc E2_xll1 
		call Update_Enemy2
		call delay
		cmp ene2,49
		je tool
		jmp et
		
		tool:
		mov ene2,36
et:
ret 
Mov_Enemy2 endp


Startagain proc
mov p_x1,0 
mov p_y1,0
mov p_x2,0 
mov p_y2,0 
mov p_x3 ,0
mov p_xlh ,0
mov p_xlh1 ,0
mov p_xrh ,0
mov p_xrh1 ,0
mov p_y3 ,0
mov p_ylh,0
mov p_ylh1,0
mov p_yrh,0
mov p_yrh1,0
mov p_xrl1,0
mov p_xrl ,0
mov p_xll ,0
mov p_xll1,0
mov p_yrl1,0
mov p_yrl ,0
mov p_yll ,0
mov p_yll1,0

;Enemy Body coordinates
mov E_x1,0
mov E_x2,0
mov E_y2,0
mov E_y1,0
mov E_y3,0
mov E_x3,0

mov E_xrl,0
mov E_yrl,0
mov E_yrl1,0
mov E_xrl1,0

mov E_xll, 0
mov E_yll, 0
mov E_yll1,0
mov E_xll1,0
;Enemy Body coordinates
mov E2_x1,0
mov E2_x2,0
mov E2_y2,0
mov E2_y1,0
mov E2_y3,0
mov E2_x3,0

mov E2_xrl,0
mov E2_yrl,0
mov E2_yrl1,0
mov E2_xrl1,0

mov E2_xll, 0
mov E2_yll, 0
mov E2_yll1,0
mov E2_xll1,0


;;monster
mov M_x1,0
mov M_x2 ,0
mov M_y2,0
mov M_y1 ,0
mov M_xm ,0
mov M_xm1,0
mov M_ym,0
mov M_ym1,0
mov M_y3,0
mov M_x3 ,0
mov M_xrh ,0
mov M_yrh,0
mov M_yrh1,0
mov M_xrh1,0
mov M_xlh,0
mov M_ylh ,0
mov M_ylh1 ,0
mov M_xlh1 ,0

cmp lvl,50
je two
cmp lvl,51
je three
cmp lvl,52
je exit

two:
call level_2
three:
call level_3

ret
Startagain endp

Curser proc

		mov ah,02h
		mov bh,3
		mov dh,6
		mov dl,6
		int 10h

ret
Curser endp

curser1 proc

		mov ah,02h
		mov bh,3
		mov dh,23
		mov dl,0
		int 10h
ret
curser1 endp
Draw_Monster proc

	;pait
		pait:
		mov ah,06
		mov al,0 ; no scrolling
		add M_x1,42
		mov cl,M_x1 ; start column
		add M_y1,4
		mov ch,M_y1 ; start y
		add M_y2,6
		mov dh,M_y2 ; end row
		add M_x2,46
		mov dl,M_x2; end column
		mov bh,11001111b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		add M_xm,44
		mov cl,M_xm ; start column
		add M_ym,5
		mov ch,M_ym ; start y
		add M_ym1,5
		mov dh,M_ym ; end row
		add M_xm1,44
		mov dl,M_xm; end column
		mov bh,00000000b
		int 10h
		
		;eyes
		mov ah,02
		mov bh,0
		add M_y3,4
		mov dh,M_y3
		add M_x3,42
		mov dl,M_x3
		int 10h
		lea dx,MONSTER_EYE
		mov ah,09
		int 21h



		;left HANDS
	hands:
		mov ah,06
		mov al,0 ; no scrolling
		add M_xlh,39
		mov cl,M_xlh ; start column
		add M_ylh,5
		mov ch,M_ylh ; start y
		add M_ylh1,5
		mov dh,M_ylh1 ; end row
		add M_xlh1,42
		mov dl,M_xlh1; end column
		mov bh, 01110000b
		int 10h
		;Right
		mov ah,06
		mov al,0 ; no scrolling
		add M_xrh,46
		mov cl,M_xrh ; start column
		add M_yrh,5
		mov ch,M_yrh ; start y
		add M_yrh1,5
		mov dh,M_yrh1 ; end row
		add M_xrh1,49
		mov dl,M_xrh1; end column
		mov bh, 01110000b
		int 10h
		
ret
Draw_Monster endp

Remove_Monster proc

	;pait
		pait:
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,M_x1 ; start column
		mov ch,M_y1 ; start y
		mov dh,M_y2 ; end row
		mov dl,M_x2; end column
		mov bh,00000000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,M_xm ; start column
		mov ch,M_ym ; start y
		mov dh,M_ym ; end row
		mov dl,M_xm; end column
		mov bh,00000000b
		int 10h
		
		;eyes
		mov ah,02
		mov bh,0
		mov dh,M_y3
		mov dl,M_x3
		int 10h
		lea dx,MONSTER_EYE
		mov ah,09
		int 21h



		;right HANDS
	hands:
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,M_xrh ; start column
		mov ch,M_yrh ; start y
		mov dh,M_yrh1 ; end row
		mov dl,M_xrh1; end column
		mov bh, 00000000b
		int 10h
		;left
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,M_xlh ; start column
		mov ch,M_ylh ; start y
		mov dh,M_ylh1 ; end row
		mov dl,M_xlh1; end column
		mov bh, 00000000b
		int 10h
ret
Remove_Monster endp

Update_Monster proc

	;pait
		pait:
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,M_x1 ; start column
		mov ch,M_y1 ; start y
		mov dh,M_y2 ; end row
		mov dl,M_x2; end column
		mov bh,11001111b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,M_xm ; start column
		mov ch,M_ym ; start y
		mov dh,M_ym ; end row
		mov dl,M_xm; end column
		mov bh,00000000b
		int 10h
		
		;eyes
		mov ah,02
		mov bh,0
		mov dh,M_y3
		mov dl,M_x3
		int 10h
		lea dx,MONSTER_EYE
		mov ah,09
		int 21h



		;right HANDS
	hands:
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,M_xrh ; start column
		mov ch,M_yrh ; start y
		mov dh,M_yrh1 ; end row
		mov dl,M_xrh1; end column
		mov bh, 01110000b
		int 10h
		;left
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,M_xlh ; start column
		mov ch,M_ylh ; start y
		mov dh,M_ylh1 ; end row
		mov dl,M_xlh1; end column
		mov bh, 01110000b
		int 10h
ret
Update_Monster endp

Mov_Monster proc
		Enemies:
		mov dl,M_xlh
		cmp mon,dl
		je incre
		decre:
		call Remove_Monster
		dec M_x1
		dec M_x2
		dec M_xm 
		dec M_xm1
		dec M_x3
		dec M_xrh 
		dec M_xrh1
		dec M_xlh 
		dec M_xlh1 
				
		call Update_Monster
		call delay
		jmp et
		incre:
		inc mon
		call Remove_Monster
		inc M_x1
		inc M_x2
		inc M_xm 
		inc M_xm1
		inc M_x3
		inc M_xrh 
		inc M_xrh1
		inc M_xlh 
		inc M_xlh1 
				
		call Update_Monster
		call delay
		cmp mon,50
		je tool
		jmp et
		
		tool:
		mov mon,10
et:
ret 
Mov_Monster endp

delaym proc

push ax
push bx
push cx
push dx

mov cx,1000
mydelay:
mov bx,50     ;; increase this number if you want to add more delay, and decrease this number if you want to reduce delay.
mydelay1:
dec bx
jnz mydelay1
loop mydelay
call Mov_Enemy
call Mov_Enemy2
call Mov_Monster

pop dx
pop cx
pop bx
pop ax
ret

delaym endp


Draw_Castle proc
	;--------------------------------printing flag000000000000000000000000000000000000000
	flagging:	
		
		
		;
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,65 ; start column
		mov ch,14 ; start y
		mov dh,23 ; end row
		mov dl,79; end column
		mov bh, 01100000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,74 ; start column
		mov ch,19 ; start y
		mov dh,23 ; end row
		mov dl,79; end column
		mov bh, 00000000b
		int 10h
		;writing
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,70 ; start column
		mov ch,18 ; start y
		mov dh,18 ; end row
		mov dl,79; end column
		mov bh, 11100000b
		int 10h
		mov ah,02
		mov bh,0
		mov dh,18
		mov dl,75
		int 10h
		lea dx,Entrance
		mov ah,09
		int 21h
		
		mov ah,02
		mov bh,0
		mov dh,15
		mov dl,65
		int 10h
		lea dx,Castleee
		mov ah,09
		int 21h
		
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,68 ; start column
		mov ch,16 ; start y
		mov dh,16 ; end row
		mov dl,68; end column
		mov bh, 01110000b
		int 10h
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,66 ; start column
		mov ch,16 ; start y
		mov dh,16 ; end row
		mov dl,66; end column
		mov bh, 01110000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,70 ; start column
		mov ch,16 ; start y
		mov dh,16 ; end row
		mov dl,70; end column
		mov bh, 01110000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,72 ; start column
		mov ch,16 ; start y
		mov dh,16 ; end row
		mov dl,72; end column
		mov bh, 01110000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,74 ; start column
		mov ch,16 ; start y
		mov dh,16 ; end row
		mov dl,74; end column
		mov bh, 01110000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,76 ; start column
		mov ch,16 ; start y
		mov dh,16 ; end row
		mov dl,76; end column
		mov bh, 01110000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,78 ; start column
		mov ch,16 ; start y
		mov dh,16 ; end row
		mov dl,78; end column
		mov bh, 01110000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,68 ; start column
		mov ch,14 ; start y
		mov dh,14 ; end row
		mov dl,68; end column
		mov bh, 01110000b
		int 10h
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,66 ; start column
		mov ch,14 ; start y
		mov dh,14 ; end row
		mov dl,66; end column
		mov bh, 01110000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,70 ; start column
		mov ch,14 ; start y
		mov dh,14 ; end row
		mov dl,70; end column
		mov bh, 01110000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,72 ; start column
		mov ch,14 ; start y
		mov dh,14 ; end row
		mov dl,72; end column
		mov bh, 01110000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,74 ; start column
		mov ch,14 ; start y
		mov dh,14 ; end row
		mov dl,74; end column
		mov bh, 01110000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,76 ; start column
		mov ch,14 ; start y
		mov dh,14 ; end row
		mov dl,76; end column
		mov bh, 01110000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,78 ; start column
		mov ch,14 ; start y
		mov dh,14 ; end row
		mov dl,78; end column
		mov bh, 01110000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,68 ; start column
		mov ch,18 ; start y
		mov dh,18 ; end row
		mov dl,68; end column
		mov bh, 01110000b
		int 10h
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,66 ; start column
		mov ch,18 ; start y
		mov dh,18 ; end row
		mov dl,66; end column
		mov bh, 01110000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,70 ; start column
		mov ch,18 ; start y
		mov dh,18 ; end row
		mov dl,70; end column
		mov bh, 01110000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,72 ; start column
		mov ch,18 ; start y
		mov dh,18 ; end row
		mov dl,72; end column
		mov bh, 01110000b
		int 10h
		
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,68 ; start column
		mov ch,20 ; start y
		mov dh,20 ; end row
		mov dl,68; end column
		mov bh, 01110000b
		int 10h
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,66 ; start column
		mov ch,20 ; start y
		mov dh,20 ; end row
		mov dl,66; end column
		mov bh, 01110000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,70 ; start column
		mov ch,20 ; start y
		mov dh,20 ; end row
		mov dl,70; end column
		mov bh, 01110000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,72 ; start column
		mov ch,20 ; start y
		mov dh,20 ; end row
		mov dl,72; end column
		mov bh, 01110000b
		int 10h
		
		
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,68 ; start column
		mov ch,22 ; start y
		mov dh,22 ; end row
		mov dl,68; end column
		mov bh, 01110000b
		int 10h
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,66 ; start column
		mov ch,22 ; start y
		mov dh,22 ; end row
		mov dl,66; end column
		mov bh, 01110000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,70 ; start column
		mov ch,22 ; start y
		mov dh,22 ; end row
		mov dl,70; end column
		mov bh, 01110000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,72 ; start column
		mov ch,22 ; start y
		mov dh,22 ; end row
		mov dl,72; end column
		mov bh, 01110000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,65 ; start column
		mov ch,12 ; start y
		mov dh,13 ; end row
		mov dl,67; end column
		mov bh, 01000000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,70 ; start column
		mov ch,12 ; start y
		mov dh,13 ; end row
		mov dl,72 ;end column
		mov bh, 01000000b
		int 10h
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,75 ; start column
		mov ch,12 ; start y
		mov dh,13 ; end row
		mov dl,77; end column
		mov bh, 01000000b
		int 10h
		
		;danda
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,66 ; start column
		mov ch,7 ; start y
		mov dh,12 ; end row
		mov dl,66; end column
		mov bh, 01100000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,66 ; start column
		mov ch,8 ; start y
		mov dh,9 ; end row
		mov dl,71; end column
		mov bh, 10101111b
		int 10h
		;writing
		mov ah,02
		mov bh,0
		mov dh,9
		mov dl,68
		int 10h
		lea dx,ended
		mov ah,09
		int 21h
ret
Draw_Castle endp
Draw_Fireballs proc
		mov ah,06
		mov al,0 ; no scrolling
		mov f_x,46
		mov cl,f_x
		mov f_y,5
		mov ch,f_y
		mov f_y1,5
		mov dh,f_y1 ; start y
		mov f_x1,46
		mov dl,f_x1 ; end row
		mov bh, 00000000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov f2_x,43
		mov cl,f2_x
		mov f2_y,5
		mov ch,f2_y
		mov f2_y1,5
		mov dh,f2_y1 ; start y
		mov f2_x1,43
		mov dl,f2_x1 ; end row
		mov bh, 00000000b
		int 10h		
ret
Draw_Fireballs endp

Remove_Fireball12 proc
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,f_x
		mov ch,f_y
		mov dh,f_y1 ; start y
		mov dl,f_x1 ; end row
		mov bh, 00000000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,f2_x
		mov ch,f2_y
		mov dh,f2_y1 ; start y
		mov dl,f2_x1 ; end row
		mov bh, 00000000b
		int 10h				
ret
Remove_Fireball12 endp

Update_Fireball12 proc
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,f_x
		mov ch,f_y
		mov dh,f_y1 ; start y
		mov dl,f_x1 ; end row
		mov bh, 00110000b
		int 10h
		
		mov ah,06
		mov al,0 ; no scrolling
		mov cl,f2_x
		mov ch,f2_y
		mov dh,f2_y1 ; start y
		mov dl,f2_x1 ; end row
		mov bh, 00110000b
		int 10h
ret
Update_Fireball12 endp
Mov_Fireball12 proc
Enemies:
		mov dl,f_y
		cmp dl,18
		je tool 
		
		call Remove_Fireball12
		inc f_y1
		inc f_y
		inc f2_y1
		inc f2_y
		call Update_Fireball12
		call delay
		jmp et
		tool:
		call Remove_Fireball12
		mov f_y,5
		mov f_y1,5
		mov dl,M_xm1
		mov f_x1,dl
		mov dl,M_xm
		mov f_x,dl
		
		mov f2_y,5
		mov f2_y1,5
		mov dl,M_xm1
		add dl,3		
		mov f2_x1,dl
		mov dl,M_xm
		add dl,3		
		mov f2_x,dl
et:
ret
Mov_Fireball12 endp
soundA proc

        mov     al, 182         ; Prepare the speaker for the
        out     43h, al         ;  note.
        mov     ax, 9121       ; Frequency number (in decimal)
                                ;  for middle C.
        out     42h, al         ; Output low byte.
        mov     al, ah          ; Output high byte.
        out     42h, al 
        in      al, 61h         ; Turn on note (get value from
                                ;  port 61h).
        or      al, 00000011b   ; Set bits 1 and 0.
        out     61h, al         ; Send new value.
        mov     bx, 1         ; Pause for duration of note.
pause1:
        mov     cx, 65535
pause2:
        dec     cx
        jne     pause2
        dec     bx
        jne     pause1
        in      al, 61h         ; Turn off note (get value from
                                ;  port 61h).
        and     al, 11111100b   ; Reset bits 1 and 0.
        out     61h, al
ret
soundA endp

soundD proc

        mov     al, 182         ; Prepare the speaker for the
        out     43h, al         ;  note.
        mov     ax, 3619       ; Frequency number (in decimal)
                                ;  for middle C.
        out     42h, al         ; Output low byte.
        mov     al, ah          ; Output high byte.
        out     42h, al 
        in      al, 61h         ; Turn on note (get value from
                                ;  port 61h).
        or      al, 00000011b   ; Set bits 1 and 0.
        out     61h, al         ; Send new value.
        mov     bx, 1        ; Pause for duration of note.
pause1:
        mov     cx, 65535
pause2:
        dec     cx
        jne     pause2
        dec     bx
        jne     pause1
        in      al, 61h         ; Turn off note (get value from
                                ;  port 61h).
        and     al, 11111100b   ; Reset bits 1 and 0.
        out     61h, al

ret
soundD endp
soundW proc

        mov     al, 182         ; Prepare the speaker for the
        out     43h, al         ;  note.
        mov     ax, 1612       ; Frequency number (in decimal)
                                ;  for middle C.
        out     42h, al         ; Output low byte.
        mov     al, ah          ; Output high byte.
        out     42h, al 
        in      al, 61h         ; Turn on note (get value from
                                ;  port 61h).
        or      al, 00000011b   ; Set bits 1 and 0.
        out     61h, al         ; Send new value.
        mov     bx, 1      ; Pause for duration of note.
pause1:
        mov     cx, 65535
pause2:
        dec     cx
        jne     pause2
        dec     bx
        jne     pause1
        in      al, 61h         ; Turn off note (get value from
                                ;  port 61h).
        and     al, 11111100b   ; Reset bits 1 and 0.
        out     61h, al

ret
soundW endp
soundEnter proc

        mov     al, 182         ; Prepare the speaker for the
        out     43h, al         ;  note.
        mov     ax,4831   ; Frequency number (in decimal)
                                ;  for middle C.
        out     42h, al         ; Output low byte.
        mov     al, ah          ; Output high byte.
        out     42h, al 
        in      al, 61h         ; Turn on note (get value from
                                ;  port 61h).
        or      al, 00000011b   ; Set bits 1 and 0.
        out     61h, al         ; Send new value.
        mov     bx, 1      ; Pause for duration of note.
pause1:
        mov     cx, 65535
pause2:
        dec     cx
        jne     pause2
        dec     bx
        jne     pause1
        in      al, 61h         ; Turn off note (get value from
                                ;  port 61h).
        and     al, 11111100b   ; Reset bits 1 and 0.
        out     61h, al

ret
soundEnter endp

end


