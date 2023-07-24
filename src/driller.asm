; -------------------------------------------
; Driller.
; Game.
; Disassembled by Franck "hitchhikr" Charlet.
; -------------------------------------------

                    section  Prog,code

ProgStart:          jmp      MAIN

GrafBase:           dc.l     0
GrafName:           dc.b     "graphics.library",0
                    even
DosName:            dc.b     "dos.library",0
                    even

BMLNGTH:            dc.l     8000
OLDCOPPER:          dc.l     0
NEWCOPPER:          dc.w     $100,$5200
                    dc.w     $102,0,$104,$24
                    dc.w     $108,0,$10a,0
                    dc.w     $92,$38,$94,$d0
                    dc.w     $8e,$2c81,$90,$f4c1
sp1:                dc.w     $120,0,$122,0
sp2:                dc.w     $124,0,$126,0
sp3:                dc.w     $128,0,$12a,0
sp4:                dc.w     $12c,0,$12e,0
sp5:                dc.w     $130,0,$132,0
sp6:                dc.w     $134,0,$136,0
sp7:                dc.w     $138,0,$13a,0
sp8:                dc.w     $13c,0,$13e,0
                    dc.w     $e0
PL1H:               dc.w     0,$e2
PL1L:               dc.w     0,$e4
PL2H:               dc.w     0,$e6
PL2L:               dc.w     0,$e8
PL3H:               dc.w     0,$ea
PL3L:               dc.w     0,$ec
PL4H:               dc.w     0,$ee
PL4L:               dc.w     0,$f0
PL5H:               dc.w     0,$f2
PL5L:               dc.w     0
COPCOL:             dc.w     $180,$000,$182,$a00,$184,$0a0,$186,$00a
                    dc.w     $188,$f44,$18a,$04f,$18c,$0c4,$18e,$a66
                    dc.w     $190,$000,$192,$a00,$194,$0a0,$196,$00a
                    dc.w     $198,$f44,$19a,$04f,$19c,$0c4,$19e,$a66
COPSPC:             dc.w     $1a0,$000,$1a2,$a00,$1a4,$0a0,$1a6,$00a
                    dc.w     $1a8,$f44,$1aa,$04f,$1ac,$0c4,$1ae,$a66
                    dc.w     $1b0,$000,$1b2,$a00,$1b4,$0a0,$1b6,$00a
                    dc.w     $1b8,$f44,$1ba,$04f,$1bc,$0c4,$1be,$a66
BIZFLASHY:          dc.w     $4b01,$ff00,$1a0,0
                    dc.w     $4c01,$ff00,$1a0,0
                    dc.w     $4d01,$ff00,$1a0,0
                    dc.w     $4e01,$ff00,$1a0,0
                    dc.w     $4f01,$ff00,$1a0,0
                    dc.w     $5001,$ff00,$1a0,0
                    dc.w     $5101,$ff00,$1a0,0
                    dc.w     $5201,$ff00,$1a0,0
                    dc.w     $5301,$ff00,$1a0,0
                    dc.w     $5401,$ff00,$1a0,0
                    dc.w     $1fc,0,$106,0
                    dc.l     -2

COLUP:              dc.w     $000,$009,$00c,$00f,$090,$0c0,$0f0,$900
                    dc.w     $c00,$456,$999,$ccc,$fff,$123,$f00,$fff

BIZSPRCOLS:         dc.w     $00f,$aaa,$fff,$00f,$aaa,$fff,$00f,$aaa
                    dc.w     $fff,$00f,$aaa,$fff,$00f,$aaa,$fff,$00f

SPDAT1:             dc.w     109,96,114,0
                    dc.w     %0001111111110000,%0001111111110000
                    dc.w     %0001000100010000,%0001000000010000
                    dc.w     %0001000000010000,%0001000000010000
                    dc.w     %0001100100110000,%0001000000010000
                    dc.w     %0001000000010000,%0001000000010000
                    dc.w     %0001000100010000,%0001000000010000
                    dc.w     %0001111111110000,%0001111111110000
                    dc.w     0,0

BIZSPBASE:          dc.l     0
OLDSPRADD:          dc.l     0
MEMORY_POINTER:     dc.l     0
MEMORY_BASE:        dc.l     0
DISPLAY_SEG1:       dc.l     0
DISPLAY_SEG2:       dc.l     0
COPPER_LST:         dc.l     0
AI_BUFFER:          dcb.l    25,0
DISPLAY_SEGC:       dc.w     0
LEFTEND:            dc.w     $FFFF
                    dc.w     $7FFF
                    dc.w     $3FFF
                    dc.w     $1FFF
                    dc.w     $FFF
                    dc.w     $7FF
                    dc.w     $3FF
                    dc.W     $1FF
                    dc.w     $FF
                    dc.w     $7F
                    dc.W     $3F
                    dc.w     $1F
                    dc.w     $F
                    dc.w     7
                    dc.w     3
                    dc.w     1
RIGHTEND:           dc.w     $8000
                    dc.w     $C000
                    dc.w     $E000
                    dc.w     $F000
                    dc.w     $F800
                    dc.w     $FC00
                    dc.w     $FE00
                    dc.w     $FF00
                    dc.w     $FF80
                    dc.w     $FFC0
                    dc.w     $FFE0
                    dc.w     $FFF0
                    dc.w     $FFF8
                    dc.w     $FFFC
                    dc.w     $FFFE
                    dc.w     $FFFF
                    dc.w     0
                    dc.w     0
BIZBUF:             dcb.w    32,0

BIZINT:             clr.b    DISPLAY_SEGC
                    move.l   $DFF120,OLDSPRADD
                    move.l   4.w,a6
                    lea      GrafName,a1
                    clr.l    d0
                    jsr      -552(a6)
                    move.l   d0,GrafBase
                    move.l   #171000,d0
                    move.l   #$10002,d1
                    move.l   4.w,a6
                    jsr      -198(a6)
                    move.l   d0,d1
                    add.l    #81000,d1
                    move.l   d1,SNDBUF
                    move.l   d0,-(sp)
                    jsr      LOADSND
                    move.l   (sp)+,d0
                    move.l   d0,MEMORY_BASE
                    move.l   d0,DISPLAY_SEG1
                    move.l   MEMORY_BASE,d0
                    move.l   d0,d1
                    add.l    #40000,d1
                    move.w   d0,PL5L
                    swap     d0
                    move.w   d0,PL5H
                    swap     d0
                    add.l    BMLNGTH,d0
                    add.l    BMLNGTH,d1
                    move.w   d0,PL1L
                    swap     d0
                    move.w   d0,PL1H
                    swap     d0
                    add.l    BMLNGTH,d0
                    add.l    BMLNGTH,d1
                    move.w   d0,PL2L
                    swap     d0
                    move.w   d0,PL2H
                    swap     d0
                    add.l    BMLNGTH,d0
                    add.l    BMLNGTH,d1
                    move.w   d0,PL3L
                    swap     d0
                    move.w   d0,PL3H
                    swap     d0
                    add.l    BMLNGTH,d0
                    add.l    BMLNGTH,d1
                    move.w   d0,PL4L
                    swap     d0
                    move.w   d0,PL4H
                    swap     d0
                    add.l    #8000,d0
                    move.l   d0,DISPLAY_SEG2
                    add.l    #40000,d0
                    move.l   d0,MEMORY_POINTER
                    lea      PL5L,a0
                    move.w   #32-1,d0
                    lea      COLUP,a1
COLINT:             addq.w   #4,a0
                    move.w   (a1)+,(a0)
                    dbra     d0,COLINT
                    lea      NEWCOPPER,a0
                    move.l   MEMORY_POINTER,a1
                    move.l   a1,COPPER_LST
BIZ01:              move.w   (a0),(a1)+
                    cmp.w    #$FFFE,(a0)+
                    bne      BIZ01
                    move.l   a1,BIZSPBASE
                    move.l   GrafBase,a6
                    add.l    #50,a6
                    move.w   #$80,$DFF096
                    move.l   (a6),OLDCOPPER
                    move.l   MEMORY_POINTER,$DFF080
                    move.w   #$80A0,$DFF096
                    rts

BIZDEAL:            move.l   GrafBase,a6
                    add.l    #50,a6
                    move.w   #$A0,$DFF096
                    move.l   OLDCOPPER,(a6)
                    move.l   OLDCOPPER,$DFF080
                    move.l   OLDSPRADD,$DFF120
                    move.w   #$80A0,$DFF096
                    move.l   MEMORY_BASE,a1
                    move.l   #171000,d0
                    move.l   4.w,a6
                    jsr      -210(a6)
                    jsr      KYBDOFF
                    jsr      RASTOFF
                    jsr      SNDOFF
                    rts

BIZBASH:            move.w   CMNOV,d7
                    cmp.w    #2,d7
                    ble      BIZLINE
BIZSCAN:            move.w   CMCOL,d4
                    and.w    #15,d4
                    asl.w    #2,d4
                    lea      PLOTTAB,a0
                    move.l   0(a0,d4.w),a2
                    move.w   #$7FFF,d0
                    move.l   d7,d6
                    lsl.w    #2,d6
                    subq.w   #1,d7
                    lea      BIZBUF,a0
                    move.w   -4(a1,d6.w),-4(a0)
                    move.w   #$C7,d1
                    sub.w    -2(a1,d6.w),d1
                    move.w   d1,-2(a0)
BIZSLP1:            move.w   #$C7,d1
                    sub.w    2(a1),d1
                    cmp.w    d1,d0
                    blt      BIZSNX1
                    move.l   a0,a4
                    lea      0(a0,d6.w),a3
                    move.w   d1,d0
BIZSNX1:            move.w   #$C7,d1
                    sub.w    2(a1),d1
                    move.w   d1,2(a0,d6.w)
                    move.w   (a1),0(a0,d6.w)
                    move.w   (a1)+,(a0)+
                    addq.w   #2,a1
                    move.w   d1,(a0)+
                    dbra     d7,BIZSLP1
                    move.l   DISPLAY_SEG2,a6
                    add.w    #8000,a6
                    move.w   d0,d1
                    lsl.w    #2,d0
                    add.w    d1,d0
                    lsl.w    #3,d0
                    add.w    d0,a6
                    move.w   2(a4),d7
                    addq.w   #4,a3
                    subq.w   #4,a4
                    bra      BIZSGO

BIZSLP2:            movem.l  d0/d1,-(sp)
                    lsr.l    #8,d0
                    lsr.l    #8,d1
                    jsr      BIZHOR
                    movem.l  (sp)+,d0/d1
                    addq.w   #1,d7
                    lea      40(a6),a6
                    add.l    d5,d0
BIZSGO:             cmp.w    -2(a3),d7
                    bne      BIZNSY1
BIZSY1:             subq.w   #4,a3
                    move.w   (a3),d5
                    sub.w    -4(a3),d5
                    ext.l    d5
                    lsl.l    #8,d5
                    move.w   2(a3),d2
                    sub.w    -2(a3),d2
                    beq      BIZSY1
                    bmi      BIZS1N
                    addq.w   #1,d2
                    bra      BIZS1P

BIZS1N:             subq.w   #1,d2
BIZS1P:             divs     d2,d5
                    ext.l    d5
                    moveq    #0,d0
                    move.w   (a3),d0
                    asl.l    #8,d0
                    add.l    d5,d0
BIZNSY1:            add.l    d6,d1
                    cmp.w    6(a4),d7
                    bne      BIZSLP2
BIZSY2:             addq.w   #4,a4
                    move.w   (a4),d6
                    sub.w    4(a4),d6
                    ext.l    d6
                    lsl.l    #8,d6
                    move.w   2(a4),d2
                    sub.w    6(a4),d2
                    beq      BIZSY2
                    bmi      BIZS2N
                    addq.w   #1,d2
                    bra      BIZS2P

BIZS2N:             subq.w   #1,d2
BIZS2P:             divs     d2,d6
                    ext.l    d6
                    moveq    #0,d1
                    move.w   (a4),d1
                    asl.l    #8,d1
                    add.l    d6,d1
                    cmp.l    a3,a4
                    bge      BIZSND
BIZNSY2:            bra      BIZSLP2

BIZSND:             rts

BIZHOR:             move.l   a6,-(sp)
                    and.w    #$1FF,d0
                    and.w    #$1FF,d1
                    cmp.w    d0,d1
                    bge      BIZHOR1
                    exg      d0,d1
BIZHOR1:            move.w   d0,d2
                    lsr.w    #3,d2
                    and.w    #$FE,d2
                    add.w    d2,a6
                    move.w   d1,d3
                    lsr.w    #3,d3
                    and.w    #$FE,d3
                    and.w    #15,d0
                    and.w    #15,d1
                    add.w    d0,d0
                    add.w    d1,d1
                    lea      LEFTEND,a0
                    move.w   0(a0,d0.w),d0
BIZHLP:             cmp.w    d2,d3
                    ble      BIZHND
                    jsr      (a2)
                    addq.w   #2,a6
                    addq.w   #2,d2
                    moveq    #-1,d0
                    bra      BIZHLP

BIZHND:             and.w    $20(a0,d1.w),d0
                    jsr      (a2)
                    move.l   (sp)+,a6
                    rts

BIZLINE:            move.w   (a1)+,d0
                    move.w   #$C7,d1
                    sub.w    (a1)+,d1
                    move.w   (a1)+,d2
                    move.w   #$C7,d3
                    sub.w    (a1)+,d3
                    move.w   CMCOL,d4
                    move.l   DISPLAY_SEG2,a6
                    add.w    #8000,a6
                    jmp      BTD4

BIZSWAP:            move.w   CMUPD1,d0
                    btst     #2,d0
                    bne      BIZ_GO
                    btst     #11,d0
                    beq      BIZ_EX
BIZ_GO:             move.l   DISPLAY_SEG1,a0
                    move.l   DISPLAY_SEG2,a1
                    add.w    #8640,a0
                    add.w    #8640,a1
                    move.w   #102-1,d7
BIZSWLP:            movem.l  (a1),d0-d6/a4-a6
                    movem.l  d0-d6/a4-a6,(a0)
                    movem.l  8000(a1),d0-d6/a4-a6
                    movem.l  d0-d6/a4-a6,8000(a0)
                    movem.l  16000(a1),d0-d6/a4-a6
                    movem.l  d0-d6/a4-a6,16000(a0)
                    movem.l  24000(a1),d0-d6/a4-a6
                    movem.l  d0-d6/a4-a6,24000(a0)
                    lea      40(a1),a1
                    lea      40(a0),a0
                    dbra     d7,BIZSWLP
                    move.l   DISPLAY_SEG2,a0
                    add.w    #8640,a0
                    lea      BITMAP,a1
                    add.w    #$A00,a1
                    move.w   #2040-1,d7
BIZCLLP:            move.w   (a1)+,(a0)+
                    move.w   (a1)+,8000-2(a0)
                    move.w   (a1)+,16000-2(a0)
                    move.w   (a1)+,24000-2(a0)
                    dbra     d7,BIZCLLP
BIZ_EX:             rts

BIZCOPCOP:          lea      COPCOL+2,a0
                    move.w   #32-1,d0
                    lea      COLUP,a2
COLINT2:            move.w   (a2)+,(a0)
                    addq.w   #4,a0
                    dbra     d0,COLINT2
                    lea      NEWCOPPER,a0
                    move.l   a0,RASCOPA
                    move.w   #$160,d0
                    lsr.w    #2,d0
                    move.w   d0,RASCOPL
BIZ04:              tst.w    RASCOPL
                    bpl      BIZ04
                    rts

BTE1:               move.l   DISPLAY_SEG1,a0
                    move.l   DISPLAY_SEG2,a1
                    add.w    #8640,a0
                    add.w    #8640,a1
BTE1OK:             move.w   #6,d7
BTE1LO:             pea      1(a0)
                    pea      1(a1)
                    move.w   #583-1,d6
BTE1LI:             move.b   (a1),(a0)
                    move.b   8000(a1),8000(a0)
                    move.b   16000(a1),16000(a0)
                    move.b   24000(a1),24000(a0)
                    move.b   -8000(a0),d0
                    and.b    d0,24000(a1)
                    and.b    d0,16000(a1)
                    and.b    d0,8000(a1)
                    and.b    d0,(a1)
                    addq.w   #7,a0
                    addq.w   #7,a1
                    dbra     d6,BTE1LI
                    move.l   (sp)+,a1
                    move.l   (sp)+,a0
                    dbra     d7,BTE1LO
                    rts

BTG8:               move.l   DISPLAY_SEG1,a0
                    add.w    #8640,a0
BTG8OK:             move.w   #6,d7
BTG8LO:             pea      1(a0)
                    move.w   #583-1,d6
BTG8LI:             move.b   -8000(a0),d0
                    and.b    d0,24000(a0)
                    and.b    d0,16000(a0)
                    and.b    d0,8000(a0)
                    and.b    d0,(a0)
                    addq.w   #7,a0
                    dbra     d6,BTG8LI
                    move.l   (sp)+,a0
                    dbra     d7,BTG8LO
                    rts

BTE5SA:             dc.l     0
BTE5SS:             dc.w     0
BTE5PS:             dc.w     0
BTE5HL:             dc.w     0
BTE5SH:             dc.w     0
BTE5HT:             dc.w     7

CONPEN:             clr.w    BTE5HL
                    move.w   #7,BTE5HT
                    cmp.w    #14,d0
                    ble      CONPENX
                    move.w   #2112,BTE5HL
                    cmp.w    #$1A,d0
                    bne      CONPENX
                    move.w   #3696,BTE5HL
                    move.w   #4,BTE5HT
CONPENX:            rts

CONMOV:             move.l   a0,-(sp)
                    move.l   DISPLAY_SEG2,a0
                    bra      CONMOV2

CONMOV1:            move.l   a0,-(sp)
                    move.l   DISPLAY_SEG1,a0
CONMOV2:            movem.l  d0-d2,-(sp)
                    move.w   d1,d2
                    asl.w    #2,d1
                    add.w    d2,d1
                    asl.w    #3,d1
                    move.w   d0,d2
                    lsr.w    #3,d2
                    add.w    d2,d1
                    add.w    d1,a0
                    move.l   a0,BTE5SA
                    not.w    d0
                    and.w    #7,d0
                    add.w    #1,d0
                    move.w   d0,BTE5SS
                    movem.l  (sp)+,d0-d2
                    move.l   (sp)+,a0
                    rts

CONPLC:             move.l   a2,-(sp)
                    lea      BTE5SH,a2
                    and.w    #15,d6
                    move.w   #$FF00,d2
                    asr.w    d6,d2
                    and.w    #$FF,d2
                    lsl.w    d0,d2
                    not.w    d2
                    move.w   d2,d3
                    lsr.w    #8,d3
                    sub.w    d4,d0
                    bpl      CONSMP
                    moveq    #-2,d4
                    and.b    d4,CONSM1
                    and.b    d4,CONSM2
                    and.b    d4,CONSM3
                    and.b    d4,CONSM4
                    neg.w    d0
                    bra      CONPLL

CONSMP:             moveq    #1,d4
                    or.b     d4,CONSM1
                    or.b     d4,CONSM2
                    or.b     d4,CONSM3
                    or.b     d4,CONSM4
CONPLL:             cmp.w    #4,BTE5HT
                    beq      CONNORM
                    and.b    d2,8000+1(a0)
                    and.b    d3,8000(a0)
                    and.b    d2,16000+1(a0)
                    and.b    d3,16000(a0)
                    and.b    d2,24000+1(a0)
                    and.b    d3,24000(a0)
                    and.b    d2,32000+1(a0)
                    and.b    d3,32000(a0)
                    not.b    d2
                    or.b     d2,1(a0)
                    not.b    d2
                    not.b    d3
                    or.b     d3,(a0)
                    not.b    d3
CONNORM:            moveq    #0,d1
                    move.b   (a1)+,d1
CONSM1:             lsl.w    d0,d1
                    or.b     d1,8000+1(a0)
                    move.w   d1,(a2)
                    move.b   (a2),d1
                    or.b     d1,8000(a0)
                    moveq    #0,d1
                    move.b   (a1)+,d1
CONSM2:             lsl.w    d0,d1
                    or.b     d1,16000+1(a0)
                    move.w   d1,(a2)
                    move.b   (a2),d1
                    or.b     d1,16000(a0)
                    moveq    #0,d1
                    move.b   (a1)+,d1
CONSM3:             lsl.w    d0,d1
                    or.b     d1,24000+1(a0)
                    move.w   d1,(a2)
                    move.b   (a2),d1
                    or.b     d1,24000(a0)
                    moveq    #0,d1
                    move.b   (a1)+,d1
CONSM4:             lsl.w    d0,d1
                    or.b     d1,32000+1(a0)
                    move.w   d1,(a2)
                    move.b   (a2),d1
                    or.b     d1,32000(a0)
                    lea      40(a0),a0
                    dbra     d7,CONPLL
                    move.l   (sp)+,a2
                    rts

CONPLT:             tst.w    d0
                    beq      CONPLTX
                    movem.l  d0-d7/a0-a6,-(sp)
                    move.l   a0,a6
                    move.w   d0,d5
                    subq.w   #1,d5
                    lea      FONTDTA,a2
                    move.l   BTE5SA,a3
CONPLP:             move.w   BTE5SS,d0
                    moveq    #0,d1
                    moveq    #0,d4
                    move.b   (a6)+,d1
                    cmp.w    #15,d1
                    blt      CONCNT
                    sub.w    #$20,d1
                    cmp.w    #$40,d1
                    blt      CONPL2
                    sub.w    #$20,d1
CONPL2:             move.w   d1,d2
                    lsl.w    #5,d1
                    add.w    d2,d1
                    lea      0(a2,d1.w),a1
                    add.w    BTE5HL,a1
                    moveq    #0,d6
                    move.b   (a1)+,d6
                    tst.w    BTE5PS
                    bne      CONPLN
                    lsr.w    #4,d6
                    move.w   d6,d4
                    moveq    #8,d6
CONPLN:             move.w   BTE5HT,d7
                    move.l   a3,a0
                    bsr      CONPLC
                    move.w   d6,d0
                    lsr.w    #3,d0
                    add.w    d0,a3
                    and.w    #7,d6
                    move.w   BTE5SS,d0
                    sub.w    d6,d0
                    bge      CONPL3
                    addq.w   #1,a3
                    addq.w   #8,d0
CONPL3:             move.w   d0,BTE5SS
                    dbra     d5,CONPLP
                    move.l   a3,BTE5SA
                    movem.l  (sp)+,d0-d7/a0-a6
CONPLTX:            rts

CONCNT:             btst     #1,d1
                    beq      CONCNT2
                    btst     #0,d1
                    beq      CONCNT3
                    move.w   #2112,BTE5HL
                    bra      CONCNT2

CONCNT3:            clr.w    BTE5HL
CONCNT2:            btst     #3,d1
                    beq      CONPL3
                    and.w    #4,d1
                    move.w   d1,BTE5PS
                    bra      CONPL3

FONTDTA:            dc.b     $24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dcb.b    9,0
                    dc.b     $24,0,0,0,0,$40,$A0,0,$A0,$40,$A0,0,$A0,$40,0,0,0
                    dc.b     0,$40,0,$40,0,$40,0,$40,$40,0,0,0,0,0,0,0,$24,0,0
                    dcb.b    2,0
                    dc.b     $A0,0,0,0,0,$A0,0,$A0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dcb.b    6,0
                    dc.b     $17,0,0,0,0,$48,0,0,0,$FC,0,0,0,$48,0,0,0,$48,0,0
                    dc.b     0,$FC,0,0,0,$48,0,0,0,0,0,0,0,$17,$20,0,0,0,$78
                    dc.b     $80,0,$80,$80,0,0,0,$70,$88,0,$88,8,0,0,0,8,0,0,0
                    dc.b     $F0,8,0,8,$20,0,0,0,$17,0,0,0,0,$84,$40,0,$40,8,4
                    dc.b     0,4,$10,8,0,8,$20,$40,0,$40,$40,$80,0,$80,$84,8,0
                    dc.b     8,0,0,0,0,$17,0,0,0,0,$70,$88,0,$88,$88,0,0,0,$74
                    dc.b     $80,0,$80,$98,4,0,4,$98,$24,0,$24,$64,$98,0,$98,0
                    dcb.b    3,0
                    dc.b     $33,0,0,0,0,$20,$40,0,$40,$40,$80,0,$80,$80,0,0,0
                    dcb.b    $10,0
                    dc.b     $24,0,0,0,0,$20,$40,0,$40,$40,0,0,0,$40,$80,0,$80
                    dc.b     $40,$80,0,$80,$40,0,0,0,$20,$40,0,$40,0,0,0,0,$24
                    dcb.b    4,0
                    dc.b     $80,$40,0,$40,$40,0,0,0,$40,$20,0,$20,$40,$20,0
                    dc.b     $20,$40,0,0,0,$80,$40,0,$40,0,0,0,0,$16,0,0,0,0,0
                    dcb.b    3,0
                    dc.b     $A8,0,0,0,$20,$50,0,$50,$F8,0,0,0,$20,$50,0,$50
                    dc.b     $A8,0,0,0,0,0,0,0,$16,0,0,0,0,0,0,0,0,$20,0,0,0
                    dc.b     $20,0,0,0,$70,$88,0,$88,$20,0,0,0,$20,0,0,0,0,0,0
                    dc.b     0,$33,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dcb.b    2,0
                    dc.b     $40,0,0,0,$80,$40,0,$C0,$16,0,0,0,0,0,0,0,0,0,0,0
                    dcb.b    5,0
                    dc.b     $70,$88,0,$88,0,0,0,0,0,0,0,0,0,0,0,0,$42,0,0,0,0
                    dcb.b    $11,0
                    dc.b     $80,0,$80,$80,0,0,0,0,0,0,0,$17,0,0,0,0,2,4,0,4,4
                    dc.b     8,0,8,8,$10,0,$10,$10,$20,0,$20,$20,$40,0,$40,$40
                    dc.b     $80,0,$80,0,0,0,0,$17,0,0,0,0,$30,$48,0,$48,$48
                    dc.b     $84,0,$84,$84,0,0,0,$84,0,0,0,$48,$84,0,$84,$30
                    dc.b     $48,0,$48,0,0,0,0,$24,0,0,0,0,$40,$80,0,$80,$C0,0
                    dcb.b    2,0
                    dc.b     $40,0,0,0,$40,0,0,0,$40,$A0,0,$A0,$E0,0,0,0,0,0,0
                    dc.b     0,$17,0,0,0,0,$F8,4,0,4,4,0,0,0,$78,$84,0,$84,$80
                    dcb.b    3,0
                    dc.b     $80,0,0,0,$7C,$80,0,$80,0,0,0,0,$17,0,0,0,0,$F8,4
                    dc.b     0,4,4,0,0,0,$78,$84,0,$84,4,0,0,0,4,0,0,0,$F8,4,0
                    dc.b     4,0,0,0,0,$17,0,0,0,0,$18,0,0,0,$28,$10,0,$10,$48
                    dc.b     $20,0,$20,$FC,0,0,$80,8,0,0,0,8,0,0,0,0,0,0,0,$17
                    dcb.b    4,0
                    dc.b     $FC,0,0,0,$80,0,0,0,$F8,4,0,4,4,0,0,0,4,0,0,0,$F8
                    dc.b     4,0,4,0,0,0,0,$17,0,0,0,0,$78,$84,0,$84,$80,0,0,0
                    dc.b     $F8,4,0,4,$84,0,0,0,$84,0,0,0,$78,$84,0,$84,0,0,0
                    dc.b     0,$17,0,0,0,0,$FC,0,0,0,4,0,0,0,8,4,0,4,$10,8,0,8
                    dc.b     $20,$10,0,$10,$20,$10,0,$10,0,0,0,0,$17,0,0,0,0
                    dc.b     $78,$84,0,$84,$84,0,0,0,$78,$84,0,$84,$84,0,0,0
                    dc.b     $84,0,0,0,$78,$84,0,$84,0,0,0,0,$17,0,0,0,0,$78
                    dc.b     $84,0,$84,$84,0,0,0,$84,0,0,0,$7C,$80,0,$80,4,0,0
                    dc.b     0,$78,$84,0,$84,0,0,0,0,$42,0,0,0,0,0,0,0,0,$80,0
                    dcb.b    3,0
                    dc.b     $80,0,$80,0,0,0,0,0,$80,0,$80,$80,0,0,0,0,0,0,0
                    dc.b     $33,0,0,0,0,0,0,0,0,$40,0,0,0,0,$40,0,$40,0,0,0,0
                    dcb.b    4,0
                    dc.b     $40,0,0,0,$80,$40,0,$C0,$15,0,0,0,0,$10,0,0,0,$20
                    dc.b     $10,0,$10,$40,$20,0,$20,$80,$40,0,$40,$40,$20,0
                    dcb.b    2,$20
                    dc.b     $10,0,$10,$10,0,0,0,$16,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dcb.b    3,0
                    dc.b     $70,$88,0,$88,0,0,0,0,$70,$88,0,$88,0,0,0,0,$15,0
                    dcb.b    3,0
                    dc.b     $80,0,0,0,$40,$80,0,$80,$20,$40,0,$40,$10,$20,0
                    dcb.b    2,$20
                    dc.b     $40,0,$40,$40,$80,0,$80,$80,0,0,0,$17,0,0,0,0,$78
                    dc.b     $84,0,$84,4,0,0,0,4,0,0,0,$18,$24,0,$24,0,$20,0
                    dcb.b    2,$20
                    dcb.b    7,0
                    dc.b     9,$18,$24,0,$24,$66,$18,0,$5A,$5A,$A1,0,$A1,$A1
                    dc.b     $42,0,$42,$A1,$42,0,$42,$5A,$A1,0,$A1,$66,$18,0
                    dc.b     $5A,$18,$24,0,$24,$17,0,0,0,0,$78,$84,0,$84,4,0,0
                    dc.b     0,4,$80,0,$80,$FC,0,0,0,$84,0,0,0,$84,0,0,0,0,0,0
                    dc.b     0,$17,0,0,0,0,$78,$84,0,$84,4,0,0,0,$F8,4,0,4,$84
                    dcb.b    3,0
                    dc.b     $84,0,0,0,$F8,4,0,4,0,0,0,0,$17,0,0,0,0,$78,$84,0
                    dcb.b    2,$84
                    dcb.b    3,0
                    dc.b     $80,0,0,0,$80,0,0,0,$84,0,0,0,$78,$84,0,$84,0,0,0
                    dc.b     0,$17,0,0,0,0,$78,$84,0,$84,4,0,0,0,4,$80,0,$80
                    dc.b     $84,0,0,0,$84,0,0,0,$F8,4,0,4,0,0,0,0,$17,0,0,0,0
                    dc.b     $7C,$80,0,$80,0,0,0,0,$F0,8,0,8,$80,0,0,0,$80,0,0
                    dc.b     0,$FC,0,0,0,0,0,0,0,$17,0,0,0,0,$7C,$80,0,$80,0,0
                    dcb.b    2,0
                    dc.b     $F0,8,0,8,$80,0,0,0,$80,0,0,0,$80,0,0,0,0,0,0,0
                    dc.b     $17,0,0,0,0,$78,$84,0,$84,$84,0,0,0,$80,0,0,0,$9C
                    dcb.b    3,0
                    dc.b     $84,0,0,0,$78,$84,0,$84,0,0,0,0,$17,0,0,0,0,$84,0
                    dcb.b    2,0
                    dc.b     $84,0,0,0,$FC,0,0,0,$84,0,0,0,$84,0,0,0,$84,0,0,0
                    dcb.b    4,0
                    dc.b     $42,0,0,0,0,$80,0,0,0,$80,0,0,0,$80,0,0,0,$80,0,0
                    dc.b     0,$80,0,0,0,$80,0,0,0,0,0,0,0,$17,0,0,0,0,4,0,0,0
                    dc.b     4,0,0,0,4,0,0,0,4,0,0,0,$84,0,0,0,$78,$84,0,$84,0
                    dcb.b    3,0
                    dc.b     $17,0,0,0,0,$84,0,0,0,$88,0,0,0,$E0,$10,0,$10,$90
                    dc.b     8,0,8,$88,4,0,4,$84,0,0,0,0,0,0,0,$17,0,0,0,0,$80
                    dcb.b    3,0
                    dc.b     $80,0,0,0,$80,0,0,0,$80,0,0,0,$80,0,0,0,$FC,0,0,0
                    dcb.b    4,0
                    dc.b     8,0,0,0,0,$FC,0,0,0,0,2,0,2,2,$90,0,$90,$92,0,0,0
                    dc.b     $92,0,0,0,$92,0,0,0,0,0,0,0,$17,0,0,0,0,$C4,0,0,0
                    dc.b     $A4,$40,0,$40,$94,$20,0,$20,$8C,$10,0,$10,$84,8,0
                    dc.b     8,$84,0,0,0,0,0,0,0,$17,0,0,0,0,$78,$84,0,$84,$84
                    dcb.b    3,0
                    dc.b     $84,0,0,0,$84,0,0,0,$84,0,0,0,$78,$84,0,$84,0,0,0
                    dc.b     0,$17,0,0,0,0,$78,$84,0,$84,4,0,0,0,4,$80,0,$80
                    dc.b     $F8,4,0,4,$80,0,0,0,$80,0,0,0,0,0,0,0,$17,0,0,0,0
                    dc.b     $78,$84,0,$84,$84,0,0,0,$84,0,0,0,$94,8,0,8,$88,4
                    dc.b     0,4,$74,$88,0,$88,0,0,0,0,$17,0,0,0,0,$78,$84,0
                    dc.b     $84,4,0,0,0,4,$80,0,$80,$F8,4,0,4,$88,$10,0,$10
                    dc.b     $84,8,0,8,0,0,0,0,$17,0,0,0,0,$7C,$80,0,$80,$80,0
                    dcb.b    2,0
                    dc.b     $78,$84,0,$84,4,0,0,0,4,0,0,0,$F8,4,0,4,0,0,0,0,8
                    dcb.b    4,0
                    dc.b     $FE,0,0,0,0,0,0,0,0,$10,0,$10,$10,0,0,0,$10,0,0,0
                    dc.b     $10,0,0,0,0,0,0,0,$17,0,0,0,0,$84,0,0,0,$84,0,0,0
                    dc.b     $84,0,0,0,$84,0,0,0,$84,0,0,0,$78,$84,0,$84,0,0,0
                    dc.b     0,$17,0,0,0,0,$84,0,0,0,$84,0,0,0,$84,0,0,0,$84
                    dc.b     $48,0,$48,$48,$30,0,$30,$30,0,0,0,0,0,0,0,8,0,0,0
                    dc.b     0,$92,0,0,0,$92,0,0,0,$92,0,0,0,$80,$12,0,$12,$80
                    dcb.b    3,0
                    dc.b     $7E,$80,0,$80,0,0,0,0,$17,0,0,0,0,$84,8,0,8,$48
                    dc.b     $90,0,$90,$30,$40,0,$40,$30,8,0,8,$48,$24,0,$24
                    dc.b     $84,$40,0,$40,0,0,0,0,8,0,0,0,0,$82,$44,0,$44,$44
                    dc.b     $28,0,$28,$28,$10,0,$10,$10,0,0,0,$10,0,0,0,$10,0
                    dcb.b    6,0
                    dc.b     $17,0,0,0,0,$FC,0,0,4,8,4,0,4,$10,$28,0,$28,$20
                    dc.b     $50,0,$50,$40,$80,0,$80,$FC,0,0,$80,0,0,0,0,$33,0
                    dcb.b    3,0
                    dc.b     $C0,0,0,0,$80,0,0,0,$80,0,0,0,$80,0,0,0,$80,0,0,0
                    dc.b     $C0,0,0,0,0,0,0,0,$17,0,0,0,0,$80,$40,0,$40,$40
                    dc.b     $20,0,$20,$20,$10,0,$10,$10,8,0,8,8,4,0,4,4,2,0,2
                    dcb.b    4,0
                    dc.b     $33,0,0,0,0,$C0,0,0,0,$40,0,0,0,$40,0,0,0,$40,0,0
                    dc.b     0,$40,0,0,0,$C0,0,0,0,0,0,0,0,$16,0,0,0,0,$20,0,0
                    dc.b     0,$50,$20,0,$20,$88,$50,0,$50,0,0,0,0,0,0,0,0,0,0
                    dcb.b    6,0
                    dc.b     9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.b     $FF,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dcb.b    $11,0
                    dc.b     $24,0,0,0,0,$A0,$40,0,$A0,$A0,$40,0,$A0,0,$40,0,0
                    dc.b     $40,0,0,$40,$40,0,0,$40,0,$40,0,0,0,0,0,0,$24,0,0
                    dcb.b    3,0
                    dc.b     $A0,0,0,$A0,0,0,$A0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dcb.b    5,0
                    dc.b     $17,0,0,0,0,0,$48,0,0,0,$FC,0,0,0,$48,0,0,0,$48,0
                    dcb.b    2,0
                    dc.b     $FC,0,0,0,$48,0,0,0,0,0,0,$17,0,$20,0,0,$80,$78,0
                    dc.b     $80,0,$80,0,0,$88,$70,0,$88,0,8,0,0,0,8,0,0,8,$F0
                    dc.b     0,8,0,$20,0,0,$17,0,0,0,0,$40,$84,0,$40,4,8,0,4,8
                    dc.b     $10,0,8,$40,$20,0,$40,$80,$40,0,$80,8,$84,0,8,0,0
                    dcb.b    2,0
                    dc.b     $17,0,0,0,0,$88,$70,0,$88,0,$88,0,0,$80,$74,0,$80
                    dc.b     4,$98,0,4,$24,$98,0,$24,$98,$64,0,$98,0,0,0,0,$33
                    dcb.b    4,0
                    dc.b     $40,$20,0,$40,$80,$40,0,$80,0,$80,0,0,0,0,0,0,0,0
                    dcb.b    10,0
                    dc.b     $24,0,0,0,0,$40,$20,0,$40,0,$40,0,0,$80,$40,0,$80
                    dc.b     $80,$40,0,$80,0,$40,0,0,$40,$20,0,$40,0,0,0,0,$24
                    dcb.b    4,0
                    dc.b     $40,$80,0,$40,0,$40,0,0,$20,$40,0,$20,$20,$40,0
                    dc.b     $20,0,$40,0,0,$40,$80,0,$40,0,0,0,0,$16,0,0,0,0,0
                    dcb.b    4,0
                    dc.b     $A8,0,0,$50,$20,0,$50,0,$F8,0,0,$50,$20,0,$50,0
                    dc.b     $A8,0,0,0,0,0,0,$16,0,0,0,0,0,0,0,0,0,$20,0,0,0
                    dc.b     $20,0,0,$88,$70,0,$88,0,$20,0,0,0,$20,0,0,0,0,0,0
                    dc.b     $33,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dcb.b    2,0
                    dc.b     $40,0,0,$40,$80,0,$C0,$16,0,0,0,0,0,0,0,0,0,0,0,0
                    dcb.b    4,0
                    dc.b     $88,$70,0,$88,0,0,0,0,0,0,0,0,0,0,0,0,$42,0,0,0,0
                    dcb.b    $10,0
                    dc.b     $80,0,0,$80,0,$80,0,0,0,0,0,0,$17,0,0,0,0,4,2,0,4
                    dc.b     8,4,0,8,$10,8,0,$10,$20,$10,0,$20,$40,$20,0,$40
                    dc.b     $80,$40,0,$80,0,0,0,0,$17,0,0,0,0,$48,$30,0,$48
                    dc.b     $84,$48,0,$84,0,$84,0,0,0,$84,0,0,$84,$48,0,$84
                    dc.b     $48,$30,0,$48,0,0,0,0,$24,0,0,0,0,$80,$40,0,$80,0
                    dc.b     $C0,0,0,0,$40,0,0,0,$40,0,0,$A0,$40,0,$A0,0,$E0,0
                    dcb.b    5,0
                    dc.b     $17,0,0,0,0,4,$F8,0,4,0,4,0,0,$84,$78,0,$84,0,$80
                    dcb.b    3,0
                    dc.b     $80,0,0,$80,$7C,0,$80,0,0,0,0,$17,0,0,0,0,4,$F8,0
                    dc.b     4,0,4,0,0,$84,$78,0,$84,0,4,0,0,0,4,0,0,4,$F8,0,4
                    dcb.b    4,0
                    dc.b     $17,0,0,0,0,0,$18,0,0,$10,$28,0,$10,$20,$48,0,$20
                    dc.b     0,$FC,0,$80,0,8,0,0,0,8,0,0,0,0,0,0,$17,0,0,0,0,0
                    dc.b     $FC,0,0,0,$80,0,0,4,$F8,0,4,0,4,0,0,0,4,0,0,4,$F8
                    dc.b     0,4,0,0,0,0,$17,0,0,0,0,$84,$78,0,$84,0,$80,0,0,4
                    dc.b     $F8,0,4,0,$84,0,0,0,$84,0,0,$84,$78,0,$84,0,0,0,0
                    dc.b     $17,0,0,0,0,0,$FC,0,0,0,4,0,0,4,8,0,4,8,$10,0,8
                    dc.b     $10,$20,0,$10,$10,$20,0,$10,0,0,0,0,$17,0,0,0,0
                    dc.b     $84,$78,0,$84,0,$84,0,0,$84,$78,0,$84,0,$84,0,0,0
                    dc.b     $84,0,0,$84,$78,0,$84,0,0,0,0,$17,0,0,0,0,$84,$78
                    dc.b     0,$84,0,$84,0,0,0,$84,0,0,$80,$7C,0,$80,0,4,0,0
                    dc.b     $84,$78,0,$84,0,0,0,0,$42,0,0,0,0,0,0,0,0,0,$80,0
                    dc.b     0,$80,0,0,$80,0,0,0,0,$80,0,0,$80,0,$80,0,0,0,0,0
                    dc.b     0,$33,0,0,0,0,0,0,0,0,0,$40,0,0,$40,0,0,$40,0,0,0
                    dcb.b    6,0
                    dc.b     $40,0,0,$40,$80,0,$C0,$16,0,0,0,0,0,$10,0,0,$10
                    dc.b     $20,0,$10,$20,$40,0,$20,$40,$80,0,$40,$20,$40,0
                    dc.b     $20,$10,$20,0,$10,0,$10,0,0,$16,0,0,0,0,0,0,0,0,0
                    dcb.b    7,0
                    dc.b     $88,$70,0,$88,0,0,0,0,$88,$70,0,$88,0,0,0,0,$16,0
                    dcb.b    4,0
                    dc.b     $80,0,0,$80,$40,0,$80,$40,$20,0,$40,$20,$10,0,$20
                    dc.b     $40,$20,0,$40,$80,$40,0,$80,0,$80,0,0,$17,0,0,0,0
                    dc.b     $84,$78,0,$84,0,4,0,0,0,4,0,0,$24,$18,0,$24,$20,0
                    dc.b     0,$20,0,$20,0,0,0,0,0,0,9,$24,$18,0,$24,$18,$66,0
                    dc.b     $5A,$A1,$5A,0,$A1,$42,$A1,0,$42,$42,$A1,0,$42,$A1
                    dc.b     $5A,0,$A1,$18,$66,0,$5A,$24,$18,0,$24,$17,0,0,0,0
                    dc.b     $84,$78,0,$84,0,4,0,0,$80,4,0,$80,0,$FC,0,0,0,$84
                    dcb.b    3,0
                    dc.b     $84,0,0,0,0,0,0,$17,0,0,0,0,$84,$78,0,$84,0,4,0,0
                    dc.b     4,$F8,0,4,0,$84,0,0,0,$84,0,0,4,$F8,0,4,0,0,0,0
                    dc.b     $17,0,0,0,0,$84,$78,0,$84,0,$84,0,0,0,$80,0,0,0
                    dc.b     $80,0,0,0,$84,0,0,$84,$78,0,$84,0,0,0,0,$17,0,0,0
                    dc.b     0,$84,$78,0,$84,0,4,0,0,$80,4,0,$80,0,$84,0,0,0
                    dc.b     $84,0,0,4,$F8,0,4,0,0,0,0,$17,0,0,0,0,$80,$7C,0
                    dc.b     $80,0,0,0,0,8,$F0,0,8,0,$80,0,0,0,$80,0,0,0,$FC,0
                    dcb.b    5,0
                    dc.b     $17,0,0,0,0,$80,$7C,0,$80,0,0,0,0,8,$F0,0,8,0,$80
                    dcb.b    3,0
                    dc.b     $80,0,0,0,$80,0,0,0,0,0,0,$17,0,0,0,0,$84,$78,0
                    dc.b     $84,0,$84,0,0,0,$80,0,0,0,$9C,0,0,0,$84,0,0,$84
                    dc.b     $78,0,$84,0,0,0,0,$17,0,0,0,0,0,$84,0,0,0,$84,0,0
                    dc.b     0,$FC,0,0,0,$84,0,0,0,$84,0,0,0,$84,0,0,0,0,0,0
                    dc.b     $42,0,0,0,0,0,$80,0,0,0,$80,0,0,0,$80,0,0,0,$80,0
                    dcb.b    2,0
                    dc.b     $80,0,0,0,$80,0,0,0,0,0,0,$17,0,0,0,0,0,4,0,0,0,4
                    dcb.b    3,0
                    dc.b     4,0,0,0,4,0,0,0,$84,0,0,$84,$78,0,$84,0,0,0,0,$17
                    dcb.b    5,0
                    dc.b     $84,0,0,0,$88,0,0,$10,$E0,0,$10,8,$90,0,8,4,$88,0
                    dc.b     4,0,$84,0,0,0,0,0,0,$17,0,0,0,0,0,$80,0,0,0,$80,0
                    dcb.b    2,0
                    dc.b     $80,0,0,0,$80,0,0,0,$80,0,0,0,$FC,0,0,0,0,0,0,8,0
                    dcb.b    4,0
                    dc.b     $FC,0,0,2,0,0,2,$90,2,0,$90,0,$92,0,0,0,$92,0,0,0
                    dc.b     $92,0,0,0,0,0,0,$17,0,0,0,0,0,$C4,0,0,$40,$A4,0
                    dc.b     $40,$20,$94,0,$20,$10,$8C,0,$10,8,$84,0,8,0,$84,0
                    dcb.b    5,0
                    dc.b     $17,0,0,0,0,$84,$78,0,$84,0,$84,0,0,0,$84,0,0,0
                    dc.b     $84,0,0,0,$84,0,0,$84,$78,0,$84,0,0,0,0,$17,0,0,0
                    dc.b     0,$84,$78,0,$84,0,4,0,0,$80,4,0,$80,4,$F8,0,4,0
                    dc.b     $80,0,0,0,$80,0,0,0,0,0,0,$17,0,0,0,0,$84,$78,0
                    dc.b     $84,0,$84,0,0,0,$84,0,0,8,$94,0,8,4,$88,0,4,$88
                    dc.b     $74,0,$88,0,0,0,0,$17,0,0,0,0,$84,$78,0,$84,0,4,0
                    dc.b     0,$80,4,0,$80,4,$F8,0,4,$10,$88,0,$10,8,$84,0,8,0
                    dcb.b    3,0
                    dc.b     $17,0,0,0,0,$80,$7C,0,$80,0,$80,0,0,$84,$78,0,$84
                    dc.b     0,4,0,0,0,4,0,0,4,$F8,0,4,0,0,0,0,8,0,0,0,0,0,$FE
                    dcb.b    6,0
                    dc.b     $10,0,0,$10,0,$10,0,0,0,$10,0,0,0,$10,0,0,0,0,0,0
                    dc.b     $17,0,0,0,0,0,$84,0,0,0,$84,0,0,0,$84,0,0,0,$84,0
                    dcb.b    2,0
                    dc.b     $84,0,0,$84,$78,0,$84,0,0,0,0,$17,0,0,0,0,0,$84,0
                    dcb.b    2,0
                    dc.b     $84,0,0,0,$84,0,0,$48,$84,0,$48,$30,$48,0,$30,0
                    dc.b     $30,0,0,0,0,0,0,8,0,0,0,0,0,$92,0,0,0,$92,0,0,0
                    dc.b     $92,0,0,$12,$80,0,$12,0,$80,0,0,$80,$7E,0,$80,0,0
                    dcb.b    2,0
                    dc.b     $17,0,0,0,0,8,$84,0,8,$90,$48,0,$90,$40,$30,0,$40
                    dc.b     8,$30,0,8,$24,$48,0,$24,$40,$84,0,$40,0,0,0,0,8,0
                    dcb.b    3,0
                    dc.b     $44,$82,0,$44,$28,$44,0,$28,$10,$28,0,$10,0,$10,0
                    dcb.b    2,0
                    dc.b     $10,0,0,0,$10,0,0,0,0,0,0,$17,0,0,0,0,0,$FC,0,4,4
                    dc.b     8,0,4,$28,$10,0,$28,$50,$20,0,$50,$80,$40,0,$80,0
                    dc.b     $FC,0,$80,0,0,0,0,$33,0,0,0,0,0,$C0,0,0,0,$80,0,0
                    dc.b     0,$80,0,0,0,$80,0,0,0,$80,0,0,0,$C0,0,0,0,0,0,0
                    dc.b     $17,0,0,0,0,$40,$80,0,$40,$20,$40,0,$20,$10,$20,0
                    dc.b     $10,8,$10,0,8,4,8,0,4,2,4,0,2,0,0,0,0,$33,0,0,0,0
                    dc.b     0,$C0,0,0,0,$40,0,0,0,$40,0,0,0,$40,0,0,0,$40,0,0
                    dc.b     0,$C0,0,0,0,0,0,0,$16,0,0,0,0,0,$20,0,0,$20,$50,0
                    dc.b     $20,$50,$88,0,$50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.b     9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.b     0,$FF,0,0,0,0,0,0,5,$F0,$F0,$F0,$F0,$90,$90,$90
                    dcb.b    9,$90
                    dcb.b    4,$F0
                    dcb.b    12,0
                    dc.b     5,$60,$60,$60,$60,$20,$20,$20,$20,$20,$20,$20,$20
                    dcb.b    8,$20
                    dcb.b    12,0
                    dc.b     5,$F0,$F0,$F0,$F0,$10,$10,$10,$10,$F0,$F0,$F0,$F0
                    dcb.b    4,$80
                    dcb.b    4,$F0
                    dcb.b    12,0
                    dc.b     5,$F0,$F0,$F0,$F0,$10,$10,$10,$10,$70,$70,$70,$70
                    dcb.b    4,$10
                    dcb.b    4,$F0
                    dcb.b    12,0
                    dc.b     5,$90,$90,$90,$90,$90,$90,$90,$90,$F0,$F0,$F0,$F0
                    dcb.b    8,$10
                    dcb.b    12,0
                    dc.b     5,$F0,$F0,$F0,$F0,$80,$80,$80,$80,$F0,$F0,$F0,$F0
                    dcb.b    4,$10
                    dcb.b    4,$F0
                    dcb.b    12,0
                    dc.b     5,$F0,$F0,$F0,$F0,$80,$80,$80,$80,$F0,$F0,$F0,$F0
                    dcb.b    4,$90
                    dcb.b    4,$F0
                    dcb.b    12,0
                    dc.b     5,$F0,$F0,$F0,$F0,$10,$10,$10,$10,$10,$10,$10,$10
                    dcb.b    8,$10
                    dcb.b    12,0
                    dc.b     5,$F0,$F0,$F0,$F0,$90,$90,$90,$90,$F0,$F0,$F0,$F0
                    dcb.b    4,$90
                    dcb.b    4,$F0
                    dcb.b    12,0
                    dc.b     5,$F0,$F0,$F0,$F0,$90,$90,$90,$90,$F0,$F0,$F0,$F0
                    dcb.b    4,$10
                    dcb.b    4,$F0
                    dcb.b    12,0
                    dc.b     8,$88,$88,$88,$88,$50,$50,$50,$50,$20,$20,$20,$20
                    dcb.b    4,$50
                    dcb.b    4,$88
                    dcb.b    12,0
                    dc.b     8,$88,$88,$88,$88,$50,$50,$50,$50,$20,$20,$20,$20
                    dcb.b    8,$20
                    dcb.b    12,0
                    dc.b     8,$F8,$F8,$F8,$F8,$10,$10,$10,$10,$20,$20,$20,$20
                    dcb.b    4,$40
                    dcb.b    4,$F8
                    dcb.b    13,0

DRWBLOB:            movem.l  a0-a2,-(sp)
                    jsr      CONMOV1
                    movem.l  (sp)+,a0-a2
                    move.w   2(a0),d7
                    move.l   BTE5SA,d0
                    bclr     #0,d0
                    move.l   d0,a3
DRWBLLL:            pea      $28(a3)
                    move.l   a1,a4
                    move.w   (a0),d6
DRWBLWL:            move.w   (a4)+,d0
                    bne      DRWBLMK
                    move.w   (a2)+,8000(a3)
                    move.w   (a2)+,16000(a3)
                    move.w   (a2)+,24000(a3)
                    move.w   (a2)+,32000(a3)
                    not.w    d0
                    bra      DRWBLNX

DRWBLMK:            move.w   8000(a3),d1
                    move.w   16000(a3),d2
                    move.w   24000(a3),d3
                    move.w   32000(a3),d4
                    and.w    d0,d1
                    and.w    d0,d2
                    and.w    d0,d3
                    and.w    d0,d4
                    not.w    d0
                    bne      DRWBLNZ
                    addq.w   #8,a2
                    bra      DRWBLNX

DRWBLNZ:            move.w   (a2)+,d5
                    and.w    d0,d5
                    or.w     d5,d1
                    move.w   (a2)+,d5
                    and.w    d0,d5
                    or.w     d5,d2
                    move.w   (a2)+,d5
                    and.w    d0,d5
                    or.w     d5,d3
                    move.w   (a2)+,d5
                    and.w    d0,d5
                    or.w     d5,d4
                    move.w   d1,8000(a3)
                    move.w   d2,16000(a3)
                    move.w   d3,24000(a3)
                    move.w   d4,32000(a3)
DRWBLNX:            or.w     d0,(a3)+
                    dbra     d6,DRWBLWL
                    move.l   (sp)+,a3
                    dbra     d7,DRWBLLL
                    rts

BTD4:               and.w    #$1F,d4
                    asl.w    #2,d4
                    lea      PLOTTAB,a0
                    move.l   0(a0,d4.w),a0
                    move.w   d2,d4
                    sub.w    d0,d2
                    bpl      BTD4XP
                    neg.w    d2
                    exg      d0,d4
                    exg      d1,d3
BTD4XP:             moveq    #40,d5
                    sub.w    d1,d3
                    bpl      BTD4YP
                    neg.w    d3
                    moveq    #-40,d5
BTD4YP:             move.w   d1,d4
                    asl.w    #2,d4
                    add.w    d1,d4
                    asl.w    #3,d4
                    move.w   d0,d6
                    lsr.w    #3,d6
                    and.w    #$FFFE,d6
                    add.w    d6,d4
                    add.w    d4,a6
                    move.w   d0,d6
                    not.w    d6
                    and.w    #15,d6
                    cmp.w    d3,d2
                    bgt      BTD4HH
BTD4VV:             moveq    #0,d0
                    bset     d6,d0
                    move.w   d2,d7
                    asr.w    #1,d7
                    move.w   d3,d1
BTD4VL:             jsr      (a0)
                    add.w    d5,a6
                    add.w    d2,d7
                    cmp.w    d3,d7
                    blt      BTD4VN
                    sub.w    d3,d7
                    ror.w    #1,d0
                    bpl      BTD4VN
                    addq.w   #2,a6
BTD4VN:             dbra     d1,BTD4VL
                    rts

BTD4HH:             moveq    #0,d0
                    bset     d6,d0
                    moveq    #0,d6
                    exg      d0,d6
                    move.w   d3,d7
                    asr.w    #1,d7
                    move.w   d2,d1
BTD4HL:             or.w     d6,d0
                    ror.w    #1,d6
                    bpl      BTD4HM
                    jsr      (a0)
                    moveq    #0,d0
                    addq.w   #2,a6
BTD4HM:             add.w    d3,d7
                    cmp.w    d2,d7
                    blt      BTD4HN
                    jsr      (a0)
                    moveq    #0,d0
                    sub.w    d2,d7
                    add.w    d5,a6
BTD4HN:             dbra     d1,BTD4HL
                    jsr      (a0)
                    rts

PLOTTAB:            dc.l     PLOT00
                    dc.l     PLOT01
                    dc.l     PLOT02
                    dc.l     PLOT03
                    dc.l     PLOT04
                    dc.l     PLOT05
                    dc.l     PLOT06
                    dc.l     PLOT07
                    dc.l     PLOT08
                    dc.l     PLOT09
                    dc.l     PLOT0A
                    dc.l     PLOT0B
                    dc.l     PLOT0C
                    dc.l     PLOT0D
                    dc.l     PLOT0E
                    dc.l     PLOT0F
                    dc.l     PLOTX0
                    dc.l     PLOTX1
                    dc.l     PLOTX2
                    dc.l     PLOTX3
                    dc.l     PLOTX4
                    dc.l     PLOTX5
                    dc.l     PLOTX6
                    dc.l     PLOTX7
                    dc.l     PLOTX8
                    dc.l     PLOTX9
                    dc.l     PLOTXA
                    dc.l     PLOTXB
                    dc.l     PLOTXC
                    dc.l     PLOTXD
                    dc.l     PLOTXE
                    dc.l     PLOTXF

PLOT00:             not.w    d0
                    and.w    d0,(a6)
                    and.w    d0,8000(a6)
                    and.w    d0,16000(a6)
                    and.w    d0,24000(a6)
                    not.w    d0
                    rts

PLOT01:             not.w    d0
                    and.w    d0,8000(a6)
                    and.w    d0,16000(a6)
                    and.w    d0,24000(a6)
                    not.w    d0
                    or.w     d0,(a6)
                    rts

PLOT02:             not.w    d0
                    and.w    d0,(a6)
                    and.w    d0,16000(a6)
                    and.w    d0,24000(a6)
                    not.w    d0
                    or.w     d0,8000(a6)
                    rts

PLOT03:             not.w    d0
                    and.w    d0,16000(a6)
                    and.w    d0,24000(a6)
                    not.w    d0
                    or.w     d0,8000(a6)
                    or.w     d0,(a6)
                    rts

PLOT04:             not.w    d0
                    and.w    d0,(a6)
                    and.w    d0,8000(a6)
                    and.w    d0,24000(a6)
                    not.w    d0
                    or.w     d0,16000(a6)
                    rts

PLOT05:             not.w    d0
                    and.w    d0,8000(a6)
                    and.w    d0,24000(a6)
                    not.w    d0
                    or.w     d0,16000(a6)
                    or.w     d0,(a6)
                    rts

PLOT06:             not.w    d0
                    and.w    d0,(a6)
                    and.w    d0,24000(a6)
                    not.w    d0
                    or.w     d0,16000(a6)
                    or.w     d0,8000(a6)
                    rts

PLOT07:             not.w    d0
                    and.w    d0,24000(a6)
                    not.w    d0
                    or.w     d0,16000(a6)
                    or.w     d0,8000(a6)
                    or.w     d0,(a6)
                    rts

PLOT08:             not.w    d0
                    and.w    d0,(a6)
                    and.w    d0,8000(a6)
                    and.w    d0,16000(a6)
                    not.w    d0
                    or.w     d0,24000(a6)
                    rts

PLOT09:             not.w    d0
                    and.w    d0,8000(a6)
                    and.w    d0,16000(a6)
                    not.w    d0
                    or.w     d0,24000(a6)
                    or.w     d0,(a6)
                    rts

PLOT0A:             not.w    d0
                    and.w    d0,(a6)
                    and.w    d0,16000(a6)
                    not.w    d0
                    or.w     d0,24000(a6)
                    or.w     d0,8000(a6)
                    rts

PLOT0B:             not.w    d0
                    and.w    d0,16000(a6)
                    not.w    d0
                    or.w     d0,24000(a6)
                    or.w     d0,8000(a6)
                    or.w     d0,(a6)
                    rts

PLOT0C:             not.w    d0
                    and.w    d0,(a6)
                    and.w    d0,8000(a6)
                    not.w    d0
                    or.w     d0,16000(a6)
                    or.w     d0,24000(a6)
                    rts

PLOT0D:             not.w    d0
                    and.w    d0,8000(a6)
                    not.w    d0
                    or.w     d0,24000(a6)
                    or.w     d0,16000(a6)
                    or.w     d0,(a6)
                    rts

PLOT0E:             not.w    d0
                    and.w    d0,(a6)
                    not.w    d0
                    or.w     d0,24000(a6)
                    or.w     d0,16000(a6)
                    or.w     d0,8000(a6)
                    rts

PLOT0F:             or.w     d0,24000(a6)
                    or.w     d0,16000(a6)
                    or.w     d0,8000(a6)
                    or.w     d0,(a6)
                    rts

PLOTXC:             eor.w    d0,24000(a6)
PLOTX4:             eor.w    d0,16000(a6)
                    rts

PLOTXE:             eor.w    d0,24000(a6)
PLOTX6:             eor.w    d0,16000(a6)
PLOTX2:             eor.w    d0,8000(a6)
                    rts

PLOTXD:             eor.w    d0,24000(a6)
PLOTX5:             eor.w    d0,16000(a6)
                    eor.w    d0,(a6)
                    rts

PLOTXB:             eor.w    d0,(a6)
PLOTXA:             eor.w    d0,8000(a6)
PLOTX8:             eor.w    d0,24000(a6)
                    rts

PLOTX9:             eor.w    d0,(a6)
                    eor.w    d0,24000(a6)
                    rts

PLOTXF:             eor.w    d0,24000(a6)
PLOTX7:             eor.w    d0,16000(a6)
PLOTX3:             eor.w    d0,8000(a6)
PLOTX1:             eor.w    d0,(a6)
PLOTX0:             rts

RASCOPA:            dc.l     0
RASCOPL:            dc.w     0
MOUSER:             dc.w     0
RASTROT:            dc.w     36
RASTCAK:            dc.w     0
RASTATA:            dc.w     72
RASTAAK:            dc.w     0
RASEQLL:            dc.w     0
SEED:               dc.w     25412

RASTSET:            move.l   $6C.w,a0
                    move.l   a0,RASTOUT+2
                    move.l   #RASTINT,$6C.w
                    move.w   $DFF00A,MOUSELAST
                    move.w   #160,MOUSEX
                    move.w   #100,MOUSEY
                    rts

RASTINT:            movem.l  d0-d7/a0-a2,-(sp)
                    move.l   BTE5SA,-(sp)
                    move.w   BTE5HL,-(sp)
                    move.w   BTE5SS,-(sp)
                    move.w   $DFF016,MOUSER
                    tst.w    RASCOPL
                    bmi      RASTSKP
                    move.l   RASCOPA,a0
                    move.l   COPPER_LST,a1
                    move.w   RASCOPL,d7
RASTLP:             move.l   (a0)+,(a1)+
                    dbra     d7,RASTLP
                    move.w   d7,RASCOPL
RASTSKP:            addq.l   #1,FIFCLOCK
                    jsr      MOUSE
                    jsr      CURSOR
                    addq.w   #1,CMCKTK
                    subq.w   #1,CMDLCT
                    tst.w    CMCLAK
                    beq      RASTN1S
                    subq.w   #1,CMCLCT
                    bpl      RASTN1S
                    move.w   #$32,CMCLCT
                    moveq    #$2F,d1
                    lea      CMCLCK+7,a0
                    subq.b   #1,(a0)
                    cmp.b    (a0),d1
                    bne      RASTDC
                    move.b   #$39,(a0)
                    subq.l   #1,a0
                    subq.b   #1,(a0)
                    cmp.b    (a0),d1
                    bne      RASTDC
                    move.b   #$35,(a0)
                    subq.w   #1,CMENER
                    beq      RASTEG
                    addq.b   #1,lbB004075
                    addq.b   #1,lbB004076
                    move.w   d1,-(sp)
                    move.w   #11,d0
                    move.w   #$BA,d1
                    movem.l  a0-a6,-(sp)
                    move.w   CMENER,d7
                    jsr      BTE8
                    movem.l  (sp)+,a0-a6
                    move.w   (sp)+,d1
                    bra.b    RASTMIN

RASTEG:             move.w   #3,CMGMOV
                    bra.w    RASTEND

RASTMIN:            subq.w   #2,a0
                    subq.b   #1,(a0)
                    cmp.b    (a0),d1
                    bne.b    RASTDC
                    move.b   #$39,(a0)
                    subq.w   #1,a0
                    subq.b   #1,(a0)
                    cmp.b    (a0),d1
                    bne.b    RASTDC
                    move.b   #$35,(a0)
                    subq.w   #2,a0
                    subq.b   #1,(a0)
                    cmp.b    (a0),d1
                    bne.b    RASTDC
                    move.b   #$39,(a0)
                    subq.w   #1,a0
                    subq.b   #1,(a0)
                    cmp.b    (a0),d1
                    bne.b    RASTDC
                    move.w   #2,CMGMOV
                    bra      RASTEND

RASTDC:             movem.l  a3-a6,-(sp)
                    move.w   BTE5HT,-(sp)
                    move.w   BTE5PS,-(sp)
                    clr.w    BTE5PS
                    move.w   #7,BTE5HT
                    move.w   #$D1,d0
                    move.w   #7,d1
                    jsr      CONMOV1
                    clr.w    BTE5HL
                    lea      CMCLCK,a0
                    move.w   #8,d0
                    jsr      CONPLT
                    move.w   (sp)+,BTE5PS
                    move.w   (sp)+,BTE5HT
                    movem.l  (sp)+,a3-a6
RASTN1S:            move.w   RASTROT,d0
                    cmp.w    CMYROT,d0
                    beq      RASTATT
                    tst.w    RASTCAK
                    beq      RASTATT
                    moveq    #1,d2
                    move.w   CMYROT,d1
                    cmp.w    d1,d0
                    bgt.b    RASTATG
                    sub.w    d0,d1
                    move.w   d1,d0
                    sub.w    #$48,d0
                    neg.w    d0
                    bra.b    RASTCMP

RASTATG:            sub.w    d1,d0
                    move.w   d0,d1
                    sub.w    #$48,d1
                    neg.w    d1
RASTCMP:            cmp.w    d0,d1
                    blt.b    RASTCMM
                    neg.w    d2
RASTCMM:            move.w   RASTROT,d0
                    add.w    d2,d0
                    bpl.b    RASTCM2
                    add.w    #$48,d0
                    bra.b    RASTCM1

RASTCM2:            cmp.w    #$48,d0
                    blt.b    RASTCM1
                    sub.w    #$48,d0
RASTCM1:            move.w   d0,RASTROT
                    lea      SPRCBG,a2
                    lea      SPRCBW,a0
                    lea      SPRCBM,a1
                    move.w   #$32,d0
                    move.w   #$8E,d1
                    movem.l  d3/d4/a2-a4,-(sp)
                    jsr      DRWBLOB
                    movem.l  (sp)+,d3/d4/a2-a4
                    movem.l  d3/d4,-(sp)
                    move.l   BTE5SA,a0
                    lea      $28(a0),a0
                    lea      SPRCOG,a1
                    move.l   SPRCOM,d0
                    move.w   RASTROT,d1
                    lsr.w    #3,d1
                    bclr     #0,d1
                    add.w    d1,a1
                    move.w   RASTROT,d1
                    and.w    #15,d1
                    moveq    #4,d3
RASTCLP:            move.l   (a1)+,d2
                    moveq    #0,d4
                    move.w   (a1)+,d4
                    lsl.l    d1,d2
                    lsl.l    d1,d4
                    swap     d4
                    or.w     d4,d2
                    and.l    d0,d2
                    or.l     d2,16000(a0)
                    not.l    d2
                    and.l    d2,8000(a0)
                    and.l    d2,24000(a0)
                    and.l    d2,32000(a0)
                    lea      40(a0),a0
                    addq.w   #8,a1
                    dbra     d3,RASTCLP
                    movem.l  (sp)+,d3/d4
RASTATT:            tst.w    RASTAAK
                    beq      RASTRIG
                    move.w   RASTATA,d0
                    move.w   CMXROT,d1
                    add.w    d1,d1
                    add.w    d1,d1
                    cmp.w    d1,d0
                    beq      RASTRIG
                    moveq    #1,d2
                    cmp.w    d1,d0
                    bgt      RASTAT2
                    sub.w    d0,d1
                    move.w   d1,d0
                    sub.w    #288,d0
                    neg.w    d0
                    bra      RASTAT3

RASTAT2:            sub.w    d1,d0
                    move.w   d0,d1
                    sub.w    #288,d1
                    neg.w    d1
RASTAT3:            cmp.w    d0,d1
                    blt      RASTAT4
                    neg.w    d2
RASTAT4:            move.w   RASTATA,d0
                    add.w    d2,d0
                    bpl      RASTAT5
                    add.w    #288,d0
                    bra      RASTAT6

RASTAT5:            cmp.w    #288,d0
                    blt      RASTAT6
                    sub.w    #288,d0
RASTAT6:            move.w   d0,RASTATA
                    lea      SPRATT,a2
                    lea      SPRATW,a0
                    lea      SPRATM,a1
                    move.w   RASTATA,d0
                    cmp.w    #144,d0
                    blt      RASTAT7
                    sub.w    #144,d0
RASTAT7:            mulu     4(a0),d0
                    add.w    d0,a2
                    moveq    #$4E,d0
                    move.w   #$89,d1
                    movem.l  a2-a4,-(sp)
                    jsr      DRWBLOB
                    movem.l  (sp)+,a2-a4
RASTRIG:            tst.w    CMRBAK
                    beq      RASTENR
                    subq.w   #1,CMRBLD
                    bpl      RASTENR
                    move.w   #6,CMRBLD
                    move.l   CMRBLA,a2
                    lea      SPRIGW,a0
                    lea      SPRIGM,a1
                    move.w   #$11A,d0
                    move.w   #$8F,d1
                    movem.l  a2-a4,-(sp)
                    jsr      DRWBLOB
                    movem.l  (sp)+,a2-a4
                    move.w   CMRBLO,d0
                    add.w    d0,a2
                    subq.w   #1,CMRBLN
                    bpl      RASTNXQ
                    move.w   #4,CMRBLN
                    move.l   CMRBLB,a2
RASTNXQ:            move.l   a2,CMRBLA
RASTENR:            tst.w    CMEBAK
                    beq      RASTEQL
                    subq.w   #1,CMFLSH
                    bpl      RASTEQL
                    move.w   #$14,CMFLSH
                    lea      SPRENW,a0
                    move.w   4(a0),d0
                    eor.w    d0,CMFLSH2
                    moveq    #0,d0
                    cmp.w    #14,CMENER
                    bge      RASTNER
                    move.w   CMFLSH2,d0
RASTNER:            lea      SPRENM,a1
                    lea      SPRENG,a2
                    add.w    d0,a2
                    moveq    #$52,d0
                    move.w   #$BA,d1
                    movem.l  a2-a4,-(sp)
                    jsr      DRWBLOB
                    movem.l  (sp)+,a2-a4
                    moveq    #0,d0
                    cmp.w    #14,CMSHLD
                    bge      RASTNSD
                    move.w   CMFLSH2,d0
RASTNSD:            lea      SPRSHW,a0
                    lea      SPRSHM,a1
                    lea      SPRSHL,a2
                    add.w    d0,a2
                    moveq    #$52,d0
                    move.w   #$B3,d1
                    movem.l  a2-a4,-(sp)
                    jsr      DRWBLOB
                    movem.l  (sp)+,a2-a4
RASTEQL:            tst.w    CMQBAK
                    beq      RASTSHT
                    move.w   CMCKTK,d0
                    and.w    #3,d0
                    bne      RASTSHT
                    lea      SPREQW,a0
                    lea      SPREQM,a1
                    lea      SPREQL,a2
                    move.w   RASEQLL,d0
                    tst.w    SNDON
                    beq      RASTEQ2
                    jsr      RANDOM
                    and.w    #$1E0,d0
                    add.w    #2048,d0
RASTEQ4:            move.w   d0,RASEQLL
RASTEQ3:            add.w    RASEQLL,a2
                    moveq    #$31,d0
                    moveq    #1,d1
                    movem.l  a2-a4,-(sp)
                    jsr      DRWBLOB
                    movem.l  (sp)+,a2-a4
                    bra      RASTSHT

RASTEQ2:            sub.w    4(a0),d0
                    bpl      RASTEQ4
                    jsr      RANDOM
                    and.w    #$1E0,d0
                    bra      RASTEQ4

RASTSHT:            btst     #0,CMINTR
                    bne      BTE906
                    btst     #2,CMINTR
                    bne      RASTEND
BTE906:             bclr     #0,CMINTR
                    move.w   CMSHT2,d2
                    beq      RASTEND
                    subq.w   #1,d2
                    lea      CMSHI2,a0
BTE902:             addq.w   #1,4(a0)
                    move.w   4(a0),d1
                    cmp.w    2(a0),d1
                    blt      BTE917
                    clr.w    4(a0)
BTE917:             tst.w    6(a0)
                    beq      BTE904
                    tst.w    4(a0)
                    bne      BTE918
                    movem.l  d2/a0-a6,-(sp)
                    moveq    #2,d0
                    jsr      BTF9
                    movem.l  (sp)+,d2/a0-a6
                    bset     #0,CMINTR
                    move.l   COPPER_LST,a1
                    move.w   #$F00,(COPCOL-NEWCOPPER)+2(a1)
                    btst     #1,CMINTR
                    bne      BTE919
                    move.w   6(a0),d1
                    cmp.w    #1,d1
                    beq      BTE922
                    bra      BTE919

BTE918:             move.l   COPPER_LST,a1
                    move.w   COLUP,(COPCOL-NEWCOPPER)+2(a1)
                    btst     #1,CMINTR
                    bne      BTE921
                    move.w   6(a0),d1
                    cmp.w    #1,d1
                    bne      BTE904
                    move.w   4(a0),d0
                    cmp.w    #2,d0
                    beq      BTE922
                    bra      BTE904

BTE921:             move.w   4(a0),d0
                    cmp.w    #2,d0
                    beq      BTE919
                    cmp.w    #1,d0
                    bne      BTE904
                    bset     #0,CMINTR
                    bra      BTE904

BTE922:             movem.l  d2-d7/a3/a5/a6,-(sp)
                    move.l   a0,a3
                    move.l   DISPLAY_SEG1,a6
                    add.w    #$1F40,a6
                    move.l   a6,a5
                    move.w   8(a3),d0
                    move.w   #$C7,d1
                    sub.w    10(a3),d1
                    moveq    #$24,d2
                    moveq    #$75,d3
                    moveq    #$17,d4
                    jsr      BTD4
                    move.l   a5,a6
                    move.w   8(a3),d0
                    move.w   #$C7,d1
                    sub.w    10(a3),d1
                    move.w   #$11B,d2
                    moveq    #$75,d3
                    moveq    #$17,d4
                    jsr      BTD4
                    move.l   a5,a6
                    move.w   8(a3),d0
                    move.w   #$C7,d1
                    sub.w    10(a3),d1
                    move.w   #$11B,d2
                    moveq    #$10,d3
                    moveq    #$18,d4
                    jsr      BTD4
                    move.l   a5,a6
                    move.w   8(a3),d0
                    move.w   #$C7,d1
                    sub.w    10(a3),d1
                    moveq    #$24,d2
                    moveq    #$10,d3
                    moveq    #$18,d4
                    jsr      BTD4
                    move.l   a5,a6
                    move.w   8(a3),d0
                    move.w   #$C7,d1
                    sub.w    10(a3),d1
                    move.w   #$A0,d2
                    moveq    #$10,d3
                    moveq    #$19,d4
                    jsr      BTD4
                    move.l   a5,a6
                    move.w   8(a3),d0
                    move.w   #$C7,d1
                    sub.w    10(a3),d1
                    move.w   #$A0,d2
                    moveq    #$75,d3
                    moveq    #$19,d4
                    jsr      BTD4
                    move.l   a5,a6
                    move.w   8(a3),d0
                    move.w   #$C7,d1
                    sub.w    10(a3),d1
                    moveq    #$24,d2
                    moveq    #$50,d3
                    moveq    #$1A,d4
                    jsr      BTD4
                    move.l   a5,a6
                    move.w   8(a3),d0
                    move.w   #$C7,d1
                    sub.w    10(a3),d1
                    move.w   #$11B,d2
                    moveq    #$50,d3
                    moveq    #$1A,d4
                    jsr      BTD4
                    move.l   a3,a0
                    movem.l  (sp)+,d2-d7/a3/a5/a6
BTE919:             tst.w    4(a0)
                    bne      BTE904
                    subq.w   #1,CMSHLD
                    bmi      BTE909
                    move.w   #11,d0
                    move.w   #$B2,d1
                    movem.l  d2/a0-a4,-(sp)
                    move.w   CMSHLD,d7
                    jsr      BTE8
                    movem.l  (sp)+,d2/a0-a4
                    bra      BTE904

BTE909:             move.w   #1,CMGMOV
                    bra      RASTEND

BTE904:             lea      12(a0),a0
                    dbra     d2,BTE902
RASTEND:            move.w   (sp)+,BTE5SS
                    move.w   (sp)+,BTE5HL
                    move.l   (sp)+,BTE5SA
                    move.w   $DFF01E,d0
                    and.w    #$70,d0
                    move.w   d0,$DFF09C
                    movem.l  (sp)+,d0-d7/a0-a2
                    rte

RASTOUT:            jmp      RASTOUT

RASTOFF:            move.l   RASTOUT+2,$6C.w
                    rts

RANDOM:             move.w   SEED,d0
                    addq.w   #1,d0
                    mulu     #$4B,d0
                    subq.w   #1,d0
                    move.w   d0,SEED
                    rts

BTAM4:              move.w   #$A0,d0
                    move.w   #$83,d1
                    jsr      CONMOV1
                    move.l   BTE5SA,a0
                    move.l   #$39CE7FFF,d1
                    move.l   d1,d2
                    not.l    d2
                    move.l   d1,d3
                    not.l    d3
                    move.b   CMIND,d0
                    cmp.b    #4,d0
                    beq      BTAM4DS
                    moveq    #0,d2
                    moveq    #0,d3
                    btst     #0,CMDLCT+1
                    beq      BTAM40
                    or.l     #$C0000000,d2
BTAM40:             btst     #1,CMDLCT+1
                    beq      BTAM41
                    or.l     #$6000000,d2
BTAM41:             btst     #2,CMDLCT+1
                    beq      BTAM42
                    or.l     #$300000,d2
BTAM42:             btst     #3,CMDLCT+1
                    beq      BTAM43
                    or.l     #$18000,d2
BTAM43:             btst     #4,CMDLCT+1
                    beq      BTAM44
                    or.l     #$C0000000,d3
BTAM44:             btst     #5,CMDLCT+1
                    beq      BTAM45
                    or.l     #$6000000,d3
BTAM45:             btst     #6,CMDLCT+1
                    beq      BTAM46
                    or.l     #$300000,d3
BTAM46:             btst     #7,CMDLCT+1
                    beq      BTAM4DS
                    or.l     #$18000,d3
BTAM4DS:            and.l    d1,(a0)
                    and.l    d1,8000(a0)
                    and.l    d1,16000(a0)
                    and.l    d1,24000(a0)
                    and.l    d1,32000(a0)
                    and.l    d1,160(a0)
                    and.l    d1,8160(a0)
                    and.l    d1,16160(a0)
                    and.l    d1,24160(a0)
                    and.l    d1,32160(a0)
                    or.l     d2,(a0)
                    or.l     d2,16000(a0)
                    or.l     d3,$A0(a0)
                    or.l     d3,16160(a0)
                    cmp.b    #4,d0
                    bne      BTAM4EX
                    clr.w    CMIND
                    rts

BTAM4EX:            addq.b   #1,CMIND
                    rts

SPRITINIT:          move.l   BIZSPBASE,d1
                    asl.w    #8,d0
                    add.w    d0,d1
                    move.w   d1,sp1+6
                    swap     d1
                    move.w   d1,sp1+2
                    swap     d1
                    move.l   d1,a1
SPRITINITLP:        move.l   (a0)+,(a1)+
                    bne      SPRITINITLP
                    jsr      BIZCOPCOP
SPITINITEX:         rts

CURDEFSZ:           dc.w     8

CURSOR:             tst.w    MOUSEM
                    beq      CURSOREX
                    clr.w    MOUSEM
                    movem.l  d0/d1/a0,-(sp)
                    move.l   BIZSPBASE,a0
                    clr.w    d1
                    move.w   MOUSEY,d0
                    add.w    #$29,d0
                    move.b   d0,(a0)
                    move.b   MOUSEY,d0
                    add.w    #$29,d0
                    ror.w    #1,d0
                    rol.w    #1,d1
                    move.w   MOUSEY,d0
                    add.w    CURDEFSZ,d0
                    add.w    #$29,d0
                    rol.w    #1,d1
                    move.b   d0,2(a0)
                    move.w   MOUSEX,d0
                    add.w    #$79,d0
                    roxr.w   #1,d0
                    roxl.w   #1,d1
                    move.b   d0,1(a0)
                    move.b   d1,3(a0)
                    movem.l  (sp)+,d0/d1/a0
CURSOREX:           rts

SPRON:              rts

SPROFF:             rts

SNDBUF:             dc.l     0
SNDREP:             dc.w     0
SNDOLD:             dc.l     0
SNDVOL:             dc.w     64
SNDON:              dc.w     0

BTF9:               subq.w   #1,d0
                    bmi      BTF9EX
                    movem.l  d1/a0/a1,-(sp)
                    move.w   #1,$DFF096
                    move.w   #$80,$DFF09A
                    move.w   #$FF,$DFF09E
                    move.w   #$FA0,d1
BTF903:             dbra     d1,BTF903
                    lea      SNDIDX,a1
                    move.l   SNDBUF,a0
BTF900:             move.l   (a0)+,d1
                    addq.w   #2,a0
                    move.w   (a1)+,SNDREP
                    dbra     d0,BTF901
                    bra      BTF902

BTF901:             add.l    d1,a0
                    bra      BTF900

BTF902:             move.l   a0,$DFF0A0
                    move.w   SNDVOL,$DFF0A8
                    move.w   #$168,$DFF0A6
                    lsr.w    #1,d1
                    move.w   d1,$DFF0A4
                    st       SNDON
                    move.w   #$8080,$DFF09A
                    move.w   #$8201,$DFF096
                    movem.l  (sp)+,d1/a0/a1
BTF9EX:             rts

SNDINIT:            move.l   $70.w,SNDOLD
                    move.l   #SNDINT,$70.w
                    move.l   SNDBUF,$DFF0D0
                    move.w   #0,$DFF0D8
                    move.w   #$1BF,$DFF0D6
                    move.w   #8,$DFF0D4
                    move.w   #$8400,$DFF09A
                    move.w   #$8208,$DFF096
                    rts

SNDOFF:             move.w   #9,$DFF096
                    move.w   #$480,$DFF09A
                    move.l   SNDOLD,$70.w
                    rts

SHUTUP:             clr.w    SNDREP
                    move.w   #1,$DFF096
                    move.w   #$80,$DFF09A
                    rts

SNDINT:             move.w   d0,-(sp)
                    move.w   $DFF01E,d0
                    and.w    #$780,d0
                    btst     #7,d0
                    bne      SNDINT0
                    addq.w   #1,CMFIFTM
                    bra      SNDINT1

SNDINT0:            subq.w   #1,SNDREP
                    bpl      SNDINT1
                    move.w   #1,$DFF096
                    move.w   #$80,$DFF09A
                    clr.w    SNDON
SNDINT1:            move.w   d0,$DFF09C
                    move.w   (sp)+,d0
                    rte

DRAWCON:            lea      BITMAPH+4,a0
                    lea      BIZSPRCOLS,a1
                    move.w   #15,d7
DRAWCOL:            move.w   (a0)+,d0
                    and.w    #$777,d0
                    add.w    d0,d0
                    move.w   d0,(a1)+
                    dbra     d7,DRAWCOL
                    jsr      BIZCOPCOP
                    lea      LIFMAP,a3
                    move.l   DISPLAY_SEG1,a0
                    add.w    #32000,a0
                    move.l   DISPLAY_SEG2,a2
                    add.w    #32000,a2
                    lea      BITMAP,a1
                    move.w   #320-1,d7
DRAWCLP:            move.w   (a1),d0
                    move.w   d0,-24000(a2)
                    move.w   (a1)+,-24000(a0)
                    or.w     (a1),d0
                    move.w   (a1),-16000(a2)
                    move.w   (a1)+,-16000(a0)
                    or.w     (a1),d0
                    move.w   (a1),-8000(a2)
                    move.w   (a1)+,-8000(a0)
                    or.w     (a1),d0
                    move.w   d0,-32000(a0)
                    move.w   d0,-32000(a2)
                    move.w   (a1),(a2)+
                    move.w   (a1)+,(a0)+
                    dbra     d7,DRAWCLP
                    move.w   #2040-1,d7
DRAWCL1:            move.w   (a1)+,d0
                    move.w   d0,-24000(a2)
                    move.w   (a3)+,-24000(a0)
                    or.w     (a1),d0
                    move.w   (a1)+,-16000(a2)
                    move.w   (a3)+,-16000(a0)
                    or.w     (a1),d0
                    move.w   (a1)+,-8000(a2)
                    move.w   (a3)+,-8000(a0)
                    or.w     (a1),d0
                    move.w   #-1,-32000(a0)
                    move.w   d0,-32000(a2)
                    move.w   (a1)+,(a2)+
                    move.w   (a3)+,(a0)+
                    dbra     d7,DRAWCL1
                    move.w   #1640-1,d7
DRAWCL2:            move.w   (a1),d0
                    move.w   d0,-24000(a2)
                    move.w   (a1)+,-24000(a0)
                    or.w     (a1),d0
                    move.w   (a1),-16000(a2)
                    move.w   (a1)+,-16000(a0)
                    or.w     (a1),d0
                    move.w   (a1),-8000(a2)
                    move.w   (a1)+,-8000(a0)
                    or.w     (a1),d0
                    move.w   d0,-32000(a0)
                    move.w   d0,-32000(a2)
                    move.w   (a1),(a2)+
                    move.w   (a1)+,(a0)+
                    dbra     d7,DRAWCL2
                    rts

HANDLE:             dc.l     0
BUFFER:             dc.l     0
FILENAME:           dc.l     0
BLENGTH:            dc.l     0

BSAVE:              move.l   a0,BUFFER
                    move.l   a1,FILENAME
                    move.l   d7,BLENGTH
                    move.l   4.w,a6
                    move.l   #DosName,a1
                    moveq    #0,d0
                    jsr      -552(a6)
                    tst.l    d0
                    beq      ABORT
                    move.l   d0,a6
                    move.l   FILENAME,d1
                    move.l   #$3EE,d2
                    jsr      -30(a6)
                    move.l   d0,HANDLE
                    beq      ABORT
                    move.l   HANDLE,d1
                    move.l   BUFFER,d2
                    move.l   BLENGTH,d3
                    jsr      -48(a6)
                    cmp.l    #-1,d0
                    beq      ABORT
                    move.l   HANDLE,d1
                    jsr      -36(a6)
                    moveq    #0,d0
                    rts

ABORT:              moveq    #-1,d0
                    rts

BLOAD:              move.l   a0,BUFFER
                    move.l   a1,FILENAME
                    move.l   d7,BLENGTH
                    move.l   4.w,a6
                    move.l   #DosName,a1
                    moveq    #0,d0
                    jsr      -552(a6)
                    tst.l    d0
                    beq      ABORT
                    move.l   d0,a6
                    move.l   FILENAME,d1
                    move.l   #$3ED,d2
                    jsr      -30(a6)
                    move.l   d0,HANDLE
                    beq      ABORT
                    move.l   HANDLE,d1
                    move.l   BUFFER,d2
                    move.l   BLENGTH,d3
                    jsr      -42(a6)
                    cmp.l    #$FFFFFFFF,d0
                    beq      ABORT
                    move.l   HANDLE,d1
                    jsr      -36(a6)
                    moveq    #0,d0
                    rts

LIFT:               move.w   #1,CMDLCT
LIFT2:              tst.w    CMDLCT
                    bge      LIFT2
LIFT_GO:            move.l   DISPLAY_SEG1,a6
                    add.w    #8640,a6
                    move.l   DISPLAY_SEG2,a0
                    add.w    #8640,a0
                    lea      LIFMAP,a1
                    move.w   d0,d3
                    asl.w    #2,d3
                    add.w    d0,d3
                    asl.w    #5,d3
                    add.w    d3,a1
                    move.w   CMSY,d3
                    subq.w   #1,d3
                    add.w    d3,d3
                    sub.w    d1,d3
                    sub.w    d2,d3
                    bpl      LIFTOK
                    moveq    #0,d3
LIFTOK:             dbra     d1,LIFBGL0
                    bra      LIFTBLK

LIFBGL0:            move.w   d1,d4
                    add.w    d2,d4
LIFBGL1:            moveq    #10-1,d0
LIFBGL2:            move.l   24000(a0),24000(a6)
                    move.l   16000(a0),16000(a6)
                    move.l   8000(a0),8000(a6)
                    move.l   -8000(a0),-8000(a6)
                    move.l   (a0)+,(a6)+
                    dbra     d0,LIFBGL2
                    dbra     d1,LIFBGL1
LIFTBLK:            dbra     d2,LIFBLK0
                    bra      LIFTLIF

LIFBLK0:            moveq    #0,d4
LIFBLK1:            moveq    #10-1,d0
LIFBLK2:            move.l   d4,24000(a6)
                    move.l   d4,16000(a6)
                    move.l   d4,8000(a6)
                    move.l   d4,-8000(a6)
                    move.l   d4,(a6)+
                    dbra     d0,LIFBLK2
                    dbra     d2,LIFBLK1
LIFTLIF:            moveq    #-1,d4
                    dbra     d3,LIFLIF1
                    bra      LIFTEND

LIFLIF1:            moveq    #20-1,d0
LIFLIF2:            move.w   (a1)+,(a6)+
                    move.w   (a1)+,7998(a6)
                    move.w   (a1)+,15998(a6)
                    move.w   (a1)+,23998(a6)
                    move.w   d4,-8002(a6)
                    dbra     d0,LIFLIF2
                    dbra     d3,LIFLIF1
LIFTEND:            rts

LIFTDN0:            jsr      SPROFF
                    moveq    #$10,d0
                    jsr      BTF9
                    moveq    #$60,d0
                    bra      LIFTDN2

LIFTDN:             jsr      SPROFF
                    moveq    #$10,d0
                    jsr      BTF9
                    moveq    #0,d0
LIFTDN2:            moveq    #2,d1
                    moveq    #1,d2
                    moveq    #$31,d3
LINFDL:             movem.w  d0-d3,-(sp)
                    bsr      LIFT
                    movem.w  (sp)+,d0-d3
                    addq.w   #2,d1
                    dbra     d3,LINFDL
                    moveq    #0,d0
                    moveq    #$66,d1
                    moveq    #0,d2
                    bsr      LIFT
                    jsr      SPRON
                    moveq    #$12,d0
                    jsr      BTF9
                    rts

LIFTUP0:            jsr      SPROFF
                    moveq    #$10,d0
                    jsr      BTF9
                    moveq    #$60,d0
                    bra      LIFTUP2

LIFTUP:             jsr      SPROFF
                    moveq    #$10,d0
                    jsr      BTF9
                    moveq    #0,d0
LIFTUP2:            moveq    #$65,d1
                    moveq    #1,d2
                    moveq    #$31,d3
LINFUL:             movem.w  d0-d3,-(sp)
                    bsr      LIFT
                    movem.w  (sp)+,d0-d3
                    subq.w   #2,d1
                    dbra     d3,LINFUL
                    moveq    #0,d1
                    moveq    #0,d2
                    bsr      LIFT
                    jsr      SPRON
                    moveq    #$12,d0
                    jsr      BTF9
                    rts

LIFSUP:             jsr      SPROFF
                    moveq    #$10,d0
                    jsr      BTF9
                    moveq    #0,d0
                    moveq    #0,d1
                    moveq    #0,d2
                    moveq    #$2F,d3
LIFSUL:             movem.w  d0-d3,-(sp)
                    bsr      LIFT
                    movem.w  (sp)+,d0-d3
                    addq.w   #2,d0
                    dbra     d3,LIFSUL
                    jsr      SPRON
                    moveq    #$12,d0
                    jsr      BTF9
                    rts

LIFSDN:             jsr      SPROFF
                    moveq    #$10,d0
                    jsr      BTF9
                    moveq    #$60,d0
                    moveq    #0,d1
                    moveq    #0,d2
                    moveq    #$2F,d3
LIFSDL:             movem.w  d0-d3,-(sp)
                    bsr      LIFT
                    movem.w  (sp)+,d0-d3
                    subq.w   #2,d0
                    dbra     d3,LIFSDL
                    jsr      SPRON
                    moveq    #$12,d0
                    jsr      BTF9
                    rts

CENTROF:            dc.w     0
CROSSBP:            dc.l     $8000,$8000,$8000,0,0,$1C1C00,0,0,$8000,$8000
                    dc.l     $8000

CENTRE:             tst.w    CENTROF
                    bne      CENEND
                    move.w   CMSCX,d0
                    sub.w    #$10,d0
                    move.w   #$C2,d1
                    sub.w    CMSCY,d1
                    jsr      CONMOV
                    move.l   BTE5SA,d0
                    bclr     #0,d0
                    move.l   d0,a0
                    lea      CROSSBP,a1
                    moveq    #11-1,d7
CENLP:              move.w   (a1)+,d0
                    or.w     d0,32000(a0)
                    or.w     d0,8000(a0)
                    or.w     d0,16000(a0)
                    or.w     d0,24000(a0)
                    move.w   (a1)+,d0
                    or.w     d0,32000+2(a0)
                    or.w     d0,8000+2(a0)
                    or.w     d0,16000+2(a0)
                    or.w     d0,24000+2(a0)
                    lea      40(a0),a0
                    dbra     d7,CENLP
CENEND:             rts

KYBDKT:             dcb.l    28,0
KYBDLU:             dc.b     $FF,$31,$32,$33,$34,$35,$36,$37,$38,$39,$30,$2D
                    dc.b     $3D,$5C,0,$30,$51,$57,$45,$52,$54,$59,$55,$49,$4F
                    dc.b     $50,$5B,$5D,0,$31,$32,$33,$41,$53,$44,$46,$47,$48
                    dc.b     $4A,$4B,$4C,$3B,$23,0,0,$34,$35,$36,0,$5A,$58,$43
                    dc.b     $56,$42,$4E,$4D,$2C,$2E,$2F,0,$2E,$37,$38,$39,$20
                    dc.b     8,0,13,13,$1B,0,0,0,0,$2D,0,$96,$97,$98,$99,$5A
                    dc.b     $5B,$5C,$5D,$5E,$5F,$60,$61,$62,$63,0,0,0,0,0,0
                    dc.b     $64,$65,$66,$67,$68,$69,$6A,$6B,0,0,0,0

KYBD_INT:           move.w   #104-1,d0
                    lea      KYBDKT,a0
KYBD_INT01:         clr.b    (a0)+
                    dbra     d0,KYBD_INT01
                    move.l   $68.w,a0
                    move.l   a0,KYBDOUT+2
                    move.l   #KYBD,$68.w
                    rts

KYBD:               movem.l  d0/d1/a0,-(sp)
                    lea      KYBDKT,a0
                    move.l   #$FFFFFFFF,d0
KYBD99:             move.b   $BFEC01,d0
                    cmp.b    $BFEC01,d0
                    bne      KYBD99
                    cmp.b    $BFEC01,d0
                    bne      KYBD99
                    move.w   d0,d1
                    and.l    #$FFFFFFFE,d0
                    add.l    #2,d0
                    lsr.l    #1,d0
                    neg.l    d0
                    cmp.b    #$F9,d0
                    bhi      KYBDEXIT
                    and.w    #$7F,d0
                    cmp.b    #$69,d0
                    bhi      KYBDEXIT
                    btst     #0,d1
                    bne      KYBD_DN
                    bclr     #0,0(a0,d0.w)
                    bra      KYBDEXIT

KYBD_DN:            bset     #0,0(a0,d0.w)
KYBDEXIT:           movem.l  (sp)+,d0/d1/a0
KYBDOUT:            jmp      KYBDOUT

                    rte

KEYBOARD:           lea      KYBDKT,a0
                    lea      KYBDLU,a1
                    lea      CMKYBF,a2
                    clr.w    CMKYCT
                    move.w   #104-1,d0
KEYBOARD02:         btst     #0,(a0)+
                    beq      KEYBOARD01
                    move.b   (a1),(a2)+
                    addq.w   #1,CMKYCT
                    cmp.w    #5,CMKYCT
                    beq      KEYBOARDEXIT
KEYBOARD01:         addq.w   #1,a1
                    dbra     d0,KEYBOARD02
KEYBOARDEXIT:       rts

KEYCLEAR:           lea      KYBDKT,a0
                    move.w   #104-1,d0
KEYCLEAR1:          clr.b    (a0)+
                    dbra     d0,KEYCLEAR1
                    rts

KYBDOFF:            move.l   KYBDOUT+2,a0
                    move.l   a0,$68.w
                    rts

MOUSEM:             dc.w     0
MOUSELAST:          dc.w     0
MOUSEX:             dc.w     0
MOUSEY:             dc.w     0

MOUSE:              movem.l  d0-d3,-(sp)
                    move.w   $DFF00A,d0
                    cmp.w    MOUSELAST,d0
                    beq      MOUSEEX
                    move.w   #$FFFF,MOUSEM
                    move.w   MOUSELAST,d1
                    move.w   d0,MOUSELAST
                    move.w   d0,d2
                    move.w   d1,d3
                    and.w    #$FF,d0
                    and.w    #$FF,d1
                    cmp.w    #1,DEMOMOD
                    beq      MOUSEEX
                    sub.w    d0,d1
                    ext.w    d1
                    sub.w    d1,MOUSEX
                    cmp.w    #5,MOUSEX
                    bgt      MOUSEDX01
                    move.w   #5,MOUSEX
                    bra      MOUSEDY

MOUSEDX01:          cmp.w    #314,MOUSEX
                    bls      MOUSEDY
                    move.w   #314,MOUSEX
MOUSEDY:            lsr.w    #8,d2
                    lsr.w    #8,d3
                    sub.w    d2,d3
                    ext.w    d3
                    asr.w    #1,d3
                    sub.w    d3,MOUSEY
                    cmp.w    #3,MOUSEY
                    bpl      MOUSEDY01
                    move.w   #3,MOUSEY
                    jmp      MOUSEEX

MOUSEDY01:          cmp.w    #196,MOUSEY
                    bls      MOUSEEX
                    move.w   #196,MOUSEY
MOUSEEX:            movem.l  (sp)+,d0-d3
                    rts

BTC2:               add.w    #1,$DFF180
                    jmp      BTC2

BTC4:               add.w    #1,$DFF180
                    jmp      BTC4

SPLITON:            rts

SPLITOFF:           rts

MAIN:               lea      DIVIDE_ERROR,a0
                    move.l   a0,$14.w
                    move.w   #160,MOUSEX
                    move.w   #100,MOUSEY
                    st       MOUSEM
                    clr.w    CMCLAK
                    clr.w    RASTAAK
                    clr.w    RASTCAK
                    clr.w    CMEBAK
                    clr.w    CMQBAK
                    clr.w    CMDVAL
                    clr.w    CMFLSH2
                    move.w   lbW003358,SISMD1S
                    bset     #1,CMDEBUG
                    jsr      LOADMAP
                    jsr      LOADDFL
                    jsr      DEMOLOD
                    jsr      BIZINT
                    jsr      SNDINIT
                    jsr      KYBD_INT
                    moveq    #$18,d0
                    jsr      BTF9
                    jsr      RASTSET
                    jsr      SPLITON
                    clr.w    DEMOMOD
                    move.w   lbW003324,SISMD2S
                    jsr      KEYCLEAR
                    jsr      DRAWCON
                    move.w   #$34,CMSY
                    jsr      LIFTDN
                    jsr      LIFTUP
SISMOD3:            move.w   CMDVAL,CMDLCT
STARTUP:            jsr      KEYBOARD
                    tst.w    CMDLCT
                    ble      DEMOSRT
                    tst.w    CMKYCT
                    beq      STARTUP
                    bra      RESTART

DEMOSRT:            jsr      DEMOSPY
RESTART:            clr.w    BTE6XYZ
                    clr.w    CMCLAK
                    clr.w    RASTAAK
                    clr.w    RASTCAK
                    clr.w    CMEBAK
                    move.w   #$48,RASTATA
                    clr.w    RASTROT
                    lea      SPDAT1,a0
                    clr.w    d0
                    jsr      SPRITINIT
                    move.w   #-1,MOUSEM
                    move.w   #0,CMYROT
                    move.w   #0,CMZROT
                    move.w   #0,CMXROT
                    move.l   #DRAD,CMDRAD
                    move.l   #PRAD,CMPRAD
                    move.l   #PLAD,CMPLAD
                    move.w   #$20,CMTOTO
                    move.l   #OBDAT1,CMOBDT
                    jsr      INITDAT
                    jsr      DRAWCON
                    jsr      KEYCLEAR
                    st       RASTCAK
                    st       RASTAAK
                    st       CMEBAK
                    st       CMQBAK
                    clr.w    CMGMOV
                    move.w   #-2,CMUPD1
                    jsr      BT01
                    jsr      CONSOLE
                    jsr      LIFTDN
                    st       CMCLAK

loopz:              jsr      BT01
                    addq.l   #1,FRAMECOUNT
                    jsr      CONSOLE
                    jsr      BT35
                    jsr      MONITOR
                    tst.w    CMDSND
SISMOD2:            beq.w    loopns
lbW003324:          equ      *-2

                    move.w   CMDSND,d0
                    jsr      BTF9
                    clr.w    CMDSND
loopns:             jsr      BT40
                    jsr      BT50
                    cmp.b    #199,CMGMOV
                    beq      NOTGOT
                    tst.w    CMGMOV
SISMOD1:            beq.w    loopz
lbW003358:          equ      *-2

                    jsr      ENDGAME
                    bra      RESTART

NOTGOT:             jsr      SPLITOFF
                    jsr      BIZDEAL
AAA:                rts

FRAMECOUNT:         dc.l     0

DIVIDE_ERROR:       rte

; -----------------------
; saved datas
CMSAVESTART:        dc.w     $80
CMVY:               dc.w     $100
CMVZ:               dc.w     $80
CMCX:               dc.w     0
CMCY:               dc.w     0
CMCZ:               dc.w     0
CMANGN:             dc.w     0
CMSTPN:             dc.w     1
CMSTEP:             dc.w     $64
CMCRHT:             dc.w     0
CMSCAL:             dc.w     1
CMMXH2:             dc.w     3
CMSTP2:             dc.w     $64
CMCRH2:             dc.w     1
CMANGL:             dc.w     1
CMFLY2:             dc.w     0
CMFLYE:             dc.w     0
CMMXHT:             dc.w     0
CMFLLA:             dc.w     0
CMCLBA:             dc.w     0
CMENER:             dc.w     0
CMENR1:             dc.w     0
CMENR2:             dc.w     0
CMSHLD:             dc.w     0
CMSHL1:             dc.w     0
CMSHL2:             dc.w     0
CMFLL2:             dc.w     0
CMCLB2:             dc.w     0
CMXROT:             dc.w     0
CMYROT:             dc.w     0
CMZROT:             dc.w     0
CMDSTA:             dcb.l    $14,0
CMDPCT:             dcb.l    $14,0
CMRPOS:             dcb.l    $3C,0
CMDPTA:             dc.l     0
CMFRIG:             dc.w     0
CMDRNG:             dc.w     0
CMCLCK:             dc.b     "59:59:59",0
                    even
CMCLCT:             dc.w     0
CMCKTK:             dc.w     0
CMMNCT:             dcb.b    2,0
CMSGTF:             dc.w     0
CMMKRS:             dc.l     0
CMCTRS:             dcb.w    14,0
                    dc.b     0
lbB004075:          dc.b     0
lbB004076:          dcb.b    2,0
CMRBOT:             dc.b     0
lbB004079:          dc.b     $87
lbW00407A:          dcb.w    3,0
                    dc.w     8,10,8,$FF,$1D,$79,$79,0,3,3,5,5,$1A,$19,$1F1E,15
                    dc.w     $11,$1B,5,$19,$200,$13,$FF,15,$11
CMRMID:             dc.b     0
lbB0040B3:          dc.b     $81
lbW0040B4:          dcb.w    3,0
                    dc.w     12,1,12,$FE,12,$66,$22,$66
CMRTOP:             dc.b     0
lbB0040CB:          dc.b     $86
lbW0040CC:          dcb.w    3,0
                    dc.w     6,8,6,$FD,$10,$79,$79,0,3,3,3,3
CMFBOT:             dc.b     0
lbB0040EB:          dc.b     $87
lbW0040EC:          dcb.w    3,0
                    dc.w     2,1,2,$FC,$10,$CC,$CC,0,1,1,1,1
CMFTOP:             dc.b     0
lbB00410B:          dc.b     $86
lbW00410C:          dcb.w    3,0
                    dc.w     2,3,2,$FB,$10,$CC,$CC,0,1,1,1,1
CMFSH1:             dc.b     0
                    dc.b     $86,0,$3F,0,$30,0,$3D,0,2,0,2,0,6,0,$FA,0,$1D,0
                    dc.b     $64,0,$64,0,$16,0,1,0,3,0,1,0,3,0,$85,0,$F8,0,$85
                    dc.b     0,$F9,0,$85,0,$FA,0,$94,0,$1F,0,0,0,$81,0,$19,0,0
                    dcb.b    2,0
CMFSH2:             dc.b     0
                    dc.b     $87,0,$3D,0,$2E,0,$3F,0,6,0,2,0,2,0,$F9,0,$1D,0
                    dc.b     $45,0,$45,0,$22,0,3,0,1,0,3,0,1,0,$85,0,$F8,0,$85
                    dc.b     0,$F9,0,$85,0,$FA,0,$94,0,$1F,0,0,0,$81,0,$19,0,0
                    dcb.b    2,0
CMFSH3:             dc.b     0
                    dc.b     $82,0,$40,0,$2E,0,$40,0,0,0,0,0,0,0,$F8,0,14,0
                    dc.b     $11,0,$50,0,0,0,$20,0,4
CMDSET:             dc.w     0
CMTOTO:             dc.w     0
CMOBDT:             dc.l     0
CMDSNM:             dc.l     0
CMLCLC:             dc.l     0
SAVCOLS:            dcb.l    8,0
CMSCOR:             dc.l     0
CMSGTX:             dc.w     0
CMSGTY:             dc.w     0
CMNSCD:             dc.w     0
CMRBAK:             dc.w     0
CMEBAK:             dc.w     0
CMQBAK:             dc.w     0
CMFLSH:             dc.w     0
CMFLSH2:            dc.w     0
CMDPOX:             dc.w     0
CMDPOZ:             dc.w     0
CMRBLA:             dc.l     0
CMRBLB:             dc.l     0
CMRBLD:             dc.w     0
CMRBLN:             dc.w     0
CMRBLO:             dc.w     0
CMQMAT:             dcb.w    9,0
; -----------------------

CMBMAT:             dc.w     0
lbW004224:          dc.w     0
lbW004226:          dc.w     0
lbW004228:          dc.w     0
lbW00422A:          dc.w     0
lbW00422C:          dc.w     0
lbW00422E:          dc.w     0
lbW004230:          dc.w     0
lbW004232:          dc.w     0
CMNVX:              dc.w     0
CMNVY:              dc.w     0
CMNVZ:              dc.w     0
CMUPD1:             dc.b     $FF,$FF
CMNMST:             dc.b     0,0
                    dcb.b    8,0
CMCLAK:             dc.w     0
CMDEBUG:            dcb.b    2,0
CMFIFTM:            dc.w     0
FIFCLOCK:           dc.l     0
CMFIFTOT:           dc.l     0
CMAM:               dc.w     0
CMAP:               dc.w     0
CMAS:               dc.w     0
CMAD:               dc.w     0
CMMNDT:             dc.w     $14
CMNSTP:             dc.w     7
CMSTPS:             dc.w     1,2,5,10,$19,$32,$64,$FA
CMNANG:             dc.w     5
CMANGS:             dc.w     1,2,3,6,9,$12
CMDOSX:             dc.w     $1E
CMDOSY:             dc.w     $54
CMDZ:               dc.w     $1E
CMPRAD:             dc.l     0
CMDRAD:             dc.l     0
CMPLAD:             dc.l     0
CMGBLC:             dc.l     0
CMPRIN:             dc.l     0
CMDRIN:             dc.l     0
CMPRLT:             dc.l     0
CMOBAD:             dc.l     0
CMPNOB:             dc.l     0
CMPNTS:             dc.w     0
lbW0042AA:          dc.w     0
lbW0042AC:          dc.w     0
lbW0042AE:          dc.w     0
lbW0042B0:          dc.w     0
lbW0042B2:          dcb.w    $19,0
CMFACE:             dc.l     0
                    dcb.w    28,0
CMFAC2:             dcb.l    15,0
CMNOV:              dc.w     4
CMYMIN:             dc.w     0
CMYMAX:             dc.w     0
CMDEMN:             dc.w     0
CMDMAD:             dc.l     0
CMDEMC:             dc.w     0
CMKYDL:             dc.w     0
CMKYRR:             dc.w     0
CMKYCT:             dc.w     0
CMICCT:             dc.w     0
CMTRNS:             dc.w     $1D
CMTRNN:             dc.w     $9603,$9704,$9806,$9905,$4F03,$4B04,$5105,$5706
                    dc.w     $5201,$4602,$5007,$4C08,$4E09,$4D0A,$550D,$3016
                    dc.w     $4428,$4329,$492A,$2E2B,$410B,$5A0C,$5311,$5812
                    dc.w     $202C,$63C7,$5FC6,$5BFA,$FFFF,0,0
CMKYBF:             dcb.b    10,0
CMOBVS:             dc.w     0
CMOBCP:             dc.w     0
CMOBTP:             dc.w     0
CMOBJN:             dc.w     0
CMPLNS:             dc.w     5
CMPLAN:             dc.w     0
CMVPMM:             dcb.l    3,0
CMVPYA:             dc.w     9
CMCLPNTS:           dcb.l    $1E,0
CMF:                dc.w     0
CMD:                dc.w     0
CMSX:               dc.w     $A0
CMSY:               dc.w     $64
CMSCX:              dc.w     $A0
CMSCY:              dc.w     $64
CMSLX:              dc.w     0
CMSRX:              dc.w     0
CMSTY:              dc.w     0
CMSBY:              dc.w     0
CMDPTS:             dc.w     $31,$24,$42,$2C,$38,$3E,$63,$3F,$2B,$2E,$1A,$4E
                    dc.w     10,$23,$57,$54,$37,12,$31,$24,$42,$2C,$38,$3E,$63
                    dc.w     $3F,$2B,$2E,$1A,$4E,10,$23,$57,$54,$37,12
CMNBASE:            dc.w     0
CMSNST:             dc.w     0
CMENTR:             dc.w     0
CMNODS:             dc.w     0
CMNDS:              dc.w     0
CMX:                dc.w     0
CMY:                dc.w     0
CMBYPL:             dc.w     40
CMNUML:             dc.w     200
CMDVAL:             dc.w     500
CMDVAL2:            dc.w     500
CMDVAL3:            dc.w     50
CMDLCT:             dc.b     0
                    dc.b     0
CMGMOV:             dc.w     0
CMCOND:             dc.w     0
CMSCRL:             dc.w     0
CMFCVS:             dc.w     0
CMCDIR:             dc.w     0
CMINAR:             dc.w     1
CMNUMO:             dc.w     0
CMNPDO:             dc.w     8
CMWHSC:             dc.w     0
CMCOL:              dc.w     9
CMBKCOL:            dcb.b    2,0
CMIND:              dcb.b    2,0
CMOBHT:             dc.w     0
CMDSND:             dc.w     0
CMFIRE:             dc.w     0
CMFADE:             dc.w     0
CMBUMP:             dc.w     0
CMSNCS:             dc.w     0,64,6,64,11,63,17,62,22,60,27,58,32
                    dc.w     55,37,52,41,49,45,45,49,41,52,37,55
                    dc.w     32,58,27,60,22,62,17,63,11,64,6,64,0
                    dc.w     64,-6,63,-11,62,-17,60,-22,58,-27
                    dc.w     55,-32,52,-37,49,-41,45,-45,41,-49
                    dc.w     37,-52,32,-55,27,-58,22,-60,17,-62
                    dc.w     11,-63,6,-64,0,-64,-6,-64,-11,-63
                    dc.w     -17,-62,-22,-60,-27,-58,-32,-55
                    dc.w     -37,-52,-41,-49,-45,-45,-49,-41
                    dc.w     -52,-37,-55,-32,-58,-27,-60,-22
                    dc.w     -62,-17,-63,-11,-64,-6,-64,0,-64
                    dc.w     6,-63,11,-62,17,-60,22,-58,27,-55
                    dc.w     32,-52,37,-49,41,-45,45,-41,49,-37
                    dc.w     52,-32,55,-27,58,-22,60,-17,62,-11
                    dc.w     63,-6,64
CMCBIN:             dc.w     6,0,4,0,3,7,4,0,4,5,6,2,1,0,4,0,4,5,1,0,4,2,6,7,3
                    dc.w     0,4,0,1,2,3,0,4,5,4,7,6
CMP1IN:             dc.w     5,0,3,0,3,4,0,3,3,2,4,0,3,2,1,4,0,3,1,0,4,0,4,0,1
                    dc.w     2,3
CMP2IN:             dc.w     5,0,4,0,3,5,4,0,3,3,2,5,0,4,2,1,4,5,0,3,1,0,4,0,4
                    dc.w     0,1,2,3
CMP3IN:             dc.w     5,0,3,0,3,4,0,4,3,2,5,4,0,3,2,1,5,0,4,1,0,4,5,0,4
                    dc.w     0,1,2,3
CMP4IN:             dc.w     6,0,4,0,3,7,4,0,4,3,2,5,7,0,4,2,1,6,5,0,4,1,0,4,6
                    dc.w     0,4,0,1,2,3,0,4,4,7,5,6
CMFTIN:             dc.w     1
lbW004740:          dc.w     0
lbW004742:          dcb.w    2,0
                    dc.w     1,2,3,4,5
CMSHIN:             dc.w     1,0,2,0,0
CMSHAD:             dc.l     0
CMSHI1:             dcb.l    24,0
CMSHI2:             dcb.l    24,0
CMSHT2:             dc.w     0
CMSHT1:             dc.w     0
CMATLN:             dc.w     1,4,2,2,2,2,3,3,3,2,2,3,2,2,3,2,2,3,3,2,3,1,2,2,2
                    dc.w     2,1,2,2,2,2,2,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dcb.w    14,0
CMENLN:             dc.w     9,12,14,10,$10,$10,$10,$10,$10,$10,$10,$13,$16
                    dc.w     $19,$1C,0
CMINTR:             dcb.b    2,0
CMNREC:             dc.w     14
CMRECL:             dc.w     $24,$10,$11B,$75,$16,$16,$A0,$90,$B1,$A5,5,10,$CE
                    dc.w     $90,$DF,$A5,6,9,$B7,$7C,$C8,$91,3,3,$B7,$97,$C8
                    dc.w     $AC,4,13,$E6,$90,$F7,$A5,1,7,$FD,$90,$10E,$A5,2,8
                    dc.w     $31,1,$44,11,$FF,$FF,$B0,5,$C3,13,$C6,$C7,$11B
                    dc.w     $90,$12C,$A7,$28,$29,$80,$AE,$95,$C3,$2A,$2A,$2F
                    dc.w     $9E,$3B,$A6,$11,$12,$3F,$9E,$47,$A6,11,12,9,$92
                    dc.w     $26,$9A,$50,$50,9,$9C,$26,$A4,$51,$51
CMMES1:             dc.b     "SECTOR CLEARED"
CMMES2:             dc.b     " GAS BUILD UP "
CMMES3:             dc.b     " AREA NEUTRAL "
CMMES4:             dc.b     "RIG POSITIONED"
CMMES5:             dc.b     "POS UNSUITABLE"
CMMES6:             dc.b     "  00000 CFT   "
CMMES7:             dc.b     " 000% SUCCESS "
CMMES8:             dc.b     "ENERGY TOO LOW"
CMMES9:             dc.b     " NOT IN PROBE "
CMME10:             dc.b     " NO GAS FOUND "
CMME11:             dc.b     "RIG COLLECTED "
CMME12:             dc.b     "  PROCESSING  "
CMME13:             dc.b     "ALREADY PLACED"
CMME14:             dc.b     "NO RIG PLACED "
CMME15:             dc.b     " OUT OF TIME  "
CMME16:             dc.b     "  SHIELD OUT  "
CMME17:             dc.b     "  ENERGY OUT  "
CMME18:             dc.b     "  NASTY FALL  "
CMME19:             dc.b     "  TERMINATED  "
CMME20:             dc.b     "TASK COMPLETED"

BT01:               jsr      BTAM4
                    btst     #2,CMUPD1+1
                    beq      BT0124
                    jsr      BT07
                    jsr      BT10
                    clr.w    CMSHT1
                    move.l   #CMSHI1,CMSHAD
                    move.l   CMOBDT,a6
                    move.w   CMTOTO,d7
                    beq      BT01AD1
                    bsr      BT01CPO
BT01AD1:            lea      CMRBOT,a6
                    move.w   CMNPDO,d7
                    beq      BT01AD2
                    bsr      BT01CPO
BT01AD2:            jsr      BTAM4
                    move.w   CMFIFTM,CMAP
                    clr.w    CMFIFTM
                    jsr      BT22
                    move.w   CMFIFTM,CMAS
                    clr.w    CMFIFTM
                    bra      BT0125

BT0124:             btst     #3,CMUPD1
                    beq      BT0126
BT0125:             jsr      BT30
                    move.w   CMFIFTM,CMAD
                    clr.w    CMFIFTM
                    jsr      BTAM4
                    jsr      CENTRE
BT0126:             rts

BT01CPO:            subq.w   #1,d7
BT0101:             move.l   d7,-(sp)
                    move.l   a6,CMOBAD
                    move.w   (a6),d0
                    and.w    #15,d0
                    cmp.b    #2,d0
                    beq      BT0118
                    btst     #6,1(a6)
                    bne      BT0107
                    tst.w    CMINAR
                    bne      BT0118
                    lea      CMVPMM,a0
                    move.w   #2,d6
BT0119:             move.w   2(a6),d0
                    cmp.w    (a0)+,d0
                    bgt      BT0107
                    add.w    8(a6),d0
                    cmp.w    (a0)+,d0
                    ble      BT0107
                    addq.w   #2,a6
                    dbra     d6,BT0119
                    subq.w   #6,a6
BT0118:             move.l   CMPRIN,a0
                    clr.w    CMFCVS
                    move.w   #2,d1
                    lea      CMSAVESTART,a1
BT0120:             move.w   2(a6),d2
                    asl.w    #6,d2
                    sub.w    (a1)+,d2
                    ble      BT0121
                    bset     #6,CMFCVS
BT0121:             lsr.w    CMFCVS
                    move.w   d2,(a0)+
                    move.w   8(a6),d0
                    asl.w    #6,d0
                    add.w    d2,d0
                    bpl      BT0122
                    bset     #6,CMFCVS
BT0122:             lsr.w    CMFCVS
                    move.w   d0,(a0)+
                    add.w    #2,a6
                    dbra     d1,BT0120
                    move.l   CMOBAD,a0
                    move.w   14(a0),CMOBJN
                    move.w   (a0),d0
                    and.w    #15,d0
                    move.w   d0,CMOBTP
                    cmp.b    #1,d0
                    bne      BT0123
                    jsr      BT11
                    bra      BT0107

BT0123:             cmp.b    #2,d0
                    bne      BT0104
                    jsr      BT15
                    bra      BT0107

BT0104:             cmp.b    #3,d0
                    bne      BT0105
                    jsr      BT14
                    bra      BT0107

BT0105:             cmp.b    #10,d0
                    bge      BT0106
                    jsr      BT12
                    bra      BT0107

BT0106:             jsr      BT13
BT0107:             move.l   (sp)+,d7
                    move.l   CMOBAD,a6
                    move.w   16(a6),d0
                    asl.w    #1,d0
                    add.w    d0,a6
                    dbra     d7,BT0101
                    rts

BT07:               tst.w    CMINAR
                    bne      BT07END
                    lea      CMVPMM,a0
                    move.w   CMCX,d0
                    move.w   d0,(a0)
                    move.w   d0,2(a0)
                    move.w   CMCY,d0
                    move.w   d0,4(a0)
                    move.w   d0,6(a0)
                    move.w   CMCZ,d0
                    move.w   d0,8(a0)
                    move.w   d0,10(a0)
                    moveq    #3,d7
BT07LP:             btst     #1,d7
                    bne      BT0704
BT0702:             move.w   CMYROT,d0
                    add.w    CMVPYA,d0
                    cmp.w    #$48,d0
                    blt      BT0704
                    sub.w    #$48,d0
BT0704:             btst     #0,d7
                    bne      BT0707
                    move.w   CMXROT,d1
                    add.w    CMVPYA,d1
                    cmp.w    #$48,d1
                    blt      BT0707
                    sub.w    #$48,d1
BT0707:             btst     #1,d7
                    beq      BT0710
                    move.w   CMYROT,d0
                    sub.w    CMVPYA,d0
                    bpl      BT0710
                    add.w    #$48,d0
BT0710:             btst     #0,d7
                    beq      BT0713
                    move.w   CMXROT,d1
                    sub.w    CMVPYA,d1
                    bpl      BT0713
                    add.w    #$48,d1
BT0713:             cmp.w    #$12,d0
                    bpl      BT0714
                    moveq    #1,d2
                    bra      BT0717

BT0714:             cmp.w    #$24,d0
                    bpl      BT0715
                    moveq    #3,d2
                    bra      BT0717

BT0715:             cmp.w    #$36,d0
                    bpl      BT0716
                    moveq    #5,d2
                    bra      BT0717

BT0716:             moveq    #7,d2
BT0717:             cmp.w    #$12,d1
                    bpl      BT0718
                    addq.w   #1,d2
                    bra      BT0722

BT0718:             cmp.w    #$24,d1
                    bpl      BT0719
                    addq.w   #5,d2
                    bra      BT0720

BT0719:             cmp.w    #$36,d1
                    bpl      BT0722
                    addq.w   #4,d2
BT0720:             cmp.w    #8,d2
                    ble      BT0722
                    subq.w   #8,d2
BT0722:             subq.w   #1,d2
                    btst     #0,d2
                    beq      BT07MXY
                    move.w   #0,6(a0)
                    bra      BT07ZZZ

BT07MXY:            move.w   #$3F,4(a0)
BT07ZZZ:            btst     #1,d2
                    beq      BT07MXZ
                    move.w   #0,10(a0)
                    bra      BT07XXX

BT07MXZ:            move.w   #$7F,8(a0)
BT07XXX:            btst     #2,d2
                    beq      BT07MXX
                    move.w   #0,2(a0)
                    bra      BT0730

BT07MXX:            move.w   #$7F,(a0)
BT0730:             dbra     d7,BT07LP
BT07END:            rts

BT10I8:             dc.w     $40,0,0,0,$40,0,0,0,$40

BT10:               lea      CMQMAT,a1
                    move.w   CMDOSX,(a1)+
                    clr.l    (a1)+
                    clr.w    (a1)+
                    move.w   CMDOSY,(a1)+
                    clr.w    (a1)+
                    clr.l    (a1)+
                    move.w   CMDZ,(a1)+
                    tst.w    CMXROT
                    beq      BT1003
                    move.w   #8,d0
                    lea      CMBMAT,a1
                    lea      BT10I8,a2
BT1006:             move.w   (a2)+,(a1)+
                    dbra     d0,BT1006
                    move.w   CMXROT,d0
                    asl.w    #2,d0
                    lea      CMSNCS,a1
                    move.w   0(a1,d0.w),d1
                    move.w   d1,lbW00422C
                    neg.w    d1
                    move.w   d1,lbW004230
                    move.w   2(a1,d0.w),d1
                    move.w   d1,lbW00422A
                    move.w   d1,lbW004232
                    jsr      BTA1
BT1003:             tst.w    CMZROT
                    beq      BT1004
                    move.w   #8,d0
                    lea      CMBMAT,a1
                    lea      BT10I8,a2
BT1007:             move.w   (a2)+,(a1)+
                    dbra     d0,BT1007
                    move.w   CMZROT,d0
                    asl.w    #2,d0
                    lea      CMSNCS,a1
                    move.w   0(a1,d0.w),d1
                    move.w   d1,lbW004224
                    neg.w    d1
                    move.w   d1,lbW004228
                    move.w   2(a1,d0.w),d1
                    move.w   d1,CMBMAT
                    move.w   d1,lbW00422A
                    jsr      BTA1
BT1004:             tst.w    CMYROT
                    beq      BT1002
                    move.w   #8,d0
                    lea      CMBMAT,a1
                    lea      BT10I8,a2
BT1005:             move.w   (a2)+,(a1)+
                    dbra     d0,BT1005
                    move.w   CMYROT,d0
                    asl.w    #2,d0
                    lea      CMSNCS,a1
                    move.w   0(a1,d0.w),d1
                    move.w   d1,lbW00422E
                    neg.w    d1
                    move.w   d1,lbW004226
                    move.w   2(a1,d0.w),d1
                    move.w   d1,CMBMAT
                    move.w   d1,lbW004232
                    jsr      BTA1
BT1002:             move.w   #6,d0
                    move.w   CMF,d1
                    bne      BT100A
                    subq.w   #1,d0
BT100A:             move.w   d0,CMPLNS
                    move.l   CMPRAD,d0
                    move.l   d0,CMPRIN
                    move.l   CMDRAD,d0
                    move.l   d0,CMDRIN
                    move.l   CMPLAD,d0
                    addq.w   #8,d0
                    move.l   d0,CMPRLT
                    clr.w    CMNUMO
                    clr.w    CMWHSC
                    rts

BT11:               move.l   CMPRIN,a0
                    lea      CMPNTS,a4
                    lea      12(a0),a0
                    move.w   -(a0),d0
                    move.w   d0,28(a4)
                    move.w   d0,34(a4)
                    move.w   d0,40(a4)
                    move.w   d0,46(a4)
                    move.w   -(a0),d0
                    move.w   d0,4(a4)
                    move.w   d0,10(a4)
                    move.w   d0,16(a4)
                    move.w   d0,22(a4)
                    move.w   -(a0),d0
                    move.w   d0,14(a4)
                    move.w   d0,20(a4)
                    move.w   d0,38(a4)
                    move.w   d0,44(a4)
                    move.w   -(a0),d0
                    move.w   d0,2(a4)
                    move.w   d0,8(a4)
                    move.w   d0,26(a4)
                    move.w   d0,32(a4)
                    move.w   -(a0),d0
                    move.w   d0,6(a4)
                    move.w   d0,12(a4)
                    move.w   d0,30(a4)
                    move.w   d0,36(a4)
                    move.w   -(a0),d0
                    move.w   d0,(a4)
                    move.w   d0,18(a4)
                    move.w   d0,24(a4)
                    move.w   d0,42(a4)
                    move.w   #8,CMNOV
                    jsr      BTA7
                    tst.w    CMOBVS
                    bne      BT1101
                    rts

BT1101:             move.l   CMOBAD,a0
                    lea      CMCBIN,a1
                    add.w    #2,a1
                    clr.w    CMOBVS
                    move.w   #2,d0
                    move.b   CMFCVS,d1
BT1103:             lsr.w    #1,d1
                    bcs      BT1102
                    clr.w    (a1)
                    jmp      BT1109

BT1102:             move.w   18(a0),d2
                    and.w    #15,d2
                    move.w   d2,(a1)
                    beq      BT1109
                    move.w   d2,CMOBVS
BT1109:             lsr.w    #1,d1
                    bcs      BT1110
                    clr.w    12(a1)
                    jmp      BT1111

BT1110:             move.w   18(a0),d2
                    and.w    #$F0,d2
                    lsr.w    #4,d2
                    move.w   d2,12(a1)
                    beq      BT1111
                    move.w   d2,CMOBVS
BT1111:             add.w    #24,a1
                    add.w    #2,a0
                    dbra     d0,BT1103
                    tst.w    CMOBVS
                    beq      BT1105
                    clr.w    CMCDIR
                    lea      CMCBIN,a0
                    tst.w    CMOBCP
                    bne      BT1104
                    jmp      BTB6

BT1104:             jmp      BTB7

BT1105:             rts

BT12TMP:            dc.l     0
BT12C1:             dc.w     0
BT12C2:             dc.w     0
BT12C3:             dc.w     0
BT12C4:             dc.w     0

BT12:               lea      CMPNTS,a4
                    move.l   CMOBAD,a0
                    move.w   24(a0),d0
                    cmp.w    28(a0),d0
                    beq      BT1211
                    move.w   26(a0),d0
                    cmp.w    30(a0),d0
                    bne      BT1210
                    lea      CMP2IN,a1
                    move.w   #6,CMNOV
                    jmp      BT1213

BT1210:             lea      CMP4IN,a1
                    move.w   #8,CMNOV
                    jmp      BT1213

BT1211:             move.w   26(a0),d0
                    cmp.w    30(a0),d0
                    beq      BT1212
                    lea      CMP3IN,a1
                    move.w   #6,CMNOV
                    jmp      BT1213

BT1212:             lea      CMP1IN,a1
                    move.w   #5,CMNOV
BT1213:             move.l   a1,BT12TMP
                    move.w   #3,d1
                    move.l   CMOBAD,a0
                    add.w    #24,a0
                    lea      BT12C1,a1
BT1201:             move.w   (a0)+,d0
                    asl.w    #6,d0
                    move.w   d0,(a1)+
                    dbra     d1,BT1201
                    move.l   CMPRIN,a0
                    move.w   CMOBTP,d0
                    cmp.b    #4,d0
                    bne      BT1214
                    move.w   (a0)+,d0
                    move.w   d0,(a4)
                    move.w   d0,6(a4)
                    move.w   d0,12(a4)
                    move.w   d0,18(a4)
                    move.w   (a0)+,d0
                    move.w   d0,24(a4)
                    move.w   d0,30(a4)
                    move.w   d0,36(a4)
                    move.w   d0,42(a4)
                    addq.w   #4,a0
                    move.w   (a0)+,d0
                    move.w   d0,10(a4)
                    move.w   d0,16(a4)
                    add.w    BT12C2,d0
                    move.w   d0,34(a4)
                    move.w   d0,40(a4)
                    move.w   -2(a0),d0
                    add.w    BT12C4,d0
                    move.w   d0,28(a4)
                    move.w   d0,46(a4)
                    move.w   (a0)+,d0
                    move.w   d0,4(a4)
                    move.w   d0,22(a4)
                    jmp      BT1224

BT1214:             cmp.b    #5,d0
                    bne      BT1215
                    move.w   (a0)+,d0
                    move.w   d0,24(a4)
                    move.w   d0,30(a4)
                    move.w   d0,36(a4)
                    move.w   d0,42(a4)
                    move.w   (a0)+,d0
                    move.w   d0,(a4)
                    move.w   d0,6(a4)
                    move.w   d0,12(a4)
                    move.w   d0,18(a4)
                    addq.w   #4,a0
                    move.w   (a0)+,d0
                    move.w   d0,4(a4)
                    move.w   d0,22(a4)
                    add.w    BT12C2,d0
                    move.w   d0,28(a4)
                    move.w   d0,46(a4)
                    move.w   -2(a0),d0
                    add.w    BT12C4,d0
                    move.w   d0,34(a4)
                    move.w   d0,40(a4)
                    move.w   (a0)+,d0
                    move.w   d0,10(a4)
                    move.w   d0,16(a4)
BT1224:             move.l   CMPRIN,a0
                    add.w    #4,a0
                    move.w   (a0)+,d0
                    move.w   d0,2(a4)
                    move.w   d0,8(a4)
                    add.w    BT12C1,d0
                    move.w   d0,26(a4)
                    move.w   d0,38(a4)
                    move.w   -2(a0),d0
                    add.w    BT12C3,d0
                    move.w   d0,32(a4)
                    move.w   d0,44(a4)
                    move.w   (a0)+,d0
                    move.w   d0,14(a4)
                    move.w   d0,20(a4)
                    jmp      BT1220

BT1215:             cmp.b    #6,d0
                    bne      BT1216
                    move.w   (a0)+,d0
                    move.w   d0,(a4)
                    move.w   d0,6(a4)
                    add.w    BT12C1,d0
                    move.w   d0,24(a4)
                    move.w   d0,36(a4)
                    move.w   (a0)+,d0
                    move.w   d0,12(a4)
                    move.w   d0,18(a4)
                    move.w   (a4),d0
                    add.w    BT12C3,d0
                    move.w   d0,30(a4)
                    move.w   d0,42(a4)
                    move.w   (a0)+,d0
                    move.w   d0,2(a4)
                    move.w   d0,8(a4)
                    move.w   d0,14(a4)
                    move.w   d0,20(a4)
                    move.w   (a0)+,d0
                    move.w   d0,26(a4)
                    move.w   d0,32(a4)
                    move.w   d0,38(a4)
                    move.w   d0,44(a4)
                    jmp      BT1225

BT1216:             cmp.b    #7,d0
                    bne      BT1217
                    move.w   (a0)+,d0
                    move.w   d0,12(a4)
                    move.w   d0,18(a4)
                    add.w    BT12C1,d0
                    move.w   d0,30(a4)
                    move.w   d0,42(a4)
                    move.w   12(a4),d0
                    add.w    BT12C3,d0
                    move.w   d0,24(a4)
                    move.w   d0,36(a4)
                    move.w   (a0)+,d0
                    move.w   d0,(a4)
                    move.w   d0,6(a4)
                    move.w   (a0)+,d0
                    move.w   d0,26(a4)
                    move.w   d0,32(a4)
                    move.w   d0,38(a4)
                    move.w   d0,44(a4)
                    move.w   (a0)+,d0
                    move.w   d0,2(a4)
                    move.w   d0,8(a4)
                    move.w   d0,14(a4)
                    move.w   d0,20(a4)
BT1225:             move.l   CMPRIN,a0
                    add.w    #8,a0
                    move.w   (a0)+,d0
                    move.w   d0,4(a4)
                    move.w   d0,22(a4)
                    add.w    BT12C2,d0
                    move.w   d0,28(a4)
                    move.w   d0,46(a4)
                    move.w   (a0)+,d0
                    move.w   d0,10(a4)
                    move.w   d0,16(a4)
                    move.w   4(a4),d0
                    add.w    BT12C4,d0
                    move.w   d0,34(a4)
                    move.w   d0,40(a4)
                    jmp      BT1220

BT1217:             cmp.b    #8,d0
                    bne      BT1218
                    add.w    #4,a0
                    move.w   (a0)+,d0
                    move.w   d0,8(a4)
                    move.w   d0,14(a4)
                    add.w    BT12C2,d0
                    move.w   d0,32(a4)
                    move.w   d0,38(a4)
                    move.w   8(a4),d0
                    add.w    BT12C4,d0
                    move.w   d0,26(a4)
                    move.w   d0,44(a4)
                    move.w   (a0)+,d0
                    move.w   d0,2(a4)
                    move.w   d0,20(a4)
                    move.w   (a0)+,d0
                    move.w   d0,4(a4)
                    move.w   d0,10(a4)
                    move.w   d0,16(a4)
                    move.w   d0,22(a4)
                    move.w   (a0)+,d0
                    move.w   d0,28(a4)
                    move.w   d0,34(a4)
                    move.w   d0,40(a4)
                    move.w   d0,46(a4)
                    jmp      BT1226

BT1218:             add.w    #4,a0
                    move.w   (a0)+,d0
                    move.w   d0,20(a4)
                    move.w   d0,2(a4)
                    add.w    BT12C2,d0
                    move.w   d0,26(a4)
                    move.w   d0,44(a4)
                    move.w   (a0)+,d0
                    move.w   d0,8(a4)
                    move.w   d0,14(a4)
                    move.w   2(a4),d0
                    add.w    BT12C4,d0
                    move.w   d0,32(a4)
                    move.w   d0,38(a4)
                    move.w   (a0)+,d0
                    move.w   d0,28(a4)
                    move.w   d0,34(a4)
                    move.w   d0,40(a4)
                    move.w   d0,46(a4)
                    move.w   (a0)+,d0
                    move.w   d0,4(a4)
                    move.w   d0,10(a4)
                    move.w   d0,16(a4)
                    move.w   d0,22(a4)
BT1226:             move.l   CMPRIN,a0
                    move.w   (a0)+,d0
                    move.w   d0,(a4)
                    move.w   d0,6(a4)
                    add.w    BT12C1,d0
                    move.w   d0,24(a4)
                    move.w   d0,36(a4)
                    move.w   (a0)+,d0
                    move.w   d0,12(a4)
                    move.w   d0,18(a4)
                    move.w   (a4),d0
                    add.w    BT12C3,d0
                    move.w   d0,30(a4)
                    move.w   d0,42(a4)
BT1220:             move.l   a1,-(sp)
                    jsr      BTA7
                    move.l   (sp)+,a1
                    tst.w    CMOBVS
                    beq      BT1205
                    move.l   CMOBAD,a0
                    add.w    #18,a0
                    move.l   BT12TMP,a1
                    move.w   (a1)+,d4
                    sub.w    #1,d4
BT1221:             move.w   (a0),d0
                    and.w    #15,d0
                    move.w   d0,(a1)+
                    move.w   (a1)+,d0
                    asl.w    #1,d0
                    add.w    d0,a1
                    dbra     d4,BT1222
                    jmp      BT1223

BT1222:             move.w   (a0)+,d0
                    and.w    #$F0,d0
                    lsr.b    #4,d0
                    move.w   d0,(a1)+
                    move.w   (a1)+,d0
                    asl.w    #1,d0
                    add.w    d0,a1
                    dbra     d4,BT1221
BT1223:             move.w   #1,CMCDIR
                    move.l   BT12TMP,a0
                    tst.w    CMOBCP
                    bne      BT1204
                    jmp      BTB6

BT1204:             jmp      BTB7

BT1205:             rts

BT13:               move.l   CMOBAD,a0
                    add.w    #18,a0
                    move.w   CMOBTP,d4
                    subq.w   #8,d4
BT1305:             move.w   d4,CMNOV
                    subq.w   #1,d4
                    move.w   (a0)+,CMCOL
                    lea      CMPNTS,a1
BT1320:             lea      CMSAVESTART,a2
                    move.w   #2,d1
BT1321:             move.w   (a0)+,d0
                    asl.w    #6,d0
                    sub.w    (a2)+,d0
                    move.w   d0,(a1)+
                    dbra     d1,BT1321
                    dbra     d4,BT1320
                    jsr      BTA7
                    tst.w    CMOBVS
                    beq      BT1311
                    lea      CMFTIN,a0
                    move.w   CMNOV,lbW004742
                    cmp.w    #2,CMNOV
                    beq      BT1308
                    move.w   #1,lbW004740
                    move.w   #2,CMCDIR
                    jmp      BT1309

BT1308:             move.w   #15,d0
                    and.w    CMCOL,d0
                    move.w   d0,lbW004740
BT1309:             tst.w    CMOBCP
                    bne      BT1310
                    jmp      BTB6

BT1310:             jmp      BTB7

BT1311:             rts

BT14:               move.l   CMPRIN,a0
                    move.l   CMOBAD,a1
                    lea      CMPNTS,a4
                    move.w   (a0),(a4)
                    move.w   (a0)+,18(a4)
                    move.w   (a0),6(a4)
                    move.w   (a0)+,12(a4)
                    move.w   (a0),2(a4)
                    move.w   (a0)+,8(a4)
                    move.w   (a0),14(a4)
                    move.w   (a0)+,20(a4)
                    move.w   (a0),4(a4)
                    move.w   (a0)+,d2
                    move.w   (a0),16(a4)
                    move.w   (a0)+,d3
                    move.w   #1,d5
                    move.w   8(a1),d0
                    bne      BT1401
                    move.w   d2,22(a4)
                    move.w   d3,10(a4)
                    bra      BT1403

BT1401:             move.w   d2,10(a4)
                    move.w   d3,22(a4)
                    move.w   10(a1),d0
                    bne      BT1402
                    move.w   #2,d5
                    bra      BT1403

BT1402:             move.w   #3,d5
BT1403:             move.w   #4,CMNOV
                    movem.l  d5/a1,-(sp)
                    jsr      BTA7
                    movem.l  (sp)+,d5/a1
                    tst.w    CMOBVS
                    bne      BT14F1
                    rts

BT14F1:             move.w   #4,lbW004742
                    move.b   CMFCVS,d0
                    cmp.w    #1,d5
                    beq      BT1411
                    cmp.w    #2,d5
                    beq      BT1410
                    lsr.b    #2,d0
BT1410:             lsr.b    #2,d0
BT1411:             move.w   18(a1),d4
                    btst     #0,d0
                    beq      BT1412
                    and.w    #15,d4
                    beq      BT1405
                    bra      BT1413

BT1412:             and.w    #$F0,d4
                    beq      BT1405
                    lsr.b    #4,d4
BT1413:             move.w   d4,lbW004740
                    clr.w    CMCDIR
                    lea      CMFTIN,a0
                    tst.w    CMOBCP
                    bne      BT1404
                    jmp      BTB6

BT1404:             jmp      BTB7

BT1405:             rts

BT15:               addq.w   #1,CMSHT1
                    move.l   CMSHAD,a0
                    move.l   CMOBAD,a1
                    move.w   14(a1),(a0)
                    move.w   20(a1),2(a0)
                    move.w   (a1),d0
                    btst     #6,d0
                    bne      BT15NV
                    move.b   CMFCVS,d0
                    and.b    $1B(a1),d0
                    beq      BT15NV
                    move.l   CMPRIN,a1
                    move.w   (a1),d0
                    move.w   d0,CMPNTS
                    move.w   d0,lbW0042AE
                    bpl      BT1511
                    neg.w    d0
BT1511:             move.w   4(a1),d1
                    move.w   d1,lbW0042AA
                    move.w   d1,lbW0042B0
                    bpl      BT1512
                    neg.w    d1
BT1512:             add.w    d1,d0
                    move.w   8(a1),d1
                    move.w   d1,lbW0042AC
                    move.w   d1,lbW0042B2
                    bpl      BT1513
                    neg.w    d1
BT1513:             add.w    d1,d0
                    move.l   CMOBAD,a0
                    move.w   24(a0),d1
                    asl.w    #8,d1
                    move.b   23(a0),d1
                    sub.w    d1,d0
                    bpl      BT15NV
                    move.w   #2,CMNOV
                    jsr      BTA7
                    move.l   CMSHAD,a0
                    tst.w    CMOBVS
                    beq      BT1502
                    move.l   CMOBAD,a0
                    move.w   18(a0),d0
                    and.w    #15,d0
                    move.w   d0,CMSHIN+2
                    clr.w    CMCDIR
                    lea      CMSHIN,a0
                    jsr      BTB6
                    move.l   CMSHAD,a0
                    move.l   CMDRIN,a1
                    move.w   -4(a1),8(a0)
                    beq      BT1502
                    move.w   -2(a1),10(a0)
                    move.w   #1,6(a0)
                    bra      BT1503

BT1502:             move.w   #2,6(a0)
                    bra      BT1503

BT15NV:             move.l   CMSHAD,a0
                    clr.w    6(a0)
BT1503:             add.l    #12,CMSHAD
                    rts

BT22SWO:            dc.b     0
                    even

BT22:               move.w   CMNUMO,d4
                    dbra     d4,BT22XX
                    bra      BT2226

BT22XX:             dbra     d4,BT22ZZ
                    bra      BT2226

BT22ZZ:             move.w   CMNUMO,d7
                    subq.w   #2,d7
BT2201:             clr.b    BT22SWO
                    move.l   CMPLAD,a0
                    add.w    #12,a0
BT2202:             move.l   (a0),a1
                    move.l   8(a0),a2
                    clr.b    d6
                    move.w   #2,d5
BT2203:             asl.b    #1,d6
                    move.w   (a1),d0
                    sub.w    2(a2),d0
                    bpl      BT2230
                    move.w   (a2),d0
                    sub.w    2(a1),d0
                    bpl      BT2230
                    bset     #0,d6
BT2230:             add.w    #4,a2
                    add.w    #4,a1
                    dbra     d5,BT2203
                    move.l   (a0),a1
                    move.l   8(a0),a2
                    clr.l    d3
                    move.w   #2,d5
BT2231:             asl.b    #2,d3
                    asl.b    #1,d6
                    btst     #3,d6
                    bne      BT2232
                    clr.l    d1
                    tst.w    (a1)
                    bpl      BT2204
                    bset     #1,d1
BT2204:             tst.w    2(a1)
                    bpl      BT2205
                    bset     #0,d1
BT2205:             cmp.b    #1,d1
                    beq      BT2210
                    cmp.b    #2,d1
                    beq      BT2210
                    clr.w    d1
                    tst.w    (a2)
                    bpl      BT2206
                    bset     #1,d1
BT2206:             tst.w    2(a2)
                    bpl      BT2207
                    bset     #0,d1
BT2207:             cmp.b    #1,d1
                    beq      BT2244
                    cmp.b    #2,d1
                    beq      BT2244
                    bclr     #0,d1
                    tst.w    (a1)
                    bpl      BT2208
                    bset     #0,d1
BT2208:             cmp.b    #1,d1
                    beq      BT2232
                    cmp.b    #2,d1
                    beq      BT2232
                    move.w   (a2),d0
                    sub.w    (a1),d0
                    beq      BT2248
                    bpl      BT2209
                    bset     #2,d1
BT2209:             tst.b    d1
                    beq      BT2210
                    cmp.b    #7,d1
                    beq      BT2210
                    jmp      BT2244

BT2248:             clr.w    d1
                    tst.w    2(a2)
                    bpl      BT2245
                    bset     #1,d1
BT2245:             tst.w    2(a1)
                    bpl      BT2246
                    bset     #0,d1
BT2246:             move.w   2(a2),d0
                    sub.w    2(a1),d0
                    bpl      BT2247
                    bset     #2,d1
BT2247:             tst.b    d1
                    beq      BT2210
                    cmp.b    #7,d1
                    bne      BT2244
BT2210:             bset     #0,d3
                    jmp      BT2232

BT2244:             bset     #1,d3
BT2232:             add.w    #4,a1
                    add.w    #4,a2
                    dbra     d5,BT2231
BT22FC:             cmp.b    #32,d3
                    beq      BT2211
                    cmp.b    #8,d3
                    beq      BT2211
                    cmp.b    #2,d3
                    beq      BT2211
                    cmp.b    #40,d3
                    beq      BT2211
                    cmp.b    #10,d3
                    beq      BT2211
                    cmp.b    #34,d3
                    beq      BT2211
                    cmp.b    #42,d3
                    beq      BT2211
                    move.b   #$FF,BT22SWO
                    move.l   -4(a0),d0
                    move.l   (a0),d1
                    move.l   4(a0),d2
                    move.l   8(a0),d3
                    move.l   d2,-4(a0)
                    move.l   d3,(a0)
                    move.l   d0,4(a0)
                    move.l   d1,8(a0)
BT2211:             add.w    #8,a0
                    dbra     d7,BT2202
                    cmp.b    #$FF,BT22SWO
                    dbne     d4,BT22ZZ
BT2226:             rts

BT30:               move.w   CMNUMO,d7
BT3020:             move.l   CMPLAD,a0
                    tst.b    CMBKCOL
                    beq      BT3025
                    jsr      BTC2
                    bra      BT3021

BT3025:             addq.l   #8,a0
BT3021:             bra      BT3006

BT3002:             move.l   (a0)+,a1
                    addq.w   #2,a1
                    move.w   (a1)+,d6
                    beq      BT300N
                    and.w    #$7F,d6
                    subq.w   #1,d6
BT3003:             move.w   (a1),d0
                    lsr.b    #4,d0
                    move.w   d0,CMCOL
                    move.w   (a1)+,d0
                    and.w    #15,d0
                    move.w   d0,CMNOV
                    movem.l  d6/d7/a0/a1,-(sp)
                    jsr      BIZBASH
                    movem.l  (sp)+,d6/d7/a0/a1
                    move.w   CMNOV,d0
                    asl.b    #2,d0
                    add.w    d0,a1
                    dbra     d6,BT3003
BT300N:             addq.l   #4,a0
BT3006:             dbra     d7,BT3002
                    rts

BT35X:              dc.w     0
BT35Y:              dc.w     0
BT35Z:              dc.w     0
BT35FE:             dc.w     0
BT35MD:             dc.w     0

BT35:               movem.l  d0-d7/a0-a6,-(sp)
                    move.w   CMUPD1,d0
                    and.w    #$804,d0
                    beq      BT35EXQ
                    move.w   CMOBHT,-(sp)
                    move.w   CMSHT1,d7
                    beq      BT3506
                    subq.w   #1,d7
                    lea      CMSHI1,a3
BT3501:             move.w   6(a3),d0
                    beq      BT3505
                    cmp.w    #1,d0
                    bne      BT3502
                    clr.w    CMOBHT
                    move.w   8(a3),CMSGTX
                    move.w   10(a3),CMSGTY
                    movem.l  d7/a3,-(sp)
                    jsr      BTE2
                    movem.l  (sp)+,d7/a3
                    move.w   CMOBHT,d0
                    cmp.w    (a3),d0
                    beq      BT3505
                    clr.w    6(a3)
                    bra      BT3505

BT3502:             move.w   (a3),CMOBJN
                    clr.w    d0
                    movem.l  d7/a3,-(sp)
                    jsr      FINDOB
                    move.w   CMFLY2,BT35FE
                    move.w   #1,CMFLY2
                    move.w   CMMNDT,BT35MD
                    clr.w    CMMNDT
                    move.w   2(a0),d0
                    asl.w    #6,d0
                    move.w   d0,BT35X
                    move.w   d0,CMNVX
                    move.w   4(a0),d0
                    asl.w    #6,d0
                    move.w   d0,BT35Y
                    move.w   d0,CMNVY
                    move.w   6(a0),d0
                    asl.w    #6,d0
                    move.w   d0,BT35Z
                    move.w   d0,CMNVZ
                    jsr      BTC8
                    movem.l  (sp)+,d7/a3
                    move.w   CMNVX,d0
                    cmp.w    BT35X,d0
                    bne      BT3503
                    move.w   CMNVY,d0
                    cmp.w    BT35Y,d0
                    bne      BT3503
                    move.w   CMNVZ,d0
                    cmp.w    BT35Z,d0
                    beq      BT3504
BT3503:             clr.w    6(a3)
BT3504:             move.w   BT35MD,CMMNDT
                    move.w   BT35FE,CMFLY2
BT3505:             lea      12(a3),a3
                    dbra     d7,BT3501
BT3506:             lea      CMINTR,a0
                    bset     #2,(a0)
BT3507:             btst     #0,(a0)
                    bne      BT3507
                    move.w   CMSHT1,CMSHT2
                    move.w   #4,d7
                    lea      CMSHI2+4,a0
                    lea      CMSHI1+4,a1
BT3508:             move.w   (a0),d0
                    beq      BT3509
                    cmp.w    #1,d0
                    bne      BT3510
BT3509:             moveq    #2,d0
BT3510:             move.w   d0,(a1)
                    lea      12(a0),a0
                    lea      12(a1),a1
                    dbra     d7,BT3508
                    lea      CMSHI1,a0
                    lea      CMSHI2,a1
                    move.w   #14,d7
BT35LP:             move.l   (a0)+,(a1)+
                    dbra     d7,BT35LP
                    move.w   CMNDS,d0
                    beq      BT3599
BT3599:             tst.w    CMDSND
                    beq      BT35NS
                    move.w   CMDSND,d0
                    jsr      BTF9
                    clr.w    CMDSND
BT35NS:             tst.w    CMSCRL
                    bne      BT35SC
                    tst.w    CMFADE
                    beq      BT35NF
                    jsr      BTE1
                    bra      BT35FD

BT35NF:             jsr      BIZSWAP
BT35FD:             bclr     #2,CMINTR
                    move.w   (sp)+,CMOBHT
BT35EXQ:            movem.l  (sp)+,d0-d7/a0-a6
                    rts

BT35SC:             cmp.w    #1,CMSCRL
                    bne      BT35SU
                    clr.w    CMSCRL
                    jsr      LIFTDN
                    bra      BT35FD

BT35SU:             jsr      LIFSUP
                    jsr      LIFTDN0
                    clr.w    CMSCRL
                    bra      BT35FD

BT40CD:             dcb.w    5,0

BT40:               move.b   #4,CMIND
                    jsr      BTAM4
                    clr.w    CMUPD1
                    clr.w    CMOBHT
                    clr.w    CMDSND
                    clr.w    CMFIRE
                    clr.w    CMFADE
                    clr.w    CMCOND
                    clr.w    CMBUMP
                    clr.w    CMKYCT
BT4001:             jsr      JOYSTICK
                    jsr      ICONCHK
                    jsr      KEYBOARD
                    jsr      DEMO
                    tst.w    CMGMOV
                    bne      BT4025
                    tst.w    DEMOMOD
                    bne      BT4052
                    move.b   lbB004076,d0
                    cmp.b    CMMNCT,d0
                    beq      BT4052
                    move.b   d0,CMMNCT
                    move.b   #1,CMCOND
                    bra      BT4014

BT4052:             tst.w    CMICCT
                    bne      BT40KY
                    tst.w    CMKYCT
                    bne      BT40KY
                    bra      BT4001

BT40KY:             clr.w    CMFIFTM
                    lea      BT40CD,a3
                    lea      CMKYBF,a0
                    move.w   CMKYCT,d7
                    beq      BT40NK
                    subq.w   #1,d7
BT401F:             lea      CMTRNN,a1
                    move.w   CMTRNS,d6
                    subq.w   #1,d6
BT402X:             move.b   (a0)+,d0
BT402Y:             cmp.b    (a1)+,d0
                    beq      BT4004
                    addq.l   #1,a1
                    dbra     d6,BT402Y
                    clr.w    d0
                    bra      BT4021

BT4004:             move.b   (a1)+,d0
BT4021:             move.b   d0,(a3)+
                    dbra     d7,BT401F
BT40NK:             jsr      ICONS
                    tst.w    CMKYCT
                    beq      BT4001
                    jsr      BTAM4
                    lea      BT40CD,a0
BT4016:             move.b   (a0)+,d0
                    movem.l  a0,-(sp)
                    beq      BT4013
                    cmp.b    #198,d0
                    beq      BT40SLF
                    cmp.b    #199,d0
                    bne      BT40NAB
BT40SLF:            jsr      ABORTSQ
                    bra      BT4013

BT40NAB:            cmp.b    #20,d0
                    bhi      BT4015
                    cmp.w    #16,d0
                    bge      BT40H20
BT40H20:            jsr      BTC9
                    bra      BT4013

BT4015:             cmp.b    #30,d0
                    bhi      BT4018
                    jsr      BTD8
                    bra      BT4013

BT4018:             cmp.b    #41,d0
                    bhi      BT4019
                    jsr      BTF6
                    bra      BT4013

BT4019:             cmp.b    #42,d0
                    bne      BT40E2
                    jsr      BTF7
                    bra      BT4013

BT40E2:             cmp.b    #44,d0
                    bne      BT40E1
                    bchg     #7,BTE6XYZ
                    bset     #3,CMUPD1
                    bra      BT4013

BT40E1:             btst     #1,CMDEBUG
                    beq      BT4011
                    cmp.b    #255,d0
                    beq      BT40MN1
                    cmp.b    #250,d0
                    bne      BT4011
                    st       MON_IMM
                    bra      BT40MN2

BT40MN1:            clr.w    MON_IMM
BT40MN2:            jsr      MON_MAC
                    bra      BT4013

BT4011:             cmp.b    #80,d0
                    bne      BT4011A
                    jsr      SAVEPOS
                    bra      BT4013

BT4011A:            cmp.b    #81,d0
                    bne      BT4012
                    jsr      LOADPOS
                    bra      BT4013

BT4012:             cmp.b    #254,d0
                    bne      BT4013
                    move.w   #2,CMUPD1
BT4013:             move.l   (sp)+,a0
                    sub.w    #1,CMKYCT
                    bgt      BT4016
BT4014:             move.w   CMFIFTM,CMAM
                    clr.w    CMFIFTM
                    rts

BT4025:             rts

DEMOMOD:            dc.w     0
DEMOPTR:            dc.l     DEMOSPC
DEMONAM:            dc.b     "demo.cmd",0
                    even
DEMOSPC:            dc.b     $50,$64,$30,0,$64,$64,$5F
                    dcb.b    4081,0
DEMOCHK:            dcb.l    8,0

DEMO:               tst.w    DEMOMOD
                    beq      DEMOEND
                    cmp.w    #2,DEMOMOD
                    beq      DEMOREC
                    tst.w    CMKYCT
                    beq      DEMOGO
                    move.b   #$C5,CMGMOV
DEMOGO:             move.l   DEMOPTR,a0
                    lea      CMKYBF,a1
                    clr.w    CMKYCT
                    moveq    #0,d0
                    move.b   (a0)+,d0
                    lsl.w    #1,d0
                    move.w   d0,MOUSEX
                    moveq    #0,d0
                    move.b   (a0)+,d0
                    move.w   d0,MOUSEY
                    move.w   #$FFFF,MOUSEM
DEMOPLP:            addq.w   #1,CMKYCT
                    move.b   (a0)+,(a1)+
                    tst.b    -1(a1)
                    bne      DEMOPLP
                    move.l   a0,DEMOPTR
                    subq.w   #1,CMKYCT
                    clr.w    CMICCT
DEMOEND:            rts

DEMOREC:            tst.w    CMKYCT
                    beq      DEMOEND
                    tst.l    DEMOCHK
                    beq      DEMOROK
                    move.w   #1,CMKYCT
                    move.b   #$5F,CMKYBF
DEMOROK:            move.l   DEMOPTR,a0
                    lea      CMKYBF,a1
                    move.w   CMKYCT,d7
                    subq.w   #1,d7
                    move.w   MOUSEX,d0
                    lsr.w    #1,d0
                    move.b   d0,(a0)+
                    move.w   MOUSEY,d0
                    move.b   d0,(a0)+
DEMORLP:            move.b   (a1)+,(a0)+
                    dbra     d7,DEMORLP
                    move.b   #0,(a0)+
                    move.l   a0,DEMOPTR
                    rts

DEMOLOD:            lea      DEMONAM,a1
                    lea      DEMOSPC,a0
                    move.l   #4096,d7
                    jsr      BLOAD
                    rts

DEMOSPY:            move.l   #DEMOSPC,DEMOPTR
                    move.w   #1,DEMOMOD
                    rts

DEMOSRC:            clr.l    DEMOCHK
                    move.l   #DEMOSPC,DEMOPTR
                    move.w   #2,DEMOMOD
                    rts

BT50:               move.w   CMOBHT,CMOBJN
                    beq      BT5002
                    clr.w    d0
                    jsr      FINDOB
                    beq      BT5002
                    move.w   (a0),d0
                    and.w    #15,d0
                    lea      CMENLN,a1
                    add.w    d0,d0
                    move.w   0(a1,d0.w),d1
                    move.w   16(a0),d0
                    sub.w    d1,d0
                    beq      BT5007
                    add.w    d1,d1
                    lea      0(a0,d1.w),a0
                    jsr      BTE3
                    bra      BT5002

BT5007:             move.w   CMBUMP,d0
                    beq      BT5002
                    move.w   CMUPD1,d0
                    btst     #2,d0
                    bne      BT5008
                    btst     #3,d0
                    beq      BT5009
BT5008:             move.w   #19,CMDSND
                    bra      BT5002

BT5009:             jsr      BTF9
BT5002:             move.l   CMGBLC,a0
                    move.w   (a0)+,d6
                    beq      BT5004
                    subq.w   #1,d6
BT5003:             move.w   (a0)+,d0
                    jsr      BTE3
                    add.w    d0,d0
                    lea      0(a0,d0.w),a0
                    dbra     d6,BT5003
BT5004:             move.l   CMLCLC,a0
                    move.w   (a0)+,d6
                    beq      BT5006
                    subq.w   #1,d6
BT5005:             move.w   (a0)+,d0
                    jsr      BTE3
                    add.w    d0,d0
                    lea      0(a0,d0.w),a0
                    dbra     d6,BT5005
BT5006:             rts

BTA1CM:             dcb.w    9,0

BTA1:               move.w   #3,d0
                    lea      BTA1CM,a1
BTA10F:             clr.l    (a1)+
                    dbra     d0,BTA10F
                    clr.w    (a1)+
                    lea      BTA1CM,a1
                    lea      CMQMAT,a2
                    move.w   #2,d5
BTA111:             lea      CMBMAT,a3
                    move.w   #2,d4
BTA110:             move.w   #2,d0
BTA101:             move.w   (a3),d1
                    muls     (a2)+,d1
                    add.w    d1,(a1)
                    add.w    #6,a3
                    dbra     d0,BTA101
                    add.w    #2,a1
                    subq.w   #6,a2
                    sub.w    #$10,a3
                    dbra     d4,BTA110
                    add.w    #6,a2
                    dbra     d5,BTA111
                    move.w   #8,d2
                    lea      BTA1CM,a1
                    lea      CMQMAT,a2
BTA102:             move.w   (a1)+,d1
                    ext.l    d1
                    divs     #$40,d1
                    move.w   d1,(a2)+
                    dbra     d2,BTA102
                    rts

BTA3:               lea      CMFACE,a1
                    lea      CMPNTS,a0
                    move.w   CMNOV,d4
                    subq.w   #1,d4
BTA305:             lea      CMQMAT,a2
                    moveq    #2,d3
BTA304:             moveq    #0,d0
                    move.w   (a0)+,d1
                    muls     (a2)+,d1
                    add.l    d1,d0
                    move.w   (a0)+,d1
                    muls     (a2)+,d1
                    add.l    d1,d0
                    move.w   (a0)+,d1
                    muls     (a2)+,d1
                    add.l    d1,d0
                    asr.l    #6,d0
                    move.w   d0,(a1)+
                    subq.w   #6,a0
                    dbra     d3,BTA304
                    addq.w   #6,a0
                    dbra     d4,BTA305
                    rts

BTA4:               movem.l  d0-d3,-(sp)
                    move.w   CMPLAN,d0
BTA4P1:             cmp.b    #1,d0
                    bne      BTA4P2
                    move.w   -6(a0),d0
                    add.w    -2(a0),d0
                    move.w   -6(a0),d1
                    sub.w    (a0),d1
                    sub.w    4(a0),d1
                    add.w    -2(a0),d1
                    move.w   d1,d3
                    move.w   4(a0),d2
                    sub.w    -2(a0),d2
                    muls     d0,d2
                    divs     d1,d2
                    add.w    d2,-2(a0)
                    move.w   -2(a0),d2
                    neg.w    d2
                    move.w   d2,-6(a0)
                    move.w   2(a0),d2
                    sub.w    -4(a0),d2
                    muls     d0,d2
                    divs     d3,d2
                    add.w    d2,-4(a0)
                    movem.l  (sp)+,d0-d3
                    rts

BTA4P2:             cmp.b    #2,d0
                    bne      BTA4P3
                    move.w   -4(a0),d0
                    add.w    -2(a0),d0
                    move.w   -4(a0),d1
                    sub.w    2(a0),d1
                    sub.w    4(a0),d1
                    add.w    -2(a0),d1
                    move.w   d1,d3
                    move.w   4(a0),d2
                    sub.w    -2(a0),d2
                    muls     d0,d2
                    divs     d1,d2
                    add.w    d2,-2(a0)
                    move.w   -2(a0),d2
                    neg.w    d2
                    move.w   d2,-4(a0)
                    move.w   (a0),d2
                    sub.w    -6(a0),d2
                    muls     d0,d2
                    divs     d3,d2
                    add.w    d2,-6(a0)
                    movem.l  (sp)+,d0-d3
                    rts

BTA4P3:             cmp.b    #3,d0
                    bne      BTA4P4
                    move.w   -2(a0),d0
                    sub.w    -6(a0),d0
                    move.w   (a0),d1
                    sub.w    -6(a0),d1
                    sub.w    4(a0),d1
                    add.w    -2(a0),d1
                    move.w   d1,d3
                    move.w   4(a0),d2
                    sub.w    -2(a0),d2
                    muls     d0,d2
                    divs     d1,d2
                    add.w    d2,-2(a0)
                    move.w   -2(a0),-6(a0)
                    move.w   2(a0),d2
                    sub.w    -4(a0),d2
                    muls     d0,d2
                    divs     d3,d2
                    add.w    d2,-4(a0)
                    movem.l  (sp)+,d0-d3
                    rts

BTA4P4:             cmp.b    #4,d0
                    bne      BTA4P5
                    move.w   -2(a0),d0
                    sub.w    -4(a0),d0
                    move.w   2(a0),d1
                    sub.w    -4(a0),d1
                    sub.w    4(a0),d1
                    add.w    -2(a0),d1
                    move.w   d1,d3
                    move.w   4(a0),d2
                    sub.w    -2(a0),d2
                    muls     d0,d2
                    divs     d1,d2
                    add.w    d2,-2(a0)
                    move.w   -2(a0),-4(a0)
                    move.w   (a0),d2
                    sub.w    -6(a0),d2
                    muls     d0,d2
                    divs     d3,d2
                    add.w    d2,-6(a0)
                    movem.l  (sp)+,d0-d3
                    rts

BTA4P5:             cmp.b    #5,d0
                    bne      BTA4P6
                    move.w   -2(a0),d0
                    sub.w    4(a0),d0
                    move.w   (a0),d1
                    sub.w    -6(a0),d1
                    muls     -2(a0),d1
                    divs     d0,d1
                    add.w    d1,-6(a0)
                    move.w   2(a0),d1
                    sub.w    -4(a0),d1
                    muls     -2(a0),d1
                    divs     d0,d1
                    add.w    d1,-4(a0)
                    clr.w    -2(a0)
                    movem.l  (sp)+,d0-d3
                    rts

BTA4P6:             cmp.b    #6,d0
                    bne      BTA4NP6
                    move.w   -2(a0),d0
                    sub.w    CMF,d0
                    move.w   -2(a0),d1
                    sub.w    4(a0),d1
                    move.w   (a0),d2
                    sub.w    -6(a0),d2
                    muls     d0,d2
                    divs     d1,d2
                    add.w    d2,-6(a0)
                    move.w   2(a0),d2
                    sub.w    -4(a0),d2
                    muls     d0,d2
                    divs     d1,d2
                    add.w    d2,-4(a0)
                    move.w   CMF,-2(a0)
BTA4NP6:            movem.l  (sp)+,d0-d3
                    rts

BTA5:               cmp.b    #1,d5
                    bne      BTA501
                    move.w   (a0),d0
                    add.w    4(a0),d0
                    beq      BTA5ONP
                    bpl      BTA5VIS
                    move.w   #1,ccr
                    rts

BTA501:             cmp.b    #2,d5
                    bne      BTA502
                    move.w   2(a0),d0
                    add.w    4(a0),d0
                    beq      BTA5ONP
                    bpl      BTA5VIS
                    move.w   #1,ccr
                    rts

BTA502:             cmp.b    #3,d5
                    bne      BTA503
                    move.w   4(a0),d0
                    sub.w    (a0),d0
                    beq      BTA5ONP
                    bpl      BTA5VIS
                    move.w   #1,ccr
                    rts

BTA503:             cmp.b    #4,d5
                    bne      BTA504
                    move.w   4(a0),d0
                    sub.w    2(a0),d0
                    beq      BTA5ONP
                    bpl      BTA5VIS
                    move.w   #1,ccr
                    rts

BTA504:             cmp.b    #5,d5
                    bne      BTA505
                    move.w   4(a0),d0
                    bpl      BTA5VIS
                    beq      BTA5ONP
                    move.w   #1,ccr
                    rts

BTA505:             move.w   4(a0),d0
                    sub.w    CMF,d0
                    beq      BTA5ONP
                    bpl      BTA5NVIS
BTA5VIS:            move.w   #0,ccr
                    rts

BTA5NVIS:           move.w   #1,ccr
                    rts

BTA5ONP:            move.w   #2,ccr
                    rts

BTA6:               move.w   CMNOV,d4
                    subq.w   #1,d4
                    lea      CMFAC2,a0
                    lea      CMFACE,a1
BTA610:             move.w   4(a1),d1
                    bne      BTA601
                    move.w   CMSCX,(a0)+
                    move.w   CMSCY,(a0)+
                    add.w    #6,a1
                    dbra     d4,BTA610
                    rts

BTA601:             move.w   (a1),d0
                    bpl      BTA602
                    add.w    d1,d0
                    bpl      BTA603
                    move.w   CMSCX,d0
                    sub.w    CMSX,d0
                    bra      BTA609

BTA602:             sub.w    d1,d0
                    bmi      BTA603
                    move.w   CMSCX,d0
                    add.w    CMSX,d0
                    subq.w   #1,d0
                    bra      BTA609

BTA603:             move.w   CMSX,d0
                    muls     (a1),d0
                    divs     d1,d0
                    add.w    CMSCX,d0
BTA609:             move.w   d0,(a0)+
                    move.w   2(a1),d0
                    bpl      BTA604
                    add.w    d1,d0
                    bpl      BTA605
                    move.w   CMSCY,d0
                    sub.w    CMSY,d0
                    subq.w   #1,d0
                    bra      BTA608

BTA604:             sub.w    d1,d0
                    bmi      BTA605
                    move.w   CMSCY,d0
                    add.w    CMSY,d0
                    bra      BTA608

BTA605:             move.w   CMSY,d0
                    muls     2(a1),d0
                    divs     d1,d0
                    add.w    CMSCY,d0
BTA608:             move.w   d0,(a0)+
                    addq.w   #6,a1
                    dbra     d4,BTA610
                    rts

BTA7:               jsr      BTA3
                    clr.w    CMOBCP
                    move.w   CMPLNS,d5
BTA704:             move.w   CMNOV,d4
                    subq.w   #1,d4
                    clr.w    CMOBVS
                    lea      CMFACE,a0
BTA705:             jsr      BTA5
                    bcs      BTA706
                    move.w   #1,CMOBVS
                    bra      BTA707

BTA706:             move.w   #1,CMOBCP
BTA707:             add.w    #6,a0
                    dbra     d4,BTA705
                    tst.w    CMOBVS
                    beq      BTA709
                    subq.w   #1,d5
                    bne      BTA704
                    move.w   #1,CMOBVS
BTA709:             rts

BTA8VS:             dcb.b    10,0
BTA8VIS:            dc.b     0
BTA8INVIS:          dc.b     0

BTA8:               move.w   CMPLNS,CMPLAN
BTA802:             lea      CMFACE,a0
                    lea      BTA8VS,a1
                    move.w   CMNOV,d1
                    subq.w   #1,d1
                    clr.b    BTA8INVIS
                    clr.b    BTA8VIS
                    move.w   CMPLAN,d5
BTA820:             bset     #0,(a1)
                    bclr     #7,(a1)
                    jsr      BTA5
                    bcc      BTA821
                    beq      BTA822
                    addq.b   #1,BTA8INVIS
                    bra      BTA823

BTA821:             bclr     #0,(a1)
                    addq.b   #1,BTA8VIS
                    bra      BTA823

BTA822:             bset     #7,(a1)
BTA823:             add.w    #6,a0
                    add.w    #1,a1
                    dbra     d1,BTA820
                    tst.b    BTA8INVIS
                    beq      BTA860
                    tst.b    BTA8VIS
                    bne      BTA843
                    clr.w    CMNOV
                    rts

BTA843:             clr.w    d7
                    move.w   CMNOV,d1
                    move.w   d1,d2
                    subq.w   #1,d1
                    cmp.w    #1,d1
                    beq      BTA824
                    move.w   d2,d3
                    add.w    d2,d2
                    add.w    d3,d2
                    add.w    d2,d2
                    lea      CMFACE,a0
                    add.w    d2,a0
                    move.l   CMFACE,(a0)+
                    move.w   CMFACE+4,(a0)
BTA824:             lea      CMCLPNTS,a1
                    lea      BTA8VS,a2
                    lea      CMFACE,a0
                    bra      BTA805

BTA803:             tst.b    (a2)
                    bmi      BTA805
                    move.b   -1(a2),d0
                    cmp.b    (a2),d0
                    beq      BTA805
                    tst.b    -1(a2)
                    bmi      BTA805
                    jsr      BTA4
                    tst.b    d7
                    beq      BTA852
                    move.l   -6(a0),d0
                    cmp.l    -6(a1),d0
                    bne      BTA852
                    move.w   -2(a0),d0
                    cmp.w    -2(a1),d0
                    bne      BTA852
                    bra      BTA805

BTA852:             move.l   -6(a0),(a1)+
                    move.w   -2(a0),(a1)+
                    addq.b   #1,d7
BTA805:             cmp.b    #1,(a2)
                    beq      BTA806
                    tst.b    d7
                    beq      BTA855
                    move.l   (a0),d0
                    cmp.l    -6(a1),d0
                    bne      BTA855
                    move.w   4(a0),d0
                    cmp.w    -2(a1),d0
                    beq      BTA806
BTA855:             move.l   (a0),(a1)+
                    move.w   4(a0),(a1)+
                    addq.b   #1,d7
BTA806:             add.w    #6,a0
                    add.w    #1,a2
                    dbra     d1,BTA803
                    cmp.w    #2,CMNOV
                    beq      BTA807
                    tst.b    BTA8VS
                    bmi      BTA807
                    move.b   -1(a2),d0
                    bmi      BTA807
                    cmp.b    BTA8VS,d0
                    beq      BTA807
                    jsr      BTA4
                    tst.b    d7
                    beq      BTA807
                    move.l   -6(a0),d0
                    cmp.l    -6(a1),d0
                    bne      BTA858
                    move.w   -2(a0),d0
                    cmp.w    -2(a1),d0
                    beq      BTA807
BTA858:             move.l   -6(a0),(a1)+
                    move.w   -2(a0),(a1)+
                    addq.b   #1,d7
BTA807:             move.w   d7,CMNOV
                    cmp.b    #1,d7
                    bhi      BTA859
                    clr.w    CMNOV
                    rts

BTA859:             subq.w   #1,d7
                    lea      CMCLPNTS,a0
                    lea      CMFACE,a1
BTA82Z:             move.l   (a0)+,(a1)+
                    move.l   (a0)+,(a1)+
                    move.l   (a0)+,(a1)+
                    dbra     d7,BTA82Z
BTA860:             subq.w   #1,CMPLAN
                    bne      BTA802
BTA808:             rts

BTB2:               movem.l  d0/d1,-(sp)
                    clr.l    d0
                    move.w   (a4),d1
                    muls     6(a4),d1
                    add.l    d1,d0
                    move.w   2(a4),d1
                    muls     4(a4),d1
                    sub.l    d1,d0
                    move.w   4(a4),d1
                    muls     10(a4),d1
                    add.l    d1,d0
                    move.w   6(a4),d1
                    muls     8(a4),d1
                    sub.l    d1,d0
                    move.w   8(a4),d1
                    muls     2(a4),d1
                    add.l    d1,d0
                    move.w   10(a4),d1
                    muls     (a4),d1
                    sub.l    d1,d0
                    tst.l    d0
                    beq      BTB2FI
                    bpl      BTB2FV
BTB2FI:             move.w   #1,ccr
                    jmp      BTB2EX

BTB2FV:             move.w   #0,ccr
BTB2EX:             movem.l  (sp)+,d0/d1
                    rts

BTB6CAN:            dc.w     0

BTB6:               move.l   a0,-(sp)
                    jsr      BTA6
                    move.l   (sp)+,a0
                    clr.w    CMOBVS
                    move.l   CMDRIN,a1
                    move.w   CMOBJN,(a1)+
                    move.l   a1,a6
                    clr.w    (a1)+
                    move.w   (a0)+,d7
                    subq.w   #1,d7
BTB604:             move.w   (a0)+,d6
                    bne      BTB605
                    move.w   (a0)+,d0
                    asl.w    #1,d0
                    add.w    d0,a0
                    jmp      BTB608

BTB605:             asl.w    #4,d6
e:                  move.l   a1,a5
                    addq.l   #2,a1
                    move.w   (a0)+,d5
                    or.b     d5,d6
                    subq.w   #1,d5
                    lea      CMFAC2,a2
BTB606:             move.w   (a0)+,d0
                    asl.w    #2,d0
                    move.l   0(a2,d0.w),d0
                    move.l   d0,(a1)+
                    dbra     d5,BTB606
                    lea      2(a5),a4
                    move.w   CMCDIR,d0
                    beq      BTB603
                    cmp.b    #1,d0
                    bne      BTB620
                    jsr      BTB2
                    bcc      BTB603
                    move.l   a5,a1
                    bra      BTB608

BTB620:             and.b    #15,d6
                    jsr      BTB2
                    bcc      BTB621
                    move.w   CMCOL,d0
                    and.w    #$F0,d0
                    beq      BTB608
                    or.b     d0,d6
                    jmp      BTB603

BTB621:             move.w   CMCOL,d0
                    and.w    #15,d0
                    beq      BTB608
                    asl.b    #4,d0
                    or.b     d0,d6
BTB603:             move.w   #1,CMOBVS
                    add.w    #1,(a6)
                    clr.w    d0
                    move.b   d6,d0
                    move.w   d0,(a5)
BTB608:             dbra     d7,BTB604
                    tst.w    CMOBVS
                    beq      BTB616
                    move.l   CMPRLT,a0
                    move.l   CMDRIN,(a0)+
                    move.l   a1,CMDRIN
                    move.l   CMPRIN,(a0)+
                    move.l   a0,CMPRLT
                    add.l    #12,CMPRIN
                    add.w    #1,CMNUMO
BTB616:             rts

BTB7:               move.w   CMNOV,d0
                    asl.w    #1,d0
                    add.w    CMNOV,d0
                    subq.w   #1,d0
                    lea      CMFACE,a1
                    lea      CMPNTS,a2
BTB7F1:             move.l   (a1)+,(a2)+
                    dbra     d0,BTB7F1
                    clr.w    CMOBVS
                    move.l   CMDRIN,a6
                    move.w   CMOBJN,(a6)+
                    clr.w    (a6)+
                    move.w   (a0)+,d5
                    subq.w   #1,d5
BTB704:             move.w   (a0)+,d4
                    bne      BTB705
                    move.w   (a0)+,d0
                    asl.w    #1,d0
                    add.w    d0,a0
                    jmp      BTB716

BTB705:             swap     d4
                    move.w   (a0)+,d4
                    move.w   d4,CMNOV
                    subq.w   #1,d4
                    lea      CMPNTS,a2
                    lea      CMFACE,a1
BTB706:             move.w   (a0),d0
                    asl.w    #1,d0
                    add.w    (a0)+,d0
                    asl.w    #1,d0
                    move.l   0(a2,d0.w),(a1)+
                    move.w   4(a2,d0.w),(a1)+
                    dbra     d4,BTB706
                    movem.l  d4/d5/a0,-(sp)
                    jsr      BTA8
                    tst.w    CMNOV
                    beq      BTB7EMX
                    jsr      BTA6
                    movem.l  (sp)+,d4/d5/a0
                    move.w   CMCDIR,d0
                    beq      BTB703
                    cmp.b    #1,d0
                    bne      BTB720
                    lea      CMFAC2,a4
                    jsr      BTB2
                    bcs      BTB716
                    jmp      BTB703

BTB720:             swap     d4
                    lea      CMFAC2,a4
                    jsr      BTB2
                    bcc      BTB721
                    move.w   CMCOL,d4
                    and.w    #$F0,d4
                    lsr.b    #4,d4
                    swap     d4
                    jmp      BTB703

BTB721:             move.w   CMCOL,d4
                    and.w    #15,d4
                    swap     d4
BTB703:             move.w   #1,CMOBVS
                    move.l   CMDRIN,a3
                    add.w    #1,2(a3)
                    swap     d4
                    asl.b    #4,d4
                    move.w   CMNOV,d0
                    or.b     d0,d4
                    move.w   d4,(a6)+
                    lea      CMFAC2,a1
                    and.w    #15,d4
                    subq.w   #1,d4
BTB7F7:             move.l   (a1)+,(a6)+
                    dbra     d4,BTB7F7
BTB716:             dbra     d5,BTB704
                    tst.w    CMOBVS
                    beq      BTB717
BTB718:             move.l   CMPRLT,a0
                    move.l   CMDRIN,(a0)+
                    move.l   a6,CMDRIN
                    move.l   CMPRIN,(a0)+
                    move.l   a0,CMPRLT
                    add.l    #12,CMPRIN
                    add.w    #1,CMNUMO
BTB717:             rts

BTB7EMX:            movem.l  (sp)+,d4/d5/a0
                    jmp      BTB716

BTC7BF:             dc.l     0

BTC7:               movem.w  d2-d5/d7,-(sp)
BTC719:             lea      CMOBHT,a6
                    clr.w    (a6)
                    jsr      BTD2
                    tst.w    CMFLY2
                    beq      BTC720
                    tst.w    d0
                    beq      BTC770
                    move.w   #1,CMBUMP
                    move.w   #1,d6
                    movem.w  (sp)+,d2-d5/d7
                    rts

BTC720:             tst.w    d0
                    beq      BTC721
                    clr.w    d1
                    move.w   #1,d2
                    jmp      BTC722

BTC721:             move.w   d0,d3
                    move.w   #1,d1
                    cmp.w    CMCRHT,d1
                    beq      BTC770
                    clr.w    d2
BTC722:             move.w   #1,d4
                    move.w   CMCY,d5
                    move.w   d5,d6
BTC727:             cmp.w    CMCRHT,d1
                    beq      BTC731
                    cmp.w    CMCLBA,d2
                    bpl      BTC730
                    addq.w   #1,d4
                    addq.w   #1,d6
                    cmp.w    #$3F,d6
                    beq      BTC730
                    lea      BTC7BF,a6
                    move.w   d7,d6
                    move.w   #12,d7
                    jsr      BTD2
                    move.w   d6,d7
                    tst.w    d0
                    bne      BTC730
                    addq.w   #1,d5
                    lea      CMOBHT,a6
                    jsr      BTD2
                    bne      BTC728
                    addq.w   #1,d1
                    jmp      BTC727

BTC728:             clr.w    d1
                    move.w   d4,d2
                    jmp      BTC727

BTC730:             move.w   d5,CMCY
                    move.w   #1,CMBUMP
                    move.w   #1,d6
                    movem.w  (sp)+,d2-d5/d7
                    rts

BTC731:             sub.w    CMCRHT,d4
                    add.w    d4,CMCY
                    move.w   d4,d6
                    tst.w    d4
                    beq      BTC770
                    move.w   #4,CMDSND
                    asl.w    #6,d4
                    add.w    d4,CMNVY
                    move.w   #2,d6
BTC770:             btst     #1,d7
                    beq      BTC702
                    btst     #0,d7
                    beq      BTC701
                    addq.w   #1,CMCX
                    jmp      BTC702

BTC701:             subq.w   #1,CMCX
BTC702:             btst     #5,d7
                    beq      BTC704
                    btst     #4,d7
                    beq      BTC703
                    addq.w   #1,CMCZ
                    jmp      BTC704

BTC703:             subq.w   #1,CMCZ
BTC704:             tst.w    CMFLY2
                    beq      BTC709
                    btst     #3,d7
                    beq      BTC710
                    btst     #2,d7
                    beq      BTC707
                    addq.w   #1,CMCY
                    jmp      BTC710

BTC707:             subq.w   #1,CMCY
BTC710:             clr.w    d6
BTC708:             movem.w  (sp)+,d2-d5/d7
                    rts

BTC709:             move.w   CMCY,d0
                    cmp.w    #0,d0
                    beq      BTC708
                    clr.w    d2
BTC773:             lea      CMOBHT,a6
                    move.w   d7,d6
                    move.l   #8,d7
                    jsr      BTD2
                    move.w   d6,d7
                    tst.w    d0
                    bne      BTC774
                    addq.w   #1,d2
                    subq.w   #1,CMCY
                    cmp.w    #0,CMCY
                    beq      BTC774
                    jmp      BTC773

BTC774:             tst.w    d2
                    beq      BTC708
                    move.w   #3,CMDSND
                    move.w   d2,d3
                    asl.w    #6,d2
                    sub.w    d2,CMNVY
                    cmp.w    CMFLLA,d2
                    bpl      BTC710
                    move.w   #$12,CMZROT
                    clr.w    CMXROT
                    move.w   #4,CMGMOV
                    move.w   #2,d6
BTC798:             movem.w  (sp)+,d2-d5/d7
                    rts

BTC8FX:             dc.w     0
BTC8FY:             dc.w     0
BTC8FZ:             dc.w     0
BTC8DR:             dc.b     0
                    even
BTC8HT:             dc.w     0
BTC8OT:             dc.w     0
BTC8BX:             dc.w     0
BTC8BY:             dc.w     0
BTC8BZ:             dc.w     0
BTC8SX:             dc.w     0
BTC8SY:             dc.w     0
BTC8SZ:             dc.w     0
BTC8PX:             dc.w     0
BTC8PY:             dc.w     0
BTC8PZ:             dc.w     0
BTC8CX:             dc.w     0
BTC8CY:             dc.w     0
BTC8CZ:             dc.w     0
BTC8UX:             dc.w     0
BTC8UY:             dc.w     0
BTC8UZ:             dc.w     0
BTC82X:             dc.w     0
BTC82Y:             dc.w     0
BTC82Z:             dc.w     0
BTC8LC:             dc.w     0
BTC8MF:             dc.w     0
BTC8FA:             dc.l     0

BTC8:               clr.w    CMOBHT
                    clr.w    BTC8OT
                    clr.w    BTC8HT
                    clr.w    BTC8UY
                    move.w   CMMNDT,d5
                    beq      BTC8AA
                    subq.w   #1,d5
BTC8AA:             clr.w    BTC8LC
                    tst.w    CMFLY2
                    bne      BTC8A0
                    move.w   #2,BTC8LC
                    move.w   CMSAVESTART,BTC8CX
                    move.w   CMVY,BTC8CY
                    move.w   CMVZ,BTC8CZ
                    move.w   CMCRHT,d0
                    asl.w    #6,d0
                    move.w   d0,BTC8HT
                    sub.w    #$40,d0
                    sub.w    d0,CMVY
                    sub.w    d0,CMNVY
BTC8A0:             move.w   CMNVX,d0
                    move.w   d0,BTC8FX
                    move.w   CMSAVESTART,d1
                    cmp.w    d0,d1
                    bgt      BTC8A1
                    exg      d0,d1
BTC8A1:             sub.w    d5,d0
                    add.w    d5,d1
                    move.w   d0,BTC8SX
                    move.w   d1,BTC8BX
                    move.w   CMNVY,d0
                    move.w   d0,BTC8FY
                    move.w   CMVY,d1
                    cmp.w    d0,d1
                    bgt      BTC8A2
                    exg      d0,d1
BTC8A2:             tst.w    CMFLY2
                    bne      BTC8A4
                    move.w   CMCRHT,d2
                    asl.w    #6,d2
                    move.w   d2,BTC8HT
                    add.w    d2,d1
BTC8A4:             sub.w    d5,d0
                    add.w    d5,d1
                    move.w   d0,BTC8SY
                    move.w   d1,BTC8BY
                    move.w   CMNVZ,d0
                    move.w   d0,BTC8FZ
                    move.w   CMVZ,d1
                    cmp.w    d0,d1
                    bgt      BTC8A3
                    exg      d0,d1
BTC8A3:             sub.w    d5,d0
                    add.w    d5,d1
                    move.w   d0,BTC8SZ
                    move.w   d1,BTC8BZ
                    clr.w    CMBUMP
                    move.w   CMMNDT,d5
                    clr.w    d7
                    move.w   CMNVX,d0
                    cmp.w    CMSAVESTART,d0
                    beq      BTC801
                    bgt      BTC802
                    bset     #0,d7
                    bra      BTC801

BTC802:             bset     #1,d7
BTC801:             move.w   CMNVY,d0
                    cmp.w    CMVY,d0
                    beq      BTC803
                    bgt      BTC804
                    bset     #2,d7
                    bra      BTC803

BTC804:             bset     #3,d7
BTC803:             move.w   CMNVZ,d0
                    cmp.w    CMVZ,d0
                    beq      BTC805
                    bgt      BTC806
                    bset     #4,d7
                    bra      BTC805

BTC806:             bset     #5,d7
BTC805:             move.b   d7,BTC8DR
                    beq      BTC8EX
                    tst.w    CMFLY2
                    bne      BTC8MOV
                    move.l   CMNVX,BTC8CX
                    move.w   CMNVZ,BTC8CZ
                    move.w   #$FFC0,d0
                    and.w    d0,BTC8CY
                    bsr      BTC8CF
                    tst.w    BTC8MF
                    bne      BTC8CK2
                    move.w   14(a0),CMOBHT
BTC8CK2:            move.l   CMSAVESTART,BTC8CX
                    move.w   CMVZ,BTC8CZ
                    move.w   #$FFC0,d0
                    and.w    d0,BTC8CY
BTC8CK:             bsr      BTC8CF
                    tst.w    BTC8MF
                    bne      BTC8MOV
                    move.w   2(a0),d0
                    asl.w    #6,d0
                    cmp.w    CMNVX,d0
                    bge      BTC8NTV
                    move.w   2(a0),d0
                    add.w    8(a0),d0
                    asl.w    #6,d0
                    cmp.w    CMNVX,d0
                    blt      BTC8NTV
                    move.w   6(a0),d0
                    asl.w    #6,d0
                    cmp.w    CMNVZ,d0
                    bge      BTC8NTV
                    move.w   6(a0),d0
                    add.w    12(a0),d0
                    asl.w    #6,d0
                    cmp.w    CMNVZ,d0
                    blt      BTC8NTV
                    clr.w    BTC8LC
                    bra      BTC8MOV

BTC8NTV:            btst     #0,d7
                    beq      BTC8NT1
                    move.w   2(a0),d0
                    bra      BTC8NTX

BTC8NT1:            btst     #1,d7
                    beq      BTC8NT2
                    move.w   2(a0),d0
                    add.w    8(a0),d0
BTC8NTX:            asl.w    #6,d0
                    move.w   d0,BTC8CX
                    sub.w    CMSAVESTART,d0
                    move.w   CMNVZ,d1
                    sub.w    CMVZ,d1
                    muls     d0,d1
                    move.w   CMNVX,d0
                    sub.w    CMSAVESTART,d0
                    divs     d0,d1
                    add.w    CMVZ,d1
                    move.w   d1,BTC8CZ
                    move.w   6(a0),d0
                    asl.w    #6,d0
                    cmp.w    d0,d1
                    blt      BTC8NT2
                    move.w   6(a0),d0
                    add.w    12(a0),d0
                    asl.w    #6,d0
                    cmp.w    d0,d1
                    bge      BTC8NT2
                    move.w   CMMNDT,d0
                    btst     #0,d7
                    beq      BTC8NT9
                    sub.w    d0,BTC8CX
                    bra      BTC8CK

BTC8NT9:            add.w    d0,BTC8CX
                    bra      BTC8CK

BTC8NT2:            btst     #4,d7
                    beq      BTC8NT3
                    move.w   6(a0),d0
                    bra      BTC8NTZ

BTC8NT3:            btst     #5,d7
                    beq      BTC8MOV
                    move.w   6(a0),d0
                    add.w    12(a0),d0
BTC8NTZ:            asl.w    #6,d0
                    move.w   d0,BTC8CZ
                    sub.w    CMVZ,d0
                    move.w   CMNVX,d1
                    sub.w    CMSAVESTART,d1
                    muls     d0,d1
                    move.w   CMNVZ,d0
                    sub.w    CMVZ,d0
                    divs     d0,d1
                    add.w    CMSAVESTART,d1
                    move.w   d1,BTC8CX
                    move.w   CMMNDT,d0
                    btst     #4,d7
                    beq      BTC8NT8
                    sub.w    d0,BTC8CZ
                    bra      BTC8CK

BTC8NT8:            add.w    d0,BTC8CZ
                    bra      BTC8CK

BTC8MOV:            move.l   CMOBDT,a0
                    move.w   CMTOTO,d6
                    beq      BTC8NOH
                    bsr      BTC8MV1
BTC8NOH:            lea      CMRBOT,a0
                    move.w   CMNPDO,d6
                    beq      BTC8THR
                    bsr      BTC8MV1
BTC8THR:            tst.w    BTC8LC
                    bne      BTC8LC1
BTC8HF:             move.w   BTC8FX,CMNVX
                    move.w   BTC8FY,CMNVY
                    move.w   BTC8FZ,CMNVZ
                    tst.w    CMOBHT
                    bra      BTC8EX2

BTC8LC1:            move.w   BTC8FX,d1
                    move.w   BTC8FY,d2
                    move.w   BTC8FZ,d3
                    bsr      BTC8DIS
                    move.w   d0,d4
                    move.w   BTC8CX,d1
                    move.w   BTC8CY,d2
                    move.w   BTC8CZ,d3
                    bsr      BTC8DIS
                    cmp.w    d0,d4
                    ble      BTC8HF
                    move.w   BTC8MF,d0
                    lsr.w    #6,d0
                    cmp.w    CMFLLA,d0
                    ble      BTC8FAL
                    move.w   #4,CMGMOV
                    bra      BTC8BYE

BTC8FAL:            move.l   BTC8FA,a0
                    move.w   14(a0),CMOBHT
                    move.w   BTC8MF,d0
                    sub.w    d0,BTC8CY
                    move.w   BTC8CX,CMNVX
                    move.w   BTC8CY,CMNVY
                    move.w   BTC8CZ,CMNVZ
                    move.w   #2,CMBUMP
BTC8EX2:            tst.w    CMFLY2
                    bne      BTC8EX3
                    move.w   BTC8UY,d0
                    beq      BTC8EX4
                    move.w   CMNVY,d1
                    and.w    #$FFC0,d1
                    sub.w    d1,d0
                    lsr.w    #6,d0
                    cmp.w    CMCLBA,d0
                    bgt      BTC8EX4
                    move.l   CMOBDT,a0
                    move.w   CMTOTO,d6
                    beq      BTC8EX
                    subq.w   #1,d6
BTC8CBL:            btst     #6,1(a0)
                    bne      BTC8CNX
                    move.w   4(a0),d0
                    asl.w    #6,d0
                    sub.w    BTC8HT,d0
                    cmp.w    BTC8UY,d0
                    bgt      BTC8CNX
                    move.w   4(a0),d0
                    add.w    10(a0),d0
                    asl.w    #6,d0
                    cmp.w    BTC8UY,d0
                    blt      BTC8CNX
                    move.w   2(a0),d0
                    asl.w    #6,d0
                    cmp.w    BTC8UX,d0
                    bgt      BTC8CNX
                    move.w   2(a0),d0
                    add.w    8(a0),d0
                    asl.w    #6,d0
                    cmp.w    BTC8UX,d0
                    blt      BTC8CNX
                    move.w   6(a0),d0
                    asl.w    #6,d0
                    cmp.w    BTC8UZ,d0
                    bgt      BTC8CNX
                    move.w   6(a0),d0
                    add.w    12(a0),d0
                    asl.w    #6,d0
                    cmp.w    BTC8UZ,d0
                    bge      BTC8CNX
BTC8CNX:            move.w   $10(a0),d0
                    add.w    d0,a0
                    add.w    d0,a0
                    dbra     d6,BTC8CBL
                    move.l   BTC8UX,CMNVX
                    move.w   BTC8UZ,CMNVZ
BTC8EX4:            move.w   BTC8HT,d0
                    sub.w    #$40,d0
                    add.w    d0,CMNVY
BTC8EX3:            tst.w    CMMNDT
                    beq      BTC8BYE
                    move.w   CMNVX,d0
                    lsr.w    #6,d0
                    move.w   d0,CMCX
                    move.w   CMNVY,d0
                    lsr.w    #6,d0
                    move.w   d0,CMCY
                    move.w   CMNVZ,d0
                    lsr.w    #6,d0
                    move.w   d0,CMCZ
                    jsr      BTF2
                    move.l   CMNVX,CMSAVESTART
                    move.w   CMNVZ,CMVZ
BTC8BYE:            moveq    #0,d0
                    rts

BTC8EX:             moveq    #1,d0
                    rts

BTC8DIS:            sub.w    CMSAVESTART,d1
                    bpl      BTC8DI1
                    neg.w    d1
BTC8DI1:            sub.w    CMVY,d2
                    bpl      BTC8DI2
                    neg.w    d2
BTC8DI2:            sub.w    CMVZ,d3
                    bpl      BTC8DI3
                    neg.w    d3
BTC8DI3:            move.w   d1,d0
                    add.w    d2,d0
                    add.w    d3,d0
                    rts

BTC8CL:             move.w   BTC8PX,d1
                    move.w   BTC8PY,d2
                    move.w   BTC8PZ,d3
                    bsr      BTC8DIS
                    move.w   d0,d4
                    move.w   BTC8FX,d1
                    move.w   BTC8FY,d2
                    move.w   BTC8FZ,d3
                    bsr      BTC8DIS
                    cmp.w    d0,d4
                    bgt      BTC8CLX
                    move.w   (a0),d1
                    and.w    #15,d1
                    cmp.w    #3,d1
                    bne      BTC8CLR
                    move.w   #$10,d1
BTC8CLR:            cmp.w    d0,d4
                    bne      BTC8CLC
                    cmp.w    BTC8OT,d1
                    blt      BTC8CLX
BTC8CLC:            move.l   BTC82X,BTC8UX
                    move.w   BTC82Z,BTC8UZ
                    move.l   BTC8PX,BTC8FX
                    move.w   BTC8PZ,BTC8FZ
                    move.w   14(a0),CMOBHT
                    move.w   #1,CMBUMP
                    move.w   d1,BTC8OT
                    tst.w    CMMNDT
                    bne      BTC8CLX
                    addq.w   #4,sp
                    move.l   BTC8FX,CMNVX
                    move.w   BTC8FZ,CMNVZ
BTC8CLX:            rts

BTC8CF:             move.w   #9999,BTC8MF
                    move.l   CMOBDT,a0
                    move.w   CMTOTO,d6
                    beq      BTC8SS
                    subq.w   #1,d6
BTC8FL:             btst     #6,1(a0)
                    bne      BTC8NX
                    move.w   BTC8CY,d4
                    move.w   4(a0),d0
                    add.w    10(a0),d0
                    asl.w    #6,d0
                    sub.w    d0,d4
                    bmi      BTC8NX
                    move.w   2(a0),d0
                    asl.w    #6,d0
                    cmp.w    BTC8CX,d0
                    bge      BTC8NX
                    move.w   2(a0),d0
                    add.w    8(a0),d0
                    asl.w    #6,d0
                    cmp.w    BTC8CX,d0
                    blt      BTC8NX
                    move.w   6(a0),d0
                    asl.w    #6,d0
                    cmp.w    BTC8CZ,d0
                    bge      BTC8NX
                    move.w   6(a0),d0
                    add.w    12(a0),d0
                    asl.w    #6,d0
                    cmp.w    BTC8CZ,d0
                    blt      BTC8NX
                    cmp.w    BTC8MF,d4
                    bgt      BTC8NX
                    move.l   a0,BTC8FA
                    move.w   d4,BTC8MF
                    move.w   (a0),d0
                    and.w    #15,d0
                    cmp.w    #3,d0
                    beq      BTC8SS
                    cmp.w    #10,d0
                    bge      BTC8SS
BTC8NX:             move.w   $10(a0),d0
                    add.w    d0,a0
                    add.w    d0,a0
                    dbra     d6,BTC8FL
BTC8SS:             move.l   BTC8FA,a0
                    rts

BTC8MV1:            subq.w   #1,d6
BTC807:             btst     #6,1(a0)
                    bne      BTC8TR
                    move.w   2(a0),d0
                    asl.w    #6,d0
                    cmp.w    BTC8BX,d0
                    bgt      BTC8TR
                    move.w   2(a0),d0
                    add.w    8(a0),d0
                    asl.w    #6,d0
                    cmp.w    BTC8SX,d0
                    blt      BTC8TR
                    move.w   4(a0),d0
                    asl.w    #6,d0
                    cmp.w    BTC8BY,d0
                    bgt      BTC8TR
                    move.w   4(a0),d0
                    add.w    10(a0),d0
                    asl.w    #6,d0
                    cmp.w    BTC8SY,d0
                    blt      BTC8TR
                    move.w   6(a0),d0
                    asl.w    #6,d0
                    cmp.w    BTC8BZ,d0
                    bgt      BTC8TR
                    move.w   6(a0),d0
                    add.w    12(a0),d0
                    asl.w    #6,d0
                    cmp.w    BTC8SZ,d0
                    blt      BTC8TR
BTC8CHX:            move.w   d5,d1
                    btst     #0,d7
                    beq      BTC8NXD
                    move.w   2(a0),d0
                    add.w    8(a0),d0
                    bra      BTC8PCX

BTC8NXD:            btst     #1,d7
                    beq      BTC8CHY
                    move.w   2(a0),d0
                    neg.w    d1
BTC8PCX:            asl.w    #6,d0
                    move.w   d0,BTC8PX
                    sub.w    CMSAVESTART,d0
                    move.w   CMNVZ,d1
                    sub.w    CMVZ,d1
                    muls     d0,d1
                    move.w   CMNVX,d2
                    sub.w    CMSAVESTART,d2
                    divs     d2,d1
                    add.w    CMVZ,d1
                    move.w   d1,BTC8PZ
                    move.w   6(a0),d2
                    asl.w    #6,d2
                    cmp.w    d2,d1
                    bge      BTC8XC1
                    btst     #4,d7
                    bne      BTC8TR
                    bra      BTC8CHY

BTC8XC1:            move.w   6(a0),d2
                    add.w    12(a0),d2
                    asl.w    #6,d2
                    cmp.w    d2,d1
                    blt      BTC8XC2
                    btst     #5,d7
                    bne      BTC8TR
                    bra      BTC8CHY

BTC8XC2:            move.w   CMNVY,d1
                    sub.w    CMVY,d1
                    muls     d0,d1
                    move.w   CMNVX,d2
                    sub.w    CMSAVESTART,d2
                    divs     d2,d1
                    add.w    CMVY,d1
                    move.w   d1,BTC8PY
                    move.w   4(a0),d0
                    asl.w    #6,d0
                    sub.w    BTC8HT,d0
                    cmp.w    d0,d1
                    bge      BTC8XC3
                    btst     #2,d0
                    bne      BTC8TR
                    bra      BTC8CHY

BTC8XC3:            move.w   4(a0),d0
                    add.w    10(a0),d0
                    asl.w    #6,d0
                    cmp.w    d0,d1
                    ble      BTC8XC4
                    btst     #3,d0
                    bne      BTC8TR
                    bra      BTC8CHY

BTC8XC4:            move.w   BTC8PX,BTC82X
                    move.w   4(a0),d0
                    add.w    10(a0),d0
                    asl.w    #6,d0
                    add.w    d5,d0
                    move.w   d0,BTC82Y
                    move.w   BTC8PZ,BTC82Z
                    btst     #0,d7
                    bne      BTC8XC5
                    sub.w    d5,BTC8PX
                    add.w    d5,BTC82X
                    bra      BTC8XC6

BTC8XC5:            add.w    d5,BTC8PX
                    sub.w    d5,BTC82X
BTC8XC6:            bsr      BTC8CL
                    bra      BTC8TR

BTC8CHY:            move.w   d5,d1
                    btst     #2,d7
                    beq      BTC8NYD
                    move.w   4(a0),d0
                    add.w    10(a0),d0
                    bra      BTC8PCY

BTC8NYD:            btst     #3,d7
                    beq      BTC8CHZ
                    move.w   4(a0),d0
                    sub.w    BTC8HT,d0
                    neg.w    d1
BTC8PCY:            asl.w    #6,d0
                    move.w   d0,BTC8PY
                    sub.w    CMVY,d0
                    move.w   CMNVZ,d1
                    sub.w    CMVZ,d1
                    muls     d0,d1
                    move.w   CMNVY,d2
                    sub.w    CMVY,d2
                    divs     d2,d1
                    add.w    CMVZ,d1
                    move.w   d1,BTC8PZ
                    move.w   6(a0),d2
                    asl.w    #6,d2
                    cmp.w    d2,d1
                    bge      BTC8YC1
                    btst     #4,d7
                    bne      BTC8TR
                    bra      BTC8CHZ

BTC8YC1:            move.w   6(a0),d2
                    add.w    12(a0),d2
                    asl.w    #6,d2
                    cmp.w    d2,d1
                    blt      BTC8YC2
                    btst     #5,d7
                    bne      BTC8TR
                    bra      BTC8CHZ

BTC8YC2:            move.w   CMNVX,d1
                    sub.w    CMSAVESTART,d1
                    muls     d0,d1
                    move.w   CMNVY,d2
                    sub.w    CMVY,d2
                    divs     d2,d1
                    add.w    CMSAVESTART,d1
                    move.w   d1,BTC8PX
                    move.w   2(a0),d0
                    asl.w    #6,d0
                    cmp.w    d0,d1
                    bge      BTC8YC3
                    btst     #0,d0
                    bne      BTC8TR
                    bra      BTC8CHZ

BTC8YC3:            move.w   2(a0),d0
                    add.w    8(a0),d0
                    asl.w    #6,d0
                    cmp.w    d0,d1
                    ble      BTC8YC4
                    btst     #1,d0
                    bne      BTC8TR
                    bra      BTC8CHZ

BTC8YC4:            btst     #2,d7
                    beq      BTC8YC5
                    add.w    d5,BTC8PY
                    bra      BTC8YC6

BTC8YC5:            sub.w    d5,BTC8PY
BTC8YC6:            bsr      BTC8CL
                    bra      BTC8TR

BTC8CHZ:            move.w   d5,d1
                    btst     #4,d7
                    beq      BTC8NZD
                    move.w   6(a0),d0
                    add.w    12(a0),d0
                    bra      BTC8PCZ

BTC8NZD:            btst     #5,d7
                    beq      BTC8TR
                    move.w   6(a0),d0
                    neg.w    d1
BTC8PCZ:            asl.w    #6,d0
                    move.w   d0,BTC8PZ
                    sub.w    CMVZ,d0
                    move.w   CMNVX,d1
                    sub.w    CMSAVESTART,d1
                    muls     d0,d1
                    move.w   CMNVZ,d2
                    sub.w    CMVZ,d2
                    divs     d2,d1
                    add.w    CMSAVESTART,d1
                    move.w   d1,BTC8PX
                    move.w   2(a0),d2
                    asl.w    #6,d2
                    cmp.w    d2,d1
                    blt      BTC8TR
BTC8ZC1:            move.w   2(a0),d2
                    add.w    8(a0),d2
                    asl.w    #6,d2
                    cmp.w    d2,d1
                    bge      BTC8TR
BTC8ZC2:            move.w   CMNVY,d1
                    sub.w    CMVY,d1
                    muls     d0,d1
                    move.w   CMNVX,d2
                    sub.w    CMSAVESTART,d2
                    divs     d2,d1
                    add.w    CMVY,d1
                    move.w   d1,BTC8PY
                    move.w   4(a0),d0
                    asl.w    #6,d0
                    sub.w    BTC8HT,d0
                    cmp.w    d0,d1
                    blt      BTC8TR
BTC8ZC3:            move.w   4(a0),d0
                    add.w    10(a0),d0
                    asl.w    #6,d0
                    cmp.w    d0,d1
                    bge      BTC8TR
BTC8ZC4:            move.w   BTC8PX,BTC82X
                    move.w   4(a0),d0
                    add.w    10(a0),d0
                    asl.w    #6,d0
                    add.w    d5,d0
                    move.w   d0,BTC82Y
                    move.w   BTC8PZ,BTC82Z
                    btst     #4,d7
                    beq      BTC8ZC5
                    add.w    d5,BTC8PZ
                    sub.w    d5,BTC82Z
                    bra      BTC8ZC6

BTC8ZC5:            sub.w    d5,BTC8PZ
                    add.w    d5,BTC82Z
BTC8ZC6:            bsr      BTC8CL
                    bra      BTC8TR

BTC8TR:             move.w   $10(a0),d0
                    add.w    d0,a0
                    add.w    d0,a0
                    dbra     d6,BTC807
                    rts

BTC9TMP:            dc.w     0

BTC9:               clr.w    d7
                    cmp.b    #1,d0
                    bne      BTC901
                    move.w   CMSAVESTART,CMNVX
                    move.w   CMVZ,CMNVZ
                    move.w   CMVY,d6
                    tst.w    CMFLY2
                    beq      BTC931
                    add.w    CMSTEP,d6
                    move.w   d6,CMNVY
                    move.w   d7,-(sp)
                    jsr      BTC8
                    move.w   (sp)+,d7
                    tst.b    d0
                    bne      BTC944
                    or.w     #$14,d7
                    bra      BTC944

BTC931:             move.w   CMCRH2,d0
                    cmp.w    CMMXH2,d0
                    bge      BTC944
BTC9F2:             move.w   CMSCAL,d0
                    mulu     #$40,d0
                    add.w    CMVY,d0
                    move.w   #1,CMFLY2
                    movem.w  d0/d6/d7,-(sp)
                    move.w   d0,CMNVY
                    move.w   CMSAVESTART,CMNVX
                    move.w   CMVZ,CMNVZ
                    jsr      BTC8
                    movem.w  (sp)+,d0/d6/d7
                    clr.w    CMFLY2
                    cmp.w    CMVY,d0
                    bne      BTC924
                    addq.w   #1,CMCRH2
                    move.w   CMSCAL,d0
                    add.w    d0,CMCRHT
                    or.w     #$8014,d7
                    bra      BTC944

BTC924:             move.w   d6,CMVY
                    bra      BTC944

BTC901:             cmp.b    #2,d0
                    bne      BTC902
                    tst.w    CMFLY2
                    beq      BTC934
                    move.w   CMSAVESTART,CMNVX
                    move.w   CMVZ,CMNVZ
                    move.w   CMVY,d0
                    sub.w    CMSTEP,d0
                    move.w   d0,CMNVY
                    move.w   d7,-(sp)
                    jsr      BTC8
                    move.w   (sp)+,d7
                    tst.b    d0
                    bne      BTC944
                    or.w     #$14,d7
                    bra      BTC944

BTC934:             move.w   CMCRH2,d0
                    cmp.w    #1,d0
                    ble      BTC944
                    subq.w   #1,CMCRH2
                    move.w   CMSCAL,d0
                    sub.w    d0,CMCRHT
                    asl.w    #6,d0
                    sub.w    d0,CMVY
                    or.w     #$8014,d7
                    bra      BTC944

BTC902:             cmp.b    #3,d0
                    beq      BTC903
                    cmp.b    #4,d0
                    bne      BTC906
BTC903:             lea      CMSNCS,a0
                    move.w   CMSTEP,d2
                    tst.w    CMFLY2
                    beq      BTC935A
                    cmp.w    #1,CMFLY2
                    beq      BTC935
                    cmp.w    #3,CMFLY2
                    beq      BTC935
BTC935A:            move.w   CMVY,CMNVY
                    bra      BTC939

BTC935:             move.w   CMXROT,d1
                    beq      BTC935A
                    asl.w    #2,d1
                    move.w   0(a0,d1.w),d2
                    neg.w    d2
                    muls     CMSTEP,d2
                    lsr.l    #6,d2
                    cmp.b    #3,d0
                    beq      BTC937
                    neg.w    d2
BTC937:             add.w    CMVY,d2
                    move.w   d2,CMNVY
                    move.w   2(a0,d1.w),d2
                    bpl      BTC938
                    neg.w    d2
BTC938:             muls     CMSTEP,d2
                    lsr.l    #6,d2
BTC939:             move.w   d2,d3
                    move.w   CMYROT,d1
                    asl.w    #2,d1
                    move.w   2(a0,d1.w),d4
                    muls     d4,d2
                    lsr.l    #6,d2
                    cmp.b    #3,d0
                    beq      BTC904
                    neg.w    d2
BTC904:             add.w    CMVZ,d2
                    move.w   d2,CMNVZ
                    move.w   0(a0,d1.w),d2
                    muls     d3,d2
                    lsr.l    #6,d2
                    cmp.b    #3,d0
                    beq      BTC905
                    neg.w    d2
BTC905:             add.w    CMSAVESTART,d2
                    move.w   d2,CMNVX
                    tst.w    CMFLY2
BTC940:             jsr      BTC8
                    tst.b    d0
                    bne      BTC944
                    or.w     #$14,d7
                    bra      BTC944

BTC906:             lea      CMYROT,a1
                    move.w   #$24,d7
                    cmp.b    #5,d0
                    beq      BTC914
                    cmp.b    #6,d0
                    beq      BTC912
                    move.w   #$44,d7
                    subq.l   #2,a1
                    cmp.b    #7,d0
                    beq      BTC914
                    cmp.b    #8,d0
                    beq      BTC912
                    move.w   #4,d7
                    addq.l   #4,a1
                    cmp.b    #10,d0
                    beq      BTC914
                    cmp.b    #9,d0
                    bne      BTC916
BTC912:             move.w   CMANGL,d1
                    add.w    (a1),d1
                    cmp.w    #$47,d1
                    ble      BTC913
                    sub.w    #$48,d1
BTC913:             move.w   d1,(a1)
                    bra      BTC944

BTC914:             move.w   (a1),d1
                    sub.w    CMANGL,d1
                    bpl      BTC915
                    add.w    #$48,d1
BTC915:             move.w   d1,(a1)
                    bra      BTC944

BTC916:             clr.w    d7
                    cmp.b    #13,d0
                    bne      BTC952
                    move.w   #$24,d7
                    add.w    #$24,CMYROT
                    cmp.w    #$48,CMYROT
                    blt      BTC950
                    sub.w    #$48,CMYROT
BTC950:             tst.w    CMFLY2
                    bne      BTC9FG
BTC9FZ:             bra      BTC944

BTC9FG:             tst.w    CMXROT
                    beq      BTC9FZ
                    sub.w    #$48,CMXROT
                    neg.w    CMXROT
                    move.w   #$64,d7
                    bra      BTC944

BTC952:             lea      CMANGS,a1
                    move.w   CMANGN,d2
                    cmp.b    #11,d0
                    bne      BTC917
                    cmp.w    CMNANG,d2
                    beq      BTC919
                    addq.w   #1,d2
                    bra      BTC918

BTC917:             cmp.b    #12,d0
                    bne      BTC919
                    tst.w    d2
                    ble      BTC944
                    subq.w   #1,d2
BTC918:             move.w   d2,CMANGN
                    add.w    d2,d2
                    move.w   0(a1,d2.w),CMANGL
                    or.w     #$80,d7
                    bra      BTC922

BTC919:             lea      CMSTPS,a1
                    move.w   CMSTPN,d2
                    cmp.b    #$11,d0
                    bne      BTC920
                    cmp.w    CMNSTP,d2
                    beq      BTC944
                    addq.w   #1,d2
                    bra      BTC921

BTC920:             cmp.b    #$12,d0
                    bne      BTC944
                    tst.w    d2
                    beq      BTC944
                    subq.w   #1,d2
BTC921:             move.w   d2,CMSTPN
                    add.w    d2,d2
                    move.w   0(a1,d2.w),d1
                    move.w   d1,CMSTP2
                    mulu     CMSCAL,d1
                    move.w   d1,CMSTEP
                    or.w     #$100,d7
BTC922:             move.w   #7,CMDLCT
BTC925:             tst.w    CMDLCT
                    bpl      BTC925
BTC944:             or.w     d7,CMUPD1
                    rts

BTD8:               clr.w    CMFIRE
                    cmp.b    #$16,d0
                    bne      BTD899
BTD8MS:             btst     #0,CMINTR
                    bne      BTD8MS
                    move.w   #1,d0
                    jsr      BTF9
                    jsr      SPROFF
                    move.w   MOUSEX,d0
                    move.w   d0,CMSGTX
                    move.w   #$C7,d1
                    sub.w    MOUSEY,d1
                    move.w   d1,CMSGTY
                    movem.w  d0/d1,-(sp)
                    jsr      BTD8LN
                    jsr      BTE2
                    movem.w  (sp)+,d0/d1
                    jsr      BTD8LN
                    move.w   #1,CMCOND
                    move.w   #1,CMFIRE
                    jsr      SPRON
BTD899:             rts

BTD8LN:             move.l   DISPLAY_SEG1,a6
                    add.w    #8000,a6
                    neg.w    d1
                    add.w    #$C7,d1
                    moveq    #2,d7
BTD8LNL:            movem.l  d0/d1/d7/a6,-(sp)
                    moveq    #$24,d2
                    add.w    d7,d2
                    add.w    d7,d2
                    moveq    #$75,d3
                    moveq    #$1F,d4
                    jsr      BTD4
                    movem.l  (sp)+,d0/d1/d7/a6
                    movem.l  d0/d1/d7/a6,-(sp)
                    move.w   #$11B,d2
                    sub.w    d7,d2
                    sub.w    d7,d2
                    moveq    #$75,d3
                    moveq    #$1F,d4
                    jsr      BTD4
                    movem.l  (sp)+,d0/d1/d7/a6
                    movem.l  d0/d1/d7/a6,-(sp)
                    moveq    #$24,d2
                    moveq    #$75,d3
                    sub.w    d7,d3
                    sub.w    d7,d3
                    moveq    #$1E,d4
                    jsr      BTD4
                    movem.l  (sp)+,d0/d1/d7/a6
                    movem.l  d0/d1/d7/a6,-(sp)
                    move.w   #$11B,d2
                    moveq    #$75,d3
                    sub.w    d7,d3
                    sub.w    d7,d3
                    moveq    #$1E,d4
                    jsr      BTD4
                    movem.l  (sp)+,d0/d1/d7/a6
                    dbra     d7,BTD8LNL
                    rts

BTD2SH:             dc.w     0

BTD2:               movem.l  d1-d7,-(sp)
                    clr.w    BTD2SH
                    move.w   CMTOTO,d5
                    beq      BTD2FF
                    move.l   CMOBDT,a0
                    jsr      BTD201
BTD2FF:             move.w   CMNPDO,d5
                    beq      BTD298
                    lea      CMRBOT,a0
                    jsr      BTD201
BTD298:             clr.w    d0
                    tst.w    BTD2SH
                    beq      BTD299
                    move.w   BTD2SH,(a6)
                    move.w   #1,d0
BTD299:             movem.l  (sp)+,d1-d7
                    rts

BTD201:             subq.w   #1,d5
                    move.w   CMCX,d0
                    btst     #0,d7
                    beq      BTD2NX
                    addq.w   #1,d0
BTD2NX:             move.w   CMCY,d1
                    btst     #2,d7
                    beq      BTD2NY
                    addq.w   #1,d1
BTD2NY:             move.w   CMCZ,d2
                    btst     #4,d7
                    beq      BTD2NZ
                    addq.w   #1,d2
BTD2NZ:             btst     #6,1(a0)
                    bne      BTD226
                    btst     #1,d7
                    beq      BTD2X0
                    move.w   2(a0),d4
                    cmp.w    d4,d0
                    beq      BTD2X1
                    add.w    8(a0),d4
                    cmp.w    d4,d0
                    bne      BTD2X0
BTD2X1:             move.w   4(a0),d4
                    cmp.w    d4,d1
                    blt      BTD2X0
                    add.w    10(a0),d4
                    cmp.w    d4,d1
                    bge      BTD2X0
                    move.w   6(a0),d4
                    cmp.w    d4,d2
                    blt      BTD2X0
                    add.w    12(a0),d4
                    cmp.w    d4,d2
                    blt      BTD225
BTD2X0:             btst     #3,d7
                    beq      BTD2Y0
                    move.w   4(a0),d4
                    cmp.w    d4,d1
                    beq      BTD2Y1
                    add.w    10(a0),d4
                    cmp.w    d4,d1
                    bne      BTD2Y0
BTD2Y1:             move.w   2(a0),d4
                    cmp.w    d4,d0
                    blt      BTD2Y0
                    add.w    8(a0),d4
                    cmp.w    d4,d0
                    bge      BTD2Y0
                    move.w   6(a0),d4
                    cmp.w    d4,d2
                    blt      BTD2Y0
                    add.w    12(a0),d4
                    cmp.w    d4,d2
                    blt      BTD225
BTD2Y0:             btst     #5,d7
                    beq      BTD2Z0
                    move.w   6(a0),d4
                    cmp.w    d4,d2
                    beq      BTD2Z1
                    add.w    12(a0),d4
                    cmp.w    d4,d2
                    bne      BTD2Z0
BTD2Z1:             move.w   4(a0),d4
                    cmp.w    d4,d1
                    blt      BTD2Z0
                    add.w    10(a0),d4
                    cmp.w    d4,d1
                    bge      BTD2Z0
                    move.w   2(a0),d4
                    cmp.w    d4,d0
                    blt      BTD2Z0
                    add.w    8(a0),d4
                    cmp.w    d4,d0
                    blt      BTD225
BTD2Z0:             bra      BTD226

BTD225:             move.w   (a0),d4
                    and.w    #15,d4
                    cmp.w    #3,d4
                    beq      BTD227
                    cmp.w    #10,d4
                    bpl      BTD227
                    move.w   14(a0),BTD2SH
                    jmp      BTD226

BTD227:             move.w   14(a0),(a6)
                    move.w   #1,d0
                    movem.l  (sp)+,d1-d7
                    addq.l   #4,sp
                    move.w   #1,d0
                    rts

BTD226:             move.w   $10(a0),d4
                    asl.w    #1,d4
                    lea      0(a0,d4.w),a0
                    dbra     d5,BTD2NZ
                    rts

BTE8MT:             dc.w     -32,0,0,0,15,-16,0,0,0,15,-8,0,0,0,15
                    dc.w     -4,0,0,0,15,-2,0,0,0,15,-1,0,0,0,15
                    dc.w     -1,$8000,0,0,15,-1,-16384,0,0,15,-1,-8192
                    dc.w     0,0,15,-1,-4096,0,0,15,-1,-2048,0,0,15
                    dc.w     -1,-1024,0,0,15,-1,-512,0,0,15,-1,-256
                    dc.w     0,0,15,-1,-128,0,0,15,-1,-64,0,0,15
                    dc.w     -1,-32,0,0,15,-1,-16,0,0,15,-1,-8
                    dc.w     0,0,15,-1,-4,0,0,15,-1,-2,0,0,15
                    dc.w     -1,-1,0,0,15,-1,-1,-32768,0,15,-1
                    dc.w     -1,-16384,0,15,-1,-1,-8192,0,15,-1
                    dc.w     -1,-4096,0,15,-1,-1,-2048,0,15,-1
                    dc.w     -1,-1024,0,15,-1,-1,-512,0,15,-1
                    dc.w     -1,-256,0,15,-1,-1,-64,0,15,-1
                    dc.w     -1,-32,0,15,-1,-1,-16,0,15,-1
                    dc.w     -1,-8,0,15,-1,-1,-4,0,15,-1
                    dc.w     -1,-2,0,15,-1,-1,-1,0,15,-1
                    dc.w     -1,-1,-32768,15,-1,-1,-1,-16384,15
                    dc.w     -1,-1,-1,-8192,15,-1,-1,-1
                    dc.w     -4096,15,-1,-1,-1,-2048,15,-1,-1
                    dc.w     -1,-1024,15,-1,-1,-1,-512,15,-1
                    dc.w     -1,-1,-256,15,-1,-1,-1,-128,15
                    dc.w     -1,-1,-1,-64,15,-1,-1,-1
                    dc.w     -32,15,-1,-1,-1,-16,15,-1,-1
                    dc.w     -1,-8,15,-1,-1,-1,-4,15,-1
                    dc.w     -1,-1,-2,15,-1,-1,-1,-1
                    dc.w     -32753,-1,-1,-1,-1,-16369,-1,-1
                    dc.w     -1,-1,-8177,-1,-1,-1,-1,-4081
                    dc.w     -1,-1,-1,-1,-2033,-1,-1,-1
                    dc.w     -1,-1009,-1,-1,-1,-1,-497,-1
                    dc.w     -1,-1,-1,-241,-1,-1,-1,-1
                    dc.w     -113,-1,-1,-1,-1,-49,-1,-1
                    dc.w     -1,-1,-17,-1,-1,-1,-1,-1

BTE8:               movem.w  d0/d1,-(sp)
                    lea      BTE8MT,a0
                    lea      SPRBAM,a1
                    add.w    d7,d7
                    add.w    d7,a0
                    asl.w    #2,d7
                    add.w    d7,a0
                    move.l   (a0)+,(a1)+
                    move.l   (a0)+,(a1)+
                    move.w   (a0)+,(a1)+
                    lea      SPRBAR,a2
                    lea      SPRBAM,a1
                    lea      SPRBAW,a0
                    movem.l  a0-a2,-(sp)
                    move.w   4(a0),d2
                    add.w    d2,a2
                    jsr      DRWBLOB
                    movem.l  (sp)+,a0-a2
                    not.l    (a1)
                    not.l    4(a1)
                    not.w    8(a1)
                    or.w     #-32,(a1)
                    or.w     #15,8(a1)
                    movem.w  (sp)+,d0/d1
                    jsr      DRWBLOB
                    rts

BTF2BF:             dc.l     0

BTF2:               clr.w    d7
                    move.w   #$40,d5
                    sub.w    CMMNDT,d5
                    move.w   CMNVX,d0
                    and.w    #$3F,d0
                    cmp.w    CMMNDT,d0
                    bge      BTF201
                    bset     #1,d7
BTF201:             cmp.w    d5,d0
                    blt      BTF203
                    bset     #1,d7
                    bset     #0,d7
BTF203:             move.w   CMNVY,d0
                    and.w    #$3F,d0
                    cmp.w    CMMNDT,d0
                    bge      BTF204
                    bset     #3,d7
BTF204:             cmp.w    d5,d0
                    blt      BTF205
                    bset     #3,d7
                    bset     #2,d7
BTF205:             move.w   CMNVZ,d0
                    and.w    #$3F,d0
                    cmp.w    CMMNDT,d0
                    bge      BTF206
                    bset     #5,d7
BTF206:             cmp.w    d5,d0
                    blt      BTF209
                    bset     #5,d7
                    bset     #4,d7
BTF209:             lea      BTF2BF,a6
                    tst.w    CMOBHT
                    beq      BTF210
                    lea      CMOBHT,a6
BTF210:             tst.w    d7
                    beq      BTF212
                    move.w   d5,-(sp)
                    jsr      BTD2
                    movem.w  (sp)+,d5
                    beq      BTF212
                    move.w   CMNVX,d0
                    btst     #1,d7
                    beq      BTF292
                    and.w    #$FFC0,d0
                    btst     #0,d7
                    beq      BTF291
                    add.w    d5,d0
                    jmp      BTF292

BTF291:             add.w    CMMNDT,d0
BTF292:             move.w   d0,CMNVX
                    move.w   CMNVY,d0
                    btst     #3,d7
                    beq      BTF294
                    and.w    #$FFC0,d0
                    btst     #2,d7
                    beq      BTF293
                    add.w    d5,d0
                    jmp      BTF294

BTF293:             add.w    CMMNDT,d0
BTF294:             move.w   d0,CMNVY
                    move.w   CMNVZ,d0
                    btst     #5,d7
                    beq      BTF212
                    and.w    #$FFC0,d0
                    btst     #4,d7
                    beq      BTF295
                    add.w    d5,d0
                    jmp      BTF296

BTF295:             add.w    CMMNDT,d0
BTF296:             move.w   d0,CMNVZ
BTF212:             rts

BTF6PC:             dc.w     0
BTF6DS:             dc.w     0

BTF6:               movem.l  d0-d7/a0-a6,-(sp)
                    move.w   CMKYCT,d1
                    cmp.w    #1,d1
                    bne      BTF699
                    lea      CMMES3,a0
                    move.w   CMDSET,d2
                    cmp.w    #$12,d2
                    bgt      BTF690
                    lea      CMDSTA,a1
                    subq.w   #1,d2
                    add.w    d2,a1
                    add.w    d2,a1
                    move.w   (a1),d1
                    cmp.b    #$28,d0
                    bne      BTF630
                    lea      CMME13,a0
                    tst.w    d1
                    bne      BTF690
                    bra      BTF631

BTF630:             lea      CMME14,a0
                    tst.w    d1
                    beq      BTF690
BTF631:             lea      CMMES9,a0
                    tst.w    CMFLY2
                    bne      BTF690
                    lea      CMMES8,a0
                    cmp.w    #5,CMENER
                    bmi      BTF690
                    cmp.b    #$28,d0
                    beq      BTF634
                    lea      CMDPCT,a2
                    add.w    d2,a2
                    add.w    d2,a2
                    move.w   (a2),d1
                    clr.w    (a2)
                    move.l   CMDPTA,a2
                    add.w    d2,a2
                    add.w    d2,a2
                    move.w   (a2),d3
                    mulu     #10,d1
                    mulu     d3,d1
                    sub.l    d1,CMSCOR
                    bset     #1,CMUPD1
                    sub.w    #5,CMENER
                    movem.l  d0-d7/a0-a4,-(sp)
                    move.w   #11,d0
                    move.w   #$BA,d1
                    move.w   CMENER,d7
                    jsr      BTE8
                    movem.l  (sp)+,d0-d7/a0-a4
                    move.w   (a1),d1
                    clr.w    (a1)
                    cmp.w    #3,d1
                    bne      BTF636
                    subq.w   #1,CMNSCD
BTF636:             jsr      BTF660
                    lea      CMME11,a0
                    jsr      BTF670
                    bra      BTF629

BTF634:             move.w   CMSAVESTART,d4
                    move.w   CMVZ,d5
                    asr.w    #6,d4
                    asr.w    #6,d5
                    move.w   CMYROT,d3
                    lea      CMSNCS,a0
                    asl.w    #2,d3
                    move.w   0(a0,d3.w),d1
                    move.w   2(a0,d3.w),d2
                    move.w   d1,d3
                    add.w    d1,d1
                    add.w    d3,d1
                    asr.w    #5,d1
                    move.w   d2,d3
                    add.w    d2,d2
                    add.w    d3,d2
                    asr.w    #5,d2
                    add.w    d1,d4
                    add.w    d2,d5
BTF604:             subq.w   #6,d4
                    subq.w   #6,d5
                    lea      CMMES5,a0
                    move.w   #0,d1
                    cmp.w    d1,d4
                    ble      BTF690
                    move.w   #$7F,d1
                    sub.w    #12,d1
                    cmp.w    d1,d4
                    bge      BTF690
                    move.w   #0,d1
                    cmp.w    d1,d5
                    ble      BTF690
                    move.w   #$7F,d1
                    sub.w    #12,d1
                    cmp.w    d1,d5
                    bge      BTF690
                    addq.w   #6,d4
                    addq.w   #6,d5
                    move.w   CMVY,d1
                    asr.w    #6,d1
                    sub.w    CMCRHT,d1
                    addq.w   #1,d1
                    beq      BTF607
                    move.l   CMOBDT,a3
                    move.w   CMTOTO,d7
                    subq.w   #1,d4
                    subq.w   #1,d5
                    subq.w   #1,d7
                    bmi      BTF690
BTF605:             btst     #6,1(a3)
                    bne      BTF606
                    move.w   (a3),d2
                    and.w    #15,d2
                    cmp.w    #1,d2
                    bne      BTF606
                    move.w   4(a3),d2
                    add.w    10(a3),d2
                    cmp.w    d1,d2
                    bne      BTF606
                    cmp.w    2(a3),d4
                    blt      BTF606
                    cmp.w    6(a3),d5
                    blt      BTF606
                    move.w   2(a3),d2
                    add.w    8(a3),d2
                    subq.w   #2,d2
                    cmp.w    d2,d4
                    bgt      BTF606
                    move.w   6(a3),d2
                    add.w    12(a3),d2
                    subq.w   #2,d2
                    cmp.w    d2,d5
                    ble      BTF607
BTF606:             move.w   $10(a3),d2
                    add.w    d2,a3
                    add.w    d2,a3
                    dbra     d7,BTF605
                    bra      BTF690

BTF607:             subq.w   #5,d4
                    subq.w   #5,d5
                    move.l   CMOBDT,a3
                    move.w   CMTOTO,d7
                    subq.w   #1,d7
                    bmi      BTF690
BTF608:             btst     #6,1(a3)
                    bne      BTF609
                    move.w   (a3),d2
                    and.w    #15,d2
                    cmp.w    #1,d2
                    bne      BTF609
                    move.w   4(a3),d2
                    add.w    10(a3),d2
                    cmp.w    d2,d1
                    bge      BTF609
                    move.w   2(a3),d2
                    sub.w    #11,d2
                    cmp.w    d2,d4
                    blt      BTF609
                    move.w   4(a3),d2
                    sub.w    #$16,d2
                    cmp.w    d2,d1
                    blt      BTF609
                    move.w   6(a3),d2
                    sub.w    #11,d2
                    cmp.w    d2,d5
                    blt      BTF609
                    move.w   2(a3),d2
                    add.w    8(a3),d2
                    cmp.w    d2,d4
                    bge      BTF609
                    move.w   6(a3),d2
                    add.w    12(a3),d2
                    cmp.w    d2,d5
                    blt      BTF690
BTF609:             move.w   $10(a3),d2
                    add.w    d2,a3
                    add.w    d2,a3
                    dbra     d7,BTF608
                    bra      BTF610

BTF690:             move.l   a0,-(sp)
                    moveq    #15,d0
                    jsr      CONPEN
                    move.w   #$BC,d0
                    move.w   #$B1,d1
                    jsr      CONMOV1
                    move.l   (sp),a0
                    moveq    #14,d0
                    jsr      CONPLT
                    move.w   #$32,CMDLCT
BTF691:             tst.w    CMDLCT
                    bpl      BTF691
                    moveq    #1,d0
                    jsr      CONPEN
                    move.w   #$BC,d0
                    move.w   #$B1,d1
                    jsr      CONMOV1
                    move.l   (sp)+,a0
                    moveq    #14,d0
                    jsr      CONPLT
                    bra      BTF699

BTF610:             sub.w    #5,CMENER
                    movem.l  d0-d7/a0-a4,-(sp)
                    move.w   #11,d0
                    move.w   #$BA,d1
                    move.w   CMENER,d7
                    jsr      BTE8
                    movem.l  (sp)+,d0-d7/a0-a4
                    move.w   CMDSET,d2
                    subq.w   #1,d2
                    lea      CMRPOS,a0
                    add.w    d2,d2
                    add.w    d2,a0
                    add.w    d2,a0
                    add.w    d2,a0
                    addq.w   #2,d4
                    addq.w   #2,d5
                    move.w   d4,(a0)+
                    move.w   d1,(a0)+
                    move.w   d5,(a0)+
                    addq.w   #4,d4
                    addq.w   #4,d5
                    move.w   CMDPOX,d2
                    sub.w    d4,d2
                    bpl      BTF616
                    neg.w    d2
BTF616:             move.w   CMDPOZ,d3
                    sub.w    d5,d3
                    bpl      BTF617
                    neg.w    d3
BTF617:             add.w    d3,d2
                    mulu     #$64,d2
                    divu     CMDRNG,d2
                    neg.l    d2
                    add.w    #$64,d2
                    ble      BTF680
                    move.w   d2,BTF6PC
                    tst.w    CMFRIG
                    bne      BTF618
                    st       CMFRIG
                    move.w   CMCLCT,d2
                    and.w    #15,d2
                    lea      CMDPTS,a4
                    add.w    d2,a4
                    add.w    d2,a4
                    move.l   a4,CMDPTA
BTF618:             move.w   CMDSET,d1
                    subq.w   #1,d1
                    lea      CMDSTA,a1
                    lea      CMDPCT,a0
                    add.w    d1,d1
                    move.w   BTF6PC,d2
                    move.w   d2,0(a0,d1.w)
                    move.w   #2,0(a1,d1.w)
                    cmp.w    #$32,d2
                    blt      BTF635
                    move.w   #3,0(a1,d1.w)
                    addq.w   #1,CMNSCD
                    cmp.w    #$12,CMNSCD
                    bne      BTF635
                    move.w   #5,CMGMOV
BTF635:             move.l   CMDPTA,a0
                    move.w   0(a0,d1.w),d2
                    move.w   d2,BTF6DS
                    mulu     #10,d2
                    mulu     BTF6PC,d2
                    add.l    d2,CMSCOR
                    bset     #1,CMUPD1
                    moveq    #0,d0
                    move.w   BTF6DS,d0
                    moveq    #2,d1
                    jsr      NUMCONV
                    move.b   CMNMST,CMMES6+2
                    cmp.b    #'0',CMNMST
                    bne      BTF622
                    move.b   #' ',CMMES6+2
BTF622:             move.b   CMNMST+1,CMMES6+3
                    move.w   BTF6PC,d0
                    moveq    #3,d1
                    jsr      NUMCONV
                    lea      CMNMST,a0
                    lea      CMMES7+1,a1
                    moveq    #2,d1
                    move.b   (a0),(a1)
                    move.b   1(a0),1(a1)
                    move.b   2(a0),2(a1)
BTF623:             cmp.b    #'0',(a0)+
                    bne      BTF624
                    move.b   #' ',(a1)+
                    dbra     d1,BTF623
BTF624:             bsr      BTF660
                    lea      CMMES4,a0
                    bsr      BTF670
                    lea      CMMES6,a0
                    bsr      BTF670
                    lea      CMMES7,a0
                    bsr      BTF670
                    bra      BTF629

BTF680:             tst.w    CMFRIG
                    bne      BTF688
                    st       CMFRIG
                    move.w   CMCLCT,d2
                    and.w    #15,d2
                    lea      CMDPTS,a4
                    add.w    d2,a4
                    add.w    d2,a4
                    move.l   a4,CMDPTA
BTF688:             move.w   CMDSET,d1
                    subq.w   #1,d1
                    add.w    d1,d1
                    lea      CMDPCT,a1
                    lea      CMDSTA,a2
                    clr.w    BTF6PC
                    clr.w    0(a1,d1.w)
                    move.w   #1,0(a2,d1.w)
                    bsr      BTF660
                    lea      CMMES4,a0
                    bsr      BTF670
                    lea      CMME10,a0
                    bsr      BTF670
BTF629:             bset     #5,CMUPD1
BTF699:             movem.l  (sp)+,d0-d7/a0-a6
                    rts

BTF660:             jsr      BTG3
                    move.w   CMUPD1,-(sp)
                    move.w   #1028,CMUPD1
                    lea      CMME12,a0
                    bsr      BTF670
                    moveq    #5,d0
                    jsr      BTF9
                    move.w   CMFADE,-(sp)
                    move.w   #1,CMFADE
                    jsr      BT01
                    jsr      CONSOLE
                    jsr      BT35
                    move.w   (sp)+,CMFADE
                    move.w   (sp)+,CMUPD1
BTF628:             move.w   #$32,CMDLCT
BTF626:             tst.w    CMDLCT
                    bpl      BTF626
                    rts

BTF670:             clr.w    BTE5PS
                    move.l   a0,-(sp)
                    moveq    #15,d0
                    jsr      CONPEN
                    move.w   #$BC,d0
                    move.w   #$B1,d1
                    jsr      CONMOV1
                    move.l   (sp),a0
                    moveq    #14,d0
                    jsr      CONPLT
                    bsr      BTF628
                    moveq    #1,d0
                    jsr      CONPEN
                    move.w   #$BC,d0
                    move.w   #$B1,d1
                    jsr      CONMOV1
                    move.l   (sp)+,a0
                    moveq    #14,d0
                    jsr      CONPLT
                    rts

BTF7IF:             dcb.w    2,0
BTF7ML:             dc.w     $1D
BTF7S1:             dc.b     "U     SECTOR : LAPIS LAZULI   "
BTF7S2:             dc.b     "P RIG STATUS : NOT POSITIONED "
BTF7S3:             dc.b     "P  GAS FOUND : 99000 CU. FT.  "
BTF7S4:             dc.b     "P  % SUCCESS :   100 %        "
BTF7S5:             dc.b     "L GAS TAPPED : 99000 CU. FT.  "
BTF7SB:             dc.b     "(                             "
BTF7S6:             dc.b     "U     TOTAL SECTORS : 18      "
BTF7S7:             dc.b     "Z      SAFE SECTORS : 18      "
BTF7S8:             dc.b     "(                             "
BTF7S9:             dc.b     "F  PRESS ANY KEY TO CONTINUE  "
BTF7AR:             dc.b     "  AREA"
BTF7SC:             dc.b     "SECTOR"
BTF7NR:             dc.b     " NOT REQUIRED   "
BTF7NP:             dc.b     " NOT POSITIONED "
BTF7PS:             dc.b     " POSITIONED     "
BTF7NN:             dc.b     "NONE"
BTF7ZR:             dc.b     "ZERO"

BTF7:               cmp.w    #1,CMKYCT
                    bne      BTF7EX
                    bset     #2,CMINTR
BTF7WS:             btst     #0,CMINTR
                    bne      BTF7WS
                    clr.w    CMCLAK
                    jsr      BTG8
                    jsr      SPLITOFF
                    move.w   CMDSET,d3
                    cmp.w    #$12,d3
                    ble      BTF7OS
                    move.w   BTF7AR,BTF7S1+6
                    move.l   BTF7AR+2,BTF7S1+8
                    move.w   BTF7NR,BTF7S2+14
                    move.l   BTF7NR+2,BTF7S2+16
                    move.l   BTF7NR+6,BTF7S2+20
                    move.l   BTF7NR+10,BTF7S2+24
                    move.w   BTF7NR+14,BTF7S2+28
BTF7DSH:            move.b   #'-',BTF7S3+15
                    move.l   #'----',BTF7S3+16
                    move.b   #'-',BTF7S5+15
                    move.l   #'----',BTF7S5+16
                    move.b   #'-',BTF7S4+17
                    move.w   #'--',BTF7S4+18
                    bra      BTF7CM

BTF7OS:             move.w   BTF7SC,BTF7S1+6
                    move.l   BTF7SC+2,BTF7S1+8
                    subq.w   #1,d3
                    add.w    d3,d3
                    lea      CMDSTA,a0
                    tst.w    0(a0,d3.w)
                    bne      BTF7RPL
                    move.w   BTF7NP,BTF7S2+14
                    move.l   BTF7NP+2,BTF7S2+16
                    move.l   BTF7NP+6,BTF7S2+20
                    move.l   BTF7NP+10,BTF7S2+24
                    move.w   BTF7NP+14,BTF7S2+28
                    bra      BTF7DSH

BTF7RPL:            move.w   BTF7PS,BTF7S2+14
                    move.l   BTF7PS+2,BTF7S2+16
                    move.l   BTF7PS+6,BTF7S2+20
                    move.l   BTF7PS+10,BTF7S2+24
                    move.w   BTF7PS+14,BTF7S2+28
                    move.l   CMDPTA,a0
                    moveq    #0,d0
                    move.w   0(a0,d3.w),d0
                    move.w   d0,BTF7IF
                    moveq    #2,d1
                    move.w   d3,-(sp)
                    jsr      NUMCONV
                    move.b   CMNMST,d0
                    cmp.b    #'0',d0
                    bne      BTF7RP1
                    moveq    #' ',d0
BTF7RP1:            move.b   d0,BTF7S3+15
                    move.b   CMNMST+1,BTF7S3+16
                    move.b   #'0',BTF7S3+17
                    move.w   #'00',BTF7S3+18
                    lea      CMDPCT,a0
                    move.w   (sp)+,d3
                    moveq    #0,d0
                    move.w   0(a0,d3.w),d0
                    move.w   d0,-(sp)
                    moveq    #3,d1
                    jsr      NUMCONV
                    move.b   CMNMST,BTF7S4+17
                    move.b   CMNMST+1,BTF7S4+18
                    move.b   CMNMST,d0
                    cmp.b    #'0',d0
                    bne      BTF7RPQ
                    moveq    #' ',d0
BTF7RP2:            move.b   d0,BTF7S4+17
                    move.b   CMNMST+1,d0
                    cmp.b    #'0',d0
                    bne      BTF7RPQ
                    moveq    #' ',d0
                    move.b   d0,BTF7S4+18
BTF7RPQ:            move.b   CMNMST+2,BTF7S4+19
                    move.w   (sp)+,d0
                    mulu     BTF7IF,d0
                    moveq    #4,d1
                    jsr      NUMCONV
                    move.b   #'0',BTF7S5+19
                    lea      BTF7S5+15,a0
                    lea      CMNMST,a1
                    moveq    #3,d1
BTF7RP3:            move.b   (a1)+,d0
                    cmp.b    #'0',d0
                    bne      BTF7RP5
                    move.b   #' ',(a0)+
                    dbra     d1,BTF7RP3
                    bra      BTF7CM

BTF7RP6:            move.b   (a1)+,d0
BTF7RP5:            move.b   d0,(a0)+
                    dbra     d1,BTF7RP6
BTF7CM:             move.l   CMDSNM,a0
                    lea      BTF7S1+15,a1
                    moveq    #11,d7
BTF7CM1:            move.w   (a0)+,d0
                    move.b   d0,(a1)+
                    dbra     d7,BTF7CM1
                    moveq    #0,d0
                    move.w   CMNSCD,d0
                    moveq    #2,d1
                    jsr      NUMCONV
                    move.b   CMNMST,d0
                    cmp.b    #'0',d0
                    bne      BTF7RP9
                    moveq    #' ',d0
BTF7RP9:            move.b   d0,BTF7S7+22
                    move.b   CMNMST+1,BTF7S7+23
                    move.w   #1,BTE5PS
                    lea      BTF7S1,a0
                    moveq    #0,d0
                    moveq    #$18,d1
                    moveq    #9,d7
BTF7LP:             movem.l  d1/d7/a0,-(sp)
                    moveq    #0,d0
                    move.b   (a0)+,d0
                    jsr      CONMOV1
                    moveq    #15,d0
                    jsr      CONPEN
                    move.w   BTF7ML,d0
                    jsr      CONPLT
                    moveq    #$16,d0
                    jsr      BTF9
                    move.w   #2,CMDLCT
BTF7WT:             tst.w    CMDLCT
                    bpl      BTF7WT
                    movem.l  (sp),d1/d7/a0
                    moveq    #0,d0
                    move.b   (a0)+,d0
                    jsr      CONMOV1
                    moveq    #1,d0
                    jsr      CONPEN
                    move.w   BTF7ML,d0
                    jsr      CONPLT
                    movem.l  (sp)+,d1/d7/a0
                    add.w    #9,d1
                    add.w    BTF7ML,a0
                    addq.w   #1,a0
                    dbra     d7,BTF7LP
BTF7WT2:            jsr      KEYBOARD
                    tst.w    CMKYCT
                    beq      BTF7WT3
                    jsr      ICONCHK
                    tst.w    CMICCT
                    bne      BTF7WT2
BTF7WT3:            jsr      KEYBOARD
                    tst.w    CMKYCT
                    bne      BTF7WT4
                    jsr      ICONCHK
                    tst.w    CMICCT
                    beq      BTF7WT3
BTF7WT4:            jsr      KEYBOARD
                    tst.w    CMKYCT
                    beq      BTF7WT5
                    jsr      ICONCHK
                    tst.w    CMICCT
                    bne      BTF7WT4
BTF7WT5:            clr.w    BTE5PS
                    lea      BTF7SB,a0
                    moveq    #0,d0
                    moveq    #$18,d1
                    moveq    #9,d7
BTF7L2:             movem.l  d1/d7/a0,-(sp)
                    moveq    #0,d0
                    move.b   (a0)+,d0
                    jsr      CONMOV1
                    moveq    #1,d0
                    jsr      CONPEN
                    move.w   BTF7ML,d0
                    jsr      CONPLT
                    movem.l  (sp)+,d1/d7/a0
                    add.w    #9,d1
                    dbra     d7,BTF7L2
                    jsr      SPLITON
                    move.l   DISPLAY_SEG1,a0
                    move.l   DISPLAY_SEG2,a1
                    add.w    #640,a0
                    add.w    #640,a1
                    move.w   #101-1,d7
BTF7CPY:            movem.l  (a1)+,d0-d6/a2-a4
                    movem.l  d0-d6/a2-a4,(a0)
                    add.w    #40,a0
                    dbra     d7,BTF7CPY
                    bset     #2,CMUPD1+1
                    jsr      BT01
                    jsr      BTE1
                    bclr     #2,CMINTR
                    clr.w    BTE5PS
                    move.w   #1,CMCLAK
BTF7EX:             rts

BTG3:               movem.l  d0-d6/a0-a4,-(sp)
                    bclr     #6,CMMKRS+3
                    lea      SPRIGS,a2
                    lea      SPRIGW,a0
                    lea      SPRIGM,a1
                    move.w   4(a0),d0
                    mulu     #7,d0
                    add.w    d0,a2
                    move.w   CMDSET,d0
                    cmp.w    #$12,d0
                    bgt      BTG301A
                    bset     #6,CMMKRS+3
                    subq.w   #1,d0
                    add.w    d0,d0
                    lea      CMDSTA,a0
                    move.w   0(a0,d0.w),d1
                    beq      BTG301
                    lea      CMRPOS,a1
                    add.w    d0,a1
                    add.w    d0,a1
                    add.w    d0,a1
                    move.w   (a1),d4
                    move.w   2(a1),d5
                    move.w   4(a1),d6
                    lea      lbW00407A,a2
                    bclr     #6,-1(a2)
                    move.w   d4,(a2)+
                    move.w   d5,(a2)+
                    move.w   d6,(a2)+
                    subq.w   #2,d4
                    subq.w   #2,d6
                    add.w    #10,d5
                    lea      lbW0040B4,a2
                    bclr     #6,-1(a2)
                    move.w   d4,(a2)+
                    move.w   d5,(a2)+
                    move.w   d6,(a2)+
                    addq.w   #3,d4
                    addq.w   #3,d6
                    addq.w   #1,d5
                    lea      lbW0040CC,a2
                    bclr     #6,-1(a2)
                    move.w   d4,(a2)+
                    move.w   d5,(a2)+
                    move.w   d6,(a2)+
                    lea      SPRIGS,a2
                    lea      SPRIGW,a0
                    lea      SPRIGM,a1
                    move.w   4(a0),d0
                    mulu     #6,d0
                    add.w    d0,a2
                    cmp.w    #1,d1
                    beq      BTG302
                    addq.w   #2,d4
                    addq.w   #2,d6
                    addq.w   #8,d5
                    lea      lbW0040EC,a2
                    bclr     #6,-1(a2)
                    move.w   d4,(a2)+
                    move.w   d5,(a2)+
                    move.w   d6,(a2)+
                    addq.w   #1,d5
                    lea      lbW00410C,a2
                    bclr     #6,-1(a2)
                    move.w   d4,(a2)+
                    move.w   d5,(a2)+
                    move.w   d6,(a2)+
                    lea      SPRIGW,a0
                    lea      SPRIGS,a2
                    move.w   4(a0),d0
                    add.w    d0,a2
                    move.l   a2,CMRBLB
                    move.l   a2,CMRBLA
                    move.w   d0,CMRBLO
                    move.w   #4,CMRBLN
                    clr.w    CMRBLD
                    st       CMRBAK
                    bra      BTG303

BTG301:             lea      SPRIGS,a2
                    lea      SPRIGW,a0
                    lea      SPRIGM,a1
BTG301A:            bset     #6,lbB004079
                    bset     #6,lbB0040B3
                    bset     #6,lbB0040CB
BTG302:             bset     #6,lbB0040EB
                    bset     #6,lbB00410B
                    clr.w    CMRBAK
                    move.w   #$11A,d0
                    move.w   #$8F,d1
                    jsr      DRWBLOB
BTG303:             movem.l  (sp)+,d0-d6/a0-a4
                    rts

ABORTFN:            dc.w     0

ABORTSQ:            move.b   d0,CMGMOV
                    lea      SPRSDS,a2
                    lea      SPRSDM,a1
                    lea      SPRSDW,a0
                    move.w   4(a0),d0
                    moveq    #6,d1
ABORTP:             movem.l  d0/d1/a0-a2,-(sp)
                    moveq    #5,d1
                    move.w   #$B0,d0
                    jsr      DRWBLOB
                    movem.l  (sp)+,d0/d1/a0-a2
                    add.w    d0,a2
                    move.w   #2,CMDLCT
ABORTW:             tst.w    CMDLCT
                    bpl      ABORTW
                    dbra     d1,ABORTP
                    moveq    #3,d7
ABORTLP:            movem.l  d0/d1/d7/a0-a2,-(sp)
                    moveq    #5,d1
                    move.w   #$B0,d0
                    jsr      DRWBLOB
                    tst.w    DEMOMOD
                    bne      ABORTDO
ABORTL1:            jsr      KEYBOARD
                    tst.w    CMKYCT
                    bne      ABORTL1
                    jsr      ICONCHK
                    tst.w    CMICCT
                    bne      ABORTL1
ABORTL2:            jsr      KEYBOARD
                    tst.w    CMKYCT
                    bne      ABORTKY
                    jsr      ICONCHK
                    tst.w    CMICCT
                    beq      ABORTL2
                    lea      ABORTFN,a3
                    clr.w    (a3)
                    jsr      ICONS
                    move.b   ABORTFN,d0
ABORTNX:            cmp.b    CMGMOV,d0
                    bne      ABORTST
                    moveq    #$16,d0
                    jsr      BTF9
ABORTDO:            movem.l  (sp)+,d0/d1/d7/a0-a2
                    add.w    d0,a2
                    dbra     d7,ABORTLP
                    rts

ABORTKY:            moveq    #0,d0
                    move.b   CMKYBF,d0
                    lea      CMTRNN,a1
                    move.w   CMTRNS,d6
                    subq.w   #1,d6
ABORTY:             cmp.b    (a1)+,d0
                    beq      ABORTF
                    addq.w   #1,a1
                    dbra     d6,ABORTY
                    clr.w    d0
                    bra      ABORTNX

ABORTF:             moveq    #0,d0
                    move.b   (a1),d0
                    bra      ABORTNX

ABORTST:            clr.w    CMGMOV
                    movem.l  (sp)+,d0/d1/d7/a0-a2
                    lea      SPRSDS,a2
                    lea      SPRSDM,a1
                    lea      SPRSDW,a0
                    move.w   4(a0),d0
                    moveq    #7,d1
                    move.w   d0,d2
                    lsl.w    #3,d2
                    sub.w    d0,d2
                    add.w    d2,a2
ABORTP2:            movem.l  d0/d1/a0-a2,-(sp)
                    moveq    #5,d1
                    move.w   #$B0,d0
                    jsr      DRWBLOB
                    movem.l  (sp)+,d0/d1/a0-a2
                    sub.w    d0,a2
                    move.w   #2,CMDLCT
ABORTW2:            tst.w    CMDLCT
                    bpl      ABORTW2
                    dbra     d1,ABORTP2
                    rts

ENDGAME:            move.w   #-1,BTE6XYZ
                    move.w   #-1,CENTROF
                    bset     #2,CMINTR
                    clr.w    CMCLAK
                    jsr      SPROFF
                    cmp.b    #$C5,CMGMOV
                    bne      ENDGNRM
                    jsr      LIFTUP
                    clr.w    DEMOMOD
                    bra      ENDGRST

ENDGNRM:            move.w   #11,d0
                    jsr      BTF9
                    move.w   #127,CMDSET
                    move.w   #0,CMENTR
                    jsr      INITSET
                    move.w   #$6004,CMUPD1
                    moveq    #0,d0
                    move.w   CMNSCD,d0
                    moveq    #2,d1
                    jsr      NUMCONV
                    move.b   CMNMST,d0
                    cmp.b    #$30,d0
                    bne      ENDGRP9
                    moveq    #$20,d0
ENDGRP9:            move.l   CMDSNM,a0
                    move.b   d0,3(a0)
                    move.b   CMNMST+1,5(a0)
                    jsr      CONSOLE
                    jsr      BIZSWAP
                    jsr      BTG8
                    sub.w    #8000,CMVZ
                    add.w    #3000,CMVY
                    moveq    #$14,d7
ENDGLP:             move.w   d7,-(sp)
                    jsr      BT01
                    jsr      BT35
                    add.w    #400,CMVZ
                    sub.w    #140,CMVY
                    clr.w    CMFADE
                    move.w   (sp)+,d7
                    dbra     d7,ENDGLP
                    jsr      BT01
ENDGLFT:            jsr      LIFTUP
SISMOD4:            move.w   CMDVAL2,CMDLCT
                    tst.w    DEMOMOD
                    beq      ENDGDLY
SISMOD5:            move.w   CMDVAL3,CMDLCT
ENDGDLY:            clr.w    DEMOMOD
ENDGKEY:            jsr      KEYBOARD
                    tst.w    CMKYCT
                    bne      ENDGRST
                    tst.w    CMDLCT
                    bne      ENDGKEY
                    jsr      DEMOSPY
ENDGRST:            jsr      SPRON
                    clr.w    BTE6XYZ
                    clr.w    CENTROF
                    rts

ICONS:              btst     #6,$BFE001
                    bne      ICON_NL
                    moveq    #1,d2
                    bra      ICON_GO

ICON_NL:            btst     #2,MOUSER
                    bne      ICON_EX
                    moveq    #3,d2
ICON_GO:            lea      CMRECL,a0
                    move.w   MOUSEX,d0
                    move.w   MOUSEY,d1
                    move.w   CMNREC,d7
ICON_LP:            cmp.w    (a0),d0
                    blt      ICON_NX
                    cmp.w    2(a0),d1
                    blt      ICON_NX
                    cmp.w    4(a0),d0
                    bgt      ICON_NX
                    cmp.w    6(a0),d1
                    bgt      ICON_NX
                    move.b   8(a0,d2.w),(a3)+
                    addq.w   #1,CMKYCT
ICON_NX:            lea      12(a0),a0
                    dbra     d7,ICON_LP
ICON_EX:            rts

ICONCHK:            clr.w    CMICCT
                    btst     #6,$BFE001
                    beq      ICONCH1
                    btst     #2,MOUSER
                    bne      ICONCHX
ICONCH1:            move.w   #1,CMICCT
ICONCHX:            rts

INITDAT:            move.w   BTCRH2,CMCRH2
                    move.w   BTSTPN,CMSTPN
                    move.w   BTANGN,CMANGN
                    move.w   BTENR1,CMENR1
                    move.w   BTENR2,CMENR2
                    move.w   BTSHL1,CMSHL1
                    move.w   BTSHL2,CMSHL2
                    move.w   #1,CMGMOV
                    move.w   #1,CMFADE
                    move.w   #63,CMSNST
                    clr.w    CMCLAK
                    clr.w    CMSGTF
                    clr.w    CMSHT1
                    clr.w    CMSHT2
                    clr.w    CMNSCD
                    clr.w    CMFRIG
                    clr.w    CMDSND
                    clr.l    CMSCOR
                    clr.l    CMMKRS
                    lea      CMCTRS,a0
                    move.w   #7,d0
BTC501:             clr.l    (a0)+
                    dbra     d0,BTC501
                    lea      CMDSTA,a0
                    lea      CMDPCT,a1
                    move.w   #8,d0
BTC502:             clr.w    (a0)+
                    clr.w    (a1)+
                    dbra     d0,BTC502
                    move.w   CMSTPN,d0
                    asl.w    #1,d0
                    lea      CMSTPS,a0
                    move.w   0(a0,d0.w),CMSTP2
                    move.w   CMANGN,d0
                    asl.w    #1,d0
                    lea      CMANGS,a0
                    move.w   0(a0,d0.w),CMANGL
                    jsr      INITBUF
                    move.w   BTSTDS,CMDSET
                    move.w   BTSTEN,CMENTR
                    jsr      INITSET
                    move.w   CMNODS,d6
                    beq      BTC507
                    subq.w   #1,d6
                    lea      BTPDS,a0
BTC509:             lea      BTNODS,a1
BTC503:             move.w   2(a0),d0
                    asl.w    #8,d0
                    or.w     (a0),d0
                    asl.w    #1,d0
                    add.w    d0,a1
                    move.w   2(a1),d7
                    beq      BTC506
                    subq.w   #1,d7
                    add.w    #50,a1
BTC504:             move.w   (a1),d0
                    and.b    #$9F,d0
                    bpl      BTC505
                    or.b     #$40,d0
BTC505:             move.w   d0,(a1)
                    move.w   $10(a1),d0
                    asl.w    #1,d0
                    add.w    d0,a1
                    dbra     d7,BTC504
BTC506:             add.l    #4,a0
                    dbra     d6,BTC509
BTC507:             rts

INITSET:            jsr      BTF5
                    move.w   CMENTR,CMOBJN
                    clr.b    d7
                    clr.w    d0
                    jsr      FINDOB
                    tst.w    d0
                    beq      BTC609
                    move.w   2(a0),d0
                    bra      BTC610

BTC609:             bset     #1,d7
                    move.w   CMCX,d0
                    cmp.w    #$7E,d0
                    blt      BTC6IN1
                    move.w   #1,d0
                    bra      BTC610

BTC6IN1:            tst.w    d0
                    bgt      BTC611
                    move.w   #$7D,d0
BTC610:             move.w   d0,CMCX
                    asl.w    #6,d0
                    add.w    #$20,d0
                    move.w   d0,CMSAVESTART
                    btst     #1,d7
                    bne      BTC601
                    move.w   6(a0),d0
                    bra      BTC612

BTC611:             move.w   CMCZ,d0
                    cmp.w    #$7E,d0
                    blt      BTC6IN2
                    move.w   #1,d0
                    bra      BTC612

BTC6IN2:            tst.w    d0
                    bgt      BTC601
                    move.w   #$7D,d0
BTC612:             move.w   d0,CMCZ
                    asl.w    #6,d0
                    add.w    #$20,d0
                    move.w   d0,CMVZ
                    btst     #1,d7
                    bne      BTC601
                    clr.w    d0
                    move.w   4(a0),CMCY
                    tst.w    CMFLY2
                    bne      BTC613
                    move.w   CMCRHT,d0
                    sub.w    #1,d0
BTC613:             add.w    CMCY,d0
                    asl.w    #6,d0
                    add.w    #$20,d0
                    move.w   d0,CMVY
                    move.w   8(a0),CMXROT
                    move.w   10(a0),CMYROT
                    move.w   12(a0),CMZROT
BTC601:             rts

INITBUF:            move.w   BTSX,CMSX
                    move.w   BTSY,CMSY
                    move.l   BTSTRT,CMSCX
                    move.w   CMSCX,d0
                    add.w    CMSX,d0
                    subq.w   #1,d0
                    move.w   d0,CMSRX
                    move.w   CMSCX,d0
                    sub.w    CMSX,d0
                    move.w   d0,CMSLX
                    move.w   CMSCY,d0
                    add.w    CMSY,d0
                    subq.w   #1,d0
                    move.w   d0,CMSBY
                    move.w   CMSCY,d0
                    sub.w    CMSY,d0
                    move.w   d0,CMSTY
                    move.w   BTD,CMD
                    move.w   BTF,CMF
                    move.w   BTFLL2,CMFLL2
                    move.w   BTCLB2,CMCLB2
                    move.w   BTMXH2,CMMXH2
                    move.w   BTFLYE,CMFLYE
                    move.w   BTKYDL,CMKYDL
                    move.w   BTKYRR,CMKYRR
                    move.w   BTDEMO+2,d0
                    asl.w    #8,d0
                    or.w     BTDEMO,d0
                    asl.w    #1,d0
                    lea      BTNODS,a0
                    add.w    d0,a0
                    move.w   (a0)+,CMDEMN
                    move.l   a0,CMDMAD
                    clr.w    CMDEMC
                    move.w   BTGBLC+2,d0
                    asl.w    #8,d0
                    or.w     BTGBLC,d0
                    asl.w    #1,d0
                    lea      BTNODS,a0
                    add.w    d0,a0
                    move.l   a0,CMGBLC
                    lea      CMCLCK,a0
                    lea      BTCLCK,a1
                    move.w   #7,d7
INITCLK:            move.w   (a1)+,d0
                    move.b   d0,(a0)+
                    dbra     d7,INITCLK
                    move.w   BTFLYE,CMFLYE
                    move.w   BTFLYE,CMFLY2
                    tst.w    BTFLY2
                    bne      BTF409
                    clr.w    CMFLY2
BTF409:             clr.w    CMINAR
                    cmp.w    #3,BTFLY2
                    bvc      BTF411
                    move.w   #1,CMINAR
BTF411:             tst.w    CMFLY2
                    beq      BTF412
                    move.w   CMENR1,CMENER
                    move.w   CMSHL1,CMSHLD
                    bset     #7,CMMKRS+3
                    jmp      BTF413

BTF412:             move.w   CMENR2,CMENER
                    move.w   CMSHL2,CMSHLD
BTF413:             move.w   BTNODS,CMNODS
                    rts

BTF5:               clr.w    CMMNCT
                    clr.b    lbB004076
                    bset     #6,CMFSH1+1
                    bset     #6,CMFSH2+1
                    bset     #6,CMFSH3+1
                    move.w   #1,CMNDS
                    move.w   #1,CMFADE
                    move.w   CMNODS,d7
                    subq.w   #1,d7
                    lea      BTPDS,a0
                    move.w   CMDSET,d1
BTF504:             move.w   2(a0),d0
                    asl.w    #8,d0
                    or.w     (a0),d0
                    asl.w    #1,d0
                    lea      BTNODS,a1
                    move.w   CMDSET,d1
                    cmp.w    4(a1,d0.w),d1
                    beq      BTF505
                    add.w    #4,a0
                    dbra     d7,BTF504
SOFTWARE_ERROR:     illegal
BTF505:             add.w    d0,a1
                    move.w   (a1),CMBKCOL
                    move.w   2(a1),CMTOTO
                    move.w   8(a1),d0
                    asl.w    #8,d0
                    or.w     6(a1),d0
                    add.w    d0,d0
                    add.w    d0,a1
                    move.l   a1,CMLCLC
                    sub.w    d0,a1
                    move.w   10(a1),CMSCAL
                    move.w   CMSTP2,d0
                    mulu     CMSCAL,d0
                    move.w   d0,CMSTEP
                    move.w   CMFLL2,d0
                    mulu     CMSCAL,d0
                    move.w   d0,CMFLLA
                    move.w   CMCLB2,d0
                    mulu     CMSCAL,d0
                    move.w   d0,CMCLBA
                    move.w   CMCRH2,d0
                    mulu     CMSCAL,d0
                    move.w   d0,CMCRHT
                    move.w   CMMXH2,d0
                    mulu     CMSCAL,d0
                    move.w   d0,CMMXHT
                    move.w   $14(a1),CMDPOX
                    move.w   $16(a1),CMDPOZ
                    move.w   $18(a1),CMDRNG
                    jsr      BTG3
                    add.w    #$1A,a1
                    move.l   a1,CMDSNM
                    add.w    #$18,a1
                    move.l   a1,CMOBDT
                    jsr      BTD3
BTF5EX:             rts

FINDOB:             tst.b    d0
                    bne      BTD501
                    lea      CMRBOT,a0
                    move.w   CMNPDO,d6
                    beq      BTD5NPO
                    subq.w   #1,d6
                    move.w   CMOBJN,d1
BTD509:             cmp.w    14(a0),d1
                    beq      BTD505
                    move.w   $10(a0),d2
                    asl.w    #1,d2
                    add.w    d2,a0
                    dbra     d6,BTD509
BTD5NPO:            move.l   CMOBDT,a0
                    move.w   CMTOTO,d6
                    subq.w   #1,d6
                    jmp      BTD502

BTD501:             move.w   CMNODS,d6
                    lea      BTPDS,a1
                    subq.w   #1,d6
                    lea      BTNODS,a0
BTD507:             move.w   2(a1),d1
                    asl.w    #8,d1
                    or.w     (a1),d1
                    asl.w    #1,d1
                    cmp.w    4(a0,d1.w),d0
                    beq      BTD508
                    add.w    #4,a1
                    dbra     d6,BTD507
BTD504:             clr.l    d0
                    rts

BTD508:             add.w    d1,a0
                    move.w   2(a0),d6
                    beq      BTD504
                    subq.w   #1,d6
                    add.w    #50,a0
BTD502:             move.w   CMOBJN,d0
BTD571:             cmp.w    14(a0),d0
                    beq      BTD505
                    move.w   $10(a0),d2
                    asl.w    #1,d2
                    add.w    d2,a0
                    dbra     d6,BTD571
                    jmp      BTD504

BTD505:             move.l   a0,d0
                    rts

BTE2AD:             or.b     #0,d0
BTE2CP:             or.b     #3,d0
BTE2:               move.l   CMPLAD,a1
                    move.w   CMNUMO,d7
                    beq      BTE2EX
                    move.w   d7,d0
                    subq.w   #1,d7
                    asl.w    #3,d0
                    add.w    d0,a1
BTE2LP:             move.l   (a1),a0
                    move.w   (a0)+,d6
                    move.w   (a0)+,d5
                    btst     #7,d5
                    bne      BTE2FD
                    and.w    #$7F,d5
                    beq      BTE291
                    subq.w   #1,d5
BTE203:             move.l   a0,a5
                    move.w   (a0)+,d4
                    and.w    #15,d4
                    beq      BTE290
                    subq.w   #1,d4
                    move.w   CMSGTX,d0
                    move.w   CMSGTY,d1
                    moveq    #3,d2
                    lea      4(a0),a2
BTE204:             tst.w    d4
                    bne      BTE2NL
                    lea      2(a5),a2
BTE2NL:             cmp.w    2(a0),d1
                    bgt      BTE2AB
                    beq      BTE2S0
                    cmp.w    2(a2),d1
                    blt      BTE2NX
                    beq      BTE2S2
                    bra      BTE2XG

BTE2AB:             cmp.w    2(a2),d1
                    bgt      BTE2NX
                    beq      BTE2S2
BTE2XG:             cmp.w    (a0),d0
                    bgt      BTE2RG
                    beq      BTE2CK
                    cmp.w    (a2),d0
                    blt      BTE2LL
                    bra      BTE2CK

BTE2RG:             cmp.w    (a2),d0
                    bgt      BTE2RR
BTE2CK:             move.w   d0,a3
                    move.w   (a0),d3
                    sub.w    (a2),d3
                    move.w   d1,d0
                    sub.w    2(a2),d0
                    muls     d0,d3
                    move.w   2(a0),d0
                    sub.w    2(a2),d0
                    divs     d0,d3
                    add.w    (a2),d3
                    move.w   a3,d0
BTE2S:              cmp.w    d3,d0
                    bgt      BTE2RR
                    beq      BTE2FD
BTE2LL:             bclr     #0,d2
                    bra      BTE2NX

BTE2RR:             bclr     #1,d2
BTE2NX:             addq.w   #4,a0
                    addq.w   #4,a2
                    dbra     d4,BTE204
                    tst.w    d2
                    bne      BTE290
BTE2FD:             move.w   d6,CMOBHT
                    rts

BTE2S0:             move.w   (a0),d3
                    bra      BTE2S

BTE2S2:             move.w   (a2),d3
                    bra      BTE2S

BTE290:             dbra     d5,BTE203
BTE291:             subq.w   #8,a1
                    dbra     d7,BTE2LP
BTE2EX:             rts

BTE3AD:             dc.l     ACT00
                    dc.l     ACT01
                    dc.l     ACT02
                    dc.l     ACT03
                    dc.l     ACT04
                    dc.l     ACT05
                    dc.l     ACT06
                    dc.l     ACT07
                    dc.l     ACT08
                    dc.l     ACT09
                    dc.l     ACT10
                    dc.l     ACT11
                    dc.l     ACT12
                    dc.l     ACT13
                    dc.l     ACT14
                    dc.l     ACT15
                    dc.l     ACT16
                    dc.l     ACT17
                    dc.l     ACT18
                    dc.l     ACT19
                    dc.l     ACT20
                    dc.l     ACT21
                    dc.l     ACT22
                    dc.l     ACT23
                    dc.l     ACT24
                    dc.l     ACT25
                    dc.l     ACT26
                    dc.l     ACT27
                    dc.l     ACT28
                    dc.l     ACT29
                    dc.l     ACT30
                    dc.l     ACT31
                    dc.l     ACT32
                    dc.l     ACT33
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00
                    dc.l     ACT00

BTE3:               movem.l  d0/d6/a0,-(sp)
                    move.w   d0,d5
                    move.l   a0,a5
BTE3LP:             move.w   (a5),d6
                    bclr     #7,d6
                    beq      BTE3NF
                    tst.w    CMFIRE
                    beq      BTE3SK
BTE3XQ:             and.w    #$3F,d6
                    lsl.w    #2,d6
                    lea      BTE3AD,a0
                    move.l   0(a0,d6.w),a0
                    jsr      (a0)
BTE3SK:             move.w   (a5),d0
                    and.w    #$3F,d0
                    add.w    d0,d0
                    lea      CMATLN,a0
                    move.w   0(a0,d0.w),d0
                    sub.w    d0,d5
                    add.w    d0,d0
                    add.w    d0,a5
                    tst.w    d5
                    bgt      BTE3LP
BTE3X2:             movem.l  (sp)+,d0/d6/a0
                    rts

BTE3NF:             tst.w    CMFIRE
                    beq      BTE3XQ
                    bra      BTE3SK

ACTEX:              addq.l   #4,sp
                    bra      BTE3X2

ACT00:              rts

ACT01:              move.b   7(a5),d0
                    lsl.w    #8,d0
                    ext.l    d0
                    move.b   5(a5),d0
                    lsl.l    #8,d0
                    move.b   3(a5),d0
                    add.l    d0,CMSCOR
                    bpl      ACT01A
                    clr.l    CMSCOR
ACT01A:             bset     #1,CMUPD1
                    rts

ACT02:              move.w   2(a5),d0
                    ext.w    d0
                    move.w   CMENER,d1
                    add.w    d0,d1
                    bpl      ACT02A
                    clr.w    d1
                    move.w   #3,CMGMOV
                    bra      ACT02B

ACT02A:             cmp.w    #$3F,d1
                    ble      ACT02B
                    move.w   #$3F,d1
ACT02B:             move.w   d1,CMENER
                    bset     #2,CMUPD1
                    movem.l  d5/a5,-(sp)
                    move.w   d1,d7
                    moveq    #11,d0
                    move.w   #$BA,d1
                    jsr      BTE8
                    movem.l  (sp)+,d5/a5
                    rts

ACTFNDT:            clr.w    d0
                    move.w   2(a5),CMOBJN
                    bra      ACTFND

ACTFNDO:            move.w   2(a5),d0
                    move.w   4(a5),CMOBJN
ACTFND:             jsr      FINDOB
                    tst.l    d0
                    beq      ACTFNDN
                    btst     #5,1(a0)
                    beq      ACTFNDF
ACTFNDN:            addq.l   #4,sp
ACTFNDF:            rts

ACT03:              jsr      ACTFNDT
                    bchg     #6,1(a0)
                    beq      ACTRDR
ACTRDF:             bset     #2,CMUPD1+1
                    st       CMFADE
                    rts

ACT04:              jsr      ACTFNDT
                    bclr     #6,1(a0)
                    bra      ACTRDF

ACT05:              jsr      ACTFNDT
BTE309:             bset     #6,1(a0)
ACTRDR:             st       CMFADE
                    move.w   (a0),d0
                    and.w    #15,d0
                    cmp.w    #2,d0
                    bne      BTE335
                    move.w   CMSHT2,d0
                    beq      BTE335
                    subq.w   #1,d0
                    lea      CMSHI1,a1
                    lea      CMSHI2,a2
BTE333:             move.w   (a1),d1
                    cmp.w    14(a0),d1
                    bne      BTE334
BTE347:             btst     #0,CMINTR
                    bne      BTE347
                    clr.w    6(a1)
                    clr.w    6(a2)
                    bra      BTE335

BTE334:             lea      12(a1),a1
                    lea      12(a2),a2
                    dbra     d0,BTE333
BTE335:             move.l   CMPLAD,a1
                    move.w   CMNUMO,d0
                    beq      BTE314
                    subq.w   #1,d0
                    move.w   CMOBJN,d1
                    addq.l   #8,a1
BTE311:             move.l   (a1),a0
                    cmp.w    (a0),d1
                    beq      BTE312
                    addq.l   #8,a1
                    dbra     d0,BTE311
                    bra      BTE314

BTE312:             btst     #7,3(a0)
                    beq      BTE313
                    subq.w   #1,CMWHSC
BTE313:             clr.w    2(a0)
BTE314:             bset     #3,CMUPD1
                    rts

ACT06:              jsr      ACTFNDO
                    bchg     #6,1(a0)
                    rts

ACT07:              jsr      ACTFNDO
                    bclr     #6,1(a0)
                    rts

ACT08:              jsr      ACTFNDO
                    bset     #6,1(a0)
                    rts

ACTCTR:             move.w   2(a5),d0
                    lea      CMCTRS,a0
                    lea      -1(a0,d0.w),a0
                    rts

ACT09:              jsr      ACTCTR
                    addq.b   #1,(a0)
                    rts

ACT10:              jsr      ACTCTR
                    subq.b   #1,(a0)
                    rts

ACT11:              jsr      ACTCTR
                    move.w   4(a5),d0
                    cmp.b    (a0),d0
                    bne      ACTEX
                    rts

ACTMKR:             move.w   2(a5),d1
                    move.l   CMMKRS,d0
                    subq.w   #1,d1
                    rts

ACT12:              jsr      ACTMKR
                    bset     d1,d0
ACTMK2:             move.l   d0,CMMKRS
                    rts

ACT13:              jsr      ACTMKR
                    bclr     d1,d0
                    bra      ACTMK2

ACT14:              jsr      ACTMKR
                    tst.w    4(a5)
                    beq      ACT14A
                    bchg     d1,d0
ACT14A:             btst     d1,d0
                    bne      ACTEX
                    rts

ACT15:              move.w   2(a5),d0
                    jsr      BTF9
                    rts

ACT16:              jsr      ACTFNDT
                    bset     #5,1(a0)
                    bra      BTE309

ACT17:              move.w   2(a5),d0
                    move.w   4(a5),CMOBJN
                    jsr      ACTFND
                    bset     #5,1(a0)
                    rts

ACT18:              tst.w    CMSCRL
                    bne      ACT18A
                    move.w   #5,d0
                    jsr      BTF9
                    move.w   2(a5),d0
                    cmp.w    CMDSET,d0
                    beq      ACT18A
                    jsr      BTG8
ACT18A:             move.w   2(a5),d0
                    move.w   d0,CMDSET
                    move.w   4(a5),CMENTR
                    jsr      INITSET
                    move.w   #$FFFC,CMUPD1
                    rts

ACT19:              move.w   2(a5),d0
                    ext.w    d0
                    move.w   CMSHLD,d1
                    add.w    d0,d1
                    bpl      ACT19A
                    clr.w    d1
                    move.w   #1,CMGMOV
                    bra      ACT19B

ACT19A:             cmp.w    #$3F,d1
                    ble      ACT19B
                    move.w   #$3F,d1
ACT19B:             move.w   d1,CMSHLD
                    bset     #4,CMUPD1
                    movem.l  d5/a5,-(sp)
                    move.w   d1,d7
                    moveq    #11,d0
                    move.w   #$B2,d1
                    jsr      BTE8
                    movem.l  (sp)+,d5/a5
                    rts

ACT20:              jsr      ACTCTR
                    move.b   5(a5),(a0)
                    rts

ACT21:              move.w   CMFLY2,d1
                    bne      ACT21F
                    move.w   CMFLYE,CMFLY2
                    move.w   CMENER,CMENR2
                    move.w   CMSHLD,CMSHL2
                    move.w   CMENR1,CMENER
                    move.w   CMSHL1,CMSHLD
                    bset     #7,CMMKRS
                    move.w   #1,CMSCRL
                    movem.l  d5/a5,-(sp)
                    bset     #3,CMUPD1
                    bclr     #2,CMUPD1+1
                    jsr      BT01
                    jsr      LIFTUP0
                    jsr      LIFSDN
                    bra      ACT21B

ACT21F:             clr.w    CMFLY2
                    move.w   CMENER,CMENR1
                    move.w   CMSHLD,CMSHL1
                    move.w   CMENR2,CMENER
                    move.w   CMSHL2,CMSHLD
                    bclr     #7,CMMKRS
                    move.w   #2,CMSCRL
                    movem.l  d5/a5,-(sp)
                    bset     #3,CMUPD1
                    bclr     #2,CMUPD1+1
                    jsr      BT01
                    jsr      LIFTUP
ACT21B:             movem.l  (sp)+,d5/a5
                    move.w   #$9408,d0
                    or.w     d0,CMUPD1
                    rts

ACT22:              move.w   2(a5),d0
                    ext.w    d0
                    add.w    d0,CMCLBA
                    rts

ACT23:              move.w   2(a5),d0
                    ext.w    d0
                    add.w    d0,CMFLLA
                    rts

ACT24:              move.w   2(a5),d0
                    ext.w    d0
                    add.w    d0,CMMXHT
                    rts

ACT25:              move.w   2(a5),d0
                    bpl      ACT25A
                    move.w   d0,d1
                    lea      COLUP,a0
                    and.w    #15,d0
                    add.w    d0,d0
                    and.w    #$7770,d1
                    lsr.w    #3,d1
                    move.w   d1,0(a0,d0.w)
                    jmp      BIZCOPCOP

ACT25A:             move.w   d0,d1
                    and.w    #$F000,d0
                    cmp.w    #$1000,d0
                    bne      ACT25B
                    move.w   d1,d0
                    and.w    #$F00,d0
                    lsr.w    #7,d0
                    move.l   COLADD,a0
                    move.w   0(a0,d0.w),d2
                    move.w   d1,d0
                    and.w    #$F0,d0
                    lsr.w    #3,d0
                    lea      COLUP,a0
                    add.w    d0,a0
                    lsr.w    #1,d0
                    and.w    #15,d1
                    sub.w    d0,d1
                    bmi      ACT25X
ACT25A1:            move.w   d2,(a0)+
                    dbra     d1,ACT25A1
ACT25X:             jmp      BIZCOPCOP

ACT25B:             move.w   d1,d0
                    and.w    #$F00,d0
                    bne      ACT25C
                    move.l   COLADD,a0
                    lea      COLUP,a1
                    move.w   d1,d0
                    and.w    #$F0,d0
                    lsr.w    #3,d0
                    and.w    #15,d1
                    add.w    d1,d1
                    move.w   0(a0,d0.w),d0
                    move.w   d0,0(a1,d1.w)
                    bra      ACT25X

ACT25C:             cmp.w    #$100,d0
                    bne      ACT25D
                    and.w    #15,d1
                    add.w    d1,d1
                    move.l   COLADD,a0
                    move.w   0(a0,d1.w),d1
                    lea      COLUP,a0
                    moveq    #14,d0
ACT25C1:            move.w   d1,(a0)+
                    dbra     d0,ACT25C1
                    bra      ACT25X

ACT25D:             cmp.w    #$200,d0
                    bne      ACT25E
                    move.l   COLADD,a0
                    lea      COLUP,a1
                    moveq    #7,d0
ACT25D1:            move.l   (a0)+,d1
                    move.l   d1,(a1)+
                    dbra     d0,ACT25D1
                    bra      ACT25X

ACT25E:             cmp.w    #$300,d0
                    bne      ACT25F
                    move.w   d1,d0
                    and.w    #$F0,d0
                    lsr.w    #3,d0
                    lea      COLUP,a0
                    add.w    d0,a0
                    move.l   COLADD,a1
                    add.w    d0,a1
                    lsr.w    #1,d0
                    and.w    #15,d1
                    sub.w    d0,d1
                    bmi      ACT25X
ACT25E1:            move.w   (a1)+,d0
                    move.w   d0,(a0)+
                    dbra     d1,ACT25E1
                    bra      ACT25X

ACT25F:             cmp.w    #$400,d0
                    bne      ACT25G
                    move.w   d1,d0
                    and.w    #$F0,d0
                    lsr.w    #3,d0
                    lea      COLUP,a0
                    add.w    d0,a0
                    lsr.w    #1,d0
                    and.w    #15,d1
                    sub.w    d0,d1
                    bmi      ACT25X
                    move.w   (a0),d0
ACT25F1:            move.w   2(a0),(a0)+
                    dbra     d1,ACT25F1
                    move.w   d0,-2(a0)
                    bra      ACT25X

ACT25G:             cmp.w    #$500,d0
                    bne      ACT25X
                    move.w   d1,d0
                    and.w    #15,d0
                    lsl.w    #1,d0
                    lea      COLUP,a0
                    add.w    d0,a0
                    lsr.w    #1,d0
                    and.w    #$F0,d1
                    lsr.w    #4,d1
                    sub.w    d1,d0
                    bmi      ACT25X
                    move.w   (a0),d1
ACT25G1:            move.w   -(a0),2(a0)
                    dbra     d0,ACT25G1
                    move.w   d1,2(a0)
                    bra      ACT25X

ACT26:              movem.l  d5/a5,-(sp)
                    jsr      BT01
                    jsr      CONSOLE
                    jsr      BT35
                    move.w   #$800,CMUPD1
                    movem.l  (sp)+,d5/a5
                    rts

ACT27:              move.w   2(a5),CMDLCT
ACT27L:             tst.w    CMDLCT
                    bne      ACT27L
                    rts

ACT28:              move.w   2(a5),CMDSND
                    rts

ACT29:              jsr      ACTMKR
                    bchg     d1,d0
                    bra      ACTMK2

ACT30:              clr.w    d0
                    move.w   2(a5),CMOBJN
                    jsr      FINDOB
                    btst     #6,1(a0)
                    bne      ACTEX
                    rts

ACT31:              clr.w    d0
                    move.w   2(a5),CMOBJN
                    jsr      FINDOB
                    btst     #6,1(a0)
                    beq      ACTEX
                    rts

ACT32:              move.w   2(a5),d0
                    move.w   4(a5),CMOBJN
                    jsr      FINDOB
                    btst     #6,1(a0)
                    bne      ACTEX
                    rts

ACT33:              move.w   2(a5),d0
                    move.w   4(a5),CMOBJN
                    jsr      FINDOB
                    btst     #6,1(a0)
                    beq      ACTEX
                    rts

BTD3:               lea      DSCOLS,a0
                    move.w   CMDSET,d0
BTD3LP:             tst.w    (a0)
                    bmi      BTD3EX
                    cmp.w    (a0)+,d0
                    beq      BTD3FD
                    lea      $20(a0),a0
                    bra      BTD3LP

BTD3FD:             lea      COLUP,a1
                    move.l   a0,COLADD
                    move.w   #7,d0
                    move.l   d1,-(sp)
BTD3FL:             move.l   (a0)+,d1
                    move.l   d1,(a1)+
                    dbra     d0,BTD3FL
                    move.l   (sp)+,d1
                    jmp      BIZCOPCOP

BTD3EX:             rts

SAVPMS1:            dc.b     " PLEASE ENTER NAME OF FILE TO "
SAVPMS2:            dc.b     "            SAVE              "
SAVPMS3:            dc.b     "                              "
                    dc.b     "  ( OR JUST RETURN TO ABORT ) "
                    dc.b     "                              "
POSNAME:            dc.b     ">                             "
SAVPERR:            dc.b     "   DISK ERROR - PRESS A KEY   "

SAVEPOS:            bset     #2,CMINTR
                    clr.w    CMCLAK
                    move.l   #'SAVE',SAVPMS2+12
                    jsr      GETFNAM
                    cmp.b    #'.',POSNAME+2
                    beq      SAVLRET
                    move.l   DISPLAY_SEG2,a6
                    add.w    #8000,a6
                    lea      CMSAVESTART,a0
                    move.l   #CMQMAT,d7
                    sub.l    a0,d7
                    subq.w   #1,d7
SAVPLP:             move.b   (a0)+,(a6)+
                    dbra     d7,SAVPLP
                    move.w   CMNODS,d7
                    subq.w   #1,d7
                    bmi      SAVPEND
                    lea      BTPDS,a0
                    lea      BTNODS,a1
SAVDSLP:            move.w   2(a0),d0
                    lsl.w    #8,d0
                    move.b   1(a0),d0
                    lsl.w    #1,d0
                    lea      0(a1,d0.w),a2
                    move.w   2(a2),d6
                    subq.w   #1,d6
                    bmi      SAVDSND
                    add.w    #50,a2
SAVOBLP:            move.b   1(a2),(a6)+
                    move.w   $10(a2),d0
                    add.w    d0,a2
                    add.w    d0,a2
                    dbra     d6,SAVOBLP
SAVDSND:            addq.w   #4,a0
                    dbra     d7,SAVDSLP
                    move.l   a6,-(sp)
                    moveq    #$10,d0
                    move.w   #$98,d1
                    lea      SPRDKW,a0
                    lea      SPRDKM,a1
                    lea      SPRDKL,a2
                    jsr      DRWBLOB
                    move.l   (sp)+,d7
                    move.l   DISPLAY_SEG2,a0
                    add.w    #8000,a0
                    sub.l    a0,d7
                    lea      POSNAME+2,a1
                    jsr      BSAVE
                    tst.w    d0
                    beq      SAVLRET
SAVLERR:            moveq    #$10,d0
                    move.w   #$A2,d1
                    lea      SPRDKW,a0
                    lea      SPRDKM,a1
                    lea      SPRDKL+8,a2
                    jsr      DRWBLOB
                    moveq    #$10,d0
                    move.w   #$98,d1
                    lea      SPRDKW,a0
                    lea      SPRDKM,a1
                    lea      SPRDKL+8,a2
                    jsr      DRWBLOB
                    moveq    #15,d0
                    jsr      CONPEN
                    moveq    #$28,d0
                    moveq    #$4A,d1
                    jsr      CONMOV1
                    lea      SAVPERR,a0
                    moveq    #$1E,d0
                    jsr      CONPLT
SAVLKEY:            jsr      KEYBOARD
                    tst.w    CMKYCT
                    bne      SAVLKEY
SAVLKY2:            jsr      KEYBOARD
                    tst.w    CMKYCT
                    beq      SAVLKY2
                    bra      SAVLRET

SAVPEND:            bclr     #2,CMINTR
                    st       CMCLAK
                    jsr      SPLITON
                    rts

SISMD1S:            dc.w     0

LOADPOS:            bset     #2,CMINTR
                    clr.w    CMCLAK
                    move.l   #'LOAD',SAVPMS2+12
                    jsr      GETFNAM
                    cmp.b    #'.',POSNAME+2
                    beq      SAVLRET
                    moveq    #$10,d0
                    move.w   #$A2,d1
                    lea      SPRDKW,a0
                    lea      SPRDKM,a1
                    lea      SPRDKL,a2
                    jsr      DRWBLOB
                    move.l   DISPLAY_SEG2,a0
                    add.w    #8000,a0
                    lea      POSNAME+2,a1
                    move.l   #$FA0,d7
                    jsr      BLOAD
                    tst.w    d0
                    bmi      SAVLERR
                    move.l   DISPLAY_SEG2,a6
                    add.w    #8000,a6
                    lea      CMSAVESTART,a0
                    move.l   #CMQMAT,d7
                    sub.l    a0,d7
                    subq.w   #1,d7
LODPLP:             move.b   (a6)+,(a0)+
                    dbra     d7,LODPLP
                    move.w   CMNODS,d7
                    subq.w   #1,d7
                    bmi      LODPEND
                    lea      BTPDS,a0
                    lea      BTNODS,a1
LODDSLP:            move.w   2(a0),d0
                    lsl.w    #8,d0
                    clr.w    CMDVAL3
                    move.b   1(a0),d0
                    lsl.w    #1,d0
                    lea      0(a1,d0.w),a2
                    move.w   2(a2),d6
                    subq.w   #1,d6
                    bmi      LODDSND
                    add.w    #50,a2
                    clr.w    CMDVAL2
LODOBLP:            move.b   (a6)+,1(a2)
                    move.w   $10(a2),d0
                    add.w    d0,a2
                    add.w    d0,a2
                    clr.w    CMDVAL
                    dbra     d6,LODOBLP
LODDSND:            addq.w   #4,a0
                    subq.w   #2,lbW003324
                    dbra     d7,LODDSLP
                    moveq    #1,d0
                    jsr      CONPEN
                    move.w   #9,d7
                    lea      SAVPMS3,a0
                    moveq    #$14,d1
SAVLLPX:            movem.l  d1/d7/a0,-(sp)
                    moveq    #$28,d0
                    jsr      CONMOV1
                    moveq    #$1E,d0
                    jsr      CONPLT
                    movem.l  (sp)+,d1/d7/a0
                    add.w    #9,d1
                    dbra     d7,SAVLLPX
                    moveq    #$10,d0
                    move.w   #$A2,d1
                    move.w   #-4,lbW003358
                    lea      SPRDKW,a0
                    lea      SPRDKM,a1
                    lea      SPRDKL+8,a2
                    jsr      DRWBLOB
SAVLRET:            moveq    #$10,d0
                    move.w   #$98,d1
                    lea      SPRDKW,a0
                    lea      SPRDKM,a1
                    lea      SPRDKL+8,a2
                    jsr      DRWBLOB
                    moveq    #$10,d0
                    move.w   #$A2,d1
                    lea      SPRDKW,a0
                    lea      SPRDKM,a1
                    lea      SPRDKL+8,a2
                    jsr      DRWBLOB
                    moveq    #1,d0
                    jsr      CONPEN
                    move.w   #9,d7
                    lea      SAVPMS3,a0
                    moveq    #$14,d1
SAVLLP2:            movem.l  d1/d7/a0,-(sp)
                    moveq    #$28,d0
                    jsr      CONMOV1
                    moveq    #$1E,d0
                    jsr      CONPLT
                    movem.l  (sp)+,d1/d7/a0
                    add.w    #9,d1
                    dbra     d7,SAVLLP2
                    move.l   DISPLAY_SEG1,a0
                    move.l   DISPLAY_SEG2,a1
                    add.w    #640,a0
                    add.w    #640,a1
                    move.w   #2040-1,d0
LODCLR:             move.w   (a1)+,(a0)+
                    dbra     d0,LODCLR
                    move.l   DISPLAY_SEG1,a0
                    move.l   DISPLAY_SEG2,a1
                    add.w    #8000,a0
                    add.w    #8000,a1
                    move.w   #2000-1,d0
LODRCY:             move.w   (a0)+,(a1)+
                    dbra     d0,LODRCY
                    jsr      BTG8
                    jsr      BTD3
                    move.w   #-1,CMUPD1
LODPEND:            bclr     #2,CMINTR
                    st       CMCLAK
                    jsr      SPLITON
                    rts

SISMD2S:            dc.w     0

GETFNAM:            jsr      BTG8
                    jsr      SPLITOFF
                    lea      POSNAME+2,a6
                    move.w   #$10,d0
GETFCLR:            move.b   #' ',(a6)+
                    dbra     d0,GETFCLR
                    move.w   #5,d7
                    lea      SAVPMS1,a0
                    moveq    #48-1,d1
GFLPLP2:            movem.l  d1/d7/a0,-(sp)
                    moveq    #$16,d0
                    jsr      BTF9
                    movem.l  (sp),d1/d7/a0
                    moveq    #15,d0
                    jsr      CONPEN
                    moveq    #$28,d0
                    jsr      CONMOV1
                    moveq    #$1E,d0
                    jsr      CONPLT
                    move.w   #2,CMDLCT
GFL7WT:             tst.w    CMDLCT
                    bpl      GFL7WT
                    movem.l  (sp),d1/d7/a0
                    moveq    #1,d0
                    jsr      CONPEN
                    moveq    #$28,d0
                    jsr      CONMOV1
                    moveq    #$1E,d0
                    jsr      CONPLT
                    movem.l  (sp)+,d1/d7/a0
                    add.w    #9,d1
                    add.w    #30,a0
                    dbra     d7,GFLPLP2
                    lea      POSNAME+2,a6
                    moveq    #0,d6
GFLKEY:             jsr      KEYBOARD
                    tst.w    CMKYCT
                    bne      GFLKEY
GFLKEY2:            jsr      KEYBOARD
                    tst.w    CMKYCT
                    beq      GFLKEY2
                    move.b   CMKYBF,d0
                    cmp.b    #13,d0
                    beq      GFLCHK
                    cmp.b    #8,d0
                    bne      GFLADD
                    tst.w    d6
                    ble      GFLILG
                    subq.w   #1,a6
                    subq.w   #1,d6
                    move.b   #$20,(a6)
                    bra      GFLRPT

GFLADD:             cmp.b    #$41,d0
                    blt      GFLILG
                    cmp.b    #$5A,d0
                    bgt      GFLILG
                    cmp.w    #8,d6
                    bge      GFLILG
                    move.b   d0,(a6)+
                    addq.w   #1,d6
GFLRPT:             movem.l  d6/a6,-(sp)
                    moveq    #$16,d0
                    jsr      BTF9
                    moveq    #$38,d0
                    moveq    #$5C,d1
                    jsr      CONMOV1
                    move.w   d6,d0
                    add.w    #1,d0
                    lea      POSNAME+2,a0
                    jsr      CONPLT
                    movem.l  (sp)+,d6/a6
                    bra      GFLKEY

GFLILG:             movem.l  d6/a6,-(sp)
                    moveq    #6,d0
                    jsr      BTF9
                    movem.l  (sp)+,d6/a6
                    bra      GFLKEY

GFLCHK:             lea      POSNAME+2,a0
GFLCLP:             cmp.b    #' ',(a0)+
                    bne      GFLCLP
                    move.b   #'.',-1(a0)
                    move.b   #'D',(a0)
                    move.b   #'L',1(a0)
                    move.b   #'R',2(a0)
                    clr.b    3(a0)
                    rts

BTE6ANG:            dc.w     0
BTE6STP:            dc.w     0
BTE6XYZ:            dcb.b    3,0
BTE6STR:            dc.b     ":"
BTE6ST2:            dc.b     "0000"
BTE6NM:             dc.b     "               ",0

CONSOLE:            move.w   #10,CMNBASE
                    btst     #1,CMUPD1
                    beq      BTE601
                    move.l   CMSCOR,d0
                    move.w   #7,d1
                    jsr      NUMCONV
                    move.w   #1,d0
                    jsr      CONPEN
                    move.w   #$F0,d0
                    move.w   #$81,d1
                    jsr      CONMOV1
                    lea      CMNMST,a0
                    move.w   #7,d0
                    jsr      CONPLT
BTE601:             btst     #0,CMUPD1+1
                    beq      BTE604
BTE604:             btst     #0,CMUPD1
                    beq      BTE605
                    lea      SPRSTP,a2
                    lea      SPRSTW,a0
                    lea      SPRSTM,a1
                    move.w   CMSTPN,d0
                    mulu     4(a0),d0
                    add.w    d0,a2
                    movem.l  a0-a2,-(sp)
                    move.w   4(a0),d0
                    asl.w    #3,d0
                    add.w    d0,a2
                    move.w   #$30,d0
                    move.w   #$A0,d1
                    jsr      DRWBLOB
                    move.w   #2,CMDLCT
BTE604W:            tst.w    CMDLCT
                    bpl      BTE604W
                    movem.l  (sp)+,a0-a2
                    move.w   #$30,d0
                    move.w   #$A0,d1
                    jsr      DRWBLOB
BTE605:             btst     #7,CMUPD1+1
                    beq      BTE606
                    lea      SPRANG,a2
                    lea      SPRANW,a0
                    lea      SPRANM,a1
                    move.w   CMANGN,d0
                    mulu     4(a0),d0
                    add.w    d0,a2
                    movem.l  a0-a2,-(sp)
                    move.w   4(a0),d0
                    mulu     #6,d0
                    add.w    d0,a2
                    move.w   #$40,d0
                    move.w   #$A0,d1
                    jsr      DRWBLOB
                    move.w   #2,CMDLCT
BTE605W:            tst.w    CMDLCT
                    bpl      BTE605W
                    movem.l  (sp)+,a0-a2
                    move.w   #$40,d0
                    move.w   #$A0,d1
                    jsr      DRWBLOB
BTE606:             tst.w    BTE6XYZ
                    bne      BTE607A
                    st       BTE5PS
                    clr.l    d0
                    move.w   CMSAVESTART,d0
                    divu     CMSCAL,d0
                    move.w   #4,d1
                    jsr      NUMCONV
                    move.w   #$1A,d0
                    jsr      CONPEN
                    moveq    #$26,d0
                    moveq    #$12,d1
                    jsr      CONMOV
                    move.b   #$3A,BTE6STR
                    move.l   CMNMST,BTE6ST2
                    lea      BTE6STR,a0
                    moveq    #5,d0
                    jsr      CONPLT
                    clr.l    d0
                    move.w   CMVZ,d0
                    divu     CMSCAL,d0
                    move.w   #4,d1
                    jsr      NUMCONV
                    move.w   #$1A,d0
                    jsr      CONPEN
                    moveq    #$26,d0
                    moveq    #$18,d1
                    jsr      CONMOV
                    addq.b   #1,BTE6STR
                    move.l   CMNMST,BTE6ST2
                    lea      BTE6STR,a0
                    moveq    #5,d0
                    jsr      CONPLT
                    clr.l    d0
                    move.w   CMVY,d0
                    divu     CMSCAL,d0
                    move.w   #4,d1
                    jsr      NUMCONV
                    move.w   #$1A,d0
                    jsr      CONPEN
                    moveq    #$26,d0
                    moveq    #$1E,d1
                    jsr      CONMOV
                    addq.b   #1,BTE6STR
                    move.l   CMNMST,BTE6ST2
                    lea      BTE6STR,a0
                    moveq    #5,d0
                    jsr      CONPLT
                    clr.w    BTE5PS
BTE607A:            btst     #5,CMUPD1
                    beq      BTE607
                    moveq    #1,d0
                    jsr      CONPEN
                    move.w   #$BC,d0
                    move.w   #$B1,d1
                    jsr      CONMOV1
                    lea      CMMES1,a0
                    lea      CMDSTA,a1
                    tst.w    CMGMOV
                    beq      BTE6NGM
                    move.w   CMGMOV,d0
                    lea      CMME15,a0
                    cmp.w    #2,d0
                    beq      BTE6M1
                    add.w    #14,a0
                    cmp.w    #1,d0
                    beq      BTE6M1
                    add.w    #14,a0
                    cmp.w    #3,d0
                    beq      BTE6M1
                    add.w    #14,a0
                    cmp.w    #4,d0
                    beq      BTE6M1
                    add.w    #14,a0
                    cmp.w    #6,d0
                    beq      BTE6M2
                    bra      BTE6M1

BTE6NGM:            move.w   CMDSET,d0
                    cmp.w    #$12,d0
                    bgt      BTE6M3
                    subq.w   #1,d0
                    add.w    d0,d0
                    move.w   0(a1,d0.w),d0
                    cmp.w    #3,d0
                    bne      BTE6M2
                    bra      BTE6M1

BTE6M4:             add.w    #14,d0
BTE6M3:             add.w    #14,a0
BTE6M2:             add.w    #14,a0
BTE6M1:             moveq    #14,d0
                    jsr      CONPLT
BTE607:             btst     #6,CMUPD1
                    beq      BTE611
                    move.l   CMDSNM,a0
                    move.l   a1,-(sp)
                    lea      BTE6NM+1,a1
                    move.w   #11,d1
BTE607L:            move.w   (a0)+,d0
                    move.b   d0,(a1)+
                    dbra     d1,BTE607L
                    move.l   (sp)+,a1
                    move.w   #$BC,d0
                    move.w   #$B9,d1
                    jsr      CONMOV1
                    moveq    #1,d0
                    jsr      CONPEN
                    moveq    #14,d0
                    lea      BTE6NM,a0
                    jsr      CONPLT
BTE611:             btst     #5,CMUPD1+1
                    beq      BTE612
BTE612:             btst     #6,CMUPD1+1
                    beq      BTE613
BTE613:             btst     #2,CMUPD1
                    beq      BTE614
                    move.w   #11,d0
                    move.w   #$BA,d1
                    move.w   CMENER,d7
                    jsr      BTE8
BTE614:             btst     #3,CMUPD1
                    beq      BTE630
                    move.w   #11,d0
                    move.w   #$B2,d1
                    move.w   CMSHLD,d7
                    jsr      BTE8
BTE630:             btst     #4,CMUPD1
                    beq      BTE633
BTE633:             btst     #3,CMUPD1
                    beq      BTE615
                    moveq    #2,d0
                    tst.w    CMFLY2
                    beq      BTE633A
                    moveq    #0,d0
BTE633A:            lea      SPRVHC,a2
                    lea      SPRVHM,a1
                    lea      SPRVHW,a0
                    mulu     4(a0),d0
                    add.w    d0,a2
                    move.w   #$68,d0
                    move.w   #$7E,d1
                    jsr      DRWBLOB
BTE615:             btst     #0,CMUPD1
                    beq      BTE6EX
BTE6EX:             rts

BTE4DCT:            dc.l     10000000
                    dc.l     1000000
                    dc.l     100000
                    dc.l     10000
                    dc.l     1000
                    dc.l     100
                    dc.l     10
BTE4HX:             dc.l     $10000000
                    dc.l     $1000000
                    dc.l     $100000
                    dc.l     $10000
                    dc.l     $1000
                    dc.l     $100
                    dc.l     $10
BTE4PAD:            dc.b     "00000000"

NUMCONV:            lea      BTE4PAD,a1
                    lea      BTE4HX,a0
                    move.w   CMNBASE,d2
                    cmp.w    #$10,d2
                    beq      NUMHX
                    lea      BTE4DCT,a0
NUMHX:              moveq    #6,d2
BTE402:             bsr      NUMDIG
                    dbra     d2,BTE402
                    move.w   d0,d4
                    bsr      NUMASC
                    lea      CMNMST,a0
                    add.w    d1,a0
                    subq.w   #1,d1
                    bmi      BTE4EX
BTE4CL:             move.b   -(a1),-(a0)
                    dbra     d1,BTE4CL
BTE4EX:             rts

NUMDIG:             move.l   (a0)+,d3
                    moveq    #0,d4
NUMLOOP:            sub.l    d3,d0
                    bmi      NUMADD
                    addq.w   #1,d4
                    bra      NUMLOOP

NUMADD:             add.l    d3,d0
NUMASC:             add.w    #$30,d4
                    cmp.w    #$3A,d4
                    blt      NUMSTOR
                    addq.w   #7,d4
NUMSTOR:            move.b   d4,(a1)+
                    rts

MONITOR:            rts

MON_MAC:            rts

MON_IMM:            dc.w     0

DRILLWIPE:          rts

JOYSTICK:           rts

SNDIDX:             dc.w     1,1,1,1,1,1,1,1,1,1,5,1,1,1,1,50,1,1,1,1,1,1,1,1
                    dc.w     1
SNDNAME:            dc.b     "SOUNDFX",0

LOADSND:            lea      SNDNAME,a1
                    move.l   SNDBUF,a0
                    move.l   #90000,d7
                    jsr      BLOAD
                    rts

BITMAPH:            dcb.b    32*4,0
BITMAP:             dcb.b    8000*4,0
LIFMAPH:            dcb.b    32*4,0
LIFMAP:             dcb.b    8000*4,0

BITMAPN:            dc.b     "console.neo",0
LIFMAPN:            dc.b     "lift.neo",0
DATAFLN:            dc.b     "data",0

LOADMAP:            lea      BITMAPH,a0
                    lea      BITMAPN,a1
                    move.l   #32128,d7
                    jsr      BLOAD
                    lea      LIFMAPH,a0
                    lea      LIFMAPN,a1
                    move.l   #32128,d7
                    jsr      BLOAD
                    rts

LOADDFL:            lea      DATAFLN,a1
                    lea      DSCOLS,a0
                    move.l   #32768,d7
                    jsr      BLOAD
                    rts

SPRDKW:             dc.w     0,0,8
SPRDKM:             dc.w     0
SPRDKL:             dc.w     3,$FFFD,$9FFE,0
                    dc.w     $6003,$9FFD,$9FFE,0
SPRATW:             dc.w     1,$1D,$10
SPRATM:             dc.w     $FFFC,$78
SPRATT:             dc.w     3,0,0,0,$B800,0,$186,$2800,0,0,0,0,0,0,$84,0,0,0
                    dc.w     0,0,0,0,$186,0,0,0,0,0,0,0,$84,0,1,0,0,0,$3800,0
                    dc.w     $186,$2800,3,0,0,2,$2800,0,$84,0,1,0,0,0,$2B87
                    dc.w     $102,$387,0,1,0,0,0,$2800,0,$84,0,1,0,0,0,$3800,0
                    dc.w     $186,$2800,0,0,0,0,0,0,$84,0,0,0,0,0,0,0,$186,0,0
                    dc.w     0,0,0,0,0,$84,0,3,0,0,2,$B800,0,$186,$A800,2,0,0
                    dc.w     0,$A800,0,$84,0,2,0,0,0,$AB87,$102,$387,0,2,0,0,0
                    dc.w     $A800,0,$84,0,3,0,0,2,$B800,0,$186,$A800,0,0,0,0
                    dc.w     0,0,$84,0,0,0,0,0,0,0,$186,0,0,0,0,0,0,0,$84,0,1
                    dc.w     0,0,0,$3800,0,$186,$2800,3,0,0,2,$2800,0,$84,0,1
                    dc.w     0,0,0,$2B87,$102,$387,0,1,0,0,0,$2800,0,$84,0,1,0
                    dc.w     0,0,$3800,0,$186,$2800,0,0,0,0,0,0,$84,0,0,0,0,0
                    dc.w     0,0,$186,0,0,0,0,0,0,0,$84,0,3,0,0,1,$3800,$8000
                    dc.w     $186,$A800,0,0,0,0,$A800,0,$84,0,3,0,0,0,$AB87
                    dc.w     $102,$387,0,2,0,0,0,$2800,0,$84,0,3,0,0,0,$B800,0
                    dc.w     $186,$2800,0,0,0,0,0,0,$84,0,0,0,0,0,0,0,$186,0,0
                    dc.w     0,0,0,0,0,$84,0,3,0,0,0,$B800,0,$186,$2800,0,0,0
                    dc.w     0,$A800,0,$84,0,1,0,0,0,$AB87,$102,$387,0,0,0,0,0
                    dc.w     $A800,0,$84,0,3,0,0,0,$B800,0,$186,$2800,0,0,0,0
                    dc.w     0,0,$84,0,0,0,0,0,0,0,$186,0,0,0,0,0,0,0,$84,0,2
                    dc.w     0,0,0,$B800,0,$186,$2800,2,0,0,0,$A800,0,$84,0,3
                    dc.w     0,0,0,$AB87,$102,$387,0,0,0,0,0,$A800,0,$84,0,0,0
                    dc.w     0,0,$B800,0,$186,$2800,0,0,0,0,0,0,$84,0,0,0,0,0
                    dc.w     0,0,$186,0,0,0,0,0,0,0,$84,0,3,0,0,0,$B800,0,$186
                    dc.w     $2800,2,0,0,0,$2800,0,$84,0,3,0,0,0,$AB87,$102
                    dc.w     $387,0,0,0,0,0,$A800,0,$84,0,3,0,0,0,$B800,0,$186
                    dc.w     $2800,0,0,0,0,0,0,$84,0,0,0,0,0,0,0,$186,0,0,0,0
                    dc.w     0,0,0,$84,0,3,0,0,0,$B800,0,$186,$2800,2,0,0,0
                    dc.w     $2800,0,$84,0,3,0,0,0,$AB87,$102,$387,0,2,0,0,0
                    dc.w     $A800,0,$84,0,3,0,0,0,$B800,0,$186,$2800,0,0,0,0
                    dc.w     0,0,$84,0,0,0,0,0,0,0,$186,0,0,0,0,0,0,0,$84,0,3
                    dc.w     0,0,0,$B800,0,$186,$2800,0,0,0,0,$A800,0,$84,0,0
                    dc.w     0,0,0,$AB87,$102,$387,0,0,0,0,0,$A800,0,$84,0,0,0
                    dc.w     0,0,$B800,0,$186,$2800,0,0,0,0,0,0,$84,0,0,0,0,0
                    dc.w     0,0,$186,0,0,0,0,0,0,0,$84,0,3,0,0,0,$B800,0,$186
                    dc.w     $2800,2,0,0,0,$A800,0,$84,0,3,0,0,0,$AB87,$102
                    dc.w     $387,0,2,0,0,0,$A800,0,$84,0,3,0,0,0,$B800,0,$186
                    dc.w     $2800,0,0,0,0,0,0,$84,0,0,0,0,0,0,0,$186,0,0,0,0
                    dc.w     0,0,0,$84,0,3,0,0,0,$B800,0,$186,$2800,2,0,0,0
                    dc.w     $A800,0,$84,0,3,0,0,0,$AB87,$102,$387,0,0,0,0,0
                    dc.w     $A800,0,$84,0,3,0,0,0,$B800,0,$186,$2800,0,0,0,0
                    dc.w     0,0,$84,0,0,0,0,0,0,0,$186,0,0,0,0,0,0,0,$84,0,3
                    dc.w     0,0,0,$B800,0,$186,$2800,2,0,0,0,$A800,0,$84,0,3
                    dc.w     0,0,0,$AB87,$102,$387,0,2,0,0,0,$A800,0,$84,0,3,0
                    dc.w     0,0,$B800,0,$186,$2800,0,0,0,0,0,0,$84,0,0,0,0,0
                    dc.w     0,0,$186,0,0,0,0,0,0,0,$84,0,3,0,0,0,$B800,0,$186
                    dc.w     $2800,0,0,0,0,$A800,0,$84,0,0,0,0,0,$AB87,$102
                    dc.w     $387,0,0,0,0,0,$A800,0,$84,0,0,0,0,0,$B800,0,$186
                    dc.w     $2800,0,0,0,0,0,0,$84,0,0,0,0,0,0,0,$186,0,0,0,0
                    dc.w     0,0,0,$84,0,3,0,0,0,$B800,0,$186,$2800,2,0,0,0
                    dc.w     $2800,0,$84,0,3,0,0,0,$AB87,$102,$387,0,2,0,0,0
                    dc.w     $A800,0,$84,0,3,0,0,0,$B800,0,$186,$2800,0,0,0,0
                    dc.w     0,0,$84,0,0,0,0,0,0,0,$186,0,0,0,0,0,0,0,$84,0,3
                    dc.w     0,0,0,$B800,0,$186,$2800,2,0,0,0,$2800,0,$84,0,3
                    dc.w     0,0,0,$AB87,$102,$387,0,0,0,0,0,$A800,0,$84,0,3,0
                    dc.w     0,0,$B800,0,$186,$2800,0,0,0,0,0,0,$84,0,0,0,0,0
                    dc.w     0,0,$186,0,0,0,0,0,0,0,$84,0,2,0,0,0,$B800,0,$186
                    dc.w     $2800,2,0,0,0,$A800,0,$84,0,3,0,0,0,$AB87,$102
                    dc.w     $387,0,0,0,0,0,$A800,0,$84,0,0,0,0,0,$B800,0,$186
                    dc.w     $2800,0,0,0,0,0,0,$84,0,0,0,0,0,0,0,$186,0,0,0,0
                    dc.w     0,0,0,$84,0,3,0,0,0,$B800,0,$186,$2800,0,0,0,0
                    dc.w     $A800,0,$84,0,1,0,0,0,$AB87,$102,$387,0,0,0,0,0
                    dc.w     $A800,0,$84,0,3,0,0,0,$B800,0,$186,$2800,0,0,0,0
                    dc.w     0,0,$84,0,0,0,0,0,0,0,$186,0,0,0,0,0,0,0,$84,0,3
                    dc.w     0,0,0,$B800,0,$186,$2800,0,0,0,0,$A800,0,$84,0,3
                    dc.w     0,0,0,$AB87,$102,$387,0,2,0,0,0,$2800,0,$84,0,3,0
                    dc.w     0,0,$B800,0,$186,$2800,0,0,0,0,0,0,$84,0,0,0,0,0
                    dc.w     0,0,$186,0,0,0,0,0,0,0,$84,0,1,0,0,0,$3800,0,$186
                    dc.w     $2800,3,0,0,2,$2800,0,$84,0,1,0,0,0,$2B87,$102
                    dc.w     $387,0,1,0,0,0,$2800,0,$84,0,1,0,0,0,$3800,0,$186
                    dc.w     $2800,0,0,0,0,0,0,$84,0,0,0,0,0,0,0,$186,0,0,0,0
                    dc.w     0,0,0,$84,0,3,0,0,2,$B800,0,$186,$A800,2,0,0,0
                    dc.w     $A800,0,$84,0,2,0,0,0,$AB87,$102,$387,0,2,0,0,0
                    dc.w     $A800,0,$84,0,3,0,0,2,$B800,0,$186,$A800,0,0,0,0
                    dc.w     0,0,$84,0,0,0,0,0,0,0,$186,0,0,0,0,0,0,0,$84,0,1
                    dc.w     0,0,0,$3800,0,$186,$2800,3,0,0,2,$2800,0,$84,0,1
                    dc.w     0,0,0,$2B87,$102,$387,0,1,0,0,0,$2800,0,$84,0,1,0
                    dc.w     0,0,$3800,0,$186,$2800,0,0,0,0,0,0,$84,0,0,0,0,0
                    dc.w     0,0,$186,0,0,0,0,0,0,0,$84,0,3,0,0,1,$3800,$8000
                    dc.w     $186,$A800,0,0,0,0,$A800,0,$84,0,3,0,0,0,$AB87
                    dc.w     $102,$387,0
SPRCBW:             dc.w     1,6,0
SPRCBM:             dc.w     $8000,$FF
SPRCBG:             dc.w     $31FF,$FFF,$7FFF,$7FFF,$C600,$F800,$FF00,$FF00
                    dc.w     $31FF,$FFF,$7FFF,$7FFF,$C600,$F800,$FF00,$FF00
                    dc.w     $31FF,$FFF,$7FFF,$7FFF,$C600,$F800,$FF00,$FF00
                    dc.w     $31FF,$FFF,$7FFF,$7FFF,$C600,$F800,$FF00,$FF00
                    dc.w     $31FF,$FFF,$7FFF,$7FFF,$C600,$F800,$FF00,$FF00
                    dc.w     $31FF,$FFF,$7FFF,$7FFF,$C600,$F800,$FF00,$FF00
                    dc.w     $31FF,$FFF,$7FFF,$7FFF,$C600,$F800,$FF00,$FF00
SPRBAW:             dc.w     4,5,$F0
SPRBAM:             dc.w     $FFE0,0,0,0,15
SPRBAR:             dc.w     0,$1F,$1F,0,$7F,$FF80,$FF80,$7F,$FFFF,0,0,$FFFF
                    dc.w     $FFFF,0,0,$FFFF,$FFF0,0,0,$FFF0,$1F,$1F,$1F,0
                    dc.w     $FFFF,$FF80,$FF80,0,$FFFF,0,0,0,$FFFF,0,0,0,$FFF0
                    dc.w     0,0,0,0,$1F,0,0,0,$FFFF,0,0,0,$FFFF,0,0,0,$FFFF,0
                    dc.w     0,0,$FFF0,0,0,0,$1F,0,0,0,$FFFF,0,0,0,$FFFF,0,0,0
                    dc.w     $FFFF,0,0,0,$FFF0,0,0,$1F,$1F,$1F,0,$FFFF,$FF80
                    dc.w     $FF80,0,$FFFF,0,0,0,$FFFF,0,0,0,$FFF0,0,0,0,0,$1F
                    dc.w     $1F,0,$7F,$FF80,$FF80,$7F,$FFFF,0,0,$FFFF,$FFFF,0
                    dc.w     0,$FFFF,$FFF0,0,0,$FFF0,$1F,$1F,0,0,$FF80,$FFFF,0
                    dc.w     $7F,0,$FFFF,0,$FFFF,0,$FFFF,0,$FFFF,0,$FFF0,0
                    dc.w     $FFF0,$1F,0,$1F,0,$FFFF,0,$FF80,$7F,$FFFF,0,0
                    dc.w     $FFFF,$FFFF,0,0,$FFFF,$FFF0,0,0,$FFF0,0,$1F,$1F,0
                    dc.w     $7F,$FF80,$FF80,0,$FFFF,0,0,0,$FFFF,0,0,0,$FFF0,0
                    dc.w     0,0,0,$1F,$1F,0,$7F,$FF80,$FF80,0,$FFFF,0,0,0
                    dc.w     $FFFF,0,0,0,$FFF0,0,0,0,$1F,0,$1F,0,$FFFF,0,$FF80
                    dc.w     $7F,$FFFF,0,0,$FFFF,$FFFF,0,0,$FFFF,$FFF0,0,0
                    dc.w     $FFF0,$1F,$1F,0,0,$FF80,$FFFF,0,$7F,0,$FFFF,0
                    dc.w     $FFFF,0,$FFFF,0,$FFFF,0,$FFF0,0,$FFF0
SPRIGW:             dc.w     1,$19,$1A0
SPRIGM:             dc.w     $FFC0,3
SPRIGS:             dc.w     0,0,$3F,0,0,0,$FFFC,0,0,0,$20,0,0,0,4,0,5,9,$2E,0
                    dc.w     $A0,$90,$74,0,8,0,$28,0,$10,0,$14,0,0,0,$28,0,0,0
                    dc.w     $14,0,8,8,$20,0,$10,$10,4,0,0,0,$20,0,0,0,$1804,0
                    dc.w     0,0,$20,0,$1800,0,$3C04,0,0,0,$20,0,$3C00,0,$3C04
                    dc.w     0,0,0,$20,0,$3C00,0,$3C04,0,0,0,$20,0,$7E00,$4200
                    dc.w     $3C04,0,0,0,$20,0,$3C00,0,$7E04,0,0,0,$20,0,$7E00
                    dc.w     0,$7E04,0,0,0,$20,0,$7E00,0,$7E04,0,0,0,$20,0
                    dc.w     $FF00,0,$FF04,0,0,0,$20,0,$7E00,$7E00,4,0,0,0,$20
                    dc.w     0,0,0,$7E04,0,0,0,$20,0,$4200,$4200,$3C04,0,0,0
                    dc.w     $20,0,$4200,$4200,$3C04,0,0,0,$20,0,0,0,$3C04,0,8
                    dc.w     8,$20,0,$10,$10,$3C04,0,0,3,$28,3,$2400,$E7C0
                    dc.w     $1814,$C3C0,8,7,$28,7,$2410,$E7E0,$1814,$C3E0,5,9
                    dc.w     $2E,0,$A0,$FF90,$74,$FF00,0,$1F,$20,$1F,0,$FFF8,4
                    dc.w     $FFF8,0,0,$3F,0,0,0,$FFFC,0,0,0,$3F,0,0,0,$FFFC,0
                    dc.w     0,0,$20,0,$E00,$E00,4,0,5,9,$2E,0,$CA0,$C90,$74,0
                    dc.w     8,0,$28,0,$10,$800,$814,0,0,0,$28,0,0,$1000,$1014
                    dc.w     $800,8,8,$20,0,$1010,$810,$1804,0,0,0,$20,0,0,0
                    dc.w     $1804,0,0,0,$20,0,$800,$1800,$3C04,0,0,0,$20,0
                    dc.w     $2C00,$1800,$3C04,0,0,0,$20,0,$1800,$3C00,$3C04,0
                    dc.w     0,0,$20,0,$7E00,$7E00,$3C04,0,0,0,$20,0,$3C00
                    dc.w     $3C00,$7E04,0,0,0,$20,0,$7E00,$3C00,$7E04,0,0,0
                    dc.w     $20,0,0,$7E00,$7E04,0,0,0,$20,0,$FF00,0,$FF04,0,0
                    dc.w     0,$20,0,$7E00,$7E00,4,0,0,0,$20,0,0,0,$7E04,0,0,0
                    dc.w     $20,0,$4200,$4200,$3C04,0,0,0,$20,0,$4200,$4200
                    dc.w     $3C04,0,0,0,$20,0,0,0,$3C04,0,8,8,$20,0,$10,$10
                    dc.w     $3C04,0,3,0,$28,3,$A5C0,$6600,$1814,$C3C0,14,1
                    dc.w     $28,7,$2470,$E780,$1814,$C3E0,5,9,$2E,0,$81A0
                    dc.w     $7E90,$74,$FF00,$1F,0,$20,$1F,$FFF8,0,4,$FFF8,0,0
                    dc.w     $3F,0,0,0,$FFFC,0,0,0,$3F,0,0,0,$FFFC,0,0,0,$20,0
                    dc.w     $400,0,$404,0,5,9,$2E,0,$8A0,$490,$E74,0,8,0,$28
                    dc.w     0,$410,$E00,$E14,0,0,0,$28,0,$800,$400,$1C14,0,8
                    dc.w     8,$20,0,$1810,$10,$1804,0,0,0,$20,0,0,0,$1804,0,0
                    dc.w     0,$20,0,0,$1800,$3C04,0,0,0,$20,0,$2C00,$1800
                    dc.w     $3C04,0,0,0,$20,0,$1800,$3C00,$3C04,0,0,0,$20,0
                    dc.w     $7E00,$7E00,$3C04,0,0,0,$20,0,$3C00,$3C00,$7E04,0
                    dc.w     0,0,$20,0,$7E00,$3C00,$7E04,0,0,0,$20,0,$4000
                    dc.w     $3E00,$7E04,0,0,0,$20,0,$FF00,0,$FF04,0,0,0,$20,0
                    dc.w     $7E00,$7E00,4,0,0,0,$20,0,0,0,$7E04,0,0,0,$20,0
                    dc.w     $4200,$4200,$3C04,0,0,0,$20,0,$4200,$4200,$3C04,0
                    dc.w     0,0,$20,0,0,0,$3C04,0,8,8,$20,0,$10,$10,$3C04,0,3
                    dc.w     0,$28,3,$27C0,$E400,$1814,$C3C0,12,3,$28,7,$24F0
                    dc.w     $E700,$1814,$C3E0,5,9,$2E,0,$81A0,$7E90,$74,$FF00
                    dc.w     $1F,0,$20,$1F,$FFF8,0,4,$FFF8,0,0,$3F,0,0,0,$FFFC
                    dc.w     0,0,0,$3F,0,0,0,$FFFC,0,0,0,$20,0,$D00,$700,$E04
                    dc.w     0,5,9,$2E,0,$AA0,$490,$E74,0,8,0,$28,0,$610,$E00
                    dc.w     $814,0,0,0,$28,0,$1800,$1800,$14,0,8,8,$20,0
                    dc.w     $1810,$810,$1004,0,0,0,$20,0,0,0,$1804,0,0,0,$20
                    dc.w     0,$1800,0,$3C04,0,0,0,$20,0,$2400,$1800,$3C04,0,0
                    dc.w     0,$20,0,$800,$3C00,$3C04,0,0,0,$20,0,$5E00,$7E00
                    dc.w     $3C04,0,0,0,$20,0,$1C00,$3C00,$7E04,0,0,0,$20,0
                    dc.w     $7E00,$3C00,$7E04,0,0,0,$20,0,$4000,$3E00,$7E04,0
                    dc.w     0,0,$20,0,$FF00,0,$FF04,0,0,0,$20,0,$7E00,$7E00,4
                    dc.w     0,0,0,$20,0,0,0,$7E04,0,0,0,$20,0,$4200,$4200
                    dc.w     $3C04,0,0,0,$20,0,$4200,$4200,$3C04,0,0,0,$20,0,0
                    dc.w     0,$3C04,0,8,8,$20,0,$10,$10,$3C04,0,3,0,$28,3
                    dc.w     $27C0,$E400,$1814,$C3C0,12,3,$28,7,$25F0,$E600
                    dc.w     $1814,$C3E0,5,9,$2E,0,$1A0,$FE90,$74,$FF00,$1F,0
                    dc.w     $20,$1F,$FFF8,0,4,$FFF8,0,0,$3F,0,0,0,$FFFC,0,0,0
                    dc.w     $3F,0,0,0,$FFFC,0,0,0,$20,0,$1080,$1680,$F04,0,5
                    dc.w     9,$2E,0,$10A0,$1090,$C74,0,8,0,$28,0,$C10,$C00
                    dc.w     $1014,0,0,0,$28,0,$1800,0,$1814,0,8,8,$20,0,$1010
                    dc.w     $810,$1804,0,0,0,$20,0,0,0,$1804,0,0,0,$20,0
                    dc.w     $1800,0,$3C04,0,0,0,$20,0,$3400,$800,$3C04,0,0,0
                    dc.w     $20,0,$2000,$1C00,$3C04,0,0,0,$20,0,$6E00,$5E00
                    dc.w     $3C04,0,0,0,$20,0,$1C00,$3C00,$7E04,0,0,0,$20,0
                    dc.w     $5E00,$3C00,$7E04,0,0,0,$20,0,$4000,$3E00,$7E04,0
                    dc.w     0,0,$20,0,$FF00,0,$FF04,0,0,0,$20,0,$7E00,$7E00,4
                    dc.w     0,0,0,$20,0,0,0,$7E04,0,0,0,$20,0,$4200,$4200
                    dc.w     $3C04,0,0,0,$20,0,$4200,$4200,$3C04,0,0,0,$20,0,0
                    dc.w     0,$3C04,0,8,8,$20,0,$10,$10,$3C04,0,3,0,$28,3
                    dc.w     $A5C0,$6600,$1814,$C3C0,14,1,$28,7,$24F0,$E700
                    dc.w     $1814,$C3E0,5,9,$2E,0,$81A0,$7E90,$74,$FF00,$1F,0
                    dc.w     $20,$1F,$FFF8,0,4,$FFF8,0,0,$3F,0,0,0,$FFFC,0,0,0
                    dc.w     $3F,0,0,0,$FFFC,0,0,0,$20,0,$3BE0,$3BE0,$404,0,5
                    dc.w     9,$2E,0,$EA0,$A90,$474,0,8,0,$28,0,$1810,$1400
                    dc.w     $C14,0,0,0,$28,0,0,$1000,$1014,$800,8,8,$20,0,$10
                    dc.w     $1810,$1804,0,0,0,$20,0,0,0,$1804,0,0,0,$20,0
                    dc.w     $800,$1800,$3C04,0,0,0,$20,0,$3C00,$1800,$3C04,0
                    dc.w     0,0,$20,0,$1800,$3C00,$3C04,0,0,0,$20,0,$7E00
                    dc.w     $7E00,$3C04,0,0,0,$20,0,$3C00,$3C00,$7E04,0,0,0
                    dc.w     $20,0,$7E00,$3C00,$7E04,0,0,0,$20,0,0,$7E00,$7E04
                    dc.w     0,0,0,$20,0,$FF00,0,$FF04,0,0,0,$20,0,$7E00,$7E00
                    dc.w     4,0,0,0,$20,0,0,0,$7E04,0,0,0,$20,0,$4200,$4200
                    dc.w     $3C04,0,0,0,$20,0,$4200,$4200,$3C04,0,0,0,$20,0,0
                    dc.w     0,$3C04,0,8,8,$20,0,$10,$10,$3C04,0,3,0,$28,3
                    dc.w     $A5C0,$6600,$1814,$C3C0,14,1,$28,7,$2470,$E780
                    dc.w     $1814,$C3E0,5,9,$2E,0,$81A0,$7E90,$74,$FF00,$1F,0
                    dc.w     $20,$1F,$FFF8,0,4,$FFF8,0,0,$3F,0,0,0,$FFFC,0,0,0
                    dc.w     $3F,0,0,0,$FFFC,0,0,0,$20,0,0,0,4,0,5,9,$2E,0,$A0
                    dc.w     $90,$74,0,8,0,$28,0,$10,0,$14,0,0,0,$28,0,0,0,$14
                    dc.w     0,8,8,$20,0,$10,$10,4,0,0,0,$20,0,0,0,$1804,0,0,0
                    dc.w     $20,0,$800,$1800,$3C04,0,0,0,$20,0,$3C00,$1800
                    dc.w     $3C04,0,0,0,$20,0,$1800,$3C00,$3C04,0,0,0,$20,0
                    dc.w     $7E00,$7E00,$3C04,0,0,0,$20,0,$3C00,$3C00,$7E04,0
                    dc.w     0,0,$20,0,$7E00,$3C00,$7E04,0,0,0,$20,0,0,$7E00
                    dc.w     $7E04,0,0,0,$20,0,$FF00,0,$FF04,0,0,0,$20,0,$7E00
                    dc.w     $7E00,4,0,0,0,$20,0,0,0,$7E04,0,0,0,$20,0,$4200
                    dc.w     $4200,$3C04,0,0,0,$20,0,$4200,$4200,$3C04,0,0,0
                    dc.w     $20,0,0,0,$3C04,0,8,8,$20,0,$10,$10,$3C04,0,3,0
                    dc.w     $28,3,$A5C0,$6600,$1814,$C3C0,14,1,$28,7,$2470
                    dc.w     $E780,$1814,$C3E0,5,9,$2E,0,$81A0,$7E90,$74,$FF00
                    dc.w     $1F,0,$20,$1F,$FFF8,0,4,$FFF8,0,0,$3F,0,0,0,$FFFC
                    dc.w     0,0,0,$3F,0,0,0,$FFFC,0,$13,12,$20,0,$9CE0,$6318
                    dc.w     4,0,8,$17,$20,7,$C630,$39C8,4,$39C8,1,$1E,$20,14
                    dc.w     $8C60,$7398,4,$7398,$13,12,$20,12,$18C0,$E738,4
                    dc.w     $E738,$16,9,$20,9,$3188,$CE70,4,$CE78,$1C,3,$20,3
                    dc.w     $6318,$9CE0,4,$9CE8,8,$17,$20,7,$C630,$39C8,4
                    dc.w     $39C8,1,$1E,$20,14,$8C60,$7398,4,$7398,$13,12,$20
                    dc.w     12,$18C0,$E738,4,$E738,$16,9,$20,9,$3188,$CE70,4
                    dc.w     $CE78,$1C,3,$20,3,$6318,$9CE0,4,$9CE8,8,$17,$20,7
                    dc.w     $C630,$39C8,4,$39C8,1,$1E,$20,14,$8C60,$7398,4
                    dc.w     $7398,$13,12,$20,12,$18C0,$E738,4,$E738,$16,9,$20
                    dc.w     9,$3188,$CE70,4,$CE78,$1C,3,$20,3,$6318,$9CE0,4
                    dc.w     $9CE8,8,$17,$20,7,$C630,$39C8,4,$39C8,1,$1E,$20
                    dc.w     14,$8C60,$7398,4,$7398,$13,12,$20,12,$18C0,$E738
                    dc.w     4,$E738,$16,9,$20,9,$3188,$CE70,4,$CE78,$1C,3,$20
                    dc.w     3,$6318,$9CE0,4,$9CE8,8,$17,$20,7,$C630,$39C8,4
                    dc.w     $39C8,1,$1E,$20,14,$8C60,$7398,4,$7398,3,$1C,$20
                    dc.w     $1F,$18C0,$E738,4,$FFF8,0,0,$3F,0,0,0,$FFFC,0
SPRVHW:             dc.w     3,$2B,$580
SPRVHM:             dc.w     $FF00,0,0,7
SPRVHC:             dc.w     $7F,$FF,$FF,0,$FFFF,$FFFF,$FFFF,0,$FFFF,$FFFF
                    dc.w     $FFFF,0,$FFF0,$FFF8,$FFF8,0,$FF,$7F,$80,0,$FFFF
                    dc.w     $FFFF,0,0,$FFFF,$FFFF,0,0,$FFF0,$FFF8,8,0,$DF,$40
                    dc.w     $BF,0,$FFFF,0,$FFFF,0,$FFFF,0,$FFFF,0,$FFD0,$18
                    dc.w     $FFE8,0,$E8,$48,$B0,0,0,0,0,0,0,0,0,0,$B0,$98,$68
                    dc.w     0,$F0,$50,$A0,0,0,0,0,0,0,$2000,0,0,$70,$58,$28,0
                    dc.w     $E0,$40,$A0,0,0,0,0,0,$2000,0,0,0,$30,$18,$28,0
                    dc.w     $E0,$40,$A0,0,0,0,0,0,$2000,0,0,$2000,$30,$18,$28
                    dc.w     0,$E0,$40,$A0,0,0,0,0,0,0,$2000,0,$2000,$30,$18
                    dc.w     $28,0,$E0,$40,$A0,0,0,0,0,0,0,0,0,0,$30,$18,$28,0
                    dc.w     $E0,$40,$A0,0,0,0,0,0,0,0,0,0,$30,$18,$28,0,$E0
                    dc.w     $40,$A0,0,0,0,0,0,0,0,0,0,$30,$18,$28,0,$E0,$40
                    dc.w     $A0,0,0,0,0,0,$2C80,$2300,$1FC0,0,$30,$18,$28,0
                    dc.w     $E0,$40,$A0,0,1,1,0,0,$7F40,$40,$FF80,0,$30,$18
                    dc.w     $28,0,$E0,$40,$A0,0,11,8,7,0,$FFD0,$10,$FFE0,0
                    dc.w     $30,$18,$28,0,$E0,$40,$A0,0,$5F,$40,$3F,0,$FFF4,4
                    dc.w     $FFF8,0,$30,$18,$28,0,$E0,$40,$A0,0,$2FF,$200
                    dc.w     $1FF,0,$FFFC,0,$FFFF,0,$E030,$E018,$28,0,$E0,$40
                    dc.w     $A0,0,$17FF,$1000,$FFF,0,$FFF8,7,$FFFF,0,$38
                    dc.w     $F010,$F828,0,$E0,$40,$A0,0,$1FFF,0,$3FFF,0,$FFC0
                    dc.w     $3F,$FFFF,0,$6038,$8010,$F028,0,$E6,$49,$A0,3
                    dc.w     $17FF,$1000,$FFF,0,$FE03,$1FC,$FFFF,0,$A338,$2490
                    dc.w     $C028,$600,$E0,$40,$A0,0,$5FF,$400,$3FF,0,$F01F
                    dc.w     $FE0,$FFFF,0,$38,$10,$8028,0,$E1,$41,$A0,0,$C17F
                    dc.w     $6100,$E0FF,0,$80FB,$7F03,$FFFC,0,$38,$10,$28,0
                    dc.w     $E3,$42,$A1,0,$405C,$8043,$E03F,0,$7D8,$F818
                    dc.w     $FFE0,0,$38,$10,$28,0,$E7,$47,$A0,0,$8010,$8017
                    dc.w     15,0,$3EC0,$C0C0,$FF00,0,$38,$10,$28,0,$E0,$40
                    dc.w     $A0,0,1,2,7,0,$F600,$600,$F800,0,$38,$10,$28,0
                    dc.w     $E0,$40,$A0,0,$383,$2C0,$1C7,0,$B000,$3000,$C000
                    dc.w     0,$38,$10,$28,0,$E0,$40,$A0,0,$681,$501,$3C6,0
                    dc.w     $8000,$8000,0,0,$38,$10,$28,0,$E0,$40,$A0,0,$F04
                    dc.w     $F04,0,0,0,0,0,0,$38,$10,$28,0,$E0,$40,$A0,0,0,0
                    dc.w     0,0,0,0,0,0,$38,$10,$28,0,$E0,$40,$A0,0,0,0,0,0,5
                    dc.w     2,0,7,$5038,$8010,$28,$D000,$E0,$40,$A0,0,0,0,0,0
                    dc.w     0,0,0,0,$38,$10,$28,0,$E0,$40,$A0,0,0,0,0,0,4
                    dc.w     $2001,0,$2005,$A438,$110,$28,$A500,$E0,$40,$A0,0
                    dc.w     0,0,0,0,$2000,0,0,$2000,$38,$10,$28,0,$E0,$40,$A0
                    dc.w     0,0,0,0,0,$2004,2,0,6,$9038,$2010,$28,$B000,$F0
                    dc.w     $50,$A0,0,0,0,0,0,0,$2000,0,0,$78,$50,$28,0,$E8
                    dc.w     $48,$B0,0,0,0,0,0,0,0,0,0,$B8,$90,$68,0,$F0,$40
                    dc.w     $BF,0,0,0,$FFFF,0,0,0,$FFFF,0,$78,$10,$FFE8,0,$DF
                    dc.w     $40,$BF,0,$4000,$4000,$8000,0,0,0,0,0,$2FD8,$2010
                    dc.w     $1FE8,0,$C0,$40,$BF,0,$5D77,$4000,$8000,$1D77
                    dc.w     $774B,0,0,$774B,$A018,$2010,$1FE8,$8000,$C0,$40
                    dc.w     $BF,0,$4000,$5555,$8000,$1555,0,$556A,0,$556A
                    dc.w     $2018,$2010,$1FE8,0,$C0,$40,$BF,0,$5556,$4000
                    dc.w     $8000,$1556,$555B,0,0,$555B,$2018,$2010,$1FE8,0
                    dc.w     $C0,$40,$BF,0,$5D65,$4000,$8000,0,$564A,0,0,0
                    dc.w     $2018,$2010,$1FE8,0,$C0,$40,$BF,0,$5557,$4000
                    dc.w     $8000,0,$754B,0,0,0,$A018,$2010,$1FE8,0,$FF,$7F
                    dc.w     $80,0,$FFFF,$FFFF,0,0,$FFFF,$FFFF,0,0,$FFF8,$FFF0
                    dc.w     8,0,$FF,0,$FF,0,$FFFF,0,$FFFF,0,$FFFF,0,$FFFF,0
                    dc.w     $FFF8,0,$FFF8,0,$7F,$FF,$FF,0,$FFFF,$FFFF,$FFFF,0
                    dc.w     $FFFF,$FFFF,$FFFF,0,$FFF0,$FFF8,$FFF8,0,$FF,$7F
                    dc.w     $80,0,$FFFF,$FFFF,0,0,$FFFF,$FFFF,0,0,$FFF0,$FFF8
                    dc.w     8,0,$DF,$40,$BF,0,$FFFF,0,$FFFF,0,$FFFF,0,$FFFF,0
                    dc.w     $FFD0,$18,$FFE8,0,$E8,$48,$B0,0,0,0,0,0,0,0,0,0
                    dc.w     $B0,$98,$68,0,$F0,$50,$A0,0,0,0,0,0,0,$2000,0,0
                    dc.w     $70,$58,$28,0,$E0,$40,$A0,0,0,0,0,0,$2000,0,0,0
                    dc.w     $30,$18,$28,0,$E0,$40,$A0,0,0,0,0,0,$2000,0,0
                    dc.w     $2000,$30,$18,$28,0,$E0,$40,$A0,0,$2000,$1FFF
                    dc.w     $3FFF,0,$5002,$AFFC,$DFFF,$2000,$30,$18,$28,0,$E0
                    dc.w     $40,$A0,0,$4000,$3FFF,$7FFF,0,0,$FFFF,$FFFF,0
                    dc.w     $8030,$18,$C028,0,$E0,$40,$A0,0,$7FFF,0,$7FFF,0
                    dc.w     $FFFF,0,$FFFF,0,$E030,$18,$F028,0,$E0,$40,$A0,0
                    dc.w     $3FFF,0,$7FFF,0,$FFFF,0,$FFFF,0,$8030,$18,$C028,0
                    dc.w     $E0,$40,$A0,0,$2000,$2000,$1FFF,0,1,1,$FFFE,0,$30
                    dc.w     $18,$28,0,$E0,$40,$A0,0,$880,$880,0,0,$88,$88,0,0
                    dc.w     $30,$18,$28,0,$E0,$40,$A0,0,0,0,$700,0,0,0,$70,0
                    dc.w     $30,$18,$28,0,$E0,$40,$A0,0,$2FF,$2FF,$100,0
                    dc.w     $FFA0,$FFA0,$40,0,$30,$18,$28,0,$E0,$40,$A0,0,8,8
                    dc.w     0,0,$4C0,$4C0,$300,0,$30,$18,$28,0,$E0,$40,$A0,0
                    dc.w     4,4,0,0,$6300,$6300,$1C00,0,$38,$10,$28,0,$E0,$40
                    dc.w     $A0,0,3,3,0,0,$1800,$1800,$E000,0,$38,$10,$28,0
                    dc.w     $E6,$49,$A0,3,$18,$18,7,0,$C000,$C000,0,0,$338
                    dc.w     $490,$28,$600,$E0,$40,$A0,0,$C6,$C6,$38,0,$8000
                    dc.w     $8000,0,0,$38,$10,$28,0,$E0,$40,$A0,0,$8230,$230
                    dc.w     $81C0,0,0,0,$4000,0,$38,$10,$28,0,$E0,$40,$A0,0
                    dc.w     $4700,$8700,$C000,0,0,0,$2000,0,$38,$10,$28,0,$E0
                    dc.w     $40,$A0,0,$1FFF,$E000,$FFFF,0,$FFFD,1,$FFFE,0,$38
                    dc.w     $10,$28,0,$E0,$40,$A0,0,0,$FFFF,$FFFF,0,0,$FFFF
                    dc.w     $FFFF,0,$C038,$4010,$8028,0,$E0,$40,$A0,0,0,$FFFF
                    dc.w     $FFFF,0,0,$FFFF,$FFFF,0,$3038,$D010,$E028,0,$E0
                    dc.w     $40,$A0,0,0,$FFFF,$FFFF,0,0,$FFFF,$FFFF,0,$C38
                    dc.w     $F410,$F828,0,$E0,$40,$A0,0,$7FFF,0,$FFFF,0,$FFFF
                    dc.w     0,$FFFF,0,$E438,$410,$F828,0,$E0,$40,$A0,0,$43FF
                    dc.w     $43FF,$3C00,0,$FFF8,$FFF8,7,0,$1038,$1010,$E028,0
                    dc.w     $E0,$40,$A0,0,$26AA,$2555,$1BFF,0,$AAAC,$5554
                    dc.w     $FFFB,0,$4038,$4010,$8028,0,$E0,$40,$A0,0,$1800
                    dc.w     $1C00,$700,0,2,6,$1C,0,$38,$10,$28,0,$E0,$40,$A0
                    dc.w     0,$411,$11,$780,0,$1104,$3100,$3C,$2000,$38,$10
                    dc.w     $28,0,$E0,$40,$A0,0,$42A,$42A,$311,0,$AA84,$8A84
                    dc.w     $1118,$2000,$38,$10,$28,0,$E0,$40,$A0,0,$3FF,$3FF
                    dc.w     0,0,$FFF8,$DFF8,0,0,$38,$10,$28,0,$F0,$50,$A0,0,0
                    dc.w     0,0,0,0,$2000,0,0,$78,$50,$28,0,$E8,$48,$B0,0,0,0
                    dc.w     0,0,0,0,0,0,$B8,$90,$68,0,$F0,$40,$BF,0,0,0,$FFFF
                    dc.w     0,0,0,$FFFF,0,$78,$10,$FFE8,0,$DA,$42,$BC,0,0,0,0
                    dc.w     0,0,0,0,0,$158,$110,$E8,0,$C2,$42,$BC,0,$EEEE,0,0
                    dc.w     $EEEE,$EEEB,0,0,$EEEB,$A518,$110,$E8,$A400,$C2
                    dc.w     $42,$BC,0,0,$88AA,0,$88AA,0,$AA4A,0,$AA4A,$118
                    dc.w     $B510,$E8,$B400,$C2,$42,$BC,0,$ECEA,0,0,$ECEA
                    dc.w     $EA4A,0,0,$EA4A,$AD18,$110,$E8,$AC00,$C2,$42,$BC
                    dc.w     0,$288E,0,0,0,$CE4A,0,0,0,$A518,$110,$E8,0,$C2
                    dc.w     $42,$BC,0,$EE8A,0,0,0,$AA4B,0,0,0,$A518,$110,$E8
                    dc.w     0,$FF,$7F,$80,0,$FFFF,$FFFF,0,0,$FFFF,$FFFF,0,0
                    dc.w     $FFF8,$FFF0,8,0,$FF,0,$FF,0,$FFFF,0,$FFFF,0,$FFFF
                    dc.w     0,$FFFF,0,$FFF8,0,$FFF8,0,$7F,$FF,$FF,0,$FFFF
                    dc.w     $FFFF,$FFFF,0,$FFFF,$FFFF,$FFFF,0,$FFF0,$FFF8
                    dc.w     $FFF8,0,$FF,$7F,$80,0,$FFFF,$FFFF,0,0,$FFFF,$FFFF
                    dc.w     0,0,$FFF0,$FFF8,8,0,$DF,$40,$BF,0,$FFFF,0,$FFFF,0
                    dc.w     $FFFF,0,$FFFF,0,$FFD0,$18,$FFE8,0,$E8,$48,$B0,0,0
                    dc.w     0,0,0,0,0,0,0,$B0,$98,$68,0,$F0,$50,$A0,0,0,0,0,0
                    dc.w     0,$2000,0,0,$70,$58,$28,0,$E0,$40,$A0,0,0,0,0,0
                    dc.w     $2000,0,0,0,$30,$18,$28,0,$E0,$40,$A0,0,0,0,0,0
                    dc.w     $2000,0,0,$2000,$30,$18,$28,0,$E0,$40,$A0,0,0,0,0
                    dc.w     0,0,$2000,0,$2000,$30,$18,$28,0,$E0,$40,$A0,0,0,0
                    dc.w     0,0,0,0,0,0,$30,$18,$28,0,$E0,$40,$A0,0,0,0,0,0,0
                    dc.w     0,0,0,$30,$18,$28,0,$E0,$40,$A0,0,0,0,0,0,$5C70
                    dc.w     $4380,$3FF0,0,$30,$18,$28,0,$E0,$40,$A0,0,2,2,1,0
                    dc.w     $FF00,$C0,$FFE0,0,$30,$18,$28,0,$E0,$40,$A0,0,$17
                    dc.w     $10,15,0,$FFC0,$30,$FFF8,0,$30,$18,$28,0,$E0,$40
                    dc.w     $A0,0,$BF,$80,$7F,0,$FFF0,12,$FFFE,0,$30,$18,$28
                    dc.w     0,$E0,$40,$A0,0,$5FF,$400,$3FF,0,$FFFC,3,$FFFF,0
                    dc.w     $2030,$2018,$C028,0,$E0,$40,$A0,0,$2FFF,$2000
                    dc.w     $1FFF,0,$FFFF,0,$FFFF,0,$1830,$E018,$FC28,0,$E0
                    dc.w     $40,$A1,0,$7FFF,$8000,$FFFF,0,$FFF8,0,$FFFF,0
                    dc.w     $838,$810,$F028,0,$E1,$41,$A0,0,$DFFF,$A000,$7FFF
                    dc.w     0,$FFC0,0,$FFFF,0,$1038,$1010,$E028,0,$E6,$49,$A0
                    dc.w     3,$F7FF,$E800,$1FFF,0,$FE00,0,$FFFF,0,$2338,$2490
                    dc.w     $C028,$600,$E1,$41,$A0,0,$FDFF,$FA00,$7FF,0,$F009
                    dc.w     9,$FFF6,0,$C038,$C010,$28,0,$E1,$41,$A0,0,$FF7F
                    dc.w     $FE80,$1FF,0,$8072,$7C,$FF8F,0,$38,$10,$28,0,$E0
                    dc.w     $40,$A0,0,$FF8C,$FFF0,$7F,0,$39C,$3E3,$FC7F,0
                    dc.w     $8038,$10,$8028,0,$E0,$40,$A0,0,$3FC0,$3FC0,$3F,0
                    dc.w     $1CE2,$1F1A,$E3FC,0,$38,$10,$4028,0,$E0,$40,$A0,0
                    dc.w     $FE0,$FE0,$1F,0,$E710,$F8D0,$1FE0,0,$4038,$4010
                    dc.w     $28,0,$E3,$43,$A0,0,$3E7,$3E7,$18,0,$3880,$C680
                    dc.w     $FF00,0,$8038,$8010,$28,0,$E0,$40,$A0,0,$C0EB
                    dc.w     $C0E8,$17,0,$C403,$3403,$F800,0,$38,$10,$28,0,$E6
                    dc.w     $46,$A0,0,$39,$38,7,0,$201C,$A01C,$C000,0,$38,$10
                    dc.w     $28,0,$E0,$40,$A0,0,13,13,2,0,$E0,$E0,0,0,$38,$10
                    dc.w     $28,0,$E0,$40,$A0,0,2,2,0,0,$702,$705,0,7,$8038
                    dc.w     $5010,$28,$D000,$E0,$40,$A0,0,2,2,0,0,$3800,$3800
                    dc.w     0,0,$38,$10,$28,0,$E0,$40,$A0,0,$31,$31,0,0,$C004
                    dc.w     $E001,0,$2005,$8438,$2110,$28,$A500,$E0,$40,$A0,0
                    dc.w     $18C,$18C,0,0,$2000,0,0,$2000,$38,$10,$28,0,$E0
                    dc.w     $40,$A0,0,$C60,$C60,0,0,$2004,2,0,6,$A038,$1010
                    dc.w     $28,$B000,$F0,$50,$A0,0,$300,$300,0,0,0,$2000,0,0
                    dc.w     $78,$50,$28,0,$E8,$48,$B0,0,0,0,0,0,0,0,0,0,$B8
                    dc.w     $90,$68,0,$F0,$40,$BF,0,0,0,$FFFF,0,0,0,$FFFF,0
                    dc.w     $78,$10,$FFE8,0,$DF,$40,$BF,0,$F400,$400,$F800,0
                    dc.w     1,1,0,0,$7FD8,$10,$FFE8,0,$C0,$40,$BF,0,$517,$400
                    dc.w     $F800,$117,$751D,1,0,$751C,$18,$10,$FFE8,0,$C0
                    dc.w     $40,$BF,0,$400,$5B5,$F800,$1B5,1,$5511,0,$5510
                    dc.w     $18,$10,$FFE8,0,$C0,$40,$BF,0,$555,$400,$F800
                    dc.w     $155,$6519,1,0,$6518,$18,$10,$FFE8,0,$C0,$40,$BF
                    dc.w     0,$515,$400,$F800,0,$5511,1,0,0,$18,$10,$FFE8,0
                    dc.w     $C0,$40,$BF,0,$517,$400,$F800,0,$75DD,1,0,0,$18
                    dc.w     $10,$FFE8,0,$FF,$7F,$80,0,$FFFF,$FFFF,0,0,$FFFF
                    dc.w     $FFFF,0,0,$FFF8,$FFF0,8,0,$FF,0,$FF,0,$FFFF,0
                    dc.w     $FFFF,0,$FFFF,0,$FFFF,0,$FFF8,0,$FFF8,0,$7F,$FF
                    dc.w     $FF,0,$FFFF,$FFFF,$FFFF,0,$FFFF,$FFFF,$FFFF,0
                    dc.w     $FFF0,$FFF8,$FFF8,0,$FF,$7F,$80,0,$FFFF,$FFFF,0,0
                    dc.w     $FFFF,$FFFF,0,0,$FFF0,$FFF8,8,0,$DF,$40,$BF,0
                    dc.w     $FFFF,0,$FFFF,0,$FFFF,0,$FFFF,0,$FFD0,$18,$FFE8,0
                    dc.w     $E8,$48,$B0,0,0,0,0,0,0,0,0,0,$B0,$98,$68,0,$F0
                    dc.w     $50,$A0,0,0,0,0,0,0,$2000,0,0,$70,$58,$28,0,$E0
                    dc.w     $40,$A0,0,0,0,0,0,$2000,0,0,0,$30,$18,$28,0,$E0
                    dc.w     $40,$A0,0,0,0,0,0,$B200,$8C00,$5F00,$2000,$30,$18
                    dc.w     $28,0,$E0,$40,$A0,0,5,4,3,0,$DD00,$2100,$DE00
                    dc.w     $2000,$30,$18,$28,0,$E0,$40,$A0,0,$2F,$20,$1F,0
                    dc.w     $FF40,$40,$FF80,0,$30,$18,$28,0,$E0,$40,$A0,0
                    dc.w     $17F,$100,$FF,0,$FFD0,$10,$FFE0,0,$30,$18,$28,0
                    dc.w     $E0,$40,$A0,0,$BFF,$800,$7FF,0,$FFF3,3,$FFFC,0
                    dc.w     $8030,$8018,$28,0,$E0,$40,$A0,0,$5FFF,$4000,$3FFF
                    dc.w     0,$FFE0,$1F,$FFFF,0,$30,$C018,$E028,0,$E0,$40,$A0
                    dc.w     0,$7FFF,0,$FFFF,0,$FF01,$FE,$FFFF,0,$8030,$18
                    dc.w     $C028,0,$E0,$40,$A0,0,$DFFF,$C000,$3FFF,0,$F80E
                    dc.w     $7F0,$FFFF,0,$8030,$8018,$28,0,$E0,$40,$A0,0
                    dc.w     $F7FF,$F000,$FFF,0,$C07C,$3F81,$FFFF,0,$2030
                    dc.w     $2018,$C028,0,$E0,$40,$A0,0,$7DFE,$7C01,$3FF,0
                    dc.w     $3EB,$FC08,$FFF7,0,$1830,$E018,$FC28,0,$E0,$40
                    dc.w     $A1,0,$BF70,$3F0F,$C0FF,0,$1F58,$E040,$FFBF,0
                    dc.w     $838,$810,$F028,0,$E1,$41,$A0,0,$EFC0,$8FDF,$703F
                    dc.w     0,$FAC0,$200,$FDFF,0,$1038,$1010,$E028,0,$E6,$49
                    dc.w     $A0,3,$FBE7,$E3E8,$1C1F,0,$D600,$1000,$EFFF,0
                    dc.w     $2338,$2490,$C028,$600,$E1,$41,$A0,0,$FEEE,$F8E0
                    dc.w     $71F,0,$B009,$8009,$7FF6,0,$C038,$C010,$28,0,$E1
                    dc.w     $41,$A0,0,$FFA5,$FE24,$1DB,0,$8072,$7C,$FF8F,0
                    dc.w     $38,$10,$28,0,$E0,$40,$A0,0,$FFDC,$FFA0,$7F,0
                    dc.w     $39C,$3E3,$FC7F,0,$8038,$10,$8028,0,$E0,$40,$A0,0
                    dc.w     $3FC0,$3FC0,$3F,0,$1CE2,$1F1A,$E3FC,0,$38,$10
                    dc.w     $4028,0,$E0,$40,$A0,0,$FE0,$FE0,$1F,0,$E710,$F8D0
                    dc.w     $1FE0,0,$4038,$4010,$28,0,$E3,$43,$A0,0,$3E7,$3E7
                    dc.w     $18,0,$3880,$C680,$FF00,0,$8038,$8010,$28,0,$E0
                    dc.w     $40,$A0,0,$C0EB,$C0E8,$17,0,$C403,$3403,$F800,0
                    dc.w     $38,$10,$28,0,$E6,$46,$A0,0,$39,$38,7,0,$201C
                    dc.w     $A01C,$C000,0,$38,$10,$28,0,$E0,$40,$A0,0,13,13,2
                    dc.w     0,$E0,$E0,0,0,$38,$10,$28,0,$E0,$40,$A0,0,2,2,0,0
                    dc.w     $705,$700,0,5,$5238,$2810,$28,$7A00,$E0,$40,$A0,0
                    dc.w     2,2,0,0,$3800,$3800,0,0,$38,$10,$28,0,$E0,$40,$A0
                    dc.w     0,$31,$31,0,0,$C005,$E002,0,$2007,$5038,$C10,$28
                    dc.w     $5C00,$E0,$40,$A0,0,$18C,$18C,0,0,$2000,0,0,$2000
                    dc.w     $38,$10,$28,0,$E0,$40,$A0,0,$C60,$C60,0,0,$2002,4
                    dc.w     0,6,$A038,$5810,$28,$F800,$F0,$50,$A0,0,$300,$300
                    dc.w     0,0,0,$2000,0,0,$78,$50,$28,0,$E8,$48,$B0,0,0,0,0
                    dc.w     0,0,0,0,0,$B8,$90,$68,0,$F0,$40,$BF,0,0,0,$FFFF,0
                    dc.w     0,0,$FFFF,0,$78,$10,$FFE8,0,$DF,$40,$BF,0,$F400
                    dc.w     $400,$F800,0,1,1,0,0,$7FD8,$10,$FFE8,0,$C0,$40
                    dc.w     $BF,0,$517,$400,$F800,$117,$751D,1,0,$751C,$18
                    dc.w     $10,$FFE8,0,$C0,$40,$BF,0,$400,$5B5,$F800,$1B5,1
                    dc.w     $5511,0,$5510,$18,$10,$FFE8,0,$C0,$40,$BF,0,$555
                    dc.w     $400,$F800,$155,$6519,1,0,$6518,$18,$10,$FFE8,0
                    dc.w     $C0,$40,$BF,0,$515,$400,$F800,0,$5511,1,0,0,$18
                    dc.w     $10,$FFE8,0,$C0,$40,$BF,0,$517,$400,$F800,0,$75DD
                    dc.w     1,0,0,$18,$10,$FFE8,0,$FF,$7F,$80,0,$FFFF,$FFFF,0
                    dc.w     0,$FFFF,$FFFF,0,0,$FFF8,$FFF0,8,0,$FF,0,$FF,0
                    dc.w     $FFFF,0,$FFFF,0,$FFFF,0,$FFFF,0,$FFF8,0,$FFF8,0,0
                    dc.w     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
SPRSDW:             dc.w     1,8,$90
SPRSDM:             dc.w     0,$FFF
SPRSDS:             dc.w     $98C6,$6739,0,$FFFF,$3000,$C000,0,$F000,$B18C
                    dc.w     $4E73,0,$CE73,$7000,$8000,0,$9000,$E318,$1CE7,0
                    dc.w     $9CE7,$D000,$2000,0,$3000,$C631,$39CE,0,$39CE
                    dc.w     $9000,$6000,0,$7000,$8C63,$739C,0,$739C,$1000
                    dc.w     $E000,0,$E000,$98C6,$6739,0,$E739,$3000,$C000,0
                    dc.w     $C000,$B18C,$4E73,0,$CE73,$7000,$8000,0,$9000
                    dc.w     $E318,$1CE7,0,$9CE7,$D000,$2000,0,$3000,$FFFF,0,0
                    dc.w     $39CE,$F000,0,0,$7000,$B18C,$4E73,0,$CE73,$7000
                    dc.w     $8000,0,$9000,$E318,$1CE7,0,$9CE7,$D000,$2000,0
                    dc.w     $3000,$C631,$39CE,0,$39CE,$9000,$6000,0,$7000
                    dc.w     $8C63,$739C,0,$739C,$1000,$E000,0,$E000,$98C6
                    dc.w     $6739,0,$E739,$3000,$C000,0,$C000,$B18C,$4E73,0
                    dc.w     $CE73,$7000,$8000,0,$9000,$E318,$1CE7,0,$9CE7
                    dc.w     $D000,$2000,0,$3000,$FFFF,0,0,$39CE,$F000,0,0
                    dc.w     $7000,0,0,0,0,0,0,0,0,$E318,$1CE7,0,$9CE7,$D000
                    dc.w     $2000,0,$3000,$C631,$39CE,0,$39CE,$9000,$6000,0
                    dc.w     $7000,$8C63,$739C,0,$739C,$1000,$E000,0,$E000
                    dc.w     $98C6,$6739,0,$E739,$3000,$C000,0,$C000,$B18C
                    dc.w     $4E73,0,$CE73,$7000,$8000,0,$9000,$E318,$1CE7,0
                    dc.w     $9CE7,$D000,$2000,0,$3000,$FFFF,0,0,$39CE,$F000,0
                    dc.w     0,$7000,0,0,$7FFF,0,0,0,$E000,0,0,0,0,0,0,0,0,0
                    dc.w     $C631,$39CE,0,$39CE,$9000,$6000,0,$7000,$8C63
                    dc.w     $739C,0,$739C,$1000,$E000,0,$E000,$98C6,$6739,0
                    dc.w     $E739,$3000,$C000,0,$C000,$B18C,$4E73,0,$CE73
                    dc.w     $7000,$8000,0,$9000,$E318,$1CE7,0,$9CE7,$D000
                    dc.w     $2000,0,$3000,$FFFF,0,0,$39CE,$F000,0,0,$7000
                    dc.w     $3FFF,0,$7FFF,0,$C000,0,$E000,0,0,0,$7FFF,0,0,0
                    dc.w     $E000,0,0,0,0,0,0,0,0,0,$8C63,$739C,0,$739C,$1000
                    dc.w     $E000,0,$E000,$98C6,$6739,0,$E739,$3000,$C000,0
                    dc.w     $C000,$B18C,$4E73,0,$CE73,$7000,$8000,0,$9000
                    dc.w     $E318,$1CE7,0,$9CE7,$D000,$2000,0,$3000,$FFFF,0,0
                    dc.w     $39CE,$F000,0,0,$7000,0,0,$7FFF,0,0,0,$E000,0
                    dc.w     $3FFF,0,$7FFF,0,$C000,0,$E000,0,0,0,$7FFF,0,0,0
                    dc.w     $E000,0,0,0,0,0,0,0,0,0,$B18C,$4E73,0,$CE73,$7000
                    dc.w     $8000,0,$9000,$E318,$1CE7,0,$9CE7,$D000,$2000,0
                    dc.w     $3000,$FFFF,0,0,$39CE,$F000,0,0,$7000,0,$78F1,0
                    dc.w     $78F1,0,$E000,0,$E000,0,0,0,0,0,0,0,0,0,0,$7FFF,0
                    dc.w     0,0,$E000,0,$3FFF,0,$7FFF,0,$C000,0,$E000,0,0,0
                    dc.w     $7FFF,0,0,0,$E000,0,0,0,0,0,0,0,0,0,$FFFF,0,0,0
                    dc.w     $F000,0,0,0,0,$78F1,0,$78F1,0,$E000,0,$E000,$3060
                    dc.w     $4891,0,$78F1,$C000,$2000,0,$E000,0,$78F1,0,$78F1
                    dc.w     0,$E000,0,$E000,0,0,0,0,0,0,0,0,0,0,$7FFF,0,0,0
                    dc.w     $E000,0,$3FFF,0,$7FFF,0,$C000,0,$E000,0,0,0,$7FFF
                    dc.w     0,0,0,$E000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     $78F1,0,$78F1,0,$E000,0,$E000,$3060,$4891,0,$78F1
                    dc.w     $C000,$2000,0,$E000,0,$78F1,0,$78F1,0,$E000,0
                    dc.w     $E000,0,0,0,0,0,0,0,0,0,0,$7FFF,0,0,0,$E000,0
                    dc.w     $3FFF,0,$7FFF,0,$C000,0,$E000,0,0,0,$7FFF,0,0,0
                    dc.w     $E000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,$7800,$F1
                    dc.w     0,$F1,0,$E000,0,$E000,$4860,$3091,0,$F1,$C000
                    dc.w     $2000,0,$E000,$7800,$F1,0,$F1,0,$E000,0,$E000,0,0
                    dc.w     0,0,0,0,0,0,0,0,$7FFF,0,0,0,$E000,0,$3FFF,0,$7FFF
                    dc.w     0,$C000,0,$E000,0,0,0,$7FFF,0,0,0,$E000,0,0,0,0,0
                    dc.w     0,0,0,0,0,0,0,0,0,0,0,0,$78F0,1,0,1,0,$E000,0
                    dc.w     $E000,$4890,$3061,0,1,$C000,$2000,0,$E000,$78F0,1
                    dc.w     0,1,0,$E000,0,$E000,0,0,0,0,0,0,0,0,0,0,$7FFF,0,0
                    dc.w     0,$E000,0,$3FFF,0,$7FFF,0,$C000,0,$E000,0,0,0
                    dc.w     $7FFF,0,0,0,$E000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     0,$78F1,0,0,0,$E000,0,0,0,$4891,$3060,0,0,$2000
                    dc.w     $C000,0,0,$78F1,0,0,0,$E000,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     0,$7FFF,$7FFF,0,0,$E000,$E000,0,0,$4000,$4000
                    dc.w     $3FFF,0,$2000,$2000,$C000,0,$7FFF,$7FFF,0,0,$E000
                    dc.w     $E000,0,0,0,0,0,0,0,0,0
SPRCOW:             dc.w     6,5,0
SPRCOM:             dc.w     $3FFF,$FE00
SPRCOG:             dc.w     $22,15,$8001,$E000,$8800,$2200,$F80,$1032,$408
                    dc.w     $102,$40,$8810,$3204,$801,$932A,$64CF,$1931,$C64C
                    dc.w     $A993,$2A64,$CF19,$1026,$408,$100,$2040,$D810
                    dc.w     $2604,$801,$22,15,$8003,$C000,$8800,$2200,$F80
SPRSTW:             dc.w     0,4,$28
SPRSTM:             dc.w     $1F
SPRSTP:             dc.w     $40,0,0,0,$C0,0,0,0,$40,0,0,0,$40,0,0,0,$E0,0,0
                    dc.w     $A0,$E0,0,0,$A0,$20,0,0,0,$E0,0,0,0,$80,0,0,0,$E0
                    dc.w     0,0,$A0,$E0,0,0,$A0,$80,0,0,0,$E0,0,0,0,$20,0,0,0
                    dc.w     $E0,0,0,$A0,$4E0,0,0,$A0,$CA0,0,0,0,$4A0,0,0,0
                    dc.w     $4A0,0,0,0,$EE0,0,0,$AA0,$EE0,0,0,$AA0,$280,0,0,0
                    dc.w     $EE0,0,0,0,$820,0,0,0,$EE0,0,0,$AA0,$EE0,0,0,$AA0
                    dc.w     $8A0,0,0,0,$EA0,0,0,0,$2A0,0,0,0,$EE0,0,0,$AA0
                    dc.w     $4EE0,0,0,$AA0,$CAA0,0,0,0,$4AA0,0,0,0,$4AA0,0,0
                    dc.w     0,$EEE0,0,0,$AAA0,$EEE0,0,0,$AAA0,$28A0,0,0,0
                    dc.w     $EEA0,0,0,0,$82A0,0,0,0,$EEE0,0,0,$AAA0
SPRSTPB:            dc.w     0,$40,0,0,0,$C0,0,0,0,$40,0,0,0,$40,0,0,$A0,$40,0
                    dc.w     0,$A0,$40,0,0,0,$20,0,0,0,$E0,0,0,0,$80,0,0,$A0
                    dc.w     $40,0,0,$A0,$40,0,0,0,$80,0,0,0,$E0,0,0,0,$20,0,0
                    dc.w     $A0,$40,0,0,$A0,$440,0,0,0,$CA0,0,0,0,$4A0,0,0,0
                    dc.w     $4A0,0,0,$AA0,$440,0,0,$AA0,$440,0,0,0,$280,0,0,0
                    dc.w     $EE0,0,0,0,$820,0,0,$AA0,$440,0,0,$AA0,$440,0,0,0
                    dc.w     $8A0,0,0,0,$EA0,0,0,0,$2A0,0,0,$AA0,$440,0,0,$AA0
                    dc.w     $4440,0,0,0,$CAA0,0,0,0,$4AA0,0,0,0,$4AA0,0,0
                    dc.w     $AAA0,$4440,0,0,$AAA0,$4440,0,0,0,$28A0,0,0,0
                    dc.w     $EEA0,0,0,0,$82A0,0,0,$AAA0,$4440,0,0
SPRANW:             dc.w     0,4,$28
SPRANM:             dc.w     $1FF
SPRANG:             dc.w     $E00,0,0,$A00,$800,0,0,0,$E00,0,0,0,$200,0,0,0
                    dc.w     $E00,0,0,$A00,$4E00,0,0,$A00,$CA00,0,0,0,$4A00,0
                    dc.w     0,0,$4A00,0,0,0,$EE00,0,0,$AA00,$4E00,0,0,$A00
                    dc.w     $C800,0,0,0,$4E00,0,0,0,$4200,0,0,0,$EE00,0,0
                    dc.w     $AA00,$EE00,0,0,$AA00,$2A00,0,0,0,$EA00,0,0,0
                    dc.w     $2A00,0,0,0,$EE00,0,0,$AA00,$AE00,0,0,$AA00,$A800
                    dc.w     0,0,0,$EE00,0,0,0,$2200,0,0,0,$2E00,0,0,$A00
                    dc.w     $EE00,0,0,$AA00,$AA00,0,0,0,$EA00,0,0,0,$2A00,0,0
                    dc.w     0,$EE00,0,0,$AA00
SPRANGB:            dc.w     $A00,$400,0,0,0,$800,0,0,0,$E00,0,0,0,$200,0,0
                    dc.w     $A00,$400,0,0,$A00,$4400,0,0,0,$CA00,0,0,0,$4A00
                    dc.w     0,0,0,$4A00,0,0,$AA00,$4400,0,0,$A00,$4400,0,0,0
                    dc.w     $C800,0,0,0,$4E00,0,0,0,$4200,0,0,$AA00,$4400,0,0
                    dc.w     $AA00,$4400,0,0,0,$2A00,0,0,0,$EA00,0,0,0,$2A00,0
                    dc.w     0,$AA00,$4400,0,0,$AA00,$400,0,0,0,$A800,0,0,0
                    dc.w     $EE00,0,0,0,$2200,0,0,$A00,$2400,0,0,$AA00,$4400
                    dc.w     0,0,0,$AA00,0,0,0,$EA00,0,0,0,$2A00,0,0,$AA00
                    dc.w     $4400,0,0
SPRSHW:             dc.w     1,4,$50
SPRSHM:             dc.w     $C000,3
SPRSHL:             dc.w     $3E95,$2000,$1E95,0,$E878,0,$E878,0,$2095,0,$2095
                    dc.w     0,$844,0,$844,0,$3EF5,$2200,$1CF5,0,$C844,0,$C844
                    dc.w     0,$295,0,$295,0,$844,0,$844,0,$3E95,$200,$3C95,0
                    dc.w     $EF78,0,$EF78,0,0,$1E95,$3E95,0,0,$E878,$E878,0,0
                    dc.w     $2095,$2095,0,0,$844,$844,0,0,$1CF5,$3EF5,0,0
                    dc.w     $C844,$C844,0,0,$295,$295,0,0,$844,$844,0,0,$3C95
                    dc.w     $3E95,0,0,$EF78,$EF78,0
SPRENW:             dc.w     1,4,$50
SPRENM:             dc.w     $C000,0
SPRENG:             dc.w     $3D2F,0,$3D2F,0,$7BDB,$A0A,$71D1,0,$21A8,0,$21A8
                    dc.w     0,$4A0E,4,$4A0A,0,$396E,0,$396E,0,$7AC4,$800
                    dc.w     $72C4,0,$2128,0,$2128,0,$4A44,0,$4A44,0,$3D2F,0
                    dc.w     $3D2F,0,$4BC4,$200,$49C4,0,0,$3D2F,$3D2F,0,0
                    dc.w     $71D1,$7BDB,0,0,$21A8,$21A8,0,0,$4A0A,$4A0E,0,0
                    dc.w     $396E,$396E,0,0,$72C4,$7AC4,0,0,$2128,$2128,0,0
                    dc.w     $4A44,$4A44,0,0,$3D2F,$3D2F,0,0,$49C4,$4BC4,0
SPREQW:             dc.w     1,10,$200
SPREQM:             dc.w     $8000,$7FF
SPREQL:             dc.w     $6C00,$180,0,$D80,0,0,0,0,0,0,0,0,0,0,0,0,0,$6000
                    dc.w     0,$6000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,0,0,0,0,$6000,$C00,0,$6C00,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,0,$6C00,$180,0,$D80,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,$6000,$C00,0
                    dc.w     $6C00,0,0,0,0,0,0,0,0,0,0,0,0,$6C00,$180,0,$D80,0
                    dc.w     0,0,0,0,0,0,0,0,0,0,0,0,$6000,0,$6000,0,0,0,0,0,0
                    dc.w     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,$6000
                    dc.w     $D80,0,$6D80,0,0,0,0,0,0,0,0,0,0,0,0,$6C00,$180,0
                    dc.w     $D80,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,0,0,0,$6000,$C00,0,$6C00,0,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,$6C00,$180,0,$D80,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     $6000,$C00,0,$6C00,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     $6000,0,$6000,0,0,0,0,0,0,0,0,0,0,0,0,0,$6000,0
                    dc.w     $6000,0,0,0,0,0,0,0,0,0,0,0,0,$D80,$6030,0,$1B0,0
                    dc.w     0,0,0,0,0,0,0,0,0,0,0,$6C00,$180,0,$D80,0,0,0,0,0
                    dc.w     0,0,0,0,0,0,0,0,$6000,0,$6000,0,0,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,$6000,0,$6000,0,0,0,0,0,0,0,0,0,0,0,0,$6C00
                    dc.w     $180,0,$D80,0,0,0,0,0,0,0,0,0,0,0,0,$D80,$6030,0
                    dc.w     $1B0,0,0,0,0,0,0,0,0,0,0,0,0,0,$6000,0,$6000,0,0
                    dc.w     0,0,0,0,0,0,0,0,0,0,0,$6000,0,$6000,0,0,0,0,0,0,0
                    dc.w     0,0,0,0,0,$D80,$6030,0,$1B0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     0,$6000,$C00,0,$6C00,0,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     $6000,0,$6000,0,0,0,0,0,0,0,0,0,0,0,0,$6C00,$180
                    dc.w     0,$D80,0,0,0,0,0,0,0,0,0,0,0,0,$D80,$6030,0,$1B0
                    dc.w     0,0,0,0,0,0,0,0,0,0,0,0,$6C00,$180,0,$D80,0,0,0,0
                    dc.w     0,0,0,0,0,0,0,0,$6000,$C00,0,$6C00,0,0,0,0,0,0,0
                    dc.w     0,0,0,0,0,$6000,$C00,0,$6C00,0,0,0,0,0,0,0,0,0,0
                    dc.w     0,0,$1B0,$6C06,0,$36,0,0,0,0,0,0,0,0,0,0,0,0,$D80
                    dc.w     $6030,0,$1B0,0,0,0,0,0,0,0,0,0,0,0,0,$6000,$C00,0
                    dc.w     $6C00,0,0,0,0,0,0,0,0,0,0,0,0,$6000,$C00,0,$6C00
                    dc.w     0,0,0,0,0,0,0,0,0,0,0,0,$D80,$6030,0,$1B0,0,0,0,0
                    dc.w     0,0,0,0,0,0,0,0,$1B0,$6C06,0,$36,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,0,$6000,$C00,0,$6C00,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     0,$6000,$C00,0,$6C00,0,0,0,0,0,0,0,0,0,0,0,0,$1B0
                    dc.w     $6C06,0,$36,0,0,0,0,0,0,0,0,0,0,0,0,$6C00,$180,0
                    dc.w     $D80,0,0,0,0,0,0,0,0,0,0,0,0,$6000,$C00,0,$6C00,0
                    dc.w     0,0,0,0,0,0,0,0,0,0,0,$D80,$6030,0,$1B0,0,0,0,0,0
                    dc.w     0,0,0,0,0,0,0,$1B0,$6C06,0,$36,0,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,$D80,$6030,0,$1B0,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     $6C00,$180,0,$D80,0,0,0,0,0,0,0,0,0,0,0,0,$6C00
                    dc.w     $180,0,$D80,0,0,0,0,0,0,0,0,0,0,0,0,$36,$6D80,0,6
                    dc.w     0,$C000,0,$C000,0,0,0,0,0,0,0,0,$1B0,$6C06,0,$36
                    dc.w     0,0,0,0,0,0,0,0,0,0,0,0,$6C00,$180,0,$D80,0,0,0,0
                    dc.w     0,0,0,0,0,0,0,0,$6C00,$180,0,$D80,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,0,$1B0,$6C06,0,$36,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     $36,$6D80,0,6,0,$C000,0,$C000,0,0,0,0,0,0,0,0
                    dc.w     $6C00,$180,0,$D80,0,0,0,0,0,0,0,0,0,0,0,0,$6C00
                    dc.w     $180,0,$D80,0,0,0,0,0,0,0,0,0,0,0,0,$36,$6D80,0,6
                    dc.w     0,$C000,0,$C000,0,0,0,0,0,0,0,0,$D80,$6030,0,$1B0
                    dc.w     0,0,0,0,0,0,0,0,0,0,0,0,$6C00,$180,0,$D80,0,0,0,0
                    dc.w     0,0,0,0,0,0,0,0,$1B0,$6C06,0,$36,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,0,$36,$6D80,0,6,0,$C000,0,$C000,0,0,0,0,0,0
                    dc.w     0,0,$1B0,$6C06,0,$36,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     $4D80,$2030,0,$1B0,0,0,0,0,0,0,0,0,0,0,0,0,$4D80
                    dc.w     $2030,0,$1B0,0,0,0,0,0,0,0,0,0,0,0,0,$4006,$2DB0
                    dc.w     0,0,$C000,$1800,0,$D800,0,0,0,0,0,0,0,0,$4036
                    dc.w     $2D80,0,6,0,$C000,0,$C000,0,0,0,0,0,0,0,0,$4D80
                    dc.w     $2030,0,$1B0,0,0,0,0,0,0,0,0,0,0,0,0,$4D80,$2030
                    dc.w     0,$1B0,0,0,0,0,0,0,0,0,0,0,0,0,$4036,$2D80,0,6,0
                    dc.w     $C000,0,$C000,0,0,0,0,0,0,0,0,$4006,$2DB0,0,0
                    dc.w     $C000,$1800,0,$D800,0,0,0,0,0,0,0,0,$4D80,$2030,0
                    dc.w     $1B0,0,0,0,0,0,0,0,0,0,0,0,0,$4D80,$2030,0,$1B0,0
                    dc.w     0,0,0,0,0,0,0,0,0,0,0,$4006,$2DB0,0,0,$C000,$1800
                    dc.w     0,$D800,0,0,0,0,0,0,0,0,$4036,$2D80,0,6,0,$C000,0
                    dc.w     $C000,0,0,0,0,0,0,0,0,$4D80,$2030,0,$1B0,0,0,0,0
                    dc.w     0,0,0,0,0,0,0,0,$4D86,$2030,0,$1B6,0,$C000,0
                    dc.w     $C000,0,0,0,0,0,0,0,0,$4036,$2D80,0,6,0,$D800,0
                    dc.w     $D800,0,0,0,0,0,0,0,0,$4006,$2DB0,0,0,$C000,$1800
                    dc.w     0,$D800,0,0,0,0,0,0,0,0,$4D80,$2030,0,$1B0,0,0,0
                    dc.w     0,0,0,0,0,0,0,0,0,$4D80,$2030,0,$1B0,0,0,0,0,0,0
                    dc.w     0,0,0,0,0,0,$6006,$DB0,0,0,$C000,$1800,0,$D800,0
                    dc.w     0,0,0,0,0,0,0,$41B0,$2C06,0,$36,0,0,0,0,0,0,0,0,0
                    dc.w     0,0,0,$4D80,$2030,0,$1B0,0,0,0,0,0,0,0,0,0,0,0,0
                    dc.w     $4036,$2D80,0,6,0,$C000,0,$C000,0,0,0,0,0,0,0,0
                    dc.w     $4006,$2DB0,0,0,$C000,$1800,0,$D800,0,0,0,0,0,0,0
                    dc.w     0,$6036,$D80,0,6,0,$C000,0,$C000,0,0,0,0,0,0,0,0
PRAD:               dcb.l    500,0
DRAD:               dcb.l    500,0
PLAD:               dcb.l    500,0
COLADD:             dc.l     0

DSCOLS:             dc.w     $19,0,9,12,15,$90,$C0,$F0,$900,$C00,$456,$999
                    dc.w     $CCC,$FFF,$123,$F00,$FFF,$1A,0,9,12,15,$90,$C0
                    dc.w     $F0,$900,$C00,$456,$999,$CCC,$FFF,$123,$F00,$FFF
                    dc.w     $1B,0,9,12,15,$90,$C0,$F0,$900,$C00,$456,$999
                    dc.w     $CCC,$FFF,$123,$F00,$FFF,$1C,0,9,12,15,$90,$C0
                    dc.w     $F0,$900,$C00,$456,$999,$CCC,$FFF,$123,$F00,$FFF
                    dc.w     $1D,0,9,12,15,$90,$C0,$F0,$900,$C00,$456,$999
                    dc.w     $CCC,$FFF,$123,$F00,$FFF,$1E,0,9,12,15,$90,$C0
                    dc.w     $F0,$900,$C00,$456,$999,$CCC,$FFF,$123,$F00,$FFF
                    dc.w     $1F,0,9,12,15,$90,$C0,$F0,$900,$C00,$456,$999
                    dc.w     $CCC,$FFF,$123,$F00,$FFF,$7F,0,9,12,15,$90,$C0
                    dc.w     $F0,$900,$C00,$456,$999,$CCC,$FFF,$123,$F00,$FFF
DSCOLS2:            dc.w     1,0,$A80,$FF0,$600,$800,$A00,$F00,$F62,$F84,$860
                    dc.w     $640,$A2,$204,$408,$60A,$80F,2,0,9,12,15,$90,$C0
                    dc.w     $F0,$900,$C00,$456,$999,$CCC,$FFF,$123,$F00,$FFF
                    dc.w     3,0,9,12,15,$90,$C0,$F0,$900,$C00,$456,$999,$CCC
                    dc.w     $FFF,$123,$F00,$FFF,4,0,9,12,15,$90,$C0,$F0,$900
                    dc.w     $C00,$456,$999,$CCC,$FFF,$123,$F00,$FFF,5,0,9,12
                    dc.w     15,$90,$C0,$F0,$900,$C00,$456,$999,$CCC,$FFF,$123
                    dc.w     $F00,$FFF,6,0,9,12,15,$90,$C0,$F0,$900,$C00,$456
                    dc.w     $999,$CCC,$FFF,$123,$F00,$FFF,7,0,9,12,15,$90,$C0
                    dc.w     $F0,$900,$C00,$456,$999,$CCC,$FFF,$123,$F00,$FFF
                    dc.w     8,0,9,12,15,$90,$C0,$F0,$900,$C00,$456,$999,$CCC
                    dc.w     $FFF,$123,$F00,$FFF,9,0,9,12,15,$90,$C0,$F0,$900
                    dc.w     $C00,$456,$999,$CCC,$FFF,$123,$F00,$FFF,10,0,9,12
                    dc.w     15,$90,$C0,$F0,$900,$C00,$456,$999,$CCC,$FFF,$123
                    dc.w     $F00,$FFF,11,0,9,12,15,$90,$C0,$F0,$900,$C00,$456
                    dc.w     $999,$CCC,$FFF,$123,$F00,$FFF,12,0,9,12,15,$90
                    dc.w     $C0,$F0,$900,$C00,$456,$999,$CCC,$FFF,$123,$F00
                    dc.w     $FFF,13,0,9,12,15,$90,$C0,$F0,$900,$C00,$456,$999
                    dc.w     $CCC,$FFF,$123,$F00,$FFF,14,0,9,12,15,$90,$C0,$F0
                    dc.w     $900,$C00,$456,$999,$CCC,$FFF,$123,$F00,$FFF,15,0
                    dc.w     9,12,15,$90,$C0,$F0,$900,$C00,$456,$999,$CCC,$FFF
                    dc.w     $123,$F00,$FFF,$10,0,9,12,15,$90,$C0,$F0,$900
                    dc.w     $C00,$456,$999,$CCC,$FFF,$123,$F00,$FFF,$11,0,9
                    dc.w     12,15,$90,$C0,$F0,$900,$C00,$456,$999,$CCC,$FFF
                    dc.w     $123,$F00,$FFF,$12,0,9,12,15,$90,$C0,$F0,$900
                    dc.w     $C00,$456,$999,$CCC,$FFF,$123,$F00,$FFF,$13,0,9
                    dc.w     12,15,$90,$C0,$F0,$900,$C00,$456,$999,$CCC,$FFF
                    dc.w     $123,$F00,$FFF,$14,0,9,12,15,$90,$C0,$F0,$900
                    dc.w     $C00,$456,$999,$CCC,$FFF,$123,$F00,$FFF,$15,0,9
                    dc.w     12,15,$90,$C0,$F0,$900,$C00,$456,$999,$CCC,$FFF
                    dc.w     $123,$F00,$FFF,$16,0,9,12,15,$90,$C0,$F0,$900
                    dc.w     $C00,$456,$999,$CCC,$FFF,$123,$F00,$FFF,$17,0,9
                    dc.w     12,15,$90,$C0,$F0,$900,$C00,$456,$999,$CCC,$FFF
                    dc.w     $123,$F00,$FFF,$18,0,9,12,15,$90,$C0,$F0,$900
                    dc.w     $C00,$456,$999,$CCC,$FFF,$123,$F00,$FFF,$FFFF
BTNODS:             dc.w     $1D
BTDFLN:             dcb.w    2,$2D
BTSTDS:             dc.w     1
BTSTEN:             dc.w     $13,5
BTENR1:             dc.w     $1D
BTSHL1:             dc.w     $22
BTENR2:             dc.w     $30
BTSHL2:             dc.w     $32
BTCOLS:             dcb.w    4,0
                    dcb.w    4,$F0
                    dcb.w    4,15
                    dcb.w    4,$FF
                    dc.w     5,10,5,10,$50,$A0,$50,$A0,$55,$AA,$55,$AA,$5A,$A5
                    dc.w     $5A,$A5,$5F,$AF,$5F,$AF,$F5,$FA,$F5,$FA,$FB,$FE
                    dc.w     $FB,$FE,$40,$20,$60,$90,$B4,$E1,$B4,$E1,$BB,$EE
                    dc.w     $BB,$EE,$B0,$E0,$B0,$E0
BTDEMO:             dc.l     $7303
BTGBLC:             dc.l     $0E01
BTSX:               dc.w     $7C
BTSY:               dc.w     $33
BTD:                dc.w     $9B,0
BTF:                dcb.w    2,0
BTMXOB:             dc.w     $33
BTSTRT:             dc.w     $A0,$85
BTSCBF:             dc.w     $76,$18
BTPLSZ:             dc.w     $94,0
BTDISZ:             dc.w     $1E,5
BTPISZ:             dc.w     $BC,1
BTSCSZ:             dc.w     $2F,1
BTIPOS:             dc.w     $B2,$C5,$18,$D6,$C5,$18,$23,$C5,13,$32,$EE,1,$F2
                    dc.w     $C4,12
BTSPOS:             dc.w     $3C,$CD,7,$10,$CF,14,$FB,$CD,3,$AC,$CD,2,$C6,$CD
                    dc.w     4,$16,$CE,4,$66,$CE,4,$62,$CF,12,0,$C0,$27,$34
                    dc.w     $D6,2,$84,$C0,8,$4E,$CE,1,$35,$CF,$10,$E5,$CE,$10
                    dc.w     $1E,$C1,11,0,0,0,0,0,0,0
                    dc.w     $43
                    dc.b     0
                    dc.b     ' ',0
                    dc.b     '1',0
                    dc.b     '9',0
                    dc.b     '8',0
                    dc.b     '7',0
                    dc.b     ' ',0
                    dc.b     ' '
                    dc.b     0
                    dc.b     '@',0,0
                    dc.b     0
                    dc.b     'I',0
                    dc.b     'N',0
                    dc.b     'C',0
                    dc.b     'E',0
                    dc.b     'N',0
                    dc.b     'T',0
                    dc.b     'I',0
                    dc.b     'V',0
                    dc.b     'E',0
                    dc.b     '!'
BTCLCK:             dc.b     0
                    dc.b     '0',0
                    dc.b     '4',0
                    dc.b     ':',0
                    dc.b     '0',0
                    dc.b     '0',0
                    dc.b     ':',0
                    dc.b     '0',0
                    dc.b     '0'
BTFLL2:             dc.w     2
BTCLB2:             dc.w     2
BTCRH2:             dc.w     1
BTMXH2:             dc.w     4
BTFLYE:             dc.w     1
BTFLY2:             dc.w     0
BTSTPN:             dc.w     5
BTANGN:             dc.w     0
BTKYDL:             dc.w     3
BTKYRR:             dc.w     3
BTBUSY:             dc.w     15,0
BTPDS:              dc.w     $74,1,$11,4,$A1,5,$A7,7,$F5,9,$4F,12,$CF,13,$4B
                    dc.w     15,$AF,$10,$F9,$11,$FA,$12,$EF,$13,$69,$14,$76
                    dc.w     $15,$32,$16,$F0,$17,$DA,$19,8,$1B,$C5,$1C,$A1,$1E
                    dc.w     $AF,$20,$85,$22,$E9,$23,$84,$25,$F8,$26,$28,$28
                    dc.w     $44,$2A,$BB,$2B,$39,$2C,0,0,0,0,0,0,0,0,0,0,0,0,5
                    dc.w     13,11,$1F,8,$1F,$F8,4,$F8,4,$F9,4,$FA,15,11,$10
                    dc.w     11,$1F,9,$1E,$F8,5,$F8,5,$F9,5,$FA,15,5,$14,$1F,0
                    dc.w     $11,14,$15,1,$12,$20,6,15,14,$1A,14,$20,0,$12,$20
                    dc.w     7,$1C,7,$19,$8E,$1E,0,$A0,9,15,$A0,10,$1C,$A0,11
                    dc.w     $24,$A0,12,$1C,$88,11,2,$87,11,$34,$8C,$1E,$9C,7
                    dc.w     $19,$8B,14,0,$A0,14,$29,$A0,$1F,11,$A0,$10,$10
                    dc.w     $A0,$11,15,$88,14,$1E,$87,14,$33,$89,14,$9C,7
DSET1:              dc.w     $10,$20,1,$FE,1,1,$14,14,$1B,$16,$64,$64,$1E
                    dc.b     0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     'A',0
                    dc.b     'M',0
                    dc.b     'E',0
                    dc.b     'T',0
                    dc.b     'H',0
                    dc.b     'Y',0
                    dc.b     'S',0
                    dc.b     'T',0
                    dc.b     ' ',0
                    dc.b     ' '
OBDAT1:             dc.w     1,0,0,0,$7F,1,$7F,1,12,0,$80,0,1,0,1,0,1,$1E,$7F
                    dc.w     2,12,$60,$20,0,1,1,1,$7E,$7D,10,1,3,12,0,$20,5,1
                    dc.w     $7E,1,0,1,10,$7F,4,12,6,$20,0,1,13,11,$28,$18,6
                    dc.w     $28,5,14,$54,$77,$EE,$8F,13,1,1,11,$30,12,6,6,8
                    dc.w     12,0,$FF,$22,1,$3D,1,$7C,1,1,1,9,$10,$22,$D0,$FF
                    dc.w     $83,10,$9C,5,$C3,$43,1,$7E,2,4,0,10,13,1,$12,14
                    dc.w     $16,3,$7E,1,$48,0,4,2,12,13,$11,$12,2,4,3,1,1,$40
                    dc.w     0,4,2,13,13,$10,$12,8,5,1,$50,1,0,1,3,$51,14,$14
                    dc.w     $44,$60,$A0,$85,14,$9C,13,$81,$FA,0,0,1,$5C,1,$17
                    dc.w     2,$23,2,15,14,$33,$70,$55,$8F,13,$C0,$48,1,$5C,0
                    dc.w     $22,0,$13,9,3,$25,14,$2A,0,1,$24,$15,10,$10,$C0
                    dc.w     $44,1,$7D,0,$24,0,$16,9,1,$50,1,$55,1,3,$29,$17
                    dc.w     $16,$44,$60,$5A,$85,$17,$85,$18,$9C,13,$81,$FA,0
                    dc.w     0,6,$50,4,$4E,1,1,10,$18,$18,$4F,$4F,$67,0,2,1,8
                    dc.w     $85,$18,$9C,13,$81,$FA,0,0,6,$3D,1,$10,12,6,$14
                    dc.w     11,$16,$35,$35,$40,2,0,10,$14,$85,11,$85,$14,$9C
                    dc.w     7,3,$42,1,$24,2,4,0,$14,13,$10,$12,$13,7,12,$61,1
                    dc.w     $61,6,0,6,$11,$1A,$11,$61,1,$66,$62,1,$67,$67,1
                    dc.w     $62,$66,1,$61,$85,$11,$9C,5,12,$61,1,$61,6,0,6
                    dc.w     $12,$1A,$11,$62,1,$61,$61,1,$62,$66,1,$67,$67,1
                    dc.w     $66,$85,$12,$9C,5,$C0,$43,1,$29,0,0,0,$19,9,$C0,2
                    dc.w     1,$41,0,$12,0,$1A,9,$C0,$7D,1,$49,0,$36,0,$1B,9,1
                    dc.w     $59,$24,$14,8,1,8,$1C,$20,$33,$6A,$55,$90,$1C,$8F
                    dc.w     7,2,$3F,$13,$3F,$10,$1C,15,7,$1B,$20,15,8,$81,$E8
                    dc.w     3,0,3,0,0,0,$7F,$3F,0,$34,13,0,$12,9,0,3,0,0,0,0
                    dc.w     $3F,$7F,$36,13,0,$12,8,0,3,0,0,$7F,$7F,$3F,0,$33
                    dc.w     13,0,$12,14,0,3,$7F,0,0,0,$3F,$7F,$35,13,0,$12,2
                    dc.w     0,$C1,$40,1,$58,2,4,2,$1D,$1D,$33,0,$77,$12,5,$12
                    dc.w     15,9,$1B,4,15,9,$1B,12,15,9,$1B,10,$1C,13,$C1,$40
                    dc.w     5,$56,2,2,6,$1E,12,$33,$22,$77,$C0,$44,1,$59,0
                    dc.w     $12,0,$1F,9,0,$7F,$89,3,$8C,6,$85,3,$84,6,$86,3
                    dc.w     $28,$82,4,$87,6,$8A,3,$83,6,$86,3,$86,7,$1E,$8B
                    dc.w     $19,$18,$19,$18,$19,$18,$19,$18,$19,$18,$19,$18
                    dc.w     $19,$18,$19,$18,$19,$18,$19,$18,$19,$18,$19,$18
                    dc.w     $19,$18,$19,$18,$19,$18,$19,$18,$19,$18,$19,$18
                    dc.w     $19,$18,$19,$B8,$18,$16,$B9,$1A,$A9,$17,$A6,$19
                    dc.w     $9D,$17,$16,$86,8,$1E,$8A,6,$1E,$A6,$18,$16,$93
                    dc.w     $17,$1A,$17,$1A,$17,$85,$1A,$16,$19,$16,$87,$19
                    dc.w     $17,$19,$89,$17,$83,$1A,$16,$1E,$83,5,$87,3,$86,5
                    dc.w     $82,3,5,3,0,0,0
                    dc.b     0
                    dc.b     'D',0
                    dc.b     'T',0
                    dc.b     'L',0
                    dc.b     ' ',0
                    dc.b     'E',0
                    dc.b     'R',0
                    dc.b     'A',0
                    dc.b     'W',0
                    dc.b     'T',0
                    dc.b     'F',0
                    dc.b     'O',0
                    dc.b     'S',0
                    dc.b     ' ',0
                    dc.b     'E',0
                    dc.b     'V',0
                    dc.b     'I',0
                    dc.b     'T',0
                    dc.b     'N',0
                    dc.b     'E',0
                    dc.b     'C',0
                    dc.b     'N',0
                    dc.b     'I',0
                    dc.b     ' ',0
                    dc.b     '7',0
                    dc.b     '8',0
                    dc.b     '9',0
                    dc.b     '1',0
                    dc.b     ' ',0
                    dc.b     'T',0
                    dc.b     'H',0
                    dc.b     'G',0
                    dc.b     'I',0
                    dc.b     'R',0
                    dc.b     'Y',0
                    dc.b     'P',0
                    dc.b     'O',0
                    dc.b     'C',0,0
DSET2:              dc.w     $10,$19,2,$8F,1,1,$14,10,$1F,$18,$40,$40,$7F
                    dc.w     $4C
                    dc.b     0
                    dc.b     'A',0
                    dc.b     'P',0
                    dc.b     'I',0
                    dc.b     'S',0
                    dc.b     ' ',0
                    dc.b     'L',0
                    dc.b     'A',0
                    dc.b     'Z',0
                    dc.b     'U',0
                    dc.b     'L',0
                    dc.b     'I'
OBDAT2:             dc.w     1,0,0,0,$7F,1,$7F,1,12,0,$80,0,1,$7E,1,0,1,10,$7F
                    dc.w     2,12,6,$10,$75,1,0,1,0,1,10,$7F,$10,12,$22,$10
                    dc.w     $75,1,$57,1,0,1,3,$7F,14,12,$44,$30,$75,1,$64,1
                    dc.w     $51,2,2,2,15,$1F,$22,$10,$AA,$83,14,$83,$11,$86,3
                    dc.w     8,$9C,5,$8E,15,0,$8C,15,$81,$DC,5,0,0,3,$7E,1,$43
                    dc.w     0,4,2,$11,13,$11,$12,3,$1A,$C0,$7C,1,$44,0,0,0
                    dc.w     $10,9,3,1,1,$3F,0,4,2,3,13,$11,$12,1,$1B,$C0,3,1
                    dc.w     $40,0,$12,0,4,9,1,$27,1,$50,8,8,$2F,9,12,$44,$60
                    dc.w     $55,6,$27,1,$48,8,8,8,10,$18,$2A,$2A,$50,4,4,4,4
                    dc.w     $85,10,$9C,13,$81,$90,1,0,1,$27,1,$38,8,8,$10,11
                    dc.w     12,$44,$60,$EE,6,$27,1,$30,8,8,8,12,$18,$2A,$2A
                    dc.w     $50,4,4,4,4,$85,12,$9C,13,$81,$90,1,0,1,$27,1,0,8
                    dc.w     8,$30,13,12,$44,$60,$55,6,$31,1,0,8,$18,$1D,8,$18
                    dc.w     $2A,$2A,$50,4,14,4,14,$85,8,$9C,13,$81,$20,3,0,1
                    dc.w     $31,1,$1D,8,$14,$1E,7,12,$33,$60,$55,6,$31,1,$3B
                    dc.w     8,$1E,8,6,$18,$2A,$2A,$50,4,4,4,4,$85,6,$9C,13
                    dc.w     $81,$20,3,0,1,$31,1,$43,8,$14,$1E,5,12,$33,$60
                    dc.w     $55,6,$31,1,$61,8,$18,$1E,$12,$18,$2A,$2A,$50,4
                    dc.w     15,4,15,$85,$12,$9C,13,$81,$20,3,0,3,0,0,$7F,$7F
                    dc.w     $3F,0,$33,12,0,12,$15,3,0,0,0,$7F,$3F,0,$34,12,0
                    dc.w     12,$15,3,$7F,0,0,0,$3F,$7F,$35,13,0,$12,3,0,3,0,0
                    dc.w     0,0,$3F,$7F,$36,13,0,$12,1,0,$C0,$7B,1,$44,0,$36
                    dc.w     0,$13,9,1,$57,$12,0,1,1,$7F,$20,12,$44,$30,$75,0
                    dc.w     $10,$23,3,5,2,1,$14,11,$18,12,$40,$40,11
                    dc.w     $20
                    dc.b     0
                    dc.b     ' ',0
                    dc.b     'E',0
                    dc.b     'M',0
                    dc.b     'E',0
                    dc.b     'R',0
                    dc.b     'A',0
                    dc.b     'L',0
                    dc.b     'D',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.w     $100,0,0,0,$7F00,$100,$7F00,$100,$C00,0,$3000,0
                    dc.w     $100,0,$100,0,$100,$A00,$7F00,$200,$C00,$5000
                    dc.w     $2000,0,$100,$100,$100,0,$7D00,$A00,$100,$500
                    dc.w     $C00,0,$2000,$8000,$100,$7E00,$100,0,$100,$A00
                    dc.w     $7F00,$400,$C00,$500,$2000,0,$100,$100,$100,$7E00
                    dc.w     $7D00,$A00,$100,$300,$C00,0,$2000,$800,$300,$100
                    dc.w     $100,$4200,0,$400,$200,$800,$D00,$1000,$1200,$200
                    dc.w     $1300,$100,$100,$100,$3C00,$200,$600,$200,$600
                    dc.w     $C00,$9000,$2000,$7A00,$400,$300,$500,$3C00,$200
                    dc.w     $200,$200,$700,$1000,$2400,$2400,0,$100,$100,$100
                    dc.w     $100,$C000,$500,$100,$4300,0,$1200,0,$1A00,$900
                    dc.w     $300,$3C00,$100,$7E00,$200,$400,0,$C00,$D00,$100
                    dc.w     $1200,$1100,$1100,$C000,$3D00,$100,$7B00,0,$2400
                    dc.w     0,$1B00,$900,$100,$4200,$100,$7C00,$200,$600,$200
                    dc.w     $900,$C00,$9400,$2000,$A00,$900,$4200,$500,$7A00
                    dc.w     $200,$200,$200,$A00,$1000,$2400,$2400,0,$100,$100
                    dc.w     $100,$100,$200,$4300,$600,$7A00,0,0,0,$B00,$E00
                    dc.w     $A00,$A00,0,$C00,$1000,$100,$3500,$100,$7A00,$200
                    dc.w     $600,$400,$D00,$C00,$9400,$2000,$A00,$100,$7C00
                    dc.w     $100,$3A00,$200,$600,$200,$1100,$C00,$400,$2000
                    dc.w     $7A00,$500,$7A00,$500,$3A00,$200,$200,$200,$1400
                    dc.w     $1000,$A400,$A400,0,$100,$100,$100,$100,$200
                    dc.w     $7A00,$600,$3B00,0,0,0,$1500,$E00,$100,$A00,0
                    dc.w     $C00,$100,$300,$7E00,$100,$4000,0,$500,$200,$F00
                    dc.w     $D00,$100,$1200,$400,$1400,$C000,$7B00,$100,$4000
                    dc.w     0,$3600,0,$1C00,$900,$100,$3C00,$100,$100,$200
                    dc.w     $600,$200,$1700,$C00,$9400,$2000,$7000,$800,$3C00
                    dc.w     $500,$300,$200,$200,$200,$1800,$1000,$2400,$2400
                    dc.w     0,$100,$100,$100,$100,$200,$3D00,$600,$500,0,0,0
                    dc.w     $1900,$E00,$100,$A00,0,$C00,$2000,$300,$3800,$100
                    dc.w     $100,$200,$400,0,$1600,$D00,$1000,$1200,$A00
                    dc.w     $2600,$300,0,0,$7F00,$7F00,$3F00,0,$3300,$D00,0
                    dc.w     $1200,$1100,0,$300,0,0,0,$7F00,$3F00,0,$3400,$D00
                    dc.w     0,$1200,$A00,0,$300,$7F00,0,0,0,$3F00,$7F00,$3500
                    dc.w     $D00,0,$1200,$400,0,$300,0,0,0,0,$3F00,$7F00
                    dc.w     $3600,$D00,0,$1200,$200,0,$100,$3800,$100,$3800
                    dc.w     $1000,$300,$1000,$1F00,$1500,$9900,$7000,$7700
                    dc.w     $8F00,$C00,$500,$1F00,$F00,$700,$9400,$1F00,$500
                    dc.w     $700,$3C00,$400,$3C00,$800,$500,$800,$2000,$1200
                    dc.w     $A400,$A400,$7000,$200,$200,$600,$600,$8F00,$D00
                    dc.w     $600,$3C00,$900,$3C00,$800,$F00,$800,$2100,$2500
                    dc.w     $2A00,$2A00,0,$400,$400,$400,$400,$8200,$600
                    dc.w     $9300,$600,$8100,$2000,$300,0,$8900,$400,$8F00
                    dc.w     $900,$8B00,$400,$500,$8500,$2100,$8F00,$C00,$8500
                    dc.w     $2000,$C000,$3800,$100,$300,0,0,0,$1D00,$900
                    dc.w     $C100,$400,$100,$1C00,$200,$400,$200,$2200,$1D00
                    dc.w     $2200,0,$6600,$1200,$700,$1C00,$F00,$E00,$1B00
                    dc.w     $A00,$F00,$E00,$1B00,$A00,$F00,$E00,$1B00,$3200
                    dc.w     $1C00,$D00,$C100,$400,$500,$1A00,$200,$200,$600
                    dc.w     $2300,$C00,$2200,$7700,$6600,$C000,$800,$100
                    dc.w     $1D00,0,$1200,0,$2400,$900
                    dc.b     0
DSET3:              dc.b     0,$10,0,$24,0,8,0,$4D,0,2,0,1,0,$14,0,11,0,7,0,12
                    dc.b     0,$2F,0,15,0,$7F,0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     'T',0
                    dc.b     'O',0
                    dc.b     'P',0
                    dc.b     'A',0
                    dc.b     'Z',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' '
OBDAT3:             dc.w     1,0,0,0,$7F,1,$7F,1,14,0,$80,0,13,3,1,$7E,1,0,1
                    dc.w     $1E,$7F,2,12,3,0,0,3,$7E,1,$40,0,4,2,4,13,1,$12,1
                    dc.w     $1A,$C0,$7C,1,$42,0,$36,0,5,9,1,$60,11,$16,$18,6
                    dc.w     $28,6,14,$99,$57,$44,$8F,13,1,$78,12,$30,6,4,4,3
                    dc.w     12,0,$77,$44,3,$60,12,$1C,0,4,4,7,13,1,$12,$15,8
                    dc.w     $C1,$5C,1,$1C,4,11,4,8,12,$22,$60,$44,1,$5C,1,$1C
                    dc.w     4,1,4,10,14,$22,$60,$44,12,3,$C0,$5E,2,$1E,0,0,0
                    dc.w     9,9,$C0,$5E,12,$1E,0,0,0,11,9,$C1,$47,1,$2F,2,6,2
                    dc.w     14,14,$33,$70,$55,$8F,13,4,$49,5,$2F,2,2,2,15,$27
                    dc.w     $42,$42,$32,1,1,1,1,$83,15,$83,$10,$83,$13,$83
                    dc.w     $14,$83,$1F,$83,14,$9C,11,$8E,$14,0,$8C,$14,$81
                    dc.w     $20,3,0,2,$4B,6,$30,0,0,0,$13,14,1,$70,$D0,$12,2
                    dc.w     $C9,$47,5,$2D,2,2,2,$10,$1E,$24,$24,$20,1,1,1,1
                    dc.w     $83,$10,$83,$11,$83,$14,$83,$15,$83,$1F,$83,14
                    dc.w     $9C,11,$C2,$48,6,$2D,0,0,0,$14,14,1,$70,$D0,$12
                    dc.w     $10,$C5,$45,5,$2F,2,2,2,$11,$1E,$62,$62,$10,1,1,1
                    dc.w     1,$83,$11,$83,$12,$83,$15,$83,$16,$83,$1F,$83,14
                    dc.w     $9C,11,$C2,$45,6,$30,0,0,0,$15,14,1,$70,$D0,$15,1
                    dc.w     $C8,$47,5,$31,2,2,2,$99,$10,$24,$24,$40,1,1,1,1,1
                    dc.w     $50,1,$50,2,2,2,12,$20,$33,$20,$55,$85,10,$84,8
                    dc.w     $9C,8,$8E,3,1,$8E,$20,0,$92,8,11,$8C,4,$8D,3,0,1
                    dc.w     $54,1,$50,2,2,2,13,$1C,$33,$20,$55,$85,8,$84,10
                    dc.w     $9C,8,$8E,4,1,$92,8,9,$8D,4,$8C,3,1,$2F,1,0,2,6
                    dc.w     $7F,$17,12,$44,$20,0,1,$31,1,$66,$10,2,8,$18,12
                    dc.w     $70,$E0,$55,1,$31,3,$66,8,2,8,$19,12,$70,$E0,$55
                    dc.w     1,$1F,1,$66,$10,2,8,$1B,12,$77,$EE,$55,1,$27,3
                    dc.w     $66,8,2,8,$1A,12,$77,$E0,$55,1,0,1,0,1,10,$7F,$1C
                    dc.w     12,$70,$40,0,3,1,1,$20,0,4,2,$1D,13,$11,$12,7,13
                    dc.w     $C0,3,1,$21,0,$12,0,$1E,9,$C2,$48,6,$33,0,0,0,$16
                    dc.w     14,1,$70,$D0,$12,$20,$C8,$47,5,$31,2,2,2,$12,$1E
                    dc.w     $24,$24,0,1,1,1,1,$83,$12,$83,15,$83,$16,$83,$13
                    dc.w     $83,$1F,$83,14,$9C,11,1,$47,1,$2F,2,6,2,$1F,14
                    dc.w     $55,$70,$33,$8F,13,3,0,0,$7F,$7F,$3F,0,$33,12,0
                    dc.w     12,$15,3,0,0,0,$7F,$3F,0,$34,12,0,12,$15,3,$7F,0
                    dc.w     0,0,$3F,$7F,$35,13,0,$12,1,0,3,0,0,0,0,$3F,$7F
                    dc.w     $36,13,0,$12,7,0,0,$10,$24,14,$42,2,1,$14,$13,$17
                    dc.w     12,$68,$68,$7F
                    dc.w     $20
                    dc.b     0
                    dc.b     ' ',0
                    dc.b     'O',0
                    dc.b     'B',0
                    dc.b     'S',0
                    dc.b     'I',0
                    dc.b     'D',0
                    dc.b     'I',0
                    dc.b     'A',0
                    dc.b     'N',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.w     $100,0,0,0,$7F00,$B00,$4600,$100,$E00,0,$7000
                    dc.w     $6000,$9300,$1800,$100,0,0,$5000,$7F00,$B00,$2F00
                    dc.w     $200,$C00,0,$7000,$600,$100,0,0,$4600,$7F00,$100
                    dc.w     $A00,$300,$C00,0,$E000,0,$600,$1400,$100,$4700
                    dc.w     $800,$A00,$800,$500,$1800,$2A00,$2A00,0,$400,$400
                    dc.w     $400,$400,$8500,$500,$8100,$E800,$300,0,$9C00
                    dc.w     $D00,$600,$3400,$100,$4700,$800,$A00,$800,$700
                    dc.w     $1800,$2A00,$2A00,0,$400,$400,$400,$400,$8500
                    dc.w     $700,$8100,$E800,$300,0,$9C00,$D00,$600,$5400
                    dc.w     $100,$4700,$800,$A00,$800,$900,$1800,$2A00,$2A00
                    dc.w     0,$400,$400,$400,$400,$8500,$900,$8100,$E800,$300
                    dc.w     0,$9C00,$D00,$600,$7400,$100,$4700,$800,$A00,$800
                    dc.w     $B00,$1800,$2A00,$2A00,0,$400,$400,$400,$400
                    dc.w     $8500,$B00,$8100,$E800,$300,0,$9C00,$D00,$100,0
                    dc.w     $B00,0,$7F00,$A00,$100,$C00,$C00,0,$3000,$9000
                    dc.w     $300,$3000,$B00,$100,$200,$400,0,$D00,$D00,$1000
                    dc.w     $1200,$100,$1600,$100,$2900,$B00,$1A00,$200,$600
                    dc.w     $200,$E00,$C00,$AA00,$2000,$4400,$900,$2900,$F00
                    dc.w     $1700,$200,$200,$300,$F00,$1A00,$3500,$3500,0
                    dc.w     $100,$100,$100,$100,$8500,$F00,$8500,$1300,$8100
                    dc.w     $EE00,$200,0,$9C00,$D00,$100,$3700,$B00,$1A00
                    dc.w     $200,$600,$200,$1000,$C00,$AA00,$2000,$4400,$900
                    dc.w     $3700,$F00,$1700,$200,$200,$300,$1100,$1A00,$3500
                    dc.w     $3500,0,$100,$100,$100,$100,$8500,$1100,$8500
                    dc.w     $1200,$8100,$EE00,$200,0,$9C00,$D00,$200,$3800
                    dc.w     $1000,$1700,0,0,0,$1200,$E00,$300,$2100,$4000
                    dc.w     $800,$1000,$200,$2A00,$1000,$1700,0,0,0,$1300
                    dc.w     $E00,$300,$2200,$4000,$800,$1000,$100,$6400,$B00
                    dc.w     $4500,$800,$E00,$100,$1400,$2500,$3300,$5000
                    dc.w     $2200,$300,$1400,$300,$1500,$8300,$1400,$8300
                    dc.w     $1500,$9C00,$700,$1C00,$700,$8E00,$1400,0,$8C00
                    dc.w     $1400,$8100,$DC00,$500,0,$100,$C400,$900,0,$C100
                    dc.w     $6400,$B00,$4500,$800,$100,$E00,$1500,$C00,$3300
                    dc.w     $2700,$5500,$C000,$3100,$B00,$200,0,0,0,$1600
                    dc.w     $900,$100,$2B00,$F00,$1A00,$C00,$200,$200,$1900
                    dc.w     $C00,0,$2700,$4400,$100,0,$B00,$7E00,$7F00,$3400
                    dc.w     $100,$1E00,$C00,0,0,$800,$600,$700,$B00,$6600
                    dc.w     $1400,$600,$C00,$1F00,$1000,$5600,$5400,$5000,0
                    dc.w     $200,$1400,$A00,$300,$1B00,$B00,$6900,0,$400,$200
                    dc.w     $2000,$D00,$1000,$1200,$1400,$700,$300,$700,$B00
                    dc.w     $6900,0,$400,$200,$2100,$D00,$900,$1200,$1400
                    dc.w     $800,$C000,$600,$B00,$6A00,0,0,0,$2300,$900,$C000
                    dc.w     $1D00,$B00,$6A00,0,$1200,0,$2200,$900,$300,0,0,0
                    dc.w     $7F00,$3F00,0,$3400,$D00,0,$1200,$100,0,$300
                    dc.w     $7F00,0,0,0,$3F00,$7F00,$3500,$C00,0,$C00,$1500
                    dc.w     $300,0,0,0,0,$3F00,$7F00,$3600,$C00,0,$C00,$1500
                    dc.w     $300,$7100,$1D00,$7E00,$100,$500,0,$2400,$A00
                    dc.w     $100,$300,$7400,$2100,$7E00,$600,$100,0,$2500
                    dc.w     $A00,$100,$C00,$7400,$1D00,$7E00,$600,$400,0
                    dc.w     $2600,$1600,$1000,$7A00,$2100,$7E00,$7600,$1D00
                    dc.w     $7E00,$7400,$1D00,$7E00,$7800,$2100,$7E00,$C100
                    dc.w     $3000,$1000,$7D00,$400,$500,$100,$2700,$C00,$6600
                    dc.w     $2200,$4400,$C100,$3100,$1100,$7D00,$200,$300,0
                    dc.w     $2800,$C00,0,0,$100,$C100,$3100,$1100,$7C00,$200
                    dc.w     $100,$100,$2900,$1000,$9900,$5500,$300,$8500
                    dc.w     $2900,$8400,$2A00,$C100,$3100,$1300,$7C00,$200
                    dc.w     $100,$100,$2A00,$1000,$9900,$5500,$300,$8500
                    dc.w     $2A00,$8400,$2900,$C300,0,0,$7F00,$7F00,$3F00,0
                    dc.w     $3300,$D00,0,$1200,$1200,0,$100,$1600,$B00,$2000
                    dc.w     $1100,$E00,$1A00,0,$C00,$1A00,$400,$2700,$400
                    dc.w     $2800,$400,$2A00,$F00,$500,$500,$2400,$500,$2500
                    dc.w     $500,$2600,$100,$1700,$F00,$7F00,$100,$100,$1400
                    dc.w     $200,$C00,$400,$1400,$2300,$1800
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     'B',0
                    dc.b     'A',0
                    dc.b     'S',0
                    dc.b     'A',0
                    dc.b     'L',0
                    dc.b     'T',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.w     $100,0,0,0,$7F00,$100,$7F00,$100,$C00,0,$8000,0
                    dc.w     $100,0,$100,$7E00,$7F00,$3E00,$100,$200,$C00,0
                    dc.w     $1000,$900,$100,0,$100,$5800,$600,$800,$2600,$300
                    dc.w     $C00,$A000,$1000,$400,$100,$600,$100,$5800,$3100
                    dc.w     $800,$600,$400,$C00,$7000,$1000,$4400,$100,$7900
                    dc.w     $100,$5800,$600,$800,$2600,$600,$C00,$A00,$1000
                    dc.w     $400,$100,$4800,$100,$5800,$3100,$800,$600,$500
                    dc.w     $C00,$700,$1000,$4400,$100,$800,$100,$2000,$F00
                    dc.w     $400,$F00,$1200,$C00,$7700,$A000,$4400,$100,$800
                    dc.w     $100,$2F00,$500,$200,$500,$1300,$C00,0,0,0,$100,0
                    dc.w     $100,0,$7F00,$A00,$100,$1C00,$C00,0,$1000,$9000
                    dc.w     $300,$3F00,$100,$100,$200,$400,0,$1D00,$D00,$1000
                    dc.w     $1200,$700,$A00,$C000,$4000,$100,$300,0,0,0,$1B00
                    dc.w     $900,$B00,$3A00,$700,$7E00,$300,$600,0,$1A00
                    dc.w     $1300,$1100,$3A00,$A00,$7E00,$3D00,$D00,$7E00
                    dc.w     $3D00,$700,$7E00,$300,$3D00,$900,$7E00,$800,$200
                    dc.w     0,$1900,$A00,$1100,$600,$5800,$100,$6800,$1000
                    dc.w     $800,$1000,$1400,$2000,$5300,$5300,0,$100,$100
                    dc.w     $F00,$F00,$8500,$1800,$8500,$1600,$8500,$1700
                    dc.w     $8500,$1500,$8500,$1400,$8100,$A800,$6100,0,$9C00
                    dc.w     $D00,$600,$5800,$900,$6800,$1000,$800,$1000,$1500
                    dc.w     $1E00,$5300,$5300,$400,$300,$300,$D00,$D00,$8500
                    dc.w     $1800,$8500,$1600,$8500,$1700,$8500,$1500,$8100
                    dc.w     $A800,$6100,0,$9C00,$D00,$600,$5800,$1100,$6800
                    dc.w     $1000,$800,$1000,$1700,$1C00,$5300,$5300,$400
                    dc.w     $500,$500,$B00,$B00,$8500,$1800,$8500,$1600,$8500
                    dc.w     $1700,$8100,$A800,$6100,0,$9C00,$D00,$600,$5800
                    dc.w     $1900,$6800,$1000,$800,$1000,$1600,$1A00,$5300
                    dc.w     $5300,$400,$700,$700,$900,$900,$8500,$1800,$8500
                    dc.w     $1600,$8100,$A800,$6100,0,$9C00,$D00,$600,$5800
                    dc.w     $2100,$6800,$1000,$800,$1000,$1800,$1800,$5300
                    dc.w     $5300,$4400,$800,$800,$800,$800,$8500,$1800,$8100
                    dc.w     $A800,$6100,0,$9C00,$D00,$300,$3700,$100,$5800,0
                    dc.w     $1000,$600,$1F00,$D00,0,$1200,$1F00,$C00,$C000
                    dc.w     $3900,$100,$5B00,0,$1200,0,$2000,$900,$300,0,0,0
                    dc.w     $7F00,$3F00,0,$3400,$D00,0,$1200,$700,0,$300
                    dc.w     $7F00,0,0,0,$3F00,$7F00,$3500,$C00,0,$C00,$1500
                    dc.w     $300,0,0,0,0,$3F00,$7F00,$3600,$C00,0,$C00,$1500
                    dc.w     0,$1000,$1100,$1200,$2B00,$100,$100,$1400,$1300
                    dc.w     $1500,$C00,$4000,$6C00,$600
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     'T',0
                    dc.b     'R',0
                    dc.b     'A',0
                    dc.b     'C',0
                    dc.b     'H',0
                    dc.b     'Y',0
                    dc.b     'T',0
                    dc.b     'E',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.w     $100,0,$A00,0,$7F00,$100,$7F00,$100,$1400,0,$8000
                    dc.w     0,$8500,$F00,$8500,$1100,$300,$F00,$300,$1000
                    dc.w     $100,$7E00,$B00,0,$100,$3300,$7F00,$300,$C00,$200
                    dc.w     0,0,$100,0,$B00,$7E00,$7E00,$3300,$100,$200,$C00
                    dc.w     0,0,$900,$100,0,$B00,0,$100,$3300,$7E00,$400,$C00
                    dc.w     $2000,0,0,$100,$100,$B00,$4600,$6100,$3300,$100
                    dc.w     $600,$1500,0,0,0,$1A00,$1900,$100,$F00,$A00,$1B00
                    dc.w     $500,$1900,0,$100,$6300,$B00,$4600,$1B00,$3300
                    dc.w     $100,$500,$1500,0,0,0,$1A00,$1900,$100,$F00,$1300
                    dc.w     $1B00,$500,$1900,0,$100,$2600,$B00,$6800,$3500
                    dc.w     $800,$800,$B00,$C00,$7700,$E000,$4400,$100,$2600
                    dc.w     $1300,$6800,$800,$2800,$800,$D00,$C00,$7E00,0
                    dc.w     $4400,$100,$2600,$3B00,$6800,$3500,$800,$800,$E00
                    dc.w     $C00,$7700,$EE00,$4400,$100,$5300,$1300,$6800
                    dc.w     $800,$2800,$800,$C00,$C00,$7700,0,$4400,$600
                    dc.w     $3C00,$1300,$6800,$800,$F00,$800,$1200,$1400
                    dc.w     $5300,$5300,$4000,$400,$400,$400,$400,$8400,$1100
                    dc.w     $8300,$1000,$700,$3C00,$2C00,$6800,$800,$F00,$800
                    dc.w     $1000,$1400,$5300,$5300,$4000,$400,$400,$400,$400
                    dc.w     $8300,$F00,$8400,$1200,$C500,$4500,$2300,$6800
                    dc.w     $E00,$800,$800,$1100,$1200,$5300,$5300,0,$400
                    dc.w     $400,$400,$400,$8500,$1300,$C400,$2E00,$2300
                    dc.w     $6800,$D00,$800,$800,$F00,$1400,$5300,$5300,0
                    dc.w     $400,$400,$400,$400,$8400,$1300,$8500,$F00,$C00
                    dc.w     $3B00,$2300,$6C00,$A00,$A00,0,$1300,$1C00,$2200
                    dc.w     $3B00,$2700,$6C00,$4000,$2C00,$6C00,$4500,$2700
                    dc.w     $6C00,$4000,$2200,$6C00,$8500,$1000,$8500,$1200
                    dc.w     $8300,$F00,$C000,$4100,$B00,$300,0,0,0,$1400,$900
                    dc.w     $300,0,0,0,$7F00,$3F00,0,$3400,$D00,$1000,$1200
                    dc.w     $E00,0,$200,$1E00,$9F00,$F00,$9F00,$1000,$9F00
                    dc.w     $1100,$9F00,$1200,$9F00,$1300,$9E00,$B00,$9000
                    dc.w     $B00,$9000,$C00,$9000,$D00,$9000,$E00,$9C00,$700
                    dc.w     $8100,$4000,$4200,$F00,$9000,$F00,$9000,$1000
                    dc.w     $2F00,$B00,$2000,$1200,$F00,$B00,$1200,$E00,$1600
                    dc.w     $1C00,$800,$1A00,$1200,$400,$1400,$1C00,$B00
                    dc.w     $1A00,$1200,$600,$D00,$1C00,$800,$1A00,$1200,$700
                    dc.w     $700,$1C00,$B00,$1A00,$1200,$500,$400,$1C00,$800
                    dc.w     $1A00,$1200,$F00,$1B00,$1C00,$B00,$1A00,$1200
                    dc.w     $A00,$2600,$1C00,$700,$1A00,0,$100,$1700,$1100
                    dc.w     $6300,$100,$100,$1400,$E00,$600,$500,$1400,$6300
                    dc.w     $1800
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     'G',0
                    dc.b     'R',0
                    dc.b     'A',0
                    dc.b     'P',0
                    dc.b     'H',0
                    dc.b     'I',0
                    dc.b     'T',0
                    dc.b     'E',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.w     $100,0,0,0,$7F00,$100,$7F00,$100,$C00,0,$8000,0
                    dc.w     $100,0,$100,$7E00,$7F00,$3E00,$100,$200,$C00,0,0
                    dc.w     $400,$100,0,$100,0,$7F00,$A00,$100,$300,$C00,0,0
                    dc.w     $4000,$300,0,$100,$1700,$6F00,0,$2000,$1400,$E00
                    dc.w     $3000,$200,$FD00,$1C00,$D00,$300,$6F00,$100,$1700
                    dc.w     $700,0,$800,$400,$E00,$3000,$200,$FD00,$1C00,$D00
                    dc.w     $300,$7000,$100,$2000,$700,0,$1700,$500,$E00
                    dc.w     $3000,$200,$FD00,$1C00,$D00,$300,$7700,$100,$1700
                    dc.w     $800,0,$2000,$600,$E00,$3000,$200,$FD00,$1C00
                    dc.w     $D00,$100,$6000,$100,$5F00,$100,$100,$100,$700
                    dc.w     $1A00,$5500,$1000,$3300,$8F00,$D00,$C00,$1D00
                    dc.w     $1C00,$D00,$1000,$700,$E00,$1C00,$100,$800,$1000
                    dc.w     $400,$300,$3300,$300,$7E00,$100,$200,0,$B00,$1D00
                    dc.w     $400,$8E00,$1800,0,$8C00,$1800,$8400,$C00,$8400
                    dc.w     $D00,$8400,$E00,$8F00,$F00,$8F00,$1000,$8100
                    dc.w     $5000,$C300,0,$C100,$4E00,$600,$7D00,$400,$500
                    dc.w     $100,$C00,$C00,$5500,$1000,$300,$C300,$4F00,$700
                    dc.w     $7D00,$200,$300,0,$D00,$A00,$100,$C100,$4F00,$700
                    dc.w     $7C00,$200,$100,$100,$F00,$1000,$7700,$1100,$400
                    dc.w     $8500,$F00,$8400,$E00,$C100,$4F00,$900,$7C00,$200
                    dc.w     $100,$100,$E00,$1000,$7700,$1100,$400,$8500,$E00
                    dc.w     $8400,$F00,$300,$3F00,$100,$100,$200,$400,0,$1000
                    dc.w     $D00,$1000,$1200,$300,$1B00,$C000,$4000,$100,$300
                    dc.w     0,0,0,$1100,$900,$300,0,0,0,$7F00,$3F00,0,$3400
                    dc.w     $D00,0,$1200,$300,0,$300,$7F00,0,0,0,$3F00,$7F00
                    dc.w     $3500,$C00,0,$C00,$1500,$300,0,0,0,0,$3F00,$7F00
                    dc.w     $3600,$C00,0,$C00,$1500,$100,$3100,$100,$5E00
                    dc.w     $200,$300,$100,$800,$C00,$3300,$7000,$5500,$100
                    dc.w     $3300,$100,$5E00,$100,$200,$100,$900,$C00,$300
                    dc.w     $7000,$5500,$100,$3400,$100,$5E00,$200,$300,$100
                    dc.w     $A00,$C00,$3300,$7000,$5500,$600,$3300,$100,$6900
                    dc.w     $100,$300,$300,$1200,$1000,$5300,$5300,0,0,$300
                    dc.w     $100,$300,$100,$C00,$500,$5800,$1400,$100,$1400
                    dc.w     $1300,$1200,$FF00,$2200,$6600,$1000,$1300,$F00
                    dc.w     $D00,$8F00,$D00,0,$100,$1300,$1000,$4900,$100
                    dc.w     $100,$1400,$200,$F00,$C00,$1600
                    dc.w     $6900,$2D00
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     'O',0
                    dc.b     'C',0
                    dc.b     'H',0
                    dc.b     'R',0
                    dc.b     'E',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.w     $100,0,0,0,$7F00,$100,$7F00,$100,$C00,0,$8000,0
                    dc.w     $100,0,$100,$5000,$100,$1400,$100,$200,$C00,$4400
                    dc.w     $1000,$EE00,$100,$7E00,$100,$5000,$100,$1400,$100
                    dc.w     $300,$C00,$4400,$1000,$EE00,$100,$100,$100,$5000
                    dc.w     $7D00,$1400,$100,$400,$1500,0,0,0,$1A00,$F00,$A00
                    dc.w     $1900,$100,$1B00,$500,$1900,0,$C00,$1000,$100
                    dc.w     $6400,$F00,0,$F00,$600,$1600,$1000,$1000,$100
                    dc.w     $7000,$1300,$100,$7300,$1F00,$100,$6700,$1C00
                    dc.w     $100,$6400,$C00,$1000,$100,$6400,$F00,0,$F00,$700
                    dc.w     $1600,$1000,$1300,$100,$6400,$1000,$100,$6700
                    dc.w     $1C00,$100,$7300,$1F00,$100,$7000,$200,$1000,$100
                    dc.w     $3F00,0,0,0,$800,$1400,$100,$3200,$8C00,$A00,$800
                    dc.w     $8500,$800,$8100,$A800,$6100,0,$200,$4100,$100
                    dc.w     $3F00,0,0,0,$900,$1400,$100,$3200,$8C00,$A00,$800
                    dc.w     $8500,$900,$8100,$A800,$6100,0,$200,$7000,$100
                    dc.w     $3F00,0,0,0,$A00,$1400,$100,$3200,$8C00,$A00,$800
                    dc.w     $8500,$A00,$8100,$A800,$6100,0,$100,0,$100,$7E00
                    dc.w     $7F00,$3E00,$100,$B00,$E00,$1100,$1000,$900,$8F00
                    dc.w     $A00,$100,$3E00,$500,$7D00,$400,$500,$100,$D00
                    dc.w     $C00,$7700,$3300,$200,$C00,$3F00,$600,$7D00,$200
                    dc.w     $300,0,$E00,$1600,$1000,$4100,$900,$7D00,$4100
                    dc.w     $600,$7D00,$3F00,$600,$7D00,$3F00,$900,$7D00,$100
                    dc.w     $3F00,$800,$7C00,$200,$100,$100,$F00,$1200,$EE00
                    dc.w     $7700,$400,$8300,$F00,$8300,$1000,$8C00,$B00
                    dc.w     $C100,$3F00,$600,$7C00,$200,$100,$100,$1000,$1200
                    dc.w     $EE00,$7700,$400,$8300,$1000,$8300,$F00,$8D00
                    dc.w     $B00,$C000,$5800,$100,$200,0,0,0,$1100,$900,$300
                    dc.w     $7F00,0,0,0,$3F00,$7F00,$3500,$C00,0,$C00,$1500
                    dc.w     $300,0,0,0,0,$3F00,$7F00,$3600,$C00,0,$C00,$1500
                    dc.w     $300,$5800,$100,0,$200,$400,0,$2000,$D00,$2200
                    dc.w     $1200,$500,$400,$300,0,0,0,$7F00,$3F00,0,$3400
                    dc.w     $D00,0,$1200,$500,0,0,0,$1000,$1500,0,$100,$200
                    dc.w     $1400,$200,$1500,$C00,0,0,0
                    dc.b     ' ',0
                    dc.b     'K',0
                    dc.b     '2',0
                    dc.b     '-',0
                    dc.b     'C',0
                    dc.b     'O',0
                    dc.b     'M',0
                    dc.b     'P',0
                    dc.b     'L',0
                    dc.b     'E',0
                    dc.b     'X',0
                    dc.b     ' ',0
                    dc.w     $100,0,0,0,$3000,$100,$5000,$100,$C00,0,$D000,0
                    dc.w     $100,0,$D00,0,$3000,$100,$5000,$600,$C00,0,$600,0
                    dc.w     $100,0,$100,0,$100,$C00,$5000,$200,$C00,$2000,0,0
                    dc.w     $100,$2F00,$100,0,$100,$C00,$5000,$300,$C00,$200
                    dc.w     0,0,$100,$100,$100,0,$2E00,$C00,$100,$500,$C00,0
                    dc.w     0,$4000,$100,$100,$100,$4F00,$2E00,$C00,$100,$400
                    dc.w     $C00,0,0,$400,$300,$100,$100,$2400,0,$800,$800
                    dc.w     $700,$D00,$1000,$1200,$800,$B00,$C000,$400,$100
                    dc.w     $2800,0,$900,0,$800,$900,$300,$2F00,$100,$3800,0
                    dc.w     $600,$800,$900,$D00,$100,$1200,$1700,$800,$600
                    dc.w     $2600,$100,$3400,$800,$900,$1000,$B00,$1000,$3500
                    dc.w     $3500,$9000,$400,0,$800,$1000,$100,$2B00,$A00
                    dc.w     $3500,$200,$200,$E00,$C00,$1F00,$AA00,$2000,$4400
                    dc.w     $8900,$200,$8400,$F00,$9C00,$500,$9A00,$8500,$F00
                    dc.w     0,0,$8B00,$200,$500,$8400,$F00,$9C00,$600,$9A00
                    dc.w     $600,$200,$100,$C00,$800,$900,$1000,$D00,$1000
                    dc.w     $3400,$2500,$6000,0,0,$400,$1000,$100,$300,$A00
                    dc.w     $D00,$200,$200,$E00,$E00,$E00,$A200,$6000,$4400
                    dc.w     $8F00,$500,$C000,$2D00,$100,$4600,0,$3600,0,$1000
                    dc.w     $900,$C700,$1600,$100,$3A00,$400,$400,$400,$F00
                    dc.w     $1A00,$7E00,$7E00,$700,$200,$200,$200,$200,$8200
                    dc.w     $2F00,$9000,$F00,$9C00,$500,$8100,$9800,$3A00,0
                    dc.w     $100,$2E00,$700,$3800,$100,$100,$800,$1100,$C00,0
                    dc.w     $6600,$EE00,0,0,$E00,$1600,$CD00,0,$200,$1400
                    dc.w     $700,$A00,$1C00,0,0,0
                    dc.b     ' ',0
                    dc.b     'K',0
                    dc.b     '1',0
                    dc.b     '-',0
                    dc.b     'C',0
                    dc.b     'O',0
                    dc.b     'M',0
                    dc.b     'P',0
                    dc.b     'L',0
                    dc.b     'E',0
                    dc.b     'X',0
                    dc.b     ' ',0
                    dc.w     $100,0,0,0,$3000,$100,$5000,$100,$C00,0,$8000,0
                    dc.w     $100,0,$D00,0,$3000,$100,$5000,$600,$C00,0,$200,0
                    dc.w     $100,0,$100,0,$100,$C00,$5000,$200,$C00,$6000,0,0
                    dc.w     $100,$2F00,$100,0,$100,$C00,$5000,$300,$C00,$600
                    dc.w     0,0,$100,$100,$100,0,$2E00,$C00,$100,$500,$C00,0
                    dc.w     0,$4000,$100,$100,$100,$4F00,$2E00,$C00,$100,$400
                    dc.w     $C00,0,0,$400,$300,$100,$100,$1100,0,$800,$800
                    dc.w     $700,$D00,$1000,$1200,$1700,$700,$C000,$300,$100
                    dc.w     $1500,0,$800,0,$800,$900,$100,$800,$100,$4000
                    dc.w     $2000,$400,$800,$B00,$C00,$6600,$B000,$7700,$100
                    dc.w     $2200,$500,$4200,$400,$400,$400,$F00,$E00,$2200
                    dc.w     $B000,$AA00,$8300,$D00,$100,$1A00,$500,$4200,$400
                    dc.w     $400,$400,$E00,$1200,$2200,$B000,$AA00,$8300,$D00
                    dc.w     $8300,$E00,$8300,$F00,$100,$1200,$500,$4200,$400
                    dc.w     $400,$400,$D00,$1000,$2200,$B000,$AA00,$8300,$C00
                    dc.w     $8300,$D00,$100,$A00,$500,$4200,$400,$400,$400
                    dc.w     $C00,$1000,$2200,$B000,$AA00,$8300,$D00,$8300
                    dc.w     $E00,$300,$2F00,$400,$800,0,$500,$3E00,$900,$A00
                    dc.w     $1100,$100,$2600,$9F00,$C00,$9F00,$D00,$9F00,$E00
                    dc.w     $9F00,$F00,$8F00,$900,$8700,$100,$1D00,$8700,$100
                    dc.w     $1E00,$8700,$300,$2200,$8700,$300,$2300,$8700
                    dc.w     $500,$1000,$8700,$500,$1100,$8700,$700,$1A00
                    dc.w     $8700,$700,$1B00,$9900,$1200,$9C00,$800,0,$800
                    dc.w     $1700,$7900,0,$400,$1400,$A00,$1300,$C00,0,0,0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     'L',0
                    dc.b     'I',0
                    dc.b     'N',0
                    dc.b     'K',0
                    dc.b     'E',0
                    dc.b     'R',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.w     $100,0,0,0,$5000,$100,$1000,$100,$C00,0,$8000,0
                    dc.w     $100,0,$F00,0,$5000,$100,$1000,$600,$C00,0,$700,0
                    dc.w     $100,0,$100,0,$5000,$E00,$100,$300,$C00,0,0,$4000
                    dc.w     $100,0,$100,$F00,$5000,$E00,$100,$200,$C00,0,0
                    dc.w     $400,$100,0,$100,$100,$100,$E00,$E00,$400,$F00
                    dc.w     $1100,0,0,$1200,$1500,$1000,$100,$4F00,$100,$100
                    dc.w     $100,$E00,$E00,$500,$F00,$100,0,0,$1200,$1600
                    dc.w     $800,$C000,$4D00,$100,$800,0,$3600,0,$700,$900
                    dc.w     $C000,$300,$100,$800,0,$1200,0,$800,$900,0,$8300
                    dc.w     $1000,$1400,$A00,$100,$400,$1400,$A00,$1300,$500
                    dc.w     0,0,0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     'S',0
                    dc.b     'T',0
                    dc.b     'O',0
                    dc.b     'R',0
                    dc.b     'E',0
                    dc.b     'S',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.w     $100,0,0,0,$5000,$100,$3000,$100,$C00,0,$8000,0
                    dc.w     $100,0,$1700,0,$5000,$100,$3000,$600,$C00,0,$700
                    dc.w     0,$100,0,$100,0,$100,$1600,$3000,$200,$C00,$2000
                    dc.w     0,0,$100,$4F00,$100,0,$100,$1600,$3000,$300,$C00
                    dc.w     $900,0,0,$700,$100,$100,0,$4E00,$1600,$500,$400
                    dc.w     $1000,0,$400,0,0,0,$4E00,$100,$700,$100,$100
                    dc.w     $2B00,$4E00,$1600,$500,$500,$1000,$400,0,0,0,$400
                    dc.w     $4E00,$500,$C000,$4D00,$100,$1600,0,$3600,0,$700
                    dc.w     $900,$C000,$300,$100,$1700,0,$1200,0,$800,$900
                    dc.w     $300,$4F00,$100,$1300,0,$1000,$800,$900,$D00,$100
                    dc.w     $1200,$E00,$2200,$100,$3700,$100,$1300,$800,$1000
                    dc.w     $800,$A00,$C00,$AA00,$7000,$BB00,$400,$3F00,$900
                    dc.w     $1300,$500,$800,$800,$B00,$1400,$1300,$1300,$A000
                    dc.w     $400,$400,$400,$400,$8500,$B00,$8500,$1500,$600
                    dc.w     $2700,$100,$1300,$800,$800,$800,$F00,$1A00,$6900
                    dc.w     $6900,0,$400,$400,$400,$400,$9300,$2000,$8500
                    dc.w     $F00,$8100,$4C00,$1D00,0,$9C00,$D00,$700,$1000
                    dc.w     $100,$1300,$800,$800,$800,$C00,$1A00,$3A00,$3A00
                    dc.w     $700,$400,$400,$400,$400,$8200,$2000,$8500,$C00
                    dc.w     $8100,$4C00,$1D00,0,$9C00,$D00,$100,$C00,$1600
                    dc.w     $1000,$3C00,$100,$100,$1400,$1000,$3300,$300
                    dc.w     $3300,$9900,$3000,$9900,$2000,$100,$C00,$1600
                    dc.w     $1F00,$3C00,$100,$100,$1200,$1000,$3300,$300
                    dc.w     $3300,$9900,$3000,$9900,$2000,$200,$4400,$D00
                    dc.w     $1700,0,0,0,$1500,$E00,$100,$500,$2000,$700,$200
                    dc.w     $100,$100,0,$8300,$D00,$1F00,$BB00,0,$100,$1400
                    dc.w     $1600,$400,$1C00,0,0,0
                    dc.b     'U',0
                    dc.b     'N',0
                    dc.b     'K',0
                    dc.b     'N',0
                    dc.b     'O',0
                    dc.b     'W',0
                    dc.b     'N',0
                    dc.b     ' ',0
                    dc.b     'A',0
                    dc.b     'R',0
                    dc.b     'E',0
                    dc.b     'A',0
                    dc.w     $100,0,0,$5800,$3800,$100,$2700,$100,$C00,0,$8000
                    dc.w     0,$100,0,$100,$5800,$3800,$700,$100,$200,$C00,0,0
                    dc.w     $4000,$100,0,$100,$5900,$100,$700,$2600,$300,$C00
                    dc.w     $2000,0,0,$100,$700,$100,$5F00,$100,$700,$1F00
                    dc.w     $400,$C00,$200,0,0,$100,$700,$100,$5E00,$3100
                    dc.w     $700,$100,$500,$C00,$200,0,$400,$100,$3700,$100
                    dc.w     $5900,$100,$700,$500,$600,$F00,$100,0,0,$1200
                    dc.w     $F00,$2000,$100,$100,$100,$7E00,$600,$700,$100
                    dc.w     $700,$C00,0,0,$E00,$100,$200,$200,$7D00,$400,$500
                    dc.w     $100,$800,$C00,$1100,$1100,$200,$300,$300,$300
                    dc.w     $7D00,$200,$300,0,$900,$A00,$1100,$100,$300,$500
                    dc.w     $7C00,$200,$100,$100,$A00,$1000,$AA00,$7700,$400
                    dc.w     $8500,$A00,$8400,$B00,$C100,$300,$300,$7C00,$200
                    dc.w     $100,$100,$B00,$1000,$AA00,$7700,$400,$8500,$B00
                    dc.w     $8400,$A00,$C000,$3500,$100,$5C00,0,$3600,0,$C00
                    dc.w     $900,$100,0,$800,$5800,$3800,$100,$2700,$D00,$C00
                    dc.w     0,$700,0,0,0,$1600,$1300,$BD00,$100,$400,$400
                    dc.w     $A00,$1300,$C00,0,0,0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     'S',0
                    dc.b     'T',0
                    dc.b     'O',0
                    dc.b     'R',0
                    dc.b     'E',0
                    dc.b     'S',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.w     $100,0,0,0,$3000,$100,$5000,$100,$C00,0,$7000,0
                    dc.w     $100,0,$100,$4F00,$3000,$1700,$100,$300,$C00,0,0
                    dc.w     $200,$100,0,$100,0,$3000,$1700,$100,$200,$C00,0,0
                    dc.w     $2000,$700,$2B00,$100,$100,$500,$1700,$4E00,$500
                    dc.w     $1000,$4000,0,0,$400,0,$500,$4E00,$700,0,$100
                    dc.w     $100,$500,$1700,$4E00,$400,$1000,0,$4000,0,0,0
                    dc.w     $100,$4E00,$100,0,$1800,0,$3000,$100,$5000,$600
                    dc.w     $C00,0,$600,0,$C000,$1900,$100,$4D00,0,$2400,0
                    dc.w     $700,$900,$700,$2000,$100,$3800,$800,$800,$800
                    dc.w     $A00,$1600,$3500,$3500,$700,$400,$400,$400,$400
                    dc.w     $8500,$A00,$8200,$2000,$9C00,$900,$700,$2000,$100
                    dc.w     $2800,$800,$800,$800,$B00,$1600,$3500,$3500,$700
                    dc.w     $400,$400,$400,$400,$8500,$B00,$8200,$2000,$9C00
                    dc.w     $900,$700,$2000,$100,$1800,$800,$800,$800,$C00
                    dc.w     $1600,$3500,$3500,$700,$400,$400,$400,$400,$8500
                    dc.w     $C00,$8200,$2000,$9C00,$900,$100,$2000,$100,$800
                    dc.w     $800,$C00,$800,$D00,$2200,$BB00,$7000,$AA00,$8500
                    dc.w     $D00,$9C00,$500,$8E00,$200,0,$9A00,$8300,$E00
                    dc.w     $8300,$1300,$9A00,$8300,$1300,$8300,$1400,$9A00
                    dc.w     $8F00,$F00,$8F00,$1000,$700,$2000,$D00,$800,$800
                    dc.w     $800,$800,$E00,$1800,$3500,$3500,$5700,$400,$400
                    dc.w     $400,$400,$8500,$E00,$8200,$2000,$8C00,$200,$9C00
                    dc.w     $900,$C700,$2000,$700,$800,$800,$800,$800,$1300
                    dc.w     $1000,$3500,$3500,$5700,$400,$400,$400,$400,$C700
                    dc.w     $2000,$100,$800,$800,$800,$800,$1400,$1E00,$3500
                    dc.w     $3500,$5700,$400,$400,$400,$400,$8500,$1400,$8200
                    dc.w     $4000,$8F00,$900,$9B00,$700,$9C00,$900,$8100
                    dc.w     $C400,$900,0,$600,$800,$D00,$800,$800,$800,$800
                    dc.w     $800,$2000,$1800,$1800,$7000,$400,$400,$400,$400
                    dc.w     $8400,$F00,$8400,$1000,$8400,$1100,$8500,$800
                    dc.w     $9C00,$900,$8100,$C400,$900,0,$9300,$2000,$600
                    dc.w     $800,$100,$1800,$800,$800,$800,$1100,$1600,$1800
                    dc.w     $1800,0,$400,$400,$400,$400,$9300,$2000,$8500
                    dc.w     $1100,$9C00,$900,$600,$800,$100,$2800,$800,$800
                    dc.w     $800,$1000,$1600,$1800,$1800,0,$400,$400,$400
                    dc.w     $400,$9300,$2000,$8500,$1000,$9C00,$900,$600,$800
                    dc.w     $100,$3800,$800,$800,$800,$F00,$1600,$1800,$1800
                    dc.w     0,$400,$400,$400,$400,$9300,$2000,$8500,$F00
                    dc.w     $9C00,$900,$100,$800,$100,$800,$800,$C00,$800
                    dc.w     $1600,$C00,$AA00,$7000,$BB00,$300,$1500,$100
                    dc.w     $4F00,$800,$1000,0,$1700,$D00,$100,$1200,$100
                    dc.w     $1900,$B00,$1500,$900,$100,$800,$600,0,$900,$1300
                    dc.w     $1100,$1500,$900,$100,$1D00,$900,$100,$1900,$F00
                    dc.w     $100,$B00,$1500,$700,$100,$800,$600,0,$1500,$1300
                    dc.w     $1100,$1500,$D00,$100,$1D00,$D00,$100,$1900,$700
                    dc.w     $100,0,$100,$1F00,$400,$E900,$100,$100,$1400,$A00
                    dc.w     $1500,$B00,$5D00,$5400,$1800
                    dc.b     ' ',0
                    dc.b     'M',0
                    dc.b     'A',0
                    dc.b     'L',0
                    dc.b     'A',0
                    dc.b     'C',0
                    dc.b     'H',0
                    dc.b     'I',0
                    dc.b     'T',0
                    dc.b     'E',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.w     $100,0,0,0,$7F00,$100,$7F00,$100,$C00,0,$8000,0
                    dc.w     $300,$7F00,$100,$5800,0,$400,$200,$300,$D00,$400
                    dc.w     $1200,$500,$200,$100,$4500,$B00,$100,$1900,$600
                    dc.w     $2800,$400,$E00,$4400,$6600,$AA00,$8F00,$D00,$100
                    dc.w     $5800,$100,$6400,$E00,$700,$300,$500,$1400,$3300
                    dc.w     $1000,$9900,$8500,$500,$8100,$DC00,$500,0,$9C00
                    dc.w     $D00,$100,$6C00,$100,$5000,$300,$900,$1000,$600
                    dc.w     $1400,$4400,$1000,$5500,$8500,$600,$8100,$DC00
                    dc.w     $500,0,$9C00,$D00,$100,$6000,$100,$5400,$300,$E00
                    dc.w     $800,$700,$1400,$3300,$1000,$9900,$8500,$700
                    dc.w     $8100,$DC00,$500,0,$9C00,$D00,$100,$4800,$100
                    dc.w     $5000,$1000,$700,$300,$800,$1400,$4400,$1000
                    dc.w     $5500,$8100,$DC00,$500,0,$8500,$800,$9C00,$D00
                    dc.w     $100,$5000,$100,$5700,$300,$500,$E00,$900,$1400
                    dc.w     $4400,$1000,$5500,$8500,$900,$8100,$DC00,$500,0
                    dc.w     $9C00,$D00,$100,$3200,$100,$4400,$500,$1F00,$3B00
                    dc.w     $C00,$C00,$2200,$3000,$500,$100,$3200,$100,0,$500
                    dc.w     $1F00,$3C00,$1000,$C00,$2200,$3000,$5000,$100
                    dc.w     $2E00,$100,$3700,$400,$500,$500,$1200,$C00,$A300
                    dc.w     $1100,$5500,$100,$2E00,$100,$4400,$400,$500,$500
                    dc.w     $1300,$C00,$300,$1000,$5500,$100,$2E00,$600,$3700
                    dc.w     $400,$1300,$1200,$1100,$C00,$300,$1500,$5500
                    dc.w     $C000,$200,$100,$4000,0,$1200,0,$1400,$900,$100
                    dc.w     $3200,$600,$3C00,$500,$1A00,$800,$1500,$C00,$2200
                    dc.w     $3300,0,$500,$2B00,$1100,$4100,$300,$600,$600
                    dc.w     $D00,$1400,$4700,$4700,0,$300,$300,$300,$300
                    dc.w     $8500,$1E00,$8F00,$D00,$500,$2B00,$1100,$3900
                    dc.w     $300,$600,$600,$F00,$1400,$4700,$4700,$6000,$300
                    dc.w     $300,$300,$300,$8500,$1F00,$8F00,$D00,$500,$2A00
                    dc.w     $700,$3D00,$400,$800,$600,$E00,$1600,$2600,$5600
                    dc.w     $6000,0,$300,$200,$300,$8F00,$C00,$8400,$1E00
                    dc.w     $8400,$1F00,$700,$2E00,$300,$3C00,$100,$300,$100
                    dc.w     $1800,$1800,$4900,$4900,0,0,$100,0,$100,$8100
                    dc.w     $9800,$3A00,0,$8500,$1800,$9C00,$600,$700,$2E00
                    dc.w     $300,$4300,$200,$300,$100,$1900,$1800,$4900,$4900
                    dc.w     0,$100,0,$100,0,$8100,$9800,$3A00,0,$8500,$1900
                    dc.w     $9C00,$600,$300,0,0,$7F00,$7F00,$3F00,0,$3300
                    dc.w     $C00,0,$C00,$1500,$300,0,0,0,$7F00,$3F00,0,$3400
                    dc.w     $C00,0,$C00,$1500,$300,$7F00,0,0,0,$3F00,$7F00
                    dc.w     $3500,$D00,0,$1200,$500,0,$300,0,0,0,0,$3F00
                    dc.w     $7F00,$3600,$D00,0,$1200,$300,0,$100,0,$100,0
                    dc.w     $100,$A00,$7F00,$1A00,$C00,$3000,$7000,0,$300
                    dc.w     $100,$100,$3F00,0,$400,$200,$1B00,$D00,$1000
                    dc.w     $1200,$300,$1C00,$200,$2B00,$1400,$4400,0,0,0
                    dc.w     $1E00,$E00,$100,$2D00,$4000,$2F00,$100,$200,$2B00
                    dc.w     $1400,$3C00,0,0,0,$1F00,$E00,$100,$2800,$4000
                    dc.w     $2F00,$100,$300,$5600,$B00,$1F00,$200,0,$200
                    dc.w     $1700,$D00,$100,$1200,$1C00,$1300,$C000,$5700
                    dc.w     $900,$2000,0,0,0,$1D00,$900,$C000,$7B00,$100
                    dc.w     $4900,0,0,0,$1C00,$900,0,$1000,$1400,$500,$2D00
                    dc.w     $100,$100,$1400,$A00,$1300,$C00,$4000,$2800,$3000
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     'R',0
                    dc.b     'U',0
                    dc.b     'B',0
                    dc.b     'Y',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.w     $100,0,$100,$5800,$5800,$100,$200,$800,$C00,0
                    dc.w     $2700,$5500,$100,$5800,$100,$2800,$200,$100,$5700
                    dc.w     $900,$C00,$9900,$2700,0,$100,$2800,$100,$2600
                    dc.w     $5700,$100,$200,$A00,$C00,0,$2700,$5500,$100
                    dc.w     $2600,$100,0,$200,$100,$5800,$B00,$C00,$9900
                    dc.w     $2700,0,$C000,$200,$200,$5900,0,$1200,0,$200,$900
                    dc.w     $C000,$5900,$200,$7D00,0,$2400,0,$400,$900,$C000
                    dc.w     $7D00,$200,$2700,0,0,0,$600,$900,$C000,$2700,$200
                    dc.w     $400,0,0,0,$700,$900,$300,0,0,$7F00,$7F00,$3F00,0
                    dc.w     $3300,$D00,0,$1200,$1000,0,$300,0,0,0,$7F00,$3F00
                    dc.w     0,$3400,$D00,0,$1200,$B00,0,$300,$7F00,0,0,0
                    dc.w     $3F00,$7F00,$3500,$D00,0,$1200,$600,0,$300,0,0,0
                    dc.w     0,$3F00,$7F00,$3600,$D00,0,$1200,$400,0,$700
                    dc.w     $3B00,$D00,$3B00,$A00,$500,$A00,$E00,$1B00,$4200
                    dc.w     $4200,0,$500,$500,$500,$500,$8F00,$1100,$8F00
                    dc.w     $1200,$8900,$500,$8B00,$500,$200,$8400,$F00,$C200
                    dc.w     $4000,$D00,$4000,0,0,0,$F00,$E00,$100,$C00,$B800
                    dc.w     $F00,$400,$600,$3B00,$1200,$3B00,$A00,$500,$A00
                    dc.w     $D00,$1900,$2400,$2400,0,$500,$500,$500,$500
                    dc.w     $8900,$600,$8B00,$600,$C00,$8500,$F00,$8F00,$900
                    dc.w     $300,0,0,0,$7F00,0,$7F00,$2800,$A00,$1000,$C100
                    dc.w     $4000,$200,$5800,$200,$400,$200,$1000,$1D00,$3300
                    dc.w     0,$5500,$1200,$100,$1F00,$F00,$900,$1B00,$500
                    dc.w     $F00,$900,$1B00,$C00,$F00,$900,$1B00,$800,$1C00
                    dc.w     $B00,$C100,$4000,$600,$5600,$200,$200,$600,$1100
                    dc.w     $C00,$3300,$2200,$5500,$C000,$4400,$200,$5900,0
                    dc.w     $1200,0,$1200,$900,$100,0,0,0,$7F00,$100,$7F00
                    dc.w     $3700,$E00,0,0,0,$C00,$1500,0,$1000,$1B00,$600
                    dc.w     $BC00,$100,$100,$1400,$B00,$C00,0,$5000,$2700
                    dc.w     $A00
                    dc.b     ' ',0
                    dc.b     'A',0
                    dc.b     'Q',0
                    dc.b     'U',0
                    dc.b     'A',0
                    dc.b     'M',0
                    dc.b     'A',0
                    dc.b     'R',0
                    dc.b     'I',0
                    dc.b     'N',0
                    dc.b     'E',0
                    dc.b     ' ',0
                    dc.w     $100,0,0,0,$7F00,$100,$7F00,$100,$C00,0,$A000,0
                    dc.w     $100,$7E00,$100,0,$100,$A00,$7F00,$600,$C00,$B00
                    dc.w     $4000,0,$C300,$7E00,$100,$3E00,0,$400,$200,$700
                    dc.w     $D00,$100,$1200,$700,$700,$600,$A00,$100,$5A00
                    dc.w     $1E00,$C00,$1800,$400,$1000,$4700,$4700,0,0,$200
                    dc.w     $1E00,$1600,$600,$A00,$D00,$5C00,$1E00,$300,$1400
                    dc.w     $500,$1000,$4E00,$4E00,0,0,$A00,$1E00,$A00,$600
                    dc.w     $A00,$100,$3A00,$1E00,$C00,$1800,$200,$1000,$4700
                    dc.w     $4700,0,0,$200,$1E00,$1600,$600,$A00,$D00,$3C00
                    dc.w     $1E00,$300,$1400,$300,$1000,$4E00,$4E00,0,0,$A00
                    dc.w     $1E00,$A00,$100,$2800,$100,$5E00,$100,$C00,$1000
                    dc.w     $800,$2200,$9000,$3000,$5500,$8500,$800,$8500
                    dc.w     $900,$8400,$A00,$8400,$B00,$8400,$C00,$9C00,$500
                    dc.w     $8E00,$1300,0,$8C00,$1300,$8100,$F800,$2400,$100
                    dc.w     0,$100,$2800,$100,$3E00,$100,$C00,$1000,$E00,$E00
                    dc.w     $9000,$3000,$E500,$8F00,$D00,$A00,$2900,$100
                    dc.w     $4600,0,$C00,0,$F00,$1000,$1100,$2900,$D00,$4600
                    dc.w     $2900,$100,$4600,$A00,$2900,$100,$6600,0,$C00,0
                    dc.w     $900,$2500,$1100,$2900,$100,$6600,$2900,$D00
                    dc.w     $6600,$8500,$800,$8500,$900,$8400,$A00,$8400,$B00
                    dc.w     $8400,$C00,$8E00,$1200,0,$8C00,$1200,$8100,$1000
                    dc.w     $2700,0,$8F00,$900,$C300,$2800,$100,$6200,0,$B00
                    dc.w     $800,$C00,$D00,$1000,$1200,$1B00,$1600,$C100
                    dc.w     $2800,$100,$5A00,$100,$C00,$800,$B00,$1800,$9900
                    dc.w     $3000,$5500,$8400,$800,$8400,$900,$8500,$A00
                    dc.w     $8500,$B00,$8500,$C00,$9C00,$500,$C100,$2800,$100
                    dc.w     $6A00,$100,$C00,$800,$A00,$1800,$9900,$3000,$5500
                    dc.w     $8400,$800,$8400,$900,$8500,$A00,$8500,$B00,$8500
                    dc.w     $C00,$9C00,$500,$C000,$7B00,$100,$3F00,0,$3600,0
                    dc.w     $D00,$900,$C000,$2C00,$100,$6600,0,$1200,0,$1000
                    dc.w     $900,$B00,$4D00,$100,$7000,$600,0,$300,$1100
                    dc.w     $1300,$1100,$5000,$100,$7000,$4D00,$100,$7300
                    dc.w     $5300,$100,$7300,$300,$4F00,$100,$7300,$200,0
                    dc.w     $500,$1200,$A00,$1000,$B00,$6600,$100,$2400,$300
                    dc.w     0,$600,$1300,$1300,$1100,$6600,$100,$2700,$6900
                    dc.w     $100,$2A00,$6900,$100,$2400,$300,$6900,$100,$2600
                    dc.w     $500,0,$200,$1400,$A00,$1000,$300,0,0,$7F00,$7F00
                    dc.w     $3F00,0,$3300,$C00,0,$C00,$1500,$300,0,0,0,$7F00
                    dc.w     $3F00,0,$3400,$C00,0,$C00,$1500,$300,$7F00,0,0,0
                    dc.w     $3F00,$7F00,$3500,$D00,0,$1200,$700,0,$300,0,0,0
                    dc.w     0,$3F00,$7F00,$3600,$D00,0,$1200,$500,0,$C000
                    dc.w     $200,$100,$2700,0,$1200,0,$1800,$900,$C000,$2B00
                    dc.w     $100,$6600,0,$1200,0,$1E00,$900,$100,0,$100,0
                    dc.w     $100,$100,$7F00,$1500,$C00,$5000,$3000,0,0,$1000
                    dc.w     $2000,$700,$D200,$100,$100,$1400,$B00,$1200,$C00
                    dc.w     $6F00,$4400,$2000
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     'B',0
                    dc.b     'E',0
                    dc.b     'R',0
                    dc.b     'Y',0
                    dc.b     'L',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.w     $100,0,0,0,$7F00,$100,$7F00,$100,$C00,0,$5000,0
                    dc.w     $100,0,$100,0,$100,$A00,$7F00,$500,$C00,$A000
                    dc.w     $A000,0,$100,$7E00,$100,0,$100,$A00,$7F00,$B00
                    dc.w     $C00,$A00,$A000,0,$100,$100,$100,0,$7D00,$A00
                    dc.w     $100,$200,$C00,0,$A000,$4000,$100,$100,$100,$7E00
                    dc.w     $7D00,$A00,$100,$800,$C00,0,$A000,$600,$C300
                    dc.w     $3F00,$100,$7E00,$200,$400,0,$900,$D00,$100,$1200
                    dc.w     $F00,$1B00,$C000,$4000,$100,$7C00,0,$2400,0,$A00
                    dc.w     $900,$300,$7E00,$100,$2000,0,$400,$200,$C00,$D00
                    dc.w     $100,$1200,$800,$1E00,$C000,$7C00,$100,$2100,0
                    dc.w     $3600,0,$D00,$900,$300,$3F00,$100,$100,$200,$400
                    dc.w     0,$300,$D00,$1000,$1200,$C00,$1E00,$C000,$4000
                    dc.w     $100,$300,0,0,0,$400,$900,$C300,$100,$100,$3F00,0
                    dc.w     $400,$200,$600,$D00,$1100,$1200,$600,$D00,$C000
                    dc.w     $300,$100,$4000,0,$1200,0,$700,$900,$100,$4800
                    dc.w     $100,$4000,$1800,$1000,$1800,$1300,$E00,$7700,0
                    dc.w     $EE00,$8F00,$D00,$600,$4800,$1100,$4000,$1800
                    dc.w     $800,$1800,$1500,$1000,$4400,$4400,0,$800,$800
                    dc.w     $1000,$1000,$100,$3800,$1900,$4800,$2000,$400
                    dc.w     $800,$1400,$C00,$7700,$A700,$EE00,$700,$3800,$D00
                    dc.w     $4800,$800,$C00,$800,$1600,$1000,$4200,$4200
                    dc.w     $5000,$400,$400,$400,$400,$200,$3C00,$D00,$4C00,0
                    dc.w     0,0,$1700,$E00,$100,$400,$E800,$900,$400,$300
                    dc.w     $4800,$100,$4B00,0,$400,$200,$1800,$D00,$100
                    dc.w     $1200,$1900,$800,$C000,$4600,$100,$4C00,0,$3600,0
                    dc.w     $1900,$900,$100,$6F00,$100,$4400,$100,$900,$200
                    dc.w     $1100,$C00,$7700,0,$4400,$100,$6F00,$A00,$4200
                    dc.w     $100,$100,$600,$1200,$C00,$7700,$AE00,$4400,$A00
                    dc.w     $6000,$B00,$4300,$1E00,0,0,$1000,$1900,$4400
                    dc.w     $7E00,$B00,$4300,$6000,$B00,$4300,$8500,$1000
                    dc.w     $9C00,$500,$8100,$8800,$1300,0,0,$A00,$6000,$B00
                    dc.w     $4500,$1E00,0,0,$F00,$1800,$3300,$6000,$B00,$4500
                    dc.w     $7E00,$B00,$4500,$8500,$F00,$9C00,$500,$8100
                    dc.w     $8800,$1300,0,$A00,$6000,$B00,$4700,$1E00,0,0
                    dc.w     $E00,$1800,$4400,$7E00,$B00,$4700,$6000,$B00
                    dc.w     $4700,$8500,$E00,$9C00,$500,$8100,$8800,$1300,0
                    dc.w     $300,0,0,$7F00,$7F00,$3F00,0,$3300,$D00,0,$1200
                    dc.w     $F00,0,$300,0,0,0,$7F00,$3F00,0,$3400,$D00,0
                    dc.w     $1200,$C00,0,$300,$7F00,0,0,0,$3F00,$7F00,$3500
                    dc.w     $D00,0,$1200,$800,0,$300,0,0,0,0,$3F00,$7F00
                    dc.w     $3600,$D00,0,$1200,$600,0,$C100,$400,$100,$1C00
                    dc.w     $200,$400,$200,$1A00,$1D00,$2200,0,$6600,$1200
                    dc.w     $300,$2400,$F00,$E00,$1B00,$A00,$F00,$E00,$1B00
                    dc.w     $A00,$F00,$E00,$1B00,$3200,$1C00,$D00,$C100,$400
                    dc.w     $500,$1A00,$200,$200,$600,$1B00,$C00,$2200,$7700
                    dc.w     $6600,$C000,$800,$100,$1D00,0,$1200,0,$1C00,$900
                    dc.w     $100,$800,$9F00,$E00,$9F00,$F00,$9F00,$1000,$9000
                    dc.w     $1700,$1000,$1F00,$900,$D00,$200,$100,$1400,$B00
                    dc.w     $1800,$C00,$800,$2000,$200
                    dc.b     ' ',0
                    dc.b     'N',0
                    dc.b     'I',0
                    dc.b     'C',0
                    dc.b     'C',0
                    dc.b     'O',0
                    dc.b     'L',0
                    dc.b     'I',0
                    dc.b     'T',0
                    dc.b     'E',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.w     $100,0,0,0,$7F00,$100,$7F00,$100,$C00,0,$3000,0
                    dc.w     $100,0,$100,0,$7F00,$3E00,$100,$200,$C00,0,0
                    dc.w     $6000,$100,0,$100,$3800,$2800,$C00,$1800,$1000
                    dc.w     $C00,$9000,$6000,$4400,$100,$5800,$100,$3800
                    dc.w     $2700,$C00,$1800,$1100,$C00,$900,$7000,$4400,$600
                    dc.w     $2E00,$100,$4E00,$200,$100,$200,$1800,$1600,$1500
                    dc.w     $1500,$4000,$100,$100,$100,$100,$1300,$8100,$F00
                    dc.w     $700,$1900,$300,$600,$3C00,$100,$3F00,$200,$100
                    dc.w     $200,$1D00,$1600,$1500,$1500,0,$100,$100,$100
                    dc.w     $100,$1300,$8100,$F00,$700,$1900,$300,$600,$4800
                    dc.w     $100,$4300,$200,$100,$200,$1C00,$1600,$1500,$1500
                    dc.w     $7000,$100,$100,$100,$100,$1300,$8100,$F00,$700
                    dc.w     $1900,$300,$600,$5400,$100,$4900,$200,$100,$200
                    dc.w     $1A00,$1600,$1500,$1500,0,$100,$100,$100,$100
                    dc.w     $1300,$8100,$F00,$700,$1900,$300,$600,$3100,$100
                    dc.w     $3900,$200,$100,$200,$1F00,$1600,$1500,$1500
                    dc.w     $7000,$100,$100,$100,$100,$1300,$8100,$F00,$700
                    dc.w     $1900,$300,$200,$2B00,$100,$4200,0,0,0,$1E00,$E00
                    dc.w     $100,$F00,0,$200,$800,$200,$4100,$100,$4D00,0,0,0
                    dc.w     $1900,$E00,$100,$A00,$8000,$400,$800,$200,$5300
                    dc.w     $100,$4000,0,0,0,$2100,$E00,$100,$F00,$C000,$300
                    dc.w     $800,$100,$5400,$100,$5700,$200,$1200,$100,$1200
                    dc.w     $C00,$AA00,$2000,$7700,$100,$5000,$700,$5800,$A00
                    dc.w     $C00,$100,$1300,$C00,$4400,$4400,$2600,$E00,$5100
                    dc.w     $E00,$5900,$800,$400,0,$1400,$1C00,$1100,$5100
                    dc.w     $1000,$5900,$5300,$1200,$5900,$5700,$1200,$5900
                    dc.w     $5900,$1000,$5900,$5700,$E00,$5900,$5300,$E00
                    dc.w     $5900,$D00,$5400,$B00,$5900,$200,$400,0,$1500
                    dc.w     $1900,$1100,$5400,$F00,$5900,$5600,$F00,$5900
                    dc.w     $5600,$C00,$5900,$5500,$B00,$5900,$5400,$C00
                    dc.w     $5900,$C00,$5100,$800,$5900,$800,$300,0,$1600
                    dc.w     $1600,$1100,$5100,$800,$5900,$5900,$A00,$5900
                    dc.w     $5900,$B00,$5900,$5100,$900,$5900,$C00,$5100,$800
                    dc.w     $5900,$800,$300,0,$1700,$1600,$1100,$5100,$A00
                    dc.w     $5900,$5100,$B00,$5900,$5900,$900,$5900,$5900
                    dc.w     $800,$5900,$100,$3A00,$B00,$100,$C00,$500,$100
                    dc.w     $400,$C00,$4400,$4400,$2000,$300,$4300,$C00,$200
                    dc.w     $200,$300,0,$900,$A00,$7000,$C100,$4300,$C00,$200
                    dc.w     $200,$100,$100,$B00,$1D00,$AA00,$5500,$4000,$8300
                    dc.w     $B00,$8300,$A00,$8300,$F00,$8600,$A00,$1B00,$8600
                    dc.w     $B00,$2200,$8600,$C00,$1900,$9C00,$C00,$100,$4300
                    dc.w     $E00,$200,$200,$100,$100,$A00,$1D00,$AA00,$5500
                    dc.w     $4000,$8300,$A00,$8300,$B00,$8300,$F00,$8600,$A00
                    dc.w     $1B00,$8600,$B00,$2200,$8600,$C00,$1900,$9C00
                    dc.w     $B00,$C300,$3B00,$E00,$200,$100,$100,0,$C00,$A00
                    dc.w     $1100,$C300,$3D00,$E00,$200,$100,$100,0,$D00,$A00
                    dc.w     $1000,$C300,$3F00,$E00,$200,$100,$100,0,$E00,$A00
                    dc.w     $1000,$C300,$4100,$E00,$200,$100,$100,0,$F00,$A00
                    dc.w     $1000,$C000,$4000,$100,$7D00,0,$2400,0,$6300,$900
                    dc.w     $300,0,0,$7F00,$7F00,$3F00,0,$3300,$D00,0,$1200
                    dc.w     $100,0,$300,0,0,0,$7F00,$3F00,0,$3400,$D00,0
                    dc.w     $1200,$D00,0,$300,$7F00,0,0,0,$3F00,$7F00,$3500
                    dc.w     $C00,0,$C00,$1500,$300,0,0,0,0,$3F00,$7F00,$3600
                    dc.w     $C00,0,$C00,$1500,0,$1000,$2000,$A00,$D500,$100
                    dc.w     $100,$1400,$300,$1F00,$C00,$4000,$4000,$1400
                    dc.b     ' ',0
                    dc.b     'A',0
                    dc.b     'L',0
                    dc.b     'A',0
                    dc.b     'B',0
                    dc.b     'A',0
                    dc.b     'S',0
                    dc.b     'T',0
                    dc.b     'E',0
                    dc.b     'R',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.w     $100,$2000,0,$2000,$4000,$100,$4000,$900,$C00,0
                    dc.w     $6000,0,$100,0,$100,0,$7F00,$500,$2000,$400,$C00
                    dc.w     0,$2000,0,$100,0,$100,$6000,$7F00,$500,$1F00,$200
                    dc.w     $C00,0,$2000,0,$100,0,$100,$1E00,$2000,$500,$4400
                    dc.w     $100,$C00,0,$2000,0,$100,$6000,$100,$1E00,$1F00
                    dc.w     $500,$4400,$300,$C00,0,$2000,0,$100,$2000,$100
                    dc.w     $5C00,$4000,$600,$400,$600,$E00,$7700,$A000,$7700
                    dc.w     $D00,$100,$100,$2000,$100,$2000,$4000,$600,$400
                    dc.w     $800,$E00,$7700,$A000,$7700,$D00,$100,$100,$2000
                    dc.w     $100,$2400,$400,$600,$3800,$500,$E00,$7700,$A000
                    dc.w     0,$D00,$100,$100,$5C00,$100,$2400,$400,$600,$3800
                    dc.w     $700,$E00,$7700,$A000,0,$D00,$100,$C100,$4E00
                    dc.w     $100,$2400,$400,$200,$800,$A00,$C00,$4400,$3000
                    dc.w     $5000,$C100,$4E00,$300,$2400,$400,$200,$400,$B00
                    dc.w     $C00,$4400,$3000,$5000,$100,$1400,$600,$4200,$800
                    dc.w     $200,$400,$C00,$C00,$9900,$1000,$5500,$100,$1800
                    dc.w     $800,$4200,$400,$100,$400,$D00,$C00,$9900,0,$5500
                    dc.w     $100,$1800,$900,$4200,$C00,$100,$400,$E00,$E00
                    dc.w     $9900,$1700,$5500,$D00,$100,$100,0,$600,$7E00
                    dc.w     $7F00,$A00,$100,$F00,$C00,0,$4000,$300,$300,$3F00
                    dc.w     $600,$7E00,$200,$400,0,$1000,$D00,$100,$1200,$300
                    dc.w     $1D00,$100,0,$600,0,$7F00,$3900,$100,$1100,$C00,0
                    dc.w     0,$8000,$300,$2400,$600,$2400,$3800,0,$3800,$2700
                    dc.w     $2F00,$3000,$8E00,$100,0,$8900,$100,$8100,$DC00
                    dc.w     $500,0,$8F00,$700,$8B00,$100,$500,$8500,$2700
                    dc.w     $8400,$1800,$9A00,$8500,$1800,$8400,$1900,$8400
                    dc.w     $B00,$9A00,$8500,$1900,$8400,$A00,$200,$FE00,$E00
                    dc.w     $2000,0,$C00,$100,$C300,$2400,$500,$2400,$3800,0
                    dc.w     $3800,$1800,$A00,$3000,$C300,$2400,$300,$2400
                    dc.w     $3800,0,$3800,$1900,$A00,$3000,$100,$4F00,$C00
                    dc.w     $100,$C00,$500,$100,$1A00,$C00,$9900,$3300,$2000
                    dc.w     $C300,$5900,$F00,$200,$100,$100,0,$1B00,$A00
                    dc.w     $5000,$C300,$5700,$F00,$200,$100,$100,0,$1C00
                    dc.w     $A00,$5000,$C300,$5500,$F00,$200,$100,$100,0
                    dc.w     $1D00,$A00,$5000,$C300,$5300,$F00,$200,$100,$100
                    dc.w     0,$1E00,$A00,$5000,$300,$5000,$D00,$200,$200,$300
                    dc.w     0,$2500,$A00,$3000,$100,$5000,$F00,$200,$200,$100
                    dc.w     $100,$2300,$1B00,$4400,$4400,$7000,$8500,$2300
                    dc.w     $8400,$2400,$8400,$1C00,$8600,$900,$E00,$8600
                    dc.w     $B00,$2300,$8600,$C00,$1A00,$C100,$5000,$D00,$200
                    dc.w     $200,$100,$100,$2400,$1B00,$4400,$4400,$7000
                    dc.w     $8500,$2400,$8400,$2300,$8500,$1C00,$8600,$900
                    dc.w     $E00,$8600,$B00,$2300,$8600,$C00,$1A00,$C000
                    dc.w     $4000,$600,$7B00,0,$2400,0,$2600,$900,$300,0,0
                    dc.w     $7F00,$7F00,$3F00,0,$3300,$D00,0,$1200,$300,0
                    dc.w     $300,$7F00,0,0,0,$3F00,$7F00,$3500,$C00,0,$C00
                    dc.w     $1500,$300,0,0,0,0,$3F00,$7F00,$3600,$C00,0,$C00
                    dc.w     $1500,0,$100,$1900,$B00,$6300,$100,$100,$1400
                    dc.w     $A00,$1300,$C00,$7900,$7900,$600
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     'O',0
                    dc.b     'P',0
                    dc.b     'A',0
                    dc.b     'L',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.w     $100,0,0,0,$7F00,$100,$7F00,$100,$E00,0,$8000,0
                    dc.w     $9300,$3F00,$100,0,$100,0,$7F00,$3E00,$100,$200
                    dc.w     $C00,0,0,$4000,$C000,$2600,$100,$7D00,0,$2400,0
                    dc.w     $F00,$900,$100,$A00,$100,$7700,$1100,$800,$100
                    dc.w     $1000,$C00,$7700,$1000,$4400,$100,$3900,$400,$100
                    dc.w     $C00,$500,$100,$1E00,$C00,$6600,$1800,$2200,$300
                    dc.w     $4200,$500,$200,$200,$300,0,$2000,$A00,$1100
                    dc.w     $C100,$4200,$500,$200,$200,$100,$100,$2100,$1B00
                    dc.w     $7700,$EE00,$4000,$8500,$2100,$8500,$2400,$8400
                    dc.w     $1F00,$8600,$900,$D00,$8600,$A00,$1D00,$8600,$C00
                    dc.w     $1B00,$100,$4200,$700,$200,$200,$100,$100,$1F00
                    dc.w     $1B00,$7700,$EE00,$4000,$8500,$1F00,$8400,$2100
                    dc.w     $8400,$2400,$8600,$900,$D00,$8600,$A00,$1D00
                    dc.w     $8600,$C00,$1B00,$C300,$4000,$700,$200,$100,$100
                    dc.w     0,$2200,$A00,$4400,$C300,$3E00,$700,$200,$100
                    dc.w     $100,0,$2300,$A00,$4400,$C300,$3C00,$700,$200
                    dc.w     $100,$100,0,$2400,$A00,$4400,$C300,$3A00,$700
                    dc.w     $200,$100,$100,0,$2500,$A00,$4400,$300,$B00,$700
                    dc.w     $7700,$300,$100,0,$1700,$A00,$200,$300,$F00,$700
                    dc.w     $7700,$300,$100,0,$1600,$A00,$200,$300,$1300,$400
                    dc.w     $7700,$100,$400,0,$1800,$A00,$200,$300,$1400,$400
                    dc.w     $7700,$300,$100,0,$1900,$A00,$200,$300,$1500,$200
                    dc.w     $7700,$100,$400,0,$1300,$A00,$200,$300,$1800,$200
                    dc.w     $7700,$100,$600,0,$1B00,$A00,$200,$300,$7F00,0,0
                    dc.w     0,$3F00,$7F00,$3500,$C00,0,$C00,$1500,$300,0,0,0
                    dc.w     0,$3F00,$7F00,$3600,$C00,0,$C00,$1500,$C00,$B00
                    dc.w     $200,$7700,$300,$500,0,$E00,$1600,$2200,$E00,$700
                    dc.w     $7700,$C00,$200,$7700,$B00,$200,$7700,$D00,$700
                    dc.w     $7700,$C00,$F00,$200,$7700,$300,$500,0,$1200
                    dc.w     $1600,$2200,$1200,$700,$7700,$1000,$200,$7700
                    dc.w     $F00,$200,$7700,$1100,$700,$7700,$300,$2600,$100
                    dc.w     $7F00,$200,$400,0,$A00,$D00,$3300,$1200,$500,$700
                    dc.w     $300,0,0,0,$7F00,$3F00,0,$3400,$D00,$1000,$1200
                    dc.w     $D00,0,$300,0,0,$7F00,$7F00,$3F00,0,$3300,$D00,0
                    dc.w     $1200,$500,0,0,$400,$1C00,$C00,$9A00,$100,$100
                    dc.w     $1400,$A00,$1F00,$C00,$2500,$1C00,$2000
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     'Q',0
                    dc.b     'U',0
                    dc.b     'A',0
                    dc.b     'R',0
                    dc.b     'T',0
                    dc.b     'Z',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.w     $100,0,0,0,$7F00,$100,$7F00,$100,$C00,0,$8000,0
                    dc.w     $100,0,$100,$7E00,$7F00,$A00,$100,$200,$C00,0
                    dc.w     $2000,$400,$100,0,$100,$100,$7F00,$3E00,$100,$300
                    dc.w     $C00,0,0,$3000,$100,0,$100,$4000,$5700,$1000,$800
                    dc.w     $400,$C00,$7000,$1000,$4400,$100,$6000,$100,$4000
                    dc.w     $1F00,$1000,$800,$500,$C00,$700,$1000,$4400,$100
                    dc.w     0,$1100,$4000,$7F00,$300,$800,$600,$C00,0,$6E00
                    dc.w     $4400,$100,$5800,$900,$4000,$700,$300,$800,$700
                    dc.w     $C00,$7700,$6200,$4400,$100,$5B00,$100,$4300,$200
                    dc.w     $400,$200,$900,$C00,$7700,$1000,$4400,$800,$5B00
                    dc.w     $300,$4500,$200,$200,$100,$A00,$1000,$9300,$9300
                    dc.w     0,$100,$100,$100,$100,$C100,$5800,$100,$4000,$700
                    dc.w     $300,$800,$B00,$C00,$7700,$6000,$4400,$CD00,$5800
                    dc.w     $100,$4800,$800,0,$100,$C00,$1900,$1000,$5900
                    dc.w     $100,$4800,$5800,$100,$4C00,$5C00,$100,$4D00
                    dc.w     $6000,$100,$4B00,$5F00,$100,$4800,$100,$3900,$600
                    dc.w     $200,$C00,$500,$100,$1500,$C00,$9900,$1100,$4000
                    dc.w     $300,$4200,$700,$300,$200,$300,0,$1600,$A00,$1000
                    dc.w     $100,$4200,$900,$300,$200,$100,$100,$1700,$1B00
                    dc.w     $5500,$1100,$3000,$8500,$1700,$8400,$1800,$8400
                    dc.w     $1C00,$8600,$900,$C00,$8600,$A00,$1E00,$8600,$B00
                    dc.w     $2500,$C100,$4200,$700,$300,$200,$100,$100,$1800
                    dc.w     $1200,$5500,$1100,$3000,$8500,$1800,$8400,$1700
                    dc.w     $8500,$1C00,$C300,$4000,$900,$300,$100,$100,0
                    dc.w     $1900,$A00,$2000,$C300,$3E00,$900,$300,$100,$100
                    dc.w     0,$1A00,$A00,$2000,$C300,$3C00,$900,$300,$100
                    dc.w     $100,0,$1B00,$A00,$2000,$C300,$3A00,$900,$300
                    dc.w     $100,$100,0,$1C00,$A00,$2000,$300,$3700,$100
                    dc.w     $7E00,$200,$400,0,$1D00,$D00,$100,$1200,$700,$400
                    dc.w     $C000,$3800,$100,$7C00,0,$2400,0,$1E00,$900,$200
                    dc.w     $5C00,$400,$4600,0,0,0,$2000,$E00,$300,$3200
                    dc.w     $DC00,$1F00,$2000,$300,0,0,$7F00,$7F00,$3F00,0
                    dc.w     $3300,$D00,0,$1200,$700,0,$300,$7F00,0,0,0,$3F00
                    dc.w     $7F00,$3500,$C00,0,$C00,$1500,$300,0,0,0,0,$3F00
                    dc.w     $7F00,$3600,$C00,0,$C00,$1500,$300,$5B00,$C00
                    dc.w     $4400,0,$500,0,$800,$2400,$2200,$8300,$800,$9C00
                    dc.w     $A00,$9A00,$8300,$700,$8500,$900,$8500,$A00,$8400
                    dc.w     $B00,$8500,$2000,$9C00,$700,$9A00,$8400,$C00
                    dc.w     $9C00,$500,$8100,$B800,$B00,0,$300,$2400,$100
                    dc.w     $1200,$200,0,$1400,$1100,$A00,$1000,$300,$1B00
                    dc.w     $100,$1B00,$1400,0,$200,$1200,$A00,$1000,0,$1000
                    dc.w     $1400,$D00,$7300,$100,$100,$1400,$700,$C00,$1C00
                    dc.w     $4000,$3000,$2000
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     'D',0
                    dc.b     'I',0
                    dc.b     'A',0
                    dc.b     'M',0
                    dc.b     'O',0
                    dc.b     'N',0
                    dc.b     'D',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.w     $100,0,0,0,$7F00,$100,$7F00,$100,$C00,0,$5000,0
                    dc.w     $100,$3000,$100,$2000,$2000,$F00,$2000,$200,$C00
                    dc.w     $3300,0,$9900,$700,$2700,$1000,$1700,$3200,$A00
                    dc.w     $3200,$300,$1000,$9500,$9500,$800,$900,$900,$2900
                    dc.w     $2900,$600,$2700,$1B00,$1700,$3200,$900,$3200
                    dc.w     $400,$1000,$3900,$3900,$7700,$900,$900,$2900
                    dc.w     $2900,$100,$3D00,$100,$4000,$100,$500,$1800,$700
                    dc.w     $C00,$7300,$4000,$9900,$100,$4200,$100,$4000,$100
                    dc.w     $500,$1800,$900,$C00,$3700,$4000,$9900,$100,$3E00
                    dc.w     $500,$4000,$400,$100,$1800,$800,$C00,0,$4500
                    dc.w     $9900,$C000,$7200,$100,$700,0,$3D00,0,$F00,$900
                    dc.w     $C00,$3F00,$100,$4200,$200,$300,0,$E00,$3200
                    dc.w     $2200,$4000,$100,$4000,$3F00,$300,$4000,$4000
                    dc.w     $400,$4000,$4100,$300,$4000,$8F00,$B00,$9B00,$300
                    dc.w     $8900,$900,$8B00,$900,$1900,$8C00,$1600,$E00
                    dc.w     $1600,$100,$1000,$200,$1000,$300,$1000,$E00,$100
                    dc.w     $2000,$A100,$700,$1000,$1400,$F00,$900,$800,$3700
                    dc.w     $100,$5800,$400,$800,$200,$1000,$1600,$2600,$2600
                    dc.w     $600,$200,$600,$200,$600,$8500,$1000,$9C00,$500
                    dc.w     $8500,$1200,$800,$4500,$100,$5800,$400,$800,$200
                    dc.w     $1100,$1600,$2600,$2600,$600,$200,$600,$200,$600
                    dc.w     $8500,$1100,$9C00,$500,$8500,$1300,$200,$4700
                    dc.w     $700,$5A00,0,0,0,$1300,$E00,$100,$FF00,$E800
                    dc.w     $1300,$2000,$200,$3900,$700,$5A00,0,0,0,$1200
                    dc.w     $E00,$100,$FF00,$E800,$1300,$2000,$300,$3100,$B00
                    dc.w     $4000,$1D00,$300,0,$1400,$A00,$8800,$700,$6F00
                    dc.w     $100,$A00,$800,$800,$800,$A00,$2000,$3500,$3500,0
                    dc.w     $400,$400,$400,$400,$900,$B00,$100,$E800,$300,0
                    dc.w     $200,$100,$F00,$900,$B00,$B00,$C800,$1000,$A00,0
                    dc.w     $600,$800,$100,$A00,$800,$800,$800,$B00,$2000
                    dc.w     $3500,$3500,0,$400,$400,$400,$400,$900,$A00,$100
                    dc.w     $E800,$300,0,$1300,$100,$F00,$900,$B00,$A00,$C800
                    dc.w     $1000,$B00,0,$100,0,$100,0,$7F00,$3E00,$100,$1E00
                    dc.w     $C00,0,0,$2000,$100,$7E00,$100,0,$100,$3E00,$7E00
                    dc.w     $1F00,$C00,$A00,0,0,$100,0,$100,0,$100,$3E00
                    dc.w     $7E00,$2000,$C00,$A000,0,0,$300,0,0,$7F00,$7F00
                    dc.w     $6300,0,$3300,$D00,0,$1200,$B00,0,0,$8300,$1100
                    dc.w     $1C00,$2F00,$100,$100,$1400,$A00,$1300,$C00,0,0,0
                    dc.b     ' ',0
                    dc.b     'K',0
                    dc.b     '4',0
                    dc.b     '-',0
                    dc.b     'C',0
                    dc.b     'O',0
                    dc.b     'M',0
                    dc.b     'P',0
                    dc.b     'L',0
                    dc.b     'E',0
                    dc.b     'X',0
                    dc.b     ' ',0
                    dc.w     $100,0,0,0,$3000,$100,$5000,$100,$C00,0,$8000,0
                    dc.w     $100,0,$D00,0,$3000,$100,$5000,$600,$C00,0,$600,0
                    dc.w     $100,0,$100,0,$100,$C00,$5000,$200,$C00,$2000,0,0
                    dc.w     $100,$2F00,$100,0,$100,$C00,$5000,$300,$C00,$200
                    dc.w     0,0,$100,$100,$100,0,$2E00,$C00,$100,$500,$C00,0
                    dc.w     0,$4000,$100,$100,$100,$4F00,$2E00,$C00,$100,$400
                    dc.w     $C00,0,0,$400,$100,$800,$100,$800,$2000,$200
                    dc.w     $2000,$700,$1800,$AA00,$7700,$BB00,$8C00,$1C00
                    dc.w     $9C00,$D00,$9000,$700,$8E00,$1D00,$100,$8800
                    dc.w     $1000,$400,$300,$2500,$100,$4000,$200,0,$200,$A00
                    dc.w     $D00,$1000,$1200,$400,$1D00,$400,$100,$300,$4700
                    dc.w     $400,$400,$400,$B00,$1A00,$5300,$5300,$1000,$200
                    dc.w     $200,$200,$200,$8F00,$D00,$8500,$1200,$8500,$B00
                    dc.w     $8100,$9800,$3A00,0,$400,$100,$300,$4200,$400
                    dc.w     $400,$400,$C00,$1A00,$5300,$5300,0,$200,$200,$200
                    dc.w     $200,$8F00,$D00,$8500,$1100,$8500,$C00,$8100
                    dc.w     $9800,$3A00,0,$400,$100,$300,$3B00,$400,$400,$400
                    dc.w     $D00,$1A00,$5300,$5300,$5000,$200,$200,$200,$200
                    dc.w     $8F00,$D00,$8500,$1000,$8500,$D00,$8100,$9800
                    dc.w     $3A00,0,$400,$100,$300,$3600,$400,$400,$400,$E00
                    dc.w     $1A00,$5300,$5300,$5100,$200,$200,$200,$200,$8F00
                    dc.w     $D00,$8500,$F00,$8500,$E00,$8100,$9800,$3A00,0
                    dc.w     $200,$500,$500,$3800,0,0,0,$F00,$E00,$300,$2200
                    dc.w     $DC00,$D00,$200,$200,$500,$500,$3D00,0,0,0,$1000
                    dc.w     $E00,$300,$2A00,$DC00,$D00,$200,$200,$500,$500
                    dc.w     $4400,0,0,0,$1100,$E00,$300,$3400,$DC00,$D00,$200
                    dc.w     $200,$500,$500,$4900,0,0,0,$1200,$E00,$300,$1A00
                    dc.w     $DC00,$D00,$200,$C000,$2600,$400,$4100,0,$3600,0
                    dc.w     $1300,$900,0,0,$2100,$1B00,$EB00,$100,$400,$1400
                    dc.w     0,$1C00,$C00,0,0,0
                    dc.b     'K',0
                    dc.b     'E',0
                    dc.b     'T',0
                    dc.b     'A',0
                    dc.b     'R',0
                    dc.b     ' ',0
                    dc.b     'H',0
                    dc.b     'A',0
                    dc.b     'N',0
                    dc.b     'G',0
                    dc.b     'A',0
                    dc.b     'R',0
                    dc.w     $100,0,0,0,$7700,$100,$5F00,$100,$C00,0,$5000,0
                    dc.w     $900,0,$100,$5800,$7700,$2E00,$700,$200,$1000
                    dc.w     $800,0,0,0,$2E00,$7700,$2E00,$700,0,$100,0,$7700
                    dc.w     $2E00,$700,$400,$1000,0,$800,0,0,0,$7700,0,$100,0
                    dc.w     $2F00,0,$7700,$100,$5F00,$500,$C00,0,$200,0,$300
                    dc.w     0,$100,0,0,$2E00,$5F00,$800,$A00,$6000,$100,$E00
                    dc.w     $1000,$1F00,$2A00,$300,$1E00,$A00,$C00,$4700
                    dc.w     $4400,$4400,$600,$E00,$1300,$1F00,$2A00,$300
                    dc.w     $1E00,$B00,$1000,$9700,$9700,$4000,0,$800,$1C00
                    dc.w     $1800,$600,$E00,$1600,$2A00,$A00,$200,$900,$C00
                    dc.w     $1000,$9700,$9700,0,0,$200,0,$700,$400,$3800
                    dc.w     $1000,$1F00,$700,$300,$600,$D00,$1000,$9300,$9300
                    dc.w     $7400,$100,$300,$100,$300,$400,$3800,$1000,$3700
                    dc.w     $600,$300,$600,$E00,$1000,$9300,$9300,$7000,$100
                    dc.w     $300,$100,$300,$700,$E00,$F00,$1F00,$2A00,$100
                    dc.w     $1E00,$F00,$2200,$7900,$7900,$3000,$200,$200
                    dc.w     $2800,$1C00,$300,$D00,$300,$E00,$300,$2500,$300
                    dc.w     $2600,$C00,$1700,$C00,$2000,$1500,$1200,$1B00
                    dc.w     $1A00,$1C00,$700,$300,$2C00,$F00,$3300,$700,0
                    dc.w     $500,$1000,$A00,$1100,$300,$2C00,$F00,$2400,$700
                    dc.w     0,$500,$1100,$A00,$1100,$300,$1300,$F00,$2400
                    dc.w     $700,0,$500,$1200,$A00,$1100,$300,$1300,$F00
                    dc.w     $3300,$700,0,$500,$1300,$A00,$1100,$300,$E00
                    dc.w     $1000,$3600,0,$300,$500,$1400,$A00,$1100,$300
                    dc.w     $E00,$1000,$2200,0,$300,$500,$1500,$A00,$1100
                    dc.w     $C000,$7200,$100,$3000,$4600,$3600,0,$1600,$900
                    dc.w     $300,$3800,$1100,$2800,0,$100,$D00,$1900,$A00
                    dc.w     $1100,$C700,$E00,$100,$1F00,$2800,$300,$400,$1E00
                    dc.w     $1000,$3700,$3700,0,$300,0,$2500,$400,$C700,$E00
                    dc.w     $100,$3900,$2800,$300,$400,$1F00,$1000,$3700
                    dc.w     $3700,0,$300,0,$2500,$400,$C600,$E00,$400,$3900
                    dc.w     $2800,$300,$400,$2000,$1000,$3700,$3700,$9000
                    dc.w     $300,0,$2500,$400,$C600,$E00,$400,$1F00,$2800
                    dc.w     $300,$400,$2100,$1000,$3700,$3700,$9000,$300,0
                    dc.w     $2500,$400,$C100,$1300,$400,$2300,$1D00,$700
                    dc.w     $1600,$2200,$1E00,$4400,$9500,$7700,$300,$D00
                    dc.w     $300,$E00,$300,$2500,$300,$2600,$C00,$1700,$D00
                    dc.w     $2000,$1500,$1200,$1B00,$1B00,$1C00,$700,$C600
                    dc.w     $1300,$B00,$2300,$300,$300,$1600,$2300,$1000
                    dc.w     $4700,$4700,$7000,0,0,0,$1600,$C400,$3000,$400
                    dc.w     $2300,$800,$700,$1600,$2400,$1000,$E700,$E700
                    dc.w     $4400,$200,$200,$500,$1400,$C400,$3800,$600,$3400
                    dc.w     $400,$300,$300,$2500,$1000,$9300,$9300,$7000,$100
                    dc.w     $100,$100,$100,$C400,$3800,$600,$2500,$500,$300
                    dc.w     $300,$2600,$1000,$9300,$9300,$7400,$100,$200,$100
                    dc.w     $200,$C300,$3800,$700,$2900,0,$100,$A00,$2800
                    dc.w     $A00,$1100,$C000,$2700,$1100,$2E00,0,$1200,0
                    dc.w     $1A00,$900,$C000,$2700,$100,$2E00,0,$1200,0,$1B00
                    dc.w     $900,$100,$7700,0,0,$100,$3000,$5F00,$1C00,$C00
                    dc.w     $400,0,0,$300,$7700,0,$1400,0,$2300,$3700,$1D00
                    dc.w     $D00,$100,$1200,$600,$1E00,$100,$2F00,$E00,$1700
                    dc.w     $100,$300,$A00,$300,$B00,$300,$C00,$300,$F00,$300
                    dc.w     $1000,$300,$1100,$300,$1200,$300,$1300,$300,$1400
                    dc.w     $300,$1500,$300,$1900,$300,$1E00,$300,$1F00,$300
                    dc.w     $2000,$300,$2200,$300,$2300,$300,$2400,$300,$2700
                    dc.w     $300,$2800,$F00,$800,$D00,$1700,$300,$2100,0
                    dc.w     $1100,$1900,$4600,$100,$400,$1400,$600,$1100,$C00
                    dc.w     0,0,0
                    dc.b     ' ',0
                    dc.b     'K',0
                    dc.b     '3',0
                    dc.b     '-',0
                    dc.b     'C',0
                    dc.b     'O',0
                    dc.b     'M',0
                    dc.b     'P',0
                    dc.b     'L',0
                    dc.b     'E',0
                    dc.b     'X',0
                    dc.b     ' ',0
                    dc.w     $100,0,0,0,$6000,$100,$6000,$100,$C00,0,$8000,0
                    dc.w     $100,0,$3E00,0,$6000,$100,$6000,$600,$C00,0,$700
                    dc.w     0,$100,0,$100,0,$100,$3D00,$6000,$500,$C00,$2000
                    dc.w     0,0,$100,$5F00,$100,0,$100,$3D00,$6000,$300,$C00
                    dc.w     $200,0,0,$100,$100,$100,0,$5E00,$3D00,$100,$400
                    dc.w     $C00,0,0,$3000,$100,$100,$100,$5F00,$5E00,$3D00
                    dc.w     $100,$200,$C00,0,0,$300,$300,$100,$100,$2E00,0
                    dc.w     $1000,$800,$700,$D00,$1000,$1200,$700,$1900,$C000
                    dc.w     $400,$100,$3200,0,$1200,0,$800,$900,$B00,$800
                    dc.w     $2800,$5F00,$1000,$1000,0,$900,$1700,$1100,$800
                    dc.w     $2800,$5F00,$1800,$2800,$5F00,$1000,$3800,$5F00
                    dc.w     $8500,$900,$8400,$A00,$CB00,$2000,$2800,$5F00
                    dc.w     $1000,$1000,0,$C00,$1700,$1100,$2000,$2800,$5F00
                    dc.w     $3000,$2800,$5F00,$2800,$3800,$5F00,$8500,$C00
                    dc.w     $8400,$D00,$B00,$3800,$2800,$5F00,$1000,$1000,0
                    dc.w     $F00,$1700,$1100,$4000,$3800,$5F00,$3800,$2800
                    dc.w     $5F00,$4800,$2800,$5F00,$8500,$F00,$8400,$1000
                    dc.w     $C300,$3800,$2800,$5F00,$1000,$1000,0,$1000,$E00
                    dc.w     $200,$8500,$1000,$8400,$1100,$300,$2000,$2800
                    dc.w     $5F00,$1000,$1000,0,$D00,$E00,$200,$8500,$D00
                    dc.w     $8400,$E00,$C300,$800,$2800,$5F00,$1000,$1000,0
                    dc.w     $A00,$E00,$200,$8500,$A00,$8400,$B00,$CE00,$800
                    dc.w     $2800,$5F00,$1000,$1000,0,$B00,$2000,$4400,$C00
                    dc.w     $3800,$5F00,$800,$3000,$5F00,$C00,$2800,$5F00
                    dc.w     $1400,$2800,$5F00,$1800,$3000,$5F00,$1400,$3800
                    dc.w     $5F00,$8500,$B00,$8400,$900,$CE00,$2000,$2800
                    dc.w     $5F00,$1000,$1000,0,$E00,$2000,$4400,$2400,$3800
                    dc.w     $5F00,$2000,$3000,$5F00,$2400,$2800,$5F00,$2C00
                    dc.w     $2800,$5F00,$3000,$3000,$5F00,$2C00,$3800,$5F00
                    dc.w     $8500,$E00,$8400,$C00,$CE00,$3800,$2800,$5F00
                    dc.w     $1000,$1000,0,$1100,$2000,$4400,$3C00,$3800,$5F00
                    dc.w     $3800,$3000,$5F00,$3C00,$2800,$5F00,$4400,$2800
                    dc.w     $5F00,$4800,$3000,$5F00,$4400,$3800,$5F00,$8500
                    dc.w     $1100,$8400,$F00,$400,$C00,$8800,$700,$900,$8800
                    dc.w     $F00,$1D00,$8800,$700,$600,$8800,$600,$700,$E00
                    dc.w     $9E00,$900,$9E00,$C00,$9E00,$F00,$8700,$700,$900
                    dc.w     $8700,$F00,$1D00,$9C00,$600,$E00,$9E00,$A00,$9E00
                    dc.w     $D00,$9E00,$1000,$8700,$700,$600,$8700,$600,$700
                    dc.w     $9C00,$600,$400,$9C00,$500,$8300,$700,$200,$700
                    dc.w     $2000,$7A00,0,$100,$1400,$300,$1500,$C00,0,0,0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     'M',0
                    dc.b     'I',0
                    dc.b     'T',0
                    dc.b     'R',0
                    dc.b     'A',0
                    dc.b     'L',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.w     $100,0,0,0,$7F00,$100,$7F00,$100,$1200,0,$7000,0
                    dc.w     $200,$FE00,$1300,$FE00,$1C00,$A00,$B00,0,$3F00,0
                    dc.w     $7F00,0,$7F00,$200,$1300,$5500,$7F00,$3F00,$7F00
                    dc.w     0,$3F00,$5D00,$5D00,$3F00,0,$100,$3D00,$100,$4000
                    dc.w     $600,$800,$600,$300,$C00,$3300,0,$5500,$600,$3D00
                    dc.w     $900,$4000,$600,$400,$600,$400,$1000,$4E00,$4E00
                    dc.w     $5000,$300,$300,$300,$300,$200,$4000,$D00,$4300,0
                    dc.w     0,0,$500,$E00,$400,$500,$1000,$2700,$800,$C000
                    dc.w     $4700,$3000,$4000,$1200,0,0,$600,$900,$C000,$6100
                    dc.w     $100,$3000,0,$3E00,$1200,$700,$900,$100,$200,$D00
                    dc.w     $1500,$3000,$F00,$7F00,$F300,0,$100,$1400,$A00
                    dc.w     $1300,$C00,0,0,0
                    dc.b     ' ',0
                    dc.b     ' ',0
                    dc.b     '0',0
                    dc.b     ' ',0
                    dc.b     'C',0
                    dc.b     'L',0
                    dc.b     'E',0
                    dc.b     'A',0
                    dc.b     'R',0
                    dc.b     'E',0
                    dc.b     'D',0
                    dc.b     ' ',0
                    dc.w     $100,$2800,$1400,$5000,$400,$400,$1400,$100,$C00
                    dc.w     $B400,$2700,$EA00,$100,$2C00,$1400,$6000,$800
                    dc.w     $400,$400,$200,$C00,$B000,$2700,$EA00,$100,$2C00
                    dc.w     $1400,$5800,$400,$400,$400,$300,$C00,$B000,$2700
                    dc.w     $EA00,$100,$2C00,$1400,$5000,$800,$400,$400,$400
                    dc.w     $C00,$B000,$2700,$EA00,$100,$3800,$1400,$5000
                    dc.w     $400,$400,$1400,$500,$C00,$B400,$2700,$EA00,$100
                    dc.w     $4400,$1400,$5000,$400,$400,$1400,$600,$C00,$B400
                    dc.w     $2700,$EA00,$100,$4C00,$1400,$5000,$400,$400
                    dc.w     $1400,$700,$C00,$B400,$2700,$EA00,$100,$5000
                    dc.w     $1400,$6000,$600,$400,$400,$900,$C00,0,$2700
                    dc.w     $EA00,$100,$5000,$1400,$5000,$600,$400,$400,$A00
                    dc.w     $C00,0,$2700,$EA00,$400,$5600,$1400,$5000,$400
                    dc.w     $400,$1400,$800,$1000,$2E00,$7A00,$B400,0,$400
                    dc.w     $400,$1000,$C00,$3C00,$1400,$5000,$800,0,$1400
                    dc.w     $B00,$1600,$7700,$4400,$1400,$5000,$4400,$1400
                    dc.w     $5800,$3C00,$1400,$6400,$3C00,$1400,$5C00,$C00
                    dc.w     $3C00,$1800,$5000,$800,0,$1400,$C00,$1600,$2200
                    dc.w     $3C00,$1800,$5C00,$3C00,$1800,$6400,$4400,$1800
                    dc.w     $5800,$4400,$1800,$5000,$C00,$3C00,$1400,$5000
                    dc.w     $800,$400,$C00,$D00,$1600,$4400,$4400,$1800,$5000
                    dc.w     $4400,$1400,$5000,$3C00,$1400,$5C00,$3C00,$1800
                    dc.w     $5C00,$B00,$3C00,$1400,$5800,$800,$400,$C00,$E00
                    dc.w     $1300,$BB00,$3C00,$1800,$6400,$4400,$1400,$5800
                    dc.w     $4400,$1800,$5800,$C000,$3F00,$2300,$3500,$500,0
                    dc.w     0,0,$900,0
                    dc.w     0
                    dcb.l    1023,0
                    dc.b     0

                    end
