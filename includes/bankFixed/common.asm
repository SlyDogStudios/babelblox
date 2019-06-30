seed_inc:
	inc seed
;	lda seed
;	and #%00111111
	lda seed
	cmp #90
	bne :+
		lda #$00
		sta seed
:	rts

do_random_set:
	ldx #$00
:	lda seed2, x
	beq @do_eor
	clc
	asl
	beq @no_eor    ;if the input was $80, skip the EOR
	bcc @no_eor
@do_eor:
	eor #$1d
@no_eor:
	sta seed2, x
	inx
	cpx #$03
	bne :-
	rts
all_sprites_offscreen:
	ldx #$00
	lda #$f0
:	sta $200, x
	dex
	dex
	dex
	dex
	bne :-
	rts
black_palette:
	ldx #$00
	lda #$0f
:	sta pal_address, x
	inx
	cpx #$20
	bne :-
	rts
stabilize:
	lda #$00
	sta $2006
	sta $2006
	sta $2005
	sta $2005
	rts
nmi_wait:
	lda nmi_num						; Wait for an NMI to happen before running
:	cmp nmi_num						; the main loop again
	beq :-							;
	rts
vblank_wait:						; I think we all know what this is!
:	bit $2002
	bpl :-
	rts
PPU_off:
	lda #$00
	sta $2000
	sta reg2000save
	sta $2001
	sta reg2001save
	rts
PPU_with_sprites:
	lda #%10000000
	sta $2000
	sta reg2000save
	lda #%00011010
	sta $2001
	sta reg2001save
	rts
PPU_no_sprites:
	lda #%10001000
	sta $2000
	sta reg2000save
	lda #%00001010
	sta $2001
	sta reg2001save
	rts
PPU_with_sprites_32:
	lda #%10001100
	sta $2000
	sta reg2000save
	lda #%00011010
	sta $2001
	sta reg2001save
	rts
PPU_with_sprites_and_bg_pattern0:
	lda #%10000000
	sta $2000
	sta reg2000save
	lda #%00011010
	sta $2001
	sta reg2001save
	rts