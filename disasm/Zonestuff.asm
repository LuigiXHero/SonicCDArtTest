Zonestuff:
	dc.l GHZ_Act1
	dc.l GHZ_Act2
	dc.l GHZ_Act3
	dc.l null
	dc.l LZ_Act1
	dc.l LZ_Act2
	dc.l LZ_Act3
	dc.l LZ_Act4
	dc.l MZ_Act1
	dc.l MZ_Act2
	dc.l MZ_Act3
	dc.l null
	dc.l SLZ_Act1
	dc.l SLZ_Act2
	dc.l SLZ_Act3
	dc.l null
	dc.l SYZ_Act1
	dc.l SYZ_Act2
	dc.l SYZ_Act3
	dc.l null
	dc.l SBZ_Act1
	dc.l SBZ_Act2
	dc.l SBZ_Act3
	dc.l null
	dc.l ending
	dc.l null
	dc.l null
	dc.l null
	
	;	moveq #0,d0				; clear d0
	;	moveq #0,d1				; clear d1
	;	move.b $FFFFFE10.w,d0	; move zone id to d0
	;	lsl.w #4,d0				; shift the bits in d0 left 4 times (multiplies by 16)

;		move.b $FFFFFE11.w,d1	; move act id to d1
;		lsl.w #2,d1				; shift the bits in d1 left w times (multiplies by 4)
;		add.w d1,d0				; add d1 to d0

;		lea Zonestuff,a0		; set beginning of array to a0
;		move.l (a0,d0.w),$FFFFFFE8.w		; apply offset (d0) and move the contents in there to $FFFFFFE8
