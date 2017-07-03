; ===========================================================================

sub2_6886_PPZ:
		lea	($C00004).l,a5
		lea	($C00000).l,a6
		lea	($FFFFF756).w,a2
		lea	($FFFFF708).w,a3
		lea	($FFFFA440).w,a4
		move.w	#$6000,d2
		bsr.w	sub2_3164
		lea	($FFFFF758).w,a2
		lea	($FFFFF710).w,a3
		bra.w	locret2_324A
; ===========================================================================

LoadTilesAsYouMovePPZ:
		lea	($C00004).l,a5
		lea	($C00000).l,a6
		lea	($FFFFFF32).w,a2
		lea	($FFFFFF18).w,a3
		lea	($FFFFA440).w,a4
		move.w	#$6000,d2
		bsr.w	sub2_3164
		lea	($FFFFFF34).w,a2
		lea	($FFFFFF20).w,a3
		lea	($FFFFA400).w,a4
		move.w	#$4000,d2
		tst.b	(a2)
		beq.s	locret2_3162
		bclr	#0,(a2)
		beq.s	loc2_3118
		moveq	#$FFFFFFF0,d4
		moveq	#$FFFFFFF0,d5
		bsr.w	sub2_3478
		moveq	#$FFFFFFF0,d4
		moveq	#$FFFFFFF0,d5
		bsr.w	sub2_324E

loc2_3118:
		bclr	#1,(a2)
		beq.s	loc2_3132
		move.w	#$E0,d4
		moveq	#$FFFFFFF0,d5
		bsr.w	sub2_3478
		move.w	#$E0,d4
		moveq	#$FFFFFFF0,d5
		bsr.w	sub2_324E

loc2_3132:
		bclr	#2,(a2)
		beq.s	loc2_3148
		moveq	#$FFFFFFF0,d4
		moveq	#$FFFFFFF0,d5
		bsr.w	sub2_3478
		moveq	#$FFFFFFF0,d4
		moveq	#$FFFFFFF0,d5
		bsr.w	sub2_32A4

loc2_3148:
		bclr	#3,(a2)
		beq.s	locret2_3162
		moveq	#$FFFFFFF0,d4
		move.w	#$140,d5
		bsr.w	sub2_3478
		moveq	#$FFFFFFF0,d4
		move.w	#$140,d5
		bsr.w	sub2_32A4

locret2_3162:
		rts
; ===========================================================================

sub2_3164:
		lea	(BGCameraSections).l,a0
		adda.w	#1,a0
		moveq	#$FFFFFFF0,d4
		bclr	#0,(a2)
		bne.s	loc2_3180
		bclr	#1,(a2)
		beq.s	loc2_31CA
		move.w	#$E0,d4

loc2_3180:
		move.w	($FFFFF70C).w,d0
		add.w	d4,d0
		andi.w	#$FFF0,d0
		asr.w	#4,d0
		move.b	(a0,d0.w),d0
		ext.w	d0
		add.w	d0,d0
		movea.l	BGCameraLookup2(pc,d0.w),a3
		beq.s	loc2_31B2
		moveq	#$FFFFFFF0,d5
		move.l	a0,-(sp)
		movem.l	d4-d5,-(sp)
		bsr.w	sub2_3478
		movem.l	(sp)+,d4-d5
		bsr.w	sub2_324E
		movea.l	(sp)+,a0
		bra.s	loc2_31CA

loc2_31B2:
		moveq	#0,d5
		move.l	a0,-(sp)
		movem.l	d4-d5,-(sp)
		bsr.w	sub2_347A
		movem.l	(sp)+,d4-d5
		moveq	#$1F,d6
		bsr.w	sub2_327A
		movea.l	(sp)+,a0

loc2_31CA:
		tst.b	(a2)
		bne.s	loc2_31D0
		rts

loc2_31D0:
		moveq	#$FFFFFFF0,d4
		moveq	#$FFFFFFF0,d5
		move.b	(a2),d0
		andi.b	#$A8,d0
		beq.s	loc2_31E4
		lsr.b	#1,d0
		move.b	d0,(a2)
		move.w	#$140,d5

loc2_31E4:
		move.w	($FFFFF70C).w,d0
		andi.w	#$FFF0,d0
		asr.w	#4,d0
		suba.w	#1,a0
		lea	(a0,d0.w),a0
		bra.w	loc2_320A
; ===========================================================================

BGCameraLookup2:
	dc.l $FF192E
	dc.l $FF192E
	dc.l $FF1936
	dc.l $FF193E
; ===========================================================================

loc2_320A:
		moveq	#$F,d6
		move.l	#$800000,d7

loc2_3212:
		moveq	#0,d0
		move.b	(a0)+,d0
		beq.s	loc2_323E
		btst	d0,(a2)
		beq.s	loc2_323E
		add.w	d0,d0
		movea.l	BGCameraLookup2(pc,d0.w),a3
		movem.l	d4-d5/a0,-(sp)
		movem.l	d4-d5,-(sp)
		bsr.w	sub2_3350
		movem.l	(sp)+,d4-d5
		bsr.w	sub2_3478
		bsr.w	sub2_32D2
		movem.l	(sp)+,d4-d5/a0

loc2_323E:
		addi.w	#$10,d4
		dbf	d6,loc2_3212
		clr.b	(a2)
		rts
; ===========================================================================

locret2_324A:
		rts
		rts
; ===========================================================================

sub2_324E:
		moveq	#$15,d6
; ===========================================================================

sub2_3250:
		move.l	#$800000,d7
		move.l	d0,d1

loc2_3258:
		movem.l	d4-d5,-(sp)
		bsr.w	sub2_3350
		move.l	d1,d0
		bsr.w	sub2_32D2
		addq.b	#4,d1
		andi.b	#$7F,d1
		movem.l	(sp)+,d4-d5
		addi.w	#$10,d5
		dbf	d6,loc2_3258
		rts
; ===========================================================================

sub2_327A:
		move.l	#$800000,d7
		move.l	d0,d1

loc2_3282:
		movem.l	d4-d5,-(sp)
		bsr.w	sub2_3352
		move.l	d1,d0
		bsr.w	sub2_32D2
		addq.b	#4,d1
		andi.b	#$7F,d1
		movem.l	(sp)+,d4-d5
		addi.w	#$10,d5
		dbf	d6,loc2_3282
		rts
; ===========================================================================

sub2_32A4:
		moveq	#$F,d6
		move.l	#$800000,d7
		move.l	d0,d1

loc2_32AE:
		movem.l	d4-d5,-(sp)
		bsr.w	sub2_3350
		move.l	d1,d0
		bsr.w	sub2_32D2
		addi.w	#$100,d1
		andi.w	#$FFF,d1
		movem.l	(sp)+,d4-d5
		addi.w	#$10,d4
		dbf	d6,loc2_32AE
		rts
; ===========================================================================

sub2_32D2:
		or.w	d2,d0
		swap	d0
		btst	#4,(a0)
		bne.s	loc2_330E
		btst	#3,(a0)
		bne.s	loc2_32EE
		move.l	d0,(a5)
		move.l	(a1)+,(a6)
		add.l	d7,d0
		move.l	d0,(a5)
		move.l	(a1)+,(a6)
		rts

loc2_32EE:
		move.l	d0,(a5)
		move.l	(a1)+,d4
		eori.l	#$8000800,d4
		swap	d4
		move.l	d4,(a6)
		add.l	d7,d0
		move.l	d0,(a5)
		move.l	(a1)+,d4
		eori.l	#$8000800,d4
		swap	d4
		move.l	d4,(a6)
		rts

loc2_330E:
		btst	#3,(a0)
		bne.s	loc2_3330
		move.l	d0,(a5)
		move.l	(a1)+,d5
		move.l	(a1)+,d4
		eori.l	#$10001000,d4
		move.l	d4,(a6)
		add.l	d7,d0
		move.l	d0,(a5)
		eori.l	#$10001000,d5
		move.l	d5,(a6)
		rts

loc2_3330:
		move.l	d0,(a5)
		move.l	(a1)+,d5
		move.l	(a1)+,d4
		eori.l	#$18001800,d4
		swap	d4
		move.l	d4,(a6)
		add.l	d7,d0
		move.l	d0,(a5)
		eori.l	#$18001800,d5
		swap	d5
		move.l	d5,(a6)
		rts
; ===========================================================================

sub2_3350:
		add.w	(a3),d5
; ===========================================================================

sub2_3352:
		add.w	4(a3),d4

loc2_3356:
		lea	($FFFFB000).w,a1
		move.w	d4,d3
		lsr.w	#1,d3
		andi.w	#$380,d3
		lsr.w	#3,d5
		move.w	d5,d0
		lsr.w	#5,d0
		andi.w	#$7F,d0
		add.w	d3,d0
		moveq	#0,d3
		jsr   LocateBlock
		add.l   $FFFFFFE8.w,d3
		movea.l d3,a0
		move.w  (a0),d3
		andi.w  #$3FF,d3
		lsl.w   #3,d3
		adda.w  d3,a1
		rts

locret2_33A0:
		rts
; ===========================================================================
; unused
ObjChunkDraw_DrawChunks:
		move.l	a0,-(sp)
		lea	($FFFFA400).w,a4
		lea	($C00004).l,a5
		lea	($C00000).l,a6
		move.w	#$4000,d2
		move.l	#$800000,d7
		movem.l	d3-d5,-(sp)
		bsr.w	loc2_3356
		bne.s	loc2_3406
		movem.l	(sp)+,d3-d5
		bra.s	loc2_3430
; ===========================================================================

loc2_3406:
		movem.l	(sp)+,d3-d5
		move.w	d3,(a0)
		bsr.w	sub2_3434
		bne.s	loc2_3430
		movem.l	d3-d5,-(sp)
		lea	($FFFFB000).w,a1
		andi.w	#$3FF,d3
		lsl.w	#3,d3
		adda.w	d3,a1
		bsr.w	loc2_347E
		bsr.w	sub2_32D2
		movem.l	(sp)+,d3-d5

loc2_3430:
		movea.l	(sp)+,a0
		rts
; ===========================================================================

sub2_3434:
		move.w	($FFFFF704).w,d0
		move.w	d0,d1
		andi.w	#$FFF0,d0
		subi.w	#$10,d0
		cmp.w	d0,d4
		bcs.s	loc2_3474
		addi.w	#$F0,d1
		andi.w	#$FFF0,d1
		cmp.w	d1,d4
		bgt.s	loc2_3474
		move.w	($FFFFF700).w,d0
		move.w	d0,d1
		andi.w	#$FFF0,d0
		subi.w	#$10,d0
		cmp.w	d0,d5
		bcs.s	loc2_3474
		addi.w	#$150,d1
		andi.w	#$FFF0,d1
		cmp.w	d1,d5
		bgt.s	loc2_3474
		moveq	#0,d0
		rts

loc2_3474:
		moveq	#1,d0
		rts
; ===========================================================================

sub2_3478:
		add.w	(a3),d5
; ===========================================================================

sub2_347A:
		add.w	4(a3),d4

loc2_347E:
		andi.w	#$F0,d4
		andi.w	#$1F0,d5
		lsl.w	#4,d4
		lsr.w	#2,d5
		add.w	d5,d4
		moveq	#3,d0
		swap	d0
		move.w	d4,d0
		rts
; ===========================================================================

LoadTilesFromStartPPZ:
		lea	($C00004).l,a5
		lea	($C00000).l,a6
		lea	($FFFFF700).w,a3
		lea	($FFFFA400).w,a4
		move.w	#$4000,d2
		bsr.s	sub2_34DA
		lea	($FFFFF708).w,a3
		lea	($FFFFA440).w,a4
		move.w	#$6000,d2
		bra.w	loc2_3502
; ===========================================================================

sub2_34DA:
		moveq	#$FFFFFFF0,d4
		moveq	#$F,d6

loc2_34DE:
		movem.l	d4-d6,-(sp)
		moveq	#0,d5
		move.w	d4,d1
		bsr.w	sub2_3478
		move.w	d1,d4
		moveq	#0,d5
		moveq	#$1F,d6
		bsr.w	sub2_3250
		movem.l	(sp)+,d4-d6
		addi.w	#$10,d4
		dbf	d6,loc2_34DE
		rts
; ===========================================================================

loc2_3502:
		moveq	#$FFFFFFF0,d4
		moveq	#$F,d6

loc2_3506:
		movem.l	d4-d6/a0,-(sp)
		lea	(BGCameraSections).l,a0
		adda.w	#1,a0
		move.w	($FFFFF70C).w,d0
		add.w	d4,d0
		andi.w	#$7F0,d0
		bsr.w	sub2_35C2
		movem.l	(sp)+,d4-d6/a0
		addi.w	#$10,d4
		dbf	d6,loc2_3506
		rts
; ===========================================================================

BGCameraSections:
	dc.b 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0,	0, 0, 4, 4, 4, 4, 4, 4,	4, 4, 4, 4, 0, 0, 0, 0
	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0
	dc.b 0,	0, 0, 0, 0, 0, 0, 4, 4,	4, 4, 4, 4, 4, 4, 4, 4
	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0
; ===========================================================================

BGCameraLookup1:
	dc.l $FFF708
	dc.l $FFF708
	dc.l $FFF710
	dc.l $FFF718
; ===========================================================================

sub2_35C2:
		lsr.w	#4,d0
		move.b	(a0,d0.w),d0
		add.w	d0,d0
		movea.l	BGCameraLookup1(pc,d0.w),a3
		beq.s	loc2_35E4
		moveq	#$FFFFFFF0,d5
		movem.l	d4-d5,-(sp)
		bsr.w	sub2_3478
		movem.l	(sp)+,d4-d5
		bsr.w	sub2_324E
		bra.s	locret2_35F8
; ===========================================================================

loc2_35E4:
		moveq	#0,d5
		movem.l	d4-d5,-(sp)
		bsr.w	sub2_347A
		movem.l	(sp)+,d4-d5
		moveq	#$1F,d6
		bsr.w	sub2_327A

locret2_35F8:
		rts
; ===========================================================================