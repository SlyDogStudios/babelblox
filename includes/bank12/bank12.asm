.segment "BANK12"

slots_lo0:
	.byte $4c,$52,$4e,$50, $0c,$12,$0e,$10, $cc,$d2,$ce,$d0, $8c,$92,$8e,$90
	.byte $4c,$52,$4e,$50, $0c,$12,$0e,$10, $cc,$d2,$ce,$d0, $8c,$92,$8e,$90
	.byte $4c,$52,$4e,$50, $0c,$12,$0e,$10
slots_lo1:
	.byte $4d,$53,$4f,$51, $0d,$13,$0f,$11, $cd,$d3,$cf,$d1, $8d,$93,$8f,$91
	.byte $4d,$53,$4f,$51, $0d,$13,$0f,$11, $cd,$d3,$cf,$d1, $8d,$93,$8f,$91
	.byte $4d,$53,$4f,$51, $0d,$13,$0f,$11
slots_lo2:
	.byte $6c,$72,$6e,$70, $2c,$32,$2e,$30, $ec,$f2,$ee,$f0, $ac,$b2,$ae,$b0
	.byte $6c,$72,$6e,$70, $2c,$32,$2e,$30, $ec,$f2,$ee,$f0, $ac,$b2,$ae,$b0
	.byte $6c,$72,$6e,$70, $2c,$32,$2e,$30
slots_lo3:
	.byte $6d,$73,$6f,$71, $2d,$33,$2f,$31, $ed,$f3,$ef,$f1, $ad,$b3,$af,$b1
	.byte $6d,$73,$6f,$71, $2d,$33,$2f,$31, $ed,$f3,$ef,$f1, $ad,$b3,$af,$b1
	.byte $6d,$73,$6f,$71, $2d,$33,$2f,$31
slots_hi:
	.byte $23,$23,$23,$23, $23,$23,$23,$23, $22,$22,$22,$22, $22,$22,$22,$22
	.byte $22,$22,$22,$22, $22,$22,$22,$22, $21,$21,$21,$21, $21,$21,$21,$21
	.byte $21,$21,$21,$21, $21,$21,$21,$21
slots_x_stop:
	.byte $60,$90,$70,$80, $60,$90,$70,$80, $60,$90,$70,$80, $60,$90,$70,$80
	.byte $60,$90,$70,$80, $60,$90,$70,$80, $60,$90,$70,$80, $60,$90,$70,$80
	.byte $60,$90,$70,$80, $60,$90,$70,$80
slots_y_stop:
	.byte $cf,$cf,$cf,$cf, $bf,$bf,$bf,$bf, $af,$af,$af,$af, $9f,$9f,$9f,$9f
	.byte $8f,$8f,$8f,$8f, $7f,$7f,$7f,$7f, $6f,$6f,$6f,$6f, $5f,$5f,$5f,$5f
	.byte $4f,$4f,$4f,$4f, $3f,$3f,$3f,$3f
slots_brick_lo:
	.byte <loop_brick_left0,<loop_brick_right0,<loop_brick_left1,<loop_brick_right1
	.byte <loop_brick_left0,<loop_brick_right0,<loop_brick_left1,<loop_brick_right1
	.byte <loop_brick_left0,<loop_brick_right0,<loop_brick_left1,<loop_brick_right1
	.byte <loop_brick_left0,<loop_brick_right0,<loop_brick_left1,<loop_brick_right1
	.byte <loop_brick_left0,<loop_brick_right0,<loop_brick_left1,<loop_brick_right1
	.byte <loop_brick_left0,<loop_brick_right0,<loop_brick_left1,<loop_brick_right1
	.byte <loop_brick_left0,<loop_brick_right0,<loop_brick_left1,<loop_brick_right1
	.byte <loop_brick_left0,<loop_brick_right0,<loop_brick_left1,<loop_brick_right1
	.byte <loop_brick_left0,<loop_brick_right0,<loop_brick_left1,<loop_brick_right1
	.byte <loop_brick_left0,<loop_brick_right0,<loop_brick_left1,<loop_brick_right1
	.byte <loop_nothing
slots_brick_hi:
	.byte >loop_brick_left0,>loop_brick_right0,>loop_brick_left1,>loop_brick_right1
	.byte >loop_brick_left0,>loop_brick_right0,>loop_brick_left1,>loop_brick_right1
	.byte >loop_brick_left0,>loop_brick_right0,>loop_brick_left1,>loop_brick_right1
	.byte >loop_brick_left0,>loop_brick_right0,>loop_brick_left1,>loop_brick_right1
	.byte >loop_brick_left0,>loop_brick_right0,>loop_brick_left1,>loop_brick_right1
	.byte >loop_brick_left0,>loop_brick_right0,>loop_brick_left1,>loop_brick_right1
	.byte >loop_brick_left0,>loop_brick_right0,>loop_brick_left1,>loop_brick_right1
	.byte >loop_brick_left0,>loop_brick_right0,>loop_brick_left1,>loop_brick_right1
	.byte >loop_brick_left0,>loop_brick_right0,>loop_brick_left1,>loop_brick_right1
	.byte >loop_brick_left0,>loop_brick_right0,>loop_brick_left1,>loop_brick_right1
	.byte >loop_nothing


nmi_brick_set:
	ldx brick_offset
	lda slots_hi, x
	sta $2006
	lda slots_lo0, x
	sta $2006
	lda #$60
	sta $2007
	lda slots_hi, x
	sta $2006
	lda slots_lo1, x
	sta $2006
	lda #$7b
	sta $2007
	lda slots_hi, x
	sta $2006
	lda slots_lo2, x
	sta $2006
	lda #$8a
	sta $2007
	lda slots_hi, x
	sta $2006
	lda slots_lo3, x
	sta $2006
	lda #$8b
	sta $2007
	inx
	stx brick_offset
		lda #$f0
		sta brick0+0
;			lda chain_hundreds
;			bne :+
;				lda chain_tens
;				bne :+
;					lda #$00
;					sta chain_ones
;					beq :++
;:
;			lda #$01
;			sta set_do_chain
		lda set_do_chain
		beq :+
		lda #<loop_chain
		sta loop_pointer+0
		lda #>loop_chain
		sta loop_pointer+1
		lda #<nmi_chain
		sta nmi_pointer+0
		lda #>nmi_chain
		sta nmi_pointer+1
		jsr chain_write
		jmp end_nmi
:
		jsr chain_write
		lda #<loop_babelplay
		sta loop_pointer+0
		lda #>loop_babelplay
		sta loop_pointer+1
		lda #<nmi_babelplay
		sta nmi_pointer+0
		lda #>nmi_babelplay
		sta nmi_pointer+1
	jmp end_nmi

brick_lt0_y:
	.byte $6f,$67,$5f,$57,$4f,$47,$3f,$37,$2f,$2f,$2f,$2f,$2f
brick_lt0_x:
	.byte $00,$08,$10,$18,$20,$28,$30,$38,$40,$48,$50,$58,$60
brick_rt0_y:
	.byte $6f,$67,$5f,$57,$4f,$47,$3f,$37,$2f,$2f,$2f,$2f,$2f
brick_rt0_x:
	.byte $f0,$e8,$e0,$d8,$d0,$c8,$c0,$b8,$b0,$a8,$a0,$98,$90
brick_lt1_y:
	.byte $6f,$67,$5f,$57,$4f,$47,$3f,$37,$2f,$2f,$2f,$2f,$2f,$2f,$2f
brick_lt1_x:
	.byte $00,$08,$10,$18,$20,$28,$30,$38,$40,$48,$50,$58,$60,$68,$70
brick_rt1_y:
	.byte $6f,$67,$5f,$57,$4f,$47,$3f,$37,$2f,$2f,$2f,$2f,$2f,$2f,$2f
brick_rt1_x:
	.byte $f0,$e8,$e0,$d8,$d0,$c8,$c0,$b8,$b0,$a8,$a0,$98,$90,$88,$80

loop_brick_left0:
	ldx brick_move
	lda brick_lt0_y, x
	sta brick0+0
	lda brick_lt0_x, x
	sta brick0+3
	inx
	stx brick_move
	cpx #$0d
	bne not_move_down
		jmp drops_sfx
rtn_drops_sfx:
		lda #$00
		sta brick_move
		lda #<loop_brick_down
		sta loop_pointer+0
		lda #>loop_brick_down
		sta loop_pointer+1
not_move_down:
	jsr tie_brick
	jmp end_loop

loop_brick_right0:
	ldx brick_move
	lda brick_rt0_y, x
	sta brick0+0
	lda brick_rt0_x, x
	sta brick0+3
	inx
	stx brick_move
	cpx #$0d
	bne :+
		jmp drops_sfx
		lda #$00
		sta brick_move
		lda #<loop_brick_down
		sta loop_pointer+0
		lda #>loop_brick_down
		sta loop_pointer+1
:
	jsr tie_brick
	jmp end_loop

loop_brick_left1:
	ldx brick_move
	lda brick_lt1_y, x
	sta brick0+0
	lda brick_lt1_x, x
	sta brick0+3
	inx
	stx brick_move
	cpx #$0f
	bne :+
		jmp drops_sfx
		lda #$00
		sta brick_move
		lda #<loop_brick_down
		sta loop_pointer+0
		lda #>loop_brick_down
		sta loop_pointer+1
:
	jsr tie_brick
	jmp end_loop

loop_brick_right1:
	ldx brick_move
	lda brick_rt1_y, x
	sta brick0+0
	lda brick_rt1_x, x
	sta brick0+3
	inx
	stx brick_move
	cpx #$0f
	bne :+
		jmp drops_sfx
		lda #$00
		sta brick_move
		lda #<loop_brick_down
		sta loop_pointer+0
		lda #>loop_brick_down
		sta loop_pointer+1
:
	jsr tie_brick
	jmp end_loop


clear_for_next:
		lda #$00
		sta bubble0+1
		sta bubble1+1
		sta bubble2+1
		sta bubble3+1
		ldx #$00
		txa
:		sta word_base, x
		sta word_b, x
		sta word_a, x
		inx
		cpx #13
		bne :-
		lda #$00
		sta b_or_a
		sta check_b+1
		sta check_a+1
		lda guy0_0+0
		cmp #$2e
		bne :+
			lda #$f0
			sta guy0_0+0
			sta guy0_1+0
			sta guy0_2+0
			sta guy0_3+0
:		lda guy1_0+0
		cmp #$2e
		bne :+
			lda #$f0
			sta guy1_0+0
			sta guy1_1+0
			sta guy1_2+0
			sta guy1_3+0
:	rts


do_score:
	lda #$20
	sta $2006
	lda #$94
	sta $2006
	lda score_ten_millions
	bne :+
		lda #$02
		sta $2007
		bne :++
:	clc
	adc #$80
	sta $2007
:	lda score_millions
	bne :+
		lda score_ten_millions
		bne :+
			lda #$02
			sta $2007
			sta $2007
			bne :++
:	lda score_millions		
	clc
	adc #$80
	sta $2007
	lda #$90
	sta $2007
:	lda score_hun_thousands
	bne :+
		lda score_millions
		bne :+
			lda score_ten_millions
			bne :+
				lda #$02
				sta $2007
				bne :++
:	lda score_hun_thousands
	clc
	adc #$80
	sta $2007
:	lda score_ten_thousands
	bne :+
		lda score_hun_thousands
		bne :+
			lda score_millions
			bne :+
				lda score_ten_millions
				bne :+
					lda #$02
					sta $2007
					bne :++
:	lda score_ten_thousands
	clc
	adc #$80
	sta $2007
:	lda score_thousands
	bne :+
		lda score_ten_thousands
		bne :+
			lda score_hun_thousands
			bne :+
				lda score_millions
				bne :+
					lda score_ten_millions
					bne :+
						lda #$02
						sta $2007
						sta $2007
						bne :++
:	lda score_thousands
	clc
	adc #$80
	sta $2007
	lda #$90
	sta $2007
:	lda score_hundreds
	bne :+
		lda score_thousands
		bne :+
			lda score_ten_thousands
			bne :+
				lda score_hun_thousands
				bne :+
					lda score_millions
					bne :+
						lda score_ten_millions
						bne :+
							lda #$02
							sta $2007
							bne :++
:	lda score_hundreds
	clc
	adc #$80
	sta $2007
:	lda score_tens
	bne :+
		lda score_hundreds
		bne :+
			lda score_thousands
			bne :+
				lda score_ten_thousands
				bne :+
					lda score_hun_thousands
					bne :+
						lda score_millions
						bne :+
							lda score_ten_millions
							bne :+
								lda #$02
								sta $2007
								bne :++
:	lda score_tens
	clc
	adc #$80
	sta $2007
:	lda score_ones
	clc
	adc #$80
	sta $2007
	rts


chain_write:
	lda #$22
	sta $2006
	lda #$bb
	sta $2006
	lda chain_hundreds
	bne :+
		lda #$02
		sta $2007
		bne :++
:	clc
	adc #$80
	sta $2007
:	lda chain_tens
	bne :+
		lda chain_hundreds
		bne :+
			lda #$02
			sta $2007
			bne :++
:	lda chain_tens
	clc
	adc #$80
	sta $2007
:	lda chain_ones
	clc
	adc #$80
	sta $2007
	rts

loop_correct:
	dec correct_wait
	bne :+
		lda #$01
		sta chain_ones_add
		sta blocks_ones_add
		jsr add_blocks
		jsr add_chain
		jsr add_score
		jsr clear_for_next
		lda #<loop_babelplay
		sta loop_pointer+0
		lda #>loop_babelplay
		sta loop_pointer+1
		lda #<nmi_basic_score
		sta nmi_pointer+0
		lda #>nmi_basic_score
		sta nmi_pointer+1
:
	jmp end_loop
nmi_basic_score:
	jsr do_score
		lda #<nmi_blockcount
		sta nmi_pointer+0
		lda #>nmi_blockcount
		sta nmi_pointer+1
	jmp end_nmi


write_blocks:
	lda #$23
	sta $2006
	lda #$1b
	sta $2006
	lda blocks_hundreds
	bne :+
		lda #$02
		sta $2007
		bne :++
:	clc
	adc #$80
	sta $2007
:	lda blocks_tens
	bne :+
		lda blocks_hundreds
		bne :+
			lda #$02
			sta $2007
			bne :++
:	lda blocks_tens
	clc
	adc #$80
	sta $2007
:	lda blocks_ones
	clc
	adc #$80
	sta $2007
	rts

nmi_blockcount:
	jsr write_blocks
	jsr chain_write

		lda #<nmi_babelplay
		sta nmi_pointer+0
		lda #>nmi_babelplay
		sta nmi_pointer+1
	jmp end_nmi
loop_brick_down:
	ldx brick_offset
	lda brick0+0
	cmp slots_y_stop, x
	bne not_yet_set_brick
		jmp brick_sfx
rtn_brick_sfx:
		lda #<loop_nothing
		sta loop_pointer+0
		lda #>loop_nothing
		sta loop_pointer+1
		lda #<nmi_brick_set
		sta nmi_pointer+0
		lda #>nmi_brick_set
		sta nmi_pointer+1
		jsr clear_for_next
		jmp end_loop
not_yet_set_brick:
	lda brick0+0
	clc
	adc #$08
	sta brick0+0

	jsr tie_brick
	jmp end_loop

tie_guys:
	lda guy0_0+0
	sta guy0_1+0
	clc
	adc #$08
	sta guy0_2+0
	sta guy0_3+0
	lda guy0_0+3
	sta guy0_2+3
	clc
	adc #$08
	sta guy0_1+3
	sta guy0_3+3

	lda guy1_0+0
	sta guy1_1+0
	clc
	adc #$08
	sta guy1_2+0
	sta guy1_3+0
	lda guy1_0+3
	sta guy1_2+3
	clc
	adc #$08
	sta guy1_1+3
	sta guy1_3+3
	rts
tie_brick:
	lda brick0+0
	sta brick1+0
	clc
	adc #$08
	sta brick2+0
	sta brick3+0
	lda brick0+3
	sta brick2+3
	clc
	adc #$08
	sta brick1+3
	sta brick3+3
	rts

run_rt0:
.byte $e8,$e9,$f8,$f9
.byte <run_rt1,>run_rt1
run_rt1:
.byte $ea,$eb,$fa,$fb
.byte <run_rt2,>run_rt2
run_rt2:
.byte $e6,$e7,$f6,$f7
.byte <run_rt3,>run_rt3
run_rt3:
.byte $ea,$eb,$fa,$fb
.byte <run_rt0,>run_rt0

run_lt0:
.byte $e2,$e3,$f2,$f3
.byte <run_lt1,>run_lt1
run_lt1:
.byte $e0,$e1,$f0,$f1
.byte <run_lt2,>run_lt2
run_lt2:
.byte $e4,$e5,$f4,$f5
.byte <run_lt3,>run_lt3
run_lt3:
.byte $e0,$e1,$f0,$f1
.byte <run_lt0,>run_lt0

climb0:
.byte $ee,$ef,$fe,$ff
.byte <climb1,>climb1
climb1:
.byte $ec,$ed,$fc,$fd
.byte <climb0,>climb0
stand0:
.byte $e0,$e1,$f0,$f1
.byte <stand0,>stand0
stand1:
.byte $ea,$eb,$fa,$fb
.byte <stand1,>stand1


guys_anim_lo:
	.byte <stand1
	.byte <run_rt0, <run_rt0, <run_lt0, <run_lt0, <climb0
	.byte <climb0, <stand0, <stand0, <stand0
guys_anim_hi:
	.byte >stand1
	.byte >run_rt0, >run_rt0, >run_lt0, >run_lt0, >climb0
	.byte >climb0, >stand0, >stand0, >stand0
guy0_anim:
	lda guy0_state
	bmi @skip_init
		tay
		lda guys_anim_lo, y
		sta guy0_anim_addy+0
		lda guys_anim_hi, y
		sta guy0_anim_addy+1
		lda guy0_state
		eor #$80
		sta guy0_state
@skip_init:
	jsr guy0_load
	dec guy0_count
	rts
guy0_load:
	ldy #$00
	lda (guy0_anim_addy), y
	sta guy0_0+1
	iny
	lda (guy0_anim_addy), y
	sta guy0_1+1
	iny
	lda (guy0_anim_addy), y
	sta guy0_2+1
	iny
	lda (guy0_anim_addy), y
	sta guy0_3+1

	lda guy0_count
	bne :+
		iny
		lda (guy0_anim_addy), y
		sta temp_addy+0
		iny
		lda (guy0_anim_addy), y
		sta temp_addy+1

		lda temp_addy+0
		sta guy0_anim_addy+0
		lda temp_addy+1
		sta guy0_anim_addy+1
		lda #$08
		sta guy0_count
:	rts



guy1_anim:
	lda guy1_state
	bmi @skip_init
		tay
		lda guys_anim_lo, y
		sta guy1_anim_addy+0
		lda guys_anim_hi, y
		sta guy1_anim_addy+1
		lda guy1_state
		eor #$80
		sta guy1_state
@skip_init:
	jsr guy1_load
	dec guy1_count
	rts
guy1_load:
	ldy #$00
	lda (guy1_anim_addy), y
	sta guy1_0+1
	iny
	lda (guy1_anim_addy), y
	sta guy1_1+1
	iny
	lda (guy1_anim_addy), y
	sta guy1_2+1
	iny
	lda (guy1_anim_addy), y
	sta guy1_3+1

	lda guy1_count
	bne :+
		iny
		lda (guy1_anim_addy), y
		sta temp_addy+0
		iny
		lda (guy1_anim_addy), y
		sta temp_addy+1

		lda temp_addy+0
		sta guy1_anim_addy+0
		lda temp_addy+1
		sta guy1_anim_addy+1
		lda #$08
		sta guy1_count
:	rts




lvl_ones:
.byte $70,$71,$72,$73,$74,$75,$76,$77,$78,$79
.byte $70,$71,$72,$73,$74,$75,$76,$77,$78,$79
.byte $70,$71,$72,$73,$74,$75,$76,$77,$78,$79
.byte $70,$71,$72,$73,$74,$75,$76,$77,$78,$79
.byte $70,$71,$72,$73,$74,$75,$76,$77,$78,$79
.byte $70
lvl_tens:
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00
.byte $71,$71,$71,$71,$71,$71,$71,$71,$71,$71
.byte $72,$72,$72,$72,$72,$72,$72,$72,$72,$72
.byte $73,$73,$73,$73,$73,$73,$73,$73,$73,$73
.byte $74,$74,$74,$74,$74,$74,$74,$74,$74,$74
.byte $75

move00_lo:
.byte $60,$80,$a0,$c0,$e0
.byte $00,$20,$40,$60,$80,$a0,$c0,$e0, $00,$20,$40,$60,$80,$a0,$c0,$e0
.byte $00,$20,$40,$60,$80,$a0,$c0,$e0, $00,$20,$40,$60,$80,$a0,$c0,$e0
.byte $00,$40,$80,$c0, $00,$40,$80,$c0
move00_hi:
.byte $00,$00,$00,$00,$00
.byte $01,$01,$01,$01,$01,$01,$01,$01, $02,$02,$02,$02,$02,$02,$02,$02
.byte $03,$03,$03,$03,$03,$03,$03,$03, $04,$04,$04,$04,$04,$04,$04,$04
.byte $05,$05,$05,$05, $06,$06,$06,$06

move0_jumper:
	lda guy0_state
	and #$0f
	asl a
	tay
	lda move_jump_table+1, y
	pha
	lda move_jump_table+0, y
	pha
	rts
move1_jumper:
	lda guy1_state
	and #$0f
	asl a
	tay
	lda move_jump_table+1, y
	pha
	lda move_jump_table+0, y
	pha
	rts

move_jump_table:
	.addr move_rt_not-1
	.addr move_rt_bot-1, move_rt_top-1, move_lt_bot-1, move_lt_top-1, move_up_ltside-1
	.addr move_up_rtside-1, move_rt_stand-1, move_lt_stand-1, move_lt_not-1
move_rt_not:
	rts
move_rt_bot:
	lda guy0_0+3
	cmp #$50
	bcc :+
		lda #$00
		sta speed_up_rt
		sta speed_up_lt
		lda #$50
		sta guy0_0+3
		lda #$05
		sta guy0_state
		lda #$00
		sta words_present
		lda guy0_0+2
		sta correct_offset
		jmp get_words
rtn_get_words:
		rts
:	lda guy0x_lo
	clc
	adc move00_lo, x
	sta guy0x_lo
	lda guy0_0+3
	adc move00_hi, x
	sta guy0_0+3
	adc speed_up_lt
	sta guy0_0+3
	rts
move_rt_top:
	lda guy0_0+3
	cmp #$78
	bcc :+
		lda #$07
		sta guy0_state
		rts
:	lda guy0x_lo
	clc
	adc move00_lo, x
	sta guy0x_lo
	lda guy0_0+3
	adc move00_hi, x
	sta guy0_0+3
	adc speed_up_lt
	sta guy0_0+3
	rts
move_lt_bot:
	lda guy1_0+3
	cmp #$a0
	bcs :+
		lda #$00
		sta speed_up_lt
		sta speed_up_rt
		lda #$a0
		sta guy1_0+3
		lda #$06
		sta guy1_state
				lda #$00
				sta words_present
		lda guy1_0+2
				sta correct_offset
		jmp get_words1
rtn_get_words1:
		rts
:	lda guy1x_lo
	sec
	sbc move00_lo, x
	sta guy1x_lo
	lda guy1_0+3
	sbc move00_hi, x
	sta guy1_0+3
	sbc speed_up_rt
	sta guy1_0+3
	rts
move_lt_top:
	lda guy1_0+3
	cmp #$78
	bcs :+
		lda #$08
		sta guy1_state
		rts
:	lda guy1x_lo
	sec
	sbc move00_lo, x
	sta guy1x_lo
	lda guy1_0+3
	sbc move00_hi, x
	sta guy1_0+3
	sbc speed_up_rt
	sta guy1_0+3
	rts
move_up_ltside:
	lda guy0_0+0
	cmp #$2e
	bcs :+
		lda #$2e
		sta guy0_0+0
		lda #$02
		sta guy0_state
		rts
:	lda guy0x_lo
	sec
	sbc move00_lo, x
	sta guy0x_lo
	lda guy0_0+0
	sbc move00_hi, x
	sta guy0_0+0
	sbc speed_up_lt
	sta guy0_0+0
	rts
move_up_rtside:
	lda guy1_0+0
	cmp #$2e
	bcs :+
		lda #$2e
		sta guy1_0+0
		lda #$04
		sta guy1_state
		rts
:	lda guy1x_lo
	sec
	sbc move00_lo, x
	sta guy1x_lo
	lda guy1_0+0
	sbc move00_hi, x
	sta guy1_0+0
	sbc speed_up_rt
	sta guy1_0+0
	rts
move_rt_stand:
	lda #$00
	sta speed_up_lt
	lda check_b+1
	cmp #$c9
	bne :+
		jmp :++
:	lda check_a+1
	cmp #$c9
	bne :++
:		lda #$cd
		sta bubble0+1
		lda #$ce
		sta bubble1+1
		lda #$d8
		sta bubble2+1
		lda #$d9
		sta bubble3+1
		lda #$20
		sta correct_wait
		lda #$00
		sta guy0_state
		inc level_change
				lda #$01
				sta words_present
		lda #<loop_correct
		sta loop_pointer+0
		lda #>loop_correct
		sta loop_pointer+1
		lda #$00
		sta notice0+1
		sta notice1+1
		rts
:
	lda #$cf
	sta bubble0+1
	lda #$d0
	sta bubble1+1
		lda #$d8
		sta bubble2+1
		lda #$d9
		sta bubble3+1
	lda #$00
	sta guy0_state
				lda #$01
				sta words_present
	jmp climb_sfx
		ldx brick_offset
		lda slots_brick_lo, x
		sta loop_pointer+0
		lda slots_brick_hi, x
		sta loop_pointer+1
	
	rts
move_lt_stand:
	lda #$00
	sta speed_up_rt
	lda check_b+1
	cmp #$c9
	bne :+
		jmp :++
:	lda check_a+1
	cmp #$c9
	bne :++
:		lda #$cd
		sta bubble0+1
		lda #$ce
		sta bubble1+1
		lda #$d8
		sta bubble2+1
		lda #$d9
		sta bubble3+1
		lda #$20
		sta correct_wait
		lda #$09
		sta guy1_state
		inc level_change
				lda #$01
				sta words_present
		lda #<loop_correct
		sta loop_pointer+0
		lda #>loop_correct
		sta loop_pointer+1
		lda #$00
		sta notice0+1
		sta notice1+1
		rts
:
	lda #$cf
	sta bubble0+1
	lda #$d0
	sta bubble1+1
		lda #$d8
		sta bubble2+1
		lda #$d9
		sta bubble3+1
	lda #$09
	sta guy1_state
				lda #$01
				sta words_present
	jmp climb_sfx
rtn_climb_sfx:
		ldx brick_offset
		lda slots_brick_lo, x
		sta loop_pointer+0
		lda slots_brick_hi, x
		sta loop_pointer+1
							lda #$00
					sta chain_ones
					sta chain_tens
					sta chain_hundreds
	rts
move_lt_not:
	
	rts




loop_chain:
	jmp chain_sfx
rtn_chain_sfx:
	lda #$d1
	sta notice0+1
	lda #$d2
	sta notice1+1
	lda #$01
	sta chain_ones_add
	lda chain_ones
	sec
	sbc chain_ones_add
	sta chain_ones
	cmp #$ff
	bne @do_tens
	lda #$09
	sta chain_ones
	dec chain_tens
@do_tens:
	lda chain_tens
	sec
	sbc chain_tens_add
	sta chain_tens
	cmp #$ff
	bne @do_hundreds
	lda #$09
	sta chain_tens
	dec chain_hundreds
@do_hundreds:
	lda chain_hundreds
	sec
	sbc chain_hundreds_add
	sta chain_hundreds
	lda #$00
	sta chain_ones_add
	sta chain_tens_add
	sta chain_hundreds_add
	lda #$01
	sta score_thousands_add
	jmp end_loop
nmi_chain:
	jsr chain_write

		lda #<loop_chain_score
		sta loop_pointer+0
		lda #>loop_chain_score
		sta loop_pointer+1
		lda #<nmi_chain_score
		sta nmi_pointer+0
		lda #>nmi_chain_score
		sta nmi_pointer+1
	jmp end_nmi

loop_chain_score:
	lda #$00
	sta notice0+1
	lda #$00
	sta notice1+1
	lda #$da
	sta chain0+1
	lda #$db
	sta chain1+1
	jsr add_score
	jmp end_loop
nmi_chain_score:
	jsr do_score
	lda chain_hundreds
	bne :+
		lda chain_tens
		bne :+
			lda chain_ones
			bne :+
				lda #<loop_babelplay
				sta loop_pointer+0
				lda #>loop_babelplay
				sta loop_pointer+1
				lda #<nmi_babelplay
				sta nmi_pointer+0
				lda #>nmi_babelplay
				sta nmi_pointer+1
				jmp end_nmi
:
		lda #<loop_chain
		sta loop_pointer+0
		lda #>loop_chain
		sta loop_pointer+1
		lda #<nmi_chain
		sta nmi_pointer+0
		lda #>nmi_chain
		sta nmi_pointer+1
	jmp end_nmi



do_final_score:
	lda final_score+0
	cmp #$30
	bne :+
		lda #$00
		sta $2007
		beq :++
:	sta $2007
:	lda final_score+1
	cmp #$30
	bne :+
		lda final_score+0
		cmp #$30
		bne :+
			lda #$00
			sta $2007
			sta $2007
			beq :++
:	lda final_score+1	
	sta $2007
	lda #$3c
	sta $2007
:	lda final_score+2
	cmp #$30
	bne :+
		lda final_score+1
		cmp #$30
		bne :+
			lda final_score+0
			cmp #$30
			bne :+
				lda #$00
				sta $2007
				beq :++
:	lda final_score+2
	sta $2007
:	lda final_score+3
	cmp #$30
	bne :+
		lda final_score+2
		cmp #$30
		bne :+
			lda final_score+1
			cmp #$30
			bne :+
				lda final_score+0
				cmp #$30
				bne :+
					lda #$00
					sta $2007
					beq :++
:	lda final_score+3
	sta $2007
:	lda final_score+4
	cmp #$30
	bne :+
		lda final_score+3
		cmp #$30
		bne :+
			lda final_score+2
			cmp #$30
			bne :+
				lda final_score+1
				cmp #$30
				bne :+
					lda final_score+0
					cmp #$30
					bne :+
						lda #$00
						sta $2007
						sta $2007
						beq :++
:	lda final_score+4
	sta $2007
	lda #$3c
	sta $2007
:	lda final_score+5
	cmp #$30
	bne :+
		lda final_score+4
		cmp #$30
		bne :+
			lda final_score+3
			cmp #$30
			bne :+
				lda final_score+2
				cmp #$30
				bne :+
					lda final_score+1
					cmp #$30
					bne :+
						lda final_score+0
						cmp #$30
						bne :+
							lda #$00
							sta $2007
							beq :++
:	lda final_score+5
	sta $2007
:	lda final_score+6
	cmp #$30
	bne :+
		lda final_score+5
		cmp #$30
		bne :+
			lda final_score+4
			cmp #$30
			bne :+
				lda final_score+3
				cmp #$30
				bne :+
					lda final_score+2
					cmp #$30
					bne :+
						lda final_score+1
						cmp #$30
						bne :+
							lda final_score+0
							cmp #$30
							bne :+
								lda #$00
								sta $2007
								beq :++
:	lda final_score+6
	sta $2007
:	lda final_score+7
	sta $2007
	rts



loop_waitplay:
	lda temp_8bit_4
	cmp #$01
	bne rtn_game_song_tune
		jmp game_song_jumper
rtn_game_song_tune:
	jmp end_loop
nmi_waitplay:
	dec temp_8bit_4
	lda #$22
	sta $2006
	lda #$0d
	sta $2006
	ldy #$00
:	lda ready_word, y
	sta $2007
	iny
	cpy #6
	bne :-
	lda temp_8bit_4
	bne :++

	lda #$22
	sta $2006
	lda #$0d
	sta $2006
	ldy #$00
:	lda wipe_ready_word, y
	sta $2007
	iny
	cpy #6
	bne :-
	
	lda #<loop_babelplay
	sta loop_pointer+0
	lda #>loop_babelplay
	sta loop_pointer+1
	lda #<nmi_babelplay
	sta nmi_pointer+0
	lda #>nmi_babelplay
	sta nmi_pointer+1
:
	jmp end_nmi

ready_word:
.byte "READY!"
wipe_ready_word:
.byte $21,$22,$23,$20,$21,$22


chain_sprites:
	lda chain_hundreds
	bne :+
		lda chain_tens
		bne :+
			lda chain_ones
			bne :+
				lda #$00
				sta chain0+1
				sta chain1+1
				jmp zero_chain
:
		lda chain_tens
		bne :+
			lda chain_hundreds
			bne :+
			lda #$dd
			sta chain0+1
			sta chain1+1
			jmp zero_chain
:
	lda #$dd
	sta chain0+1
	lda #$de
	sta chain1+1
	ldx chain_shake
	cpx #16
	bne :+
		ldx #$00
		stx chain_shake
:
	lda chain0+0
	clc
	adc chain_y, x
	sta chain0+0
	sta chain1+0
	lda chain0+3
	clc
	adc chain_x, x
	sta chain0+3
	clc
	adc #$08
	sta chain1+3
	inx
	stx chain_shake
zero_chain:
	rts




