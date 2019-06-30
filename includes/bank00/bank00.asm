.segment "BANK00"
babeltitle_chr:
.incbin "includes\bank00\babel_title.chr"
babelplay_chr:
.incbin "includes\bank00\babel.chr"
babelplay_nam:
.incbin "includes\bank00\babel.nam"
babelplay_pal:
.incbin "includes\bank00\babel.pal"
.byte $21,$11,$37,$00, $21,$27,$07,$10, $21,$05,$36,$30, $21,$29,$18,$21

babeltitle_nam:
.incbin "includes\bank00\babel_title.nam"
babeltitle_pal:
.incbin "includes\bank00\babel_title.pal"
.byte $0f,$11,$37,$00, $0f,$27,$07,$10, $0f,$05,$36,$30, $0f,$29,$18,$21
.byte $0f,$27

babeloption_nam:
.incbin "includes\bank00\babel_options.nam"
;$22ba


title_start:
	lda #<babeltitle_chr
	sta temp_16bit_1+0
	lda #>babeltitle_chr
	sta temp_16bit_1+1
	ldy #$00
	sty $2006
	sty $2006
	ldx #$20
:	lda (temp_16bit_1), y
	sta $2007
	iny
	bne :-
	inc temp_16bit_1+1
	dex
	bne :-

	lda #$08
	sta anim_ticker

	ldx #$00
:	lda babeltitle_pal, x
	sta pal_address, x
	inx
	cpx #$20
	bne :-

	ldx #$00						; Pull in bytes for sprites and their
:	lda title_sprite, x		; attributes which are stored in the
	sta $200, x						; 'title_sprites' table. Use X as an index
	inx								; to load and store each byte, which
	cpx #12;#100							; get stored starting in $200, where
	bne :-							; 'dir_arrow' is located at.

	ldy #$00
	ldx #$04
	lda #<babeltitle_nam
	sta temp_16bit_1+0
	lda #>babeltitle_nam
	sta temp_16bit_1+1
	lda #$20
	sta $2006
	lda #$00
	sta $2006
:	lda (temp_16bit_1),y
	sta $2007
	iny
	bne :-
	inc temp_16bit_1+1
	dex
	bne :-

	lda #$24
	sta $2006
	ldx #$00
	stx $2006
	txa
:	sta $2007
	sta $2007
	sta $2007
	sta $2007
	dex
	bne :-

	ldx #$00
	lda #$27
	sta $2006
	lda #$c0
	sta $2006
	lda #$aa
:	sta $2007
	inx
	cpx #64
	bne :-

	ldx #$00
	lda #$24
	sta $2006
	lda #$6b
	sta $2006
:	lda scr_word, x
	clc
	adc #$40
	sta $2007
	inx
	cpx #10
	bne :-

	jsr load_scores

	lda #<loop_babeltitle
	sta loop_pointer+0
	lda #>loop_babeltitle
	sta loop_pointer+1
	lda #<nmi_nothing
	sta nmi_pointer+0
	lda #>nmi_nothing
	sta nmi_pointer+1

	lda #$09
	sta guy1_state
	lda #$00
	sta guy0_state
	lda #$01
	sta guy0_count
	lda #$02
	sta switch_screen
	lda #$00
	sta temp_8bit_2

	jsr vblank_wait
	jsr vblank_wait
	jsr PPU_with_sprites
	jsr nmi_wait
	lda #select_punch
	sta control_old
	jmp title_tune_jumper
rtn_title_tune:
	jmp title_end
	jmp loop
	jmp jmp_for_play

scr_word:
.byte "HI--SCORES"


babelplay_sprites:
	.byte $8f,$c4,$00,$39	; up
	.byte $9f,$c5,$01,$39	; down
	.byte $af,$c6,$02,$39	; left
	.byte $bf,$c7,$03,$39	; right

	.byte $1c,$00,$02,$8a	; bubble
	.byte $1c,$00,$02,$92	; 
	.byte $24,$00,$02,$8a	; 
	.byte $24,$00,$02,$92	; 

	.byte $f0,$80,$01,$60	; brick
	.byte $f0,$9f,$01,$68	; 
	.byte $f0,$dc,$01,$60	; 
	.byte $f0,$df,$01,$68	; 

	.byte $cf,$00,$00,$00	; guy0
	.byte $cf,$00,$00,$08	; 
	.byte $d7,$00,$00,$00	; 
	.byte $d7,$00,$00,$08	; 

	.byte $f0,$e2,$01,$78	; guy1
	.byte $f0,$e3,$01,$80	; 
	.byte $f0,$f2,$01,$78	; 
	.byte $f0,$f3,$01,$80	; 

	.byte $1f,$00,$03,$19	; next to 'B' (x or check)
	.byte $27,$00,$02,$19	; next to 'A' (x or check)

	.byte $f0,$00,$03,$20	; letter0
	.byte $f0,$00,$03,$28	; letter1
	.byte $f0,$00,$03,$30	; letter2

	.byte $87,$00,$02,$d0
	.byte $87,$00,$02,$c8

	.byte $a8,$00,$01,$c1	; chain0
	.byte $a8,$00,$01,$c9	; chain1

	.byte $16,$00,$02,$d0	; notice0
	.byte $16,$00,$02,$d8	; notice1
saving_words:
	.byte $f0,$93,$02,$68	; S
	.byte $f0,$81,$02,$70	; A
	.byte $f0,$96,$02,$78	; V
	.byte $f0,$85,$02,$80	; E
	.byte $f0,$84,$02,$88	; D
	.byte $f0,$7E,$02,$98	; !

title_sprite:
	.byte $67,$c8,$00,$57
	.byte $67,$c9,$00,$aa
	.byte $f0,$ca,$00,$18

loop_scores:
	jsr seed_inc
	jsr do_random_set
	dec temp_8bit_2
	bne :++
		dec switch_screen
		bne :++
:			lda #$02
			sta switch_screen
			lda #$00
			sta temp_8bit_2
			lda #$20
			sta nametable
			lda #<loop_babeltitle
			sta loop_pointer+0
			lda #>loop_babeltitle
			sta loop_pointer+1
			jmp end_loop
:

	lda control_pad
	eor control_old
	and control_pad
	and #$ff
	beq @no_punch
		bne :--
@no_punch:
	jmp end_loop

loop_babeltitle:
	jsr seed_inc
	jsr do_random_set
	dec temp_8bit_2
	bne :+
		dec switch_screen
		bne :+
			lda #$02
			sta switch_screen
			lda #$00
			sta temp_8bit_2
			lda #$f0
			sta arrow_up+0
			sta arrow_down+0
			lda #$24
			sta nametable
			lda #<loop_scores
			sta loop_pointer+0
			lda #>loop_scores
			sta loop_pointer+1
			jmp loop_scores
:

	lda control_pad
	eor control_old
	and control_pad
	and #start_punch
	beq @no_start_punch
		bne :+
@no_start_punch:
	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq no_title_a_punch
:
		jmp title_start_jumper
rtn_start_tune:
			lda #$78
			sta temp_8bit_4
			lda #<loop_flashtitle
			sta loop_pointer+0
			lda #>loop_flashtitle
			sta loop_pointer+1
			jmp loop_flashtitle
no_title_a_punch:
	lda control_pad
	eor control_old
	and control_pad
	and #up_punch
	beq @no_up_punch
		lda temp_8bit_1
		beq @no_control
			dec temp_8bit_1
			jmp @no_control
@no_up_punch:
	lda control_pad
	eor control_old
	and control_pad
	and #down_punch
	beq @no_down_punch
		lda temp_8bit_1
		cmp #$02
		beq @no_control
			inc temp_8bit_1
			jmp @no_control
@no_down_punch:
	lda control_pad
	eor control_old
	and control_pad
	and #select_punch
	beq @no_select_punch
		lda temp_8bit_1
		cmp #$02
		bne :+
			lda #$ff
			sta temp_8bit_1
:		inc temp_8bit_1
@no_select_punch:
@no_control:
	ldx temp_8bit_1
	lda left_table_y, x
	sta arrow_up+0
	sta arrow_down+0
	lda left_table_x, x
	sta arrow_up+3
	lda right_table_x, x
	sta arrow_down+3
	lda #$c8
	sta arrow_up+1
	sta arrow_down+1
	lda #$01
	sta arrow_up+2
	lda #$41
	sta arrow_down+2
	lda #$01
	sta arrow_left+2
	jmp end_loop
title_end:
	jmp end_loop




left_table_y:
.byte $67,$77,$87,$97
left_table_x:
.byte $57,$57,$57,$57	;$57,$5f,$5f,$5f
right_table_x:
.byte $aa,$aa,$aa,$aa	;$aa,$a2,$9a,$a2

game_setup:
;	lda #<babelplay_chr
;	sta temp_16bit_1+0
;	lda #>babelplay_chr
;	sta temp_16bit_1+1
;	ldy #$00
;	sty $2006
;	sty $2006
;	ldx #$20
;:	lda (temp_16bit_1), y
;	sta $2007
;	iny
;	bne :-
;	inc temp_16bit_1+1
;	dex
;	bne :-

	lda #$08
	sta anim_ticker

	ldx #$00
:	lda babelplay_pal, x
	sta pal_address, x
	inx
	cpx #$20
	bne :-

	ldx #$00						; Pull in bytes for sprites and their
:	lda babelplay_sprites, x		; attributes which are stored in the
	sta $200, x						; 'title_sprites' table. Use X as an index
	inx								; to load and store each byte, which
	cpx #148							; get stored starting in $200, where
	bne :-							; 'dir_arrow' is located at.

	ldy #$00
	ldx #$04
	lda #<babelplay_nam
	sta temp_16bit_1+0
	lda #>babelplay_nam
	sta temp_16bit_1+1
	lda #$20
	sta $2006
	lda #$00
	sta $2006
:	lda (temp_16bit_1),y
	sta $2007
	iny
	bne :-
	inc temp_16bit_1+1
	dex
	bne :-

	lda #$24
	sta $2006
	ldx #$00
	stx $2006
	txa
:	sta $2007
	sta $2007
	sta $2007
	sta $2007
	inx
	bne :-

	ldy #$00
:	lda base_offset, y
	tax
	lda get_letters0, x
	sta letter_grpb_0, y
	lda get_letters1, x
	sta letter_grpb_1, y
	lda get_letters2, x
	sta letter_grpb_2, y
	iny
	cpy #$05
	bne :-

	lda #$22
	sta $2006
	lda #$04
	sta $2006
	lda letter_grpb_0
	clc
	adc #$50
	sta $2007
	lda letter_grpb_1
	clc
	adc #$50
	sta $2007
	lda letter_grpb_2
	clc
	adc #$50
	sta $2007

	lda #$22
	sta $2006
	lda #$44
	sta $2006
	lda letter_grp0_0
	clc
	adc #$50
	sta $2007
	sec
	sbc #$10
	sta letter_grp0_0
	lda letter_grp0_1
	clc
	adc #$50
	sta $2007
	sec
	sbc #$10
	sta letter_grp0_1
	lda letter_grp0_2
	clc
	adc #$50
	sta $2007
	sec
	sbc #$10
	sta letter_grp0_2
	lda #$22
	sta $2006
	lda #$84
	sta $2006
	lda letter_grp1_0
	clc
	adc #$50
	sta $2007
	sec
	sbc #$10
	sta letter_grp1_0
	lda letter_grp1_1
	clc
	adc #$50
	sta $2007
	sec
	sbc #$10
	sta letter_grp1_1
	lda letter_grp1_2
	clc
	adc #$50
	sta $2007
	sec
	sbc #$10
	sta letter_grp1_2
	lda #$22
	sta $2006
	lda #$c4
	sta $2006
	lda letter_grp2_0
	clc
	adc #$50
	sta $2007
	sec
	sbc #$10
	sta letter_grp2_0
	lda letter_grp2_1
	clc
	adc #$50
	sta $2007
	sec
	sbc #$10
	sta letter_grp2_1
	lda letter_grp2_2
	clc
	adc #$50
	sta $2007
	sec
	sbc #$10
	sta letter_grp2_2
	lda #$23
	sta $2006
	lda #$04
	sta $2006
	lda letter_grp3_0
	clc
	adc #$50
	sta $2007
	sec
	sbc #$10
	sta letter_grp3_0
	lda letter_grp3_1
	clc
	adc #$50
	sta $2007
	sec
	sbc #$10
	sta letter_grp3_1
	lda letter_grp3_2
	clc
	adc #$50
	sta $2007
	sec
	sbc #$10
	sta letter_grp3_2

	ldx #$00
	lda #$25
	sta $2006
	lda #$8d
	sta $2006
:	lda pause_words, x
	sta $2007
	inx
	cpx #$06
	bne :-

	ldx #$00
	lda #$25
	sta $2006
	lda #$e7
	sta $2006
:	lda end_game_words, x
	sta $2007
	inx
	cpx #18
	bne :-
	lda #$27
	sta $2006
	lda #$d9
	sta $2006
	lda #$55
	sta $2007
	sta $2007
	sta $2007

;	lda #$08
;	sta chain_ones
;	lda #$01
;	sta chain_tens
;	lda #$04
;	sta blocks_tens
;	lda #37
;	sta brick_offset

	lda #<loop_waitplay
	sta loop_pointer+0
	lda #>loop_waitplay
	sta loop_pointer+1
	lda #<nmi_waitplay
	sta nmi_pointer+0
	lda #>nmi_waitplay
	sta nmi_pointer+1

	jmp game_intro_jumper
rtn_game_intro_tune:

	lda #$09
	sta guy1_state
	lda #$01
	sta guy0_state
	sta guy0_count
	sta words_present
	lda #$f0
	sta temp_8bit_4
	jmp jmp_for_play

option_arrow_spr:
.byte $2f,$c4,$00,$70
.byte $3f,$c5,$01,$70
.byte $4f,$c6,$02,$70
.byte $5f,$c7,$03,$70

end_game_words:
.byte $0b,$07,$0c,"+",$0b,$08,$0c,"to end game"

option_setup:
	ldy #$00
	ldx #$04
	lda #<babeloption_nam
	sta temp_16bit_1+0
	lda #>babeloption_nam
	sta temp_16bit_1+1
	lda #$20
	sta $2006
	lda #$00
	sta $2006
:	lda (temp_16bit_1),y
	sta $2007
	iny
	bne :-
	inc temp_16bit_1+1
	dex
	bne :-
	ldx #$00
:	lda babeltitle_pal, x
	sta pal_address, x
	inx
	cpx #$20
	bne :-
	lda #$0f
	sta arrow_left+0
	lda #$18
	sta arrow_left+3
	lda #$c7
	sta arrow_left+1
	lda #$01
	sta arrow_up+2
	lda #$41
	sta arrow_down+2
	lda #$01
	sta arrow_left+2
	ldx #$00
:	lda option_arrow_spr, x
	sta bubble0, x
	inx
	cpx #16
	bne :-
	jsr vblank_wait
	jsr vblank_wait
	jsr PPU_with_sprites
	lda #<loop_option
	sta loop_pointer+0
	lda #>loop_option
	sta loop_pointer+1
	lda #<nmi_options
	sta nmi_pointer+0
	lda #>nmi_options
	sta nmi_pointer+1
	jmp load_saved_option_song
;	jmp loop_option
loop_option:
	jsr seed_inc
	jsr do_random_set
	lda saved_gone
	bne :++
		ldx #$00
		txa
:		sta s_word+0, x
		inx
		cpx #24
		bne :-
		jmp :++
:
	dec saved_gone
:

	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq @no_a_punch
		lda temp_8bit_3
		cmp #$09
		bne :+
			lda #$ff
			sta temp_8bit_3
:		inc temp_8bit_3
@no_a_punch:
	lda control_pad
	eor control_old
	and control_pad
	and #up_punch
	beq @no_up_punch
		lda temp_8bit_3
		bne :+
			jmp @no_control
:			dec temp_8bit_3
			jmp @no_control
@no_up_punch:
	lda control_pad
	eor control_old
	and control_pad
	and #down_punch
	beq @no_down_punch
		lda temp_8bit_3
		cmp #$09
		beq @no_control
			inc temp_8bit_3
			jmp @no_control
@no_down_punch:
	lda control_pad
	eor control_old
	and control_pad
	and #left_punch
	beq @no_left_punch
		jsr which_option2
			jmp @no_control
@no_left_punch:
	lda control_pad
	eor control_old
	and control_pad
	and #right_punch
	beq @no_right_punch
		jsr which_option
			jmp @no_control
@no_right_punch:
	lda control_pad
	eor control_old
	and control_pad
	and #select_punch
	beq @no_select_punch
			lda #$00
			sta temp_8bit_2
			jsr black_palette
			jsr all_sprites_offscreen
			jsr nmi_wait
			jsr PPU_off
			jmp title_start
@no_select_punch:
	lda control_pad
	eor control_old
	and control_pad
	and #start_punch
	beq @no_start_punch
		lda #$78
		sta saved_gone
		jsr black_palette
		ldx #$00
:		lda saving_words, x
		sta s_word+0, x
		inx
		cpx #24
		bne :-
		ldx #$00
		lda #$b3
:		sta s_word+0, x
		inx
		inx
		inx
		inx
		cpx #24
		bne :-
		jsr nmi_wait
			jmp save_options_jumper
@no_start_punch:
@no_control:
	ldx temp_8bit_3
	lda option_arrow_x, x
	sta arrow_left+0

	lda option_y, x
	sta arrow_up+0
	sta arrow_down+0
	lda option_left, x
	sta arrow_up+3
	lda option_right, x
	sta arrow_down+3
	

	ldy #$00
:	lda opt_ram_lo, y
	sta temp_16bit_2+0
	lda opt_ram_hi, y
	sta temp_16bit_2+1
	ldx base_offset, y
	lda opt_lang_lo, x
	sta temp_16bit_1+0
	lda opt_lang_hi, x
	sta temp_16bit_1+1
	tya
	pha
	ldy #$00
:	lda (temp_16bit_1), y
	clc
	adc #$40
	sta (temp_16bit_2), y
	iny
	cpy #$07
	bne :-
	pla
	tay
	iny
	cpy #$05
	bne :--

	ldx base_offset+5
	lda opt_reg_lo, x
	sta temp_16bit_1+0
	lda opt_reg_hi, x
	sta temp_16bit_1+1
	ldy #$00
:	lda (temp_16bit_1), y
	clc
	adc #$40
	sta opt5, y
	iny
	cpy #$04
	bne :-

	ldx base_offset+6
	lda opt_init_lo, x
	sta temp_16bit_1+0
	lda opt_init_hi, x
	sta temp_16bit_1+1
	ldy #$00
	lda (temp_16bit_1), y
	clc
	adc #$40
	sta opt6+0, y

	ldx base_offset+7
	lda opt_init_lo, x
	sta temp_16bit_1+0
	lda opt_init_hi, x
	sta temp_16bit_1+1
	ldy #$00
	lda (temp_16bit_1), y
	clc
	adc #$40
	sta opt6+1, y

	ldx base_offset+8
	lda opt_init_lo, x
	sta temp_16bit_1+0
	lda opt_init_hi, x
	sta temp_16bit_1+1
	ldy #$00
	lda (temp_16bit_1), y
	clc
	adc #$40
	sta opt6+2, y

	ldx base_offset+9
	lda opt_init_lo, x
	sta temp_16bit_1+0
	lda opt_init_hi, x
	sta temp_16bit_1+1
	ldy #$00
	lda (temp_16bit_1), y
	clc
	adc #$40
	sta opt7, y

	jmp end_loop

option0:
	ldx #$00
:	lda base_offset
	cmp up_offset, x
	bne :+
		lda #$01
		sta option_matching
		rts
:	inx
	cpx #4
	bne :--
	rts
option1:
	lda base_offset
	sta sds_thingy+0
	lda down_offset
	sta sds_thingy+1
	lda left_offset
	sta sds_thingy+2
	lda right_offset
	sta sds_thingy+3
	ldx #$00
:	lda up_offset
	cmp sds_thingy, x
	bne :+
		lda #$01
		sta option_matching
		rts
:	inx
	cpx #4
	bne :--
	rts
option2:
	lda base_offset
	sta sds_thingy+0
	lda up_offset
	sta sds_thingy+1
	lda left_offset
	sta sds_thingy+2
	lda right_offset
	sta sds_thingy+3
	ldx #$00
:	lda down_offset
	cmp sds_thingy, x
	bne :+
		lda #$01
		sta option_matching
		rts
:	inx
	cpx #4
	bne :--
	rts
option3:
	lda base_offset
	sta sds_thingy+0
	lda up_offset
	sta sds_thingy+1
	lda down_offset
	sta sds_thingy+2
	lda right_offset
	sta sds_thingy+3
	ldx #$00
:	lda left_offset
	cmp sds_thingy, x
	bne :+
		lda #$01
		sta option_matching
		rts
:	inx
	cpx #4
	bne :--
	rts
option4:
	ldx #$00
:	lda right_offset
	cmp base_offset, x
	bne :+
		lda #$01
		sta option_matching
		rts
:	inx
	cpx #4
	bne :--
	rts
	


option_y:
.byte $1f,$2f,$3f,$4f,$5f,$77,$8f,$8f,$8f,$a7
option_left:
.byte $90,$90,$90,$90,$90,$a8,$a8,$b8,$c8,$c8
option_right:
.byte $e1,$e1,$e1,$e1,$e1,$e1,$b9,$c9,$d9,$d9

opt_ram_lo:
.byte <opt0,<opt1,<opt2,<opt3,<opt4
opt_ram_hi:
.byte >opt0,>opt1,>opt2,>opt3,>opt4
option_arrow_x:
.byte $17,$2f,$3f,$4f,$5f,$77,$8f,$8f,$8f,$a7
which_option:
	lda temp_8bit_3
	asl a
	tay
	lda option_table+1, y
	pha
	lda option_table+0, y
	pha
	rts
which_option2:
	lda temp_8bit_3
	asl a
	tay
	lda option_table2+1, y
	pha
	lda option_table2+0, y
	pha
	rts
option_table:
.addr primary0-1,lang10-1,lang20-1,lang30-1,lang40-1,da_region0-1,initial10-1,initial20-1,initial30-1,music0-1
option_table2:
.addr primary1-1,lang11-1,lang21-1,lang31-1,lang41-1,da_region1-1,initial11-1,initial21-1,initial31-1,music1-1
primary0:
:		lda #$00
		sta option_matching
		inc base_offset+0
		lda base_offset+0
		cmp #$0a
		bne :+
			lda #$00
			sta base_offset+0
:		jsr option0
		lda option_matching
		bne :--
	rts
lang10:
:		lda #$00
		sta option_matching
		inc base_offset+1
		lda base_offset+1
		cmp #$0a
		bne :+
			lda #$00
			sta base_offset+1
:		jsr option1
		lda option_matching
		bne :--
	rts
lang20:
:		lda #$00
		sta option_matching
		inc base_offset+2
		lda base_offset+2
		cmp #$0a
		bne :+
			lda #$00
			sta base_offset+2
:		jsr option2
		lda option_matching
		bne :--
	rts
lang30:
:		lda #$00
		sta option_matching
		inc base_offset+3
		lda base_offset+3
		cmp #$0a
		bne :+
			lda #$00
			sta base_offset+3
:		jsr option3
		lda option_matching
		bne :--
	rts
lang40:
:		lda #$00
		sta option_matching
		inc base_offset+4
		lda base_offset+4
		cmp #$0a
		bne :+
			lda #$00
			sta base_offset+4
:		jsr option4
		lda option_matching
		bne :--
	rts
da_region0:
	lda base_offset+5
	cmp #$01
	beq :+
		inc base_offset+5
:
	rts
initial10:
	lda base_offset+6
	cmp #26
	beq :+
		inc base_offset+6
:
	rts
initial20:
	lda base_offset+7
	cmp #26
	beq :+
		inc base_offset+7
:
	rts
initial30:
	lda base_offset+8
	cmp #26
	beq :+
		inc base_offset+8
:
	rts
music0:
	lda base_offset+9
	cmp #2
	beq rtn_music0
		inc base_offset+9
		jmp mus0_on
rtn_music0:
	rts


primary1:
:		lda #$00
		sta option_matching
		dec base_offset+0
		lda base_offset+0
		cmp #$ff
		bne :+
			lda #$09
			sta base_offset+0
:		jsr option0
		lda option_matching
		bne :--
	rts
lang11:
:		lda #$00
		sta option_matching
		dec base_offset+1
		lda base_offset+1
		cmp #$ff
		bne :+
			lda #$09
			sta base_offset+1
:		jsr option1
		lda option_matching
		bne :--
	rts
lang21:
:		lda #$00
		sta option_matching
		dec base_offset+2
		lda base_offset+2
		cmp #$ff
		bne :+
			lda #$09
			sta base_offset+2
:		jsr option2
		lda option_matching
		bne :--
	rts
lang31:
:		lda #$00
		sta option_matching
		dec base_offset+3
		lda base_offset+3
		cmp #$ff
		bne :+
			lda #$09
			sta base_offset+3
:		jsr option3
		lda option_matching
		bne :--
	rts
lang41:
:		lda #$00
		sta option_matching
		dec base_offset+4
		lda base_offset+4
		cmp #$ff
		bne :+
			lda #$09
			sta base_offset+4
:		jsr option4
		lda option_matching
		bne :--
	rts
da_region1:
	lda base_offset+5
	beq :+
		dec base_offset+5
:
	rts
initial11:
	lda base_offset+6
	beq :+
		dec base_offset+6
:
	rts
initial21:
	lda base_offset+7
	beq :+
		dec base_offset+7
:
	rts
initial31:
	lda base_offset+8
	beq :+
		dec base_offset+8
:
	rts
music1:
	lda base_offset+9
	beq rtn_music1
		dec base_offset+9
		jmp mus1_on
rtn_music1:
	rts

get_letters0:
.byte "E","G","F","I","S","S","J","H","G","L"
get_letters1:
.byte "N","E","R","T","P","W","A","E","R","A"
get_letters2:
.byte "G","R","E","A","A","A","P","B","K","T"


opt_lang_lo:
.byte <eng_word,<ger_word,<fre_word,<ita_word,<spa_word,<swa_word,<jap_word,<heb_word,<grk_word,<lat_word
opt_lang_hi:
.byte >eng_word,>ger_word,>fre_word,>ita_word,>spa_word,>swa_word,>jap_word,>heb_word,>grk_word,>lat_word
eng_word:
.byte "ENGLISH"
ger_word:
.byte " GERMAN"
fre_word:
.byte " FRENCH"
ita_word:
.byte "ITALIAN"
spa_word:
.byte "SPANISH"
swa_word:
.byte "SWAHILI"
jap_word:
.byte "NIHONGO"
heb_word:
.byte " HEBREW"
grk_word:
.byte "  GREEK"
lat_word:
.byte "  LATIN"
opt_reg_lo:
.byte <region_n,<region_p
opt_reg_hi:
.byte >region_n,>region_p
region_n:
.byte "NTSC"
region_p:
.byte " PAL"
opt_init_lo:
.byte <an_a,<an_b,<an_c,<an_d,<an_e,<an_f,<an_g,<an_h,<an_i,<an_j,<an_k,<an_l,<an_m
.byte <an_n,<an_o,<an_p,<an_q,<an_r,<an_s,<an_t,<an_u,<an_v,<an_w,<an_x,<an_y,<an_z
opt_init_hi:
.byte >an_a,>an_b,>an_c,>an_d,>an_e,>an_f,>an_g,>an_h,>an_i,>an_j,>an_k,>an_l,>an_m
.byte >an_n,>an_o,>an_p,>an_q,>an_r,>an_s,>an_t,>an_u,>an_v,>an_w,>an_x,>an_y,>an_z
an_a:
.byte "A"
an_b:
.byte "B"
an_c:
.byte "C"
an_d:
.byte "D"
an_e:
.byte "E"
an_f:
.byte "F"
an_g:
.byte "G"
an_h:
.byte "H"
an_i:
.byte "I"
an_j:
.byte "J"
an_k:
.byte "K"
an_l:
.byte "L"
an_m:
.byte "M"
an_n:
.byte "N"
an_o:
.byte "O"
an_p:
.byte "P"
an_q:
.byte "Q"
an_r:
.byte "R"
an_s:
.byte "S"
an_t:
.byte "T"
an_u:
.byte "U"
an_v:
.byte "V"
an_w:
.byte "W"
an_x:
.byte "X"
an_y:
.byte "Y"
an_z:
.byte "Z"

opt_mus_lo:
.byte <an_a, <an_b, <an_c
opt_mus_hi:
.byte >an_a, >an_b, >an_c




nmi_options:
	lda #$20
	sta $2006
	lda #$94
	sta $2006
	lda opt0+0
	sta $2007
	lda opt0+1
	sta $2007
	lda opt0+2
	sta $2007
	lda opt0+3
	sta $2007
	lda opt0+4
	sta $2007
	lda opt0+5
	sta $2007
	lda opt0+6
	sta $2007

	lda #$20
	sta $2006
	lda #$d4
	sta $2006
	lda opt1+0
	sta $2007
	lda opt1+1
	sta $2007
	lda opt1+2
	sta $2007
	lda opt1+3
	sta $2007
	lda opt1+4
	sta $2007
	lda opt1+5
	sta $2007
	lda opt1+6
	sta $2007

	lda #$21
	sta $2006
	lda #$14
	sta $2006
	lda opt2+0
	sta $2007
	lda opt2+1
	sta $2007
	lda opt2+2
	sta $2007
	lda opt2+3
	sta $2007
	lda opt2+4
	sta $2007
	lda opt2+5
	sta $2007
	lda opt2+6
	sta $2007

	lda #$21
	sta $2006
	lda #$54
	sta $2006
	lda opt3+0
	sta $2007
	lda opt3+1
	sta $2007
	lda opt3+2
	sta $2007
	lda opt3+3
	sta $2007
	lda opt3+4
	sta $2007
	lda opt3+5
	sta $2007
	lda opt3+6
	sta $2007

	lda #$21
	sta $2006
	lda #$94
	sta $2006
	lda opt4+0
	sta $2007
	lda opt4+1
	sta $2007
	lda opt4+2
	sta $2007
	lda opt4+3
	sta $2007
	lda opt4+4
	sta $2007
	lda opt4+5
	sta $2007
	lda opt4+6
	sta $2007

	lda #$21
	sta $2006
	lda #$f7
	sta $2006
	lda opt5+0
	sta $2007
	lda opt5+1
	sta $2007
	lda opt5+2
	sta $2007
	lda opt5+3
	sta $2007

	lda #$22
	sta $2006
	lda #$56
	sta $2006
	lda opt6+0
	sta $2007
	lda #$22
	sta $2006
	lda #$58
	sta $2006
	lda opt6+1
	sta $2007
	lda #$22
	sta $2006
	lda #$5a
	sta $2006
	lda opt6+2
	sta $2007

	lda #$22
	sta $2006
	lda #$ba
	sta $2006
	lda opt7
	sta $2007
	jmp end_nmi


howto_setup:
	ldy #$00
	ldx #$04
	lda #<babelhowto_nam
	sta temp_16bit_1+0
	lda #>babelhowto_nam
	sta temp_16bit_1+1
	lda #$20
	sta $2006
	lda #$00
	sta $2006
:	lda (temp_16bit_1),y
	sta $2007
	iny
	bne :-
	inc temp_16bit_1+1
	dex
	bne :-
	ldx #$00
:	lda babelplay_pal, x
	sta pal_address, x
	inx
	cpx #$20
	bne :-

	ldx #$00
:	lda howto_spr, x
	sta howto_sprites, x
	inx
	cpx #144
	bne :-

	jsr vblank_wait
	jsr vblank_wait
	lda #%10010000
	sta $2000
	sta reg2000save
	lda #%00011010
	sta $2001
	sta reg2001save
	lda #<loop_story
	sta loop_pointer+0
	lda #>loop_story
	sta loop_pointer+1
	jmp loop_story



story_setup:

loop_story:
	lda control_pad
	eor control_old
	and control_pad
	and #$ff;#b_punch
	beq @no_b_punch
			lda #$00
			sta temp_8bit_2
			jsr black_palette
			jsr all_sprites_offscreen
			jsr nmi_wait
			jsr PPU_off
			jmp title_start
@no_b_punch:
	jmp end_loop




