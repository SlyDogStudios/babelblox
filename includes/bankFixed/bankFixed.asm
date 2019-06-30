.segment "BANKFIXED"
reset:
	sei
	ldx #$00
	stx $4015
	ldx #$40
	stx $4017
	ldx #$ff
	txs
	inx
	stx $2000
	stx reg2000save
	stx $2001
	stx reg2001save

:	lda #$00
	sta $000, x
	sta $100, x
	sta $300, x
	sta $400, x
	sta $500, x
	sta $600, x
	sta $700, x
	lda #$f0
	sta $200, x
	inx
	bne :-

	ldx #$02
:	bit $2002
	bpl :-
:	bit $2002
	bmi :-
	dex
	bne :--

	ldy #14
	jsr bankswitch

		jsr load_saved_into_ram

	ldy #00
	jsr bankswitch


	lda #$04
	sta seed
	lda #$23
	sta seed2
	lda #$46
	sta seed3
	lda #$d2
	sta seed4


	jmp title_start

rtn_from_save:
loop:
	jmp (loop_pointer)
end_loop:
	jsr do_random_set
	jsr nmi_wait
	jmp loop

jmp_for_play:
	ldy #12
	jsr bank_save
	lda #$20
	sta nametable
;	jsr vblank_wait
;	jsr vblank_wait
;	jsr PPU_with_sprites
	lda #%10010000
	sta $2000
	sta reg2000save
	lda #%00011010
	sta $2001
	sta reg2001save
	jmp loop_waitplay


save_options_jumper:
	ldy #14
	jsr bankswitch
	lda #$00
	sta $2000
	sta reg2000save
	sta $2001
	sta reg2001save
	jmp loop_save_options
rtn_from_saving_options:
	ldy #0
	jsr bankswitch
	lda #$00
	sta $2005
	sta $2005
	jsr PPU_with_sprites
	jsr nmi_wait

	ldx #$00
:	lda babeltitle_pal, x
	sta pal_address, x
	inx
	cpx #$20
	bne :-

	jmp loop_option



save_scores_jumper:
	ldy #14
	jsr bankswitch
	lda #$00
	sta $2000
	sta reg2000save
	sta $2001
	sta reg2001save
	jmp loop_save
rtn_from_saving_score:
	ldy #0
	jsr bankswitch
	lda #$00
	sta $2005
	sta $2005
	lda #%10010000
	sta $2000
	sta reg2000save
	lda #%00011010
	sta $2001
	sta reg2001save
		lda #<loop_done
		sta loop_pointer+0
		lda #>loop_done
		sta loop_pointer+1
		lda #<nmi_done
		sta nmi_pointer+0
		lda #>nmi_done
		sta nmi_pointer+1
	jsr nmi_wait
		lda #$0f
		sta pal_address+0
		sta pal_address+16
		lda #$30
		sta pal_address+3
		sta pal_address+27
		sta pal_address+7
		lda #$10
		sta pal_address+02
;	jmp end_loop
	jmp loop_done


initial_options:
.byte $00,$04,$02,$05,$01, $00, $12,$0c,$01, $00



nmi:
	pha								; Save the registers
	txa								;
	pha								;
	tya								;
	pha								;

	inc nmi_num						; Increase every NMI

	lda $2002

	lda #$00						; Do sprite transfer
	sta $2003						;
	lda #$02						;
	sta $4014						;

	lda #$3f						; Set the hi-byte address for the PPU
	sta $2006						; Store it
	ldx #$00						; Set the lo-byte address for the PPU
	stx $2006						; Store it
	lda pal_address+0
	sta $2007
	lda pal_address+1
	sta $2007
	lda pal_address+2
	sta $2007
	lda pal_address+3
	sta $2007
	lda pal_address+4
	sta $2007
	lda pal_address+5
	sta $2007
	lda pal_address+6
	sta $2007
	lda pal_address+7
	sta $2007
	lda pal_address+8
	sta $2007
	lda pal_address+9
	sta $2007
	lda pal_address+10
	sta $2007
	lda pal_address+11
	sta $2007
	lda pal_address+12
	sta $2007
	lda pal_address+13
	sta $2007
	lda pal_address+14
	sta $2007
	lda pal_address+15
	sta $2007
	lda pal_address+16
	sta $2007
	lda pal_address+17
	sta $2007
	lda pal_address+18
	sta $2007
	lda pal_address+19
	sta $2007
	lda pal_address+20
	sta $2007
	lda pal_address+21
	sta $2007
	lda pal_address+22
	sta $2007
	lda pal_address+23
	sta $2007
	lda pal_address+24
	sta $2007
	lda pal_address+25
	sta $2007
	lda pal_address+26
	sta $2007
	lda pal_address+27
	sta $2007
	lda pal_address+28
	sta $2007
	lda pal_address+29
	sta $2007
	lda pal_address+30
	sta $2007
	lda pal_address+31
	sta $2007

	jmp (nmi_pointer)					; 
end_nmi:
	lda nametable
	sta $2006
	lda #$00
	sta $2006
	lda scroll_x
	sta $2005
	lda scroll_y
	sta $2005

	ldx #$01
	stx $4016
	dex
	stx $4016
	lda control_pad
	sta control_old
	ldx #$08
:	lda $4016
	lsr A
	ror control_pad
	dex
	bne :-

	ldy #13
	jsr bankswitch
	jsr music_play
	ldy bank
	jsr bankswitch

	pla								; Restore the registers
	tay								;
	pla								;
	tax								;
	pla								;
irq:
	rti


test_highest_npc:
	lda #$00
	sta both_same
	lda guy0_0+0
	cmp guy1_0+0
	bcc @left_guy
		lda #$04
		sta speed_up_rt
		lda guy1_0+0
		cmp #$a0
		bcs :++
			cmp #$90
			bcs :+++
				cmp #$80
				bcs :++++
					cmp #$70
					bcs :+++++
						cmp #$60
						bcs :++++++
							jmp :+
@left_guy:
	lda #$04
	sta speed_up_lt
	lda guy0_0+0
	cmp #$a0
	bcs :++
		cmp #$90
		bcs :+++
			cmp #$80
			bcs :++++
				cmp #$70
				bcs :+++++
					cmp #$60
					bcs :++++++
:						lda #$01
						sta score_tens_add
						lda #$d6
						sta notice0+1
						lda #$d7
						sta notice1+1
						rts
:	lda #$05
	sta score_hundreds_add
	lda #$d3
	sta notice0+1
	lda #$d2
	sta notice1+1
	rts
:	lda #$02
	sta score_hundreds_add
	lda #$05
	sta score_tens_add
	lda #$d5
	sta notice0+1
	lda #$d4
	sta notice1+1
	rts
:	lda #$01
	sta score_hundreds_add
	lda #$d6
	sta notice0+1
	lda #$d2
	sta notice1+1
	rts
:	lda #$05
	sta score_hundreds_add;score_tens_add
	lda #$d3
	sta notice0+1
	lda #$d7
	sta notice1+1
	rts
:	lda #$02
	sta score_tens_add
	lda #$d5
	sta notice0+1
	lda #$d7
	sta notice1+1
	rts



loop_babelplay:


	jsr seed_inc


	lda brick_offset
	cmp #40
	bne :+
		jsr all_sprites_offscreen
		lda #$00
		sta temp_8bit_4
		ldy #13				; TURN ON PUSH START MUSIC HERE
		jsr bankswitch
		lda #$07
		jsr music_loadsong
		ldy bank
		jsr bank_save

		lda #<loop_endpause
		sta loop_pointer+0
		lda #>loop_endpause
		sta loop_pointer+1
		lda #<nmi_nothing
		sta nmi_pointer+0
		lda #>nmi_nothing
		sta nmi_pointer+1
		jmp end_loop
:

	lda level_change
	cmp #$0a
	bne :+
		lda #$00
		sta level_change
		inc level
:

	ldx level
	lda lvl_ones, x
	sta level_ones+1
	lda lvl_tens, x
	sta level_tens+1

	jsr chain_sprites

	lda set_do_chain
	beq :+
		lda #$00
		sta set_do_chain
		jmp rtn_from_chain
:

	lda words_present
	beq :+
		lda #$00
		sta both_same
		jmp not_words_yet
:
	lda check_b+1
	beq :+
		jmp not_words_yet
:	lda check_a+1
	beq :+
		jmp not_words_yet
:
	jsr words_same_test

	lda control_pad
	eor control_old
	and control_pad
	and #b_punch
	beq no_game_b_punch
		lda control_pad
		and #$f0
		bne :+
			jmp no_game_a_punch
:
		lda #$04
		sta speed_up_rt
		sta speed_up_lt
			ldx correct_offset		
		lda control_pad
		and #$f0	
			cmp direction_which, x
			bne :++
			lda both_same
			bne :+
			lda b_or_a
			cmp #$01
			bne :++
:				jsr test_highest_npc
				lda #$c9
				sta check_b+1
				lda #$03
				sta check_b+2
				jmp right_sfx	;jmp no_game_a_punch
:			lda #$ca
			sta check_b+1
			lda #$02
			sta check_b+2
;			lda chain_hundreds
;			bne :+
;				lda chain_tens
;				bne :+
					lda #$00
					sta chain_ones
					sta chain_tens
					sta chain_hundreds
;					beq :++
;:			lda #$01
;			sta set_do_chain
;	lda #$da
;	sta chain0+1
;	lda #$db
;	sta chain1+1
;:
	jmp wrong_sfx
rtn_wrong_sfx:
			bne no_game_a_punch
no_game_b_punch:

	lda control_pad
	eor control_old
	and control_pad
	and #a_punch
	beq no_game_a_punch
		lda control_pad
		and #$f0
		beq no_game_a_punch
		lda #$04
		sta speed_up_rt
		sta speed_up_lt
			ldx correct_offset
		lda control_pad
		and #$f0
			cmp direction_which, x
			bne :++
			lda both_same
			bne :+
			lda b_or_a
			cmp #$02
			bne :++
:				jsr test_highest_npc
				lda #$c9
				sta check_a+1
				lda #$03
				sta check_a+2
				jmp right_sfx	;bne no_game_a_punch
:			lda #$ca
			sta check_a+1
			lda #$02
			sta check_a+2
;			lda chain_hundreds
;			bne :+
;				lda chain_tens
;				bne :+
					lda #$00
					sta chain_ones
					sta chain_tens
					sta chain_hundreds
;					beq :++
;:			lda #$01
;			sta set_do_chain
;	lda #$da
;	sta chain0+1
;	lda #$db
;	sta chain1+1
;:
	jmp wrong_sfx
			bne no_game_a_punch
no_game_a_punch:
not_words_yet:


		jsr the_directions

no_game_control:
	lda control_pad
	and #$f0
	bne :+
		lda #$f0
		sta letter0+0
		sta letter1+0
		sta letter2+0
:


;	lda control_pad
;	eor control_old
;	and control_pad
;	and #select_punch
;	beq @no_select_punch
;		inc level
;@no_select_punch:

	lda guy0_state
	and #$0f
	bne @not_first_guy
		lda guy1_0+0
		cmp #$38
		bcs @not_first_guy
			ldx #$ff
:			inx
			lda seed2
			cmp random_first_num, x
			bcc :-
				lda random_first, x
				;sta correct_offset
				sta guy0_0+2
				sta guy0_1+2
				sta guy0_2+2
				sta guy0_3+2
				lda #$01
				sta guy0_state
				lda #$cf
				sta guy0_0+0
				lda #$00
				sta guy0_0+3
@not_first_guy:

	lda guy1_state
	and #$0f
	cmp #$09
	bcc @not_second_guy
		lda guy0_0+0
		cmp #$38
		bcs @not_second_guy
			ldx #$ff
:			inx
			lda seed3
			cmp random_first_num, x
			bcc :-
				lda random_second, x
				;sta correct_offset
				sta guy1_0+2
				sta guy1_1+2
				sta guy1_2+2
				sta guy1_3+2
				lda #$03
				sta guy1_state
				lda #$cf
				sta guy1_0+0
				lda #$f0
				sta guy1_0+3
@not_second_guy:


	ldx level
	jsr move0_jumper
	ldx level
	jsr move1_jumper
	jsr guy0_anim
	jsr guy1_anim
	jsr tie_guys
	jsr tie_brick



	lda control_pad
	eor control_old
	and control_pad
	and #select_punch
	beq :++
		
			lda chain_hundreds
			bne :+
				lda chain_tens
				bne :+
;					lda #$00
;					sta chain_ones
					beq :++
:			lda #$01
			sta set_do_chain
	lda #$da
	sta chain0+1
	lda #$db
	sta chain1+1
:



rtn_from_chain:
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
:

	lda control_pad
	eor control_old
	and control_pad
	and #start_punch
	bne :+
		jmp over_pause_rtn
:		lda #<loop_pause
		sta loop_pointer+0
		lda #>loop_pause
		sta loop_pointer+1
		lda #<nmi_pause
		sta nmi_pointer+0
		lda #>nmi_pause
		sta nmi_pointer+1
		lda #$24
		sta nametable
		lda #$0f
		sta pal_address+0
		sta pal_address+16
		lda #$30
		sta pal_address+3
		ldx #$00
:		lda arrow_up+0, x
		sta spr_save, x
		lda #$f0
		sta arrow_up+0, x
		inx
		inx
		inx
		inx
		bne :-
		ldx #$00
:		lda $300, x
		sta music_save, x
		inx
		bne :-
		ldy #13
		jsr bankswitch
		lda #$00
		jsr music_loadsong
		lda #$01
		jsr music_loadsfx
;		jsr music_stopsfx
		ldy bank
		jsr bank_save
;		jsr nmi_wait
;		jsr paused_music
;		jsr load_pause_music
		jmp over_pause_rtn
back_from_pause:
	lda #$20
	sta nametable
	lda #$21
	sta pal_address+0
	sta pal_address+16
	lda #$0f
	sta pal_address+3
		ldx #$00
:		lda spr_save, x
		sta arrow_up+0, x
		inx
		inx
		inx
		inx
		bne :-
		ldx #$00
:		lda music_save, x
		sta $300, x
		inx
		bne :-

over_pause_rtn:

	jmp end_loop


title_tune_jumper:
	ldy #13				; TURN ON TITLE SCREEN MUSIC HERE
	jsr bankswitch
	lda #$01
	jsr music_loadsong
	ldy bank
	jsr bank_save
	jmp rtn_title_tune
title_start_jumper:
	ldy #13				; TURN ON PUSH START MUSIC HERE
	jsr bankswitch
	lda #$02
	jsr music_loadsong
	ldy bank
	jsr bank_save
	jmp rtn_start_tune
game_intro_jumper:
	ldy #13				; TURN ON PUSH START MUSIC HERE
	jsr bankswitch
	lda #$03
	jsr music_loadsong
	ldy bank
	jsr bank_save
	jmp rtn_game_intro_tune
game_song_jumper:
	ldy #13				; TURN ON PUSH START MUSIC HERE
	jsr bankswitch
	lda #$04
	jsr music_loadsong
	ldy bank
	jsr bank_save
	jmp rtn_game_song_tune
chain_sfx:
	ldy #13				; TURN ON PUSH START MUSIC HERE
	jsr bankswitch
	lda #$03
	jsr music_loadsfx
	ldy bank
	jsr bank_save
	jmp rtn_chain_sfx
brick_sfx:
	ldy #13				; TURN ON PUSH START MUSIC HERE
	jsr bankswitch
	lda #$02
	jsr music_loadsfx
	ldy bank
	jsr bank_save
	jmp rtn_brick_sfx
wrong_sfx:
	ldy #13				; TURN ON PUSH START MUSIC HERE
	jsr bankswitch
	lda #$04
	jsr music_loadsfx
	ldy bank
	jsr bank_save
	jmp rtn_wrong_sfx
right_sfx:
	ldy #13				; TURN ON PUSH START MUSIC HERE
	jsr bankswitch
	lda #$05
	jsr music_loadsfx
	ldy bank
	jsr bank_save
	jmp rtn_wrong_sfx
drops_sfx:
	ldy #13				; TURN ON PUSH START MUSIC HERE
	jsr bankswitch
	lda #$06
	jsr music_loadsfx
	ldy bank
	jsr bank_save
	jmp rtn_drops_sfx
climb_sfx:
	ldy #13				; TURN ON PUSH START MUSIC HERE
	jsr bankswitch
	lda #$07
	jsr music_loadsfx
	ldy bank
	jsr bank_save
	jmp rtn_climb_sfx




chain_y:
.byte $02,$00,$00,$00,$ff,$00,$00,$00,$fe,$00,$00,$00,$01,$00,$00,$00
chain_x:
.byte $02,$00,$00,$00,$fe,$00,$00,$00,$01,$00,$00,$00,$ff,$00,$00,$00

loop_pause:
	lda control_pad
	eor control_old
	and control_pad
	and #start_punch
	beq :++
:		lda #<loop_babelplay
		sta loop_pointer+0
		lda #>loop_babelplay
		sta loop_pointer+1
		lda #<nmi_babelplay
		sta nmi_pointer+0
		lda #>nmi_babelplay
		sta nmi_pointer+1
		jmp back_from_pause
:
	lda control_pad
	and #b_punch
	beq :+
		lda control_pad
		and #a_punch
		beq :+
			lda #40
			sta brick_offset
			bne :--
:
	jmp end_loop
nmi_pause:

	jmp end_nmi




the_directions:

	lda control_pad
;	eor control_old
;	and control_pad
	and #up_punch
	beq @no_up_punch
		jsr do_random_set
		lda letter_grp0_0
		sta letter0+1
		lda letter_grp0_1
		sta letter1+1
		lda letter_grp0_2
		sta letter2+1
		lda #$8f
		sta letter0+0
		sta letter1+0
		sta letter2+0
		jmp @done_dirs
@no_up_punch:


	lda control_pad
;	eor control_old
;	and control_pad
	and #down_punch
	beq @no_down_punch
		jsr do_random_set
		lda letter_grp1_0
		sta letter0+1
		lda letter_grp1_1
		sta letter1+1
		lda letter_grp1_2
		sta letter2+1
		lda #$9f
		sta letter0+0
		sta letter1+0
		sta letter2+0
		jmp @done_dirs
@no_down_punch:


	lda control_pad
;	eor control_old
;	and control_pad
	and #left_punch
	beq @no_left_punch
		jsr do_random_set
		lda letter_grp2_0
		sta letter0+1
		lda letter_grp2_1
		sta letter1+1
		lda letter_grp2_2
		sta letter2+1
		lda #$af
		sta letter0+0
		sta letter1+0
		sta letter2+0
		jmp @done_dirs
@no_left_punch:


	lda control_pad
;	eor control_old
;	and control_pad
	and #right_punch
	beq @no_right_punch
		jsr do_random_set
		lda letter_grp3_0
		sta letter0+1
		lda letter_grp3_1
		sta letter1+1
		lda letter_grp3_2
		sta letter2+1
		lda #$bf
		sta letter0+0
		sta letter1+0
		sta letter2+0
		jmp @done_dirs
@no_right_punch:

@done_dirs:
	rts

random_first:
.byte $00,$01,$02,$03, $01,$03,$00,$02, $00,$02,$01,$03
random_second:
.byte $01,$00,$03,$02, $02,$00,$03,$01, $03,$01,$02,$00
random_first_num:
.byte 235,214,193,172, 151,130,109, 88,  67, 46, 25,  0

direction_which:
.byte $10,$20,$40,$80

lang_lo_lo:
.byte <eng_lo, <ger_lo, <fre_lo, <ita_lo, <spa_lo, <swa_lo, <jap_lo, <heb_lo, <grk_lo, <lat_lo
lang_lo_hi:
.byte >eng_lo, >ger_lo, >fre_lo, >ita_lo, >spa_lo, >swa_lo, >jap_lo, >heb_lo, >grk_lo, >lat_lo
lang_hi_lo:
.byte <eng_hi, <ger_hi, <fre_hi, <ita_hi, <spa_hi, <swa_hi, <jap_hi, <heb_hi, <grk_hi, <lat_hi
lang_hi_hi:
.byte >eng_hi, >ger_hi, >fre_hi, >ita_hi, >spa_hi, >swa_hi, >jap_hi, >heb_hi, >grk_hi, >lat_hi
lang_bank:
.byte $01,     $01,     $03,     $03,     $05,     $07,     $05,     $07,     $07,     $07

get_words1:
	jsr words_routine

	ldy #12
	jsr bankswitch
	jmp rtn_get_words1

get_words:
	jsr words_routine

	ldy #12
	jsr bankswitch
	jmp rtn_get_words



words_routine:
	lda seed
	sta word_offset

	lda base_offset
	tay
	lda lang_bank, y
	tay
	jsr bankswitch

	lda base_offset
	tay
	lda lang_lo_lo, y
	sta temp_addy+0
	lda lang_lo_hi, y
	sta temp_addy+1
	lda lang_hi_lo, y
	sta temp_addy2+0
	lda lang_hi_hi, y
	sta temp_addy2+1
	ldy word_offset
	lda (temp_addy), y
	sta temp_addy+0
	lda (temp_addy2), y
	sta temp_addy+1

	ldy #$00
:	lda (temp_addy), y
	sta word_base, y
	iny
	cpy #13
	bne :-


	ldx correct_offset
	lda up_offset, x
	tay
	lda lang_bank, y
	tay
	jsr bankswitch

	lda up_offset, x
	tay
	lda lang_lo_lo, y
	sta temp_addy+0
	lda lang_lo_hi, y
	sta temp_addy+1
	lda lang_hi_lo, y
	sta temp_addy2+0
	lda lang_hi_hi, y
	sta temp_addy2+1
	ldy word_offset
	lda (temp_addy), y
	sta temp_addy+0
	lda (temp_addy2), y
	sta temp_addy+1

	lda nmi_num
	cmp #$80
	bcc @do_b
		ldy #$00
:		lda (temp_addy), y
		sta word_a, y
		iny
		cpy #13
		bne :-
		lda #$02
		sta b_or_a
		jmp @done_word1
@do_b:
	ldy #$00
:	lda (temp_addy), y
	sta word_b, y
	iny
	cpy #13
	bne :-
	lda #$01
	sta b_or_a
@done_word1:
	ldx #$ff
:	inx
	lda seed4
	cmp random_wrong, x
	bcc :-
		jsr wrong_word

	lda up_offset, x
	tay
	lda lang_bank, y
	tay
	jsr bankswitch

	lda up_offset, x
	tay
	lda lang_lo_lo, y
	sta temp_addy+0
	lda lang_lo_hi, y
	sta temp_addy+1
	lda lang_hi_lo, y
	sta temp_addy2+0
	lda lang_hi_hi, y
	sta temp_addy2+1
	ldy word_offset
	lda (temp_addy), y
	sta temp_addy+0
	lda (temp_addy2), y
	sta temp_addy+1

	lda b_or_a
	cmp #$02
	beq :++
		ldy #$00
:		lda (temp_addy), y
		sta word_a, y
		iny
		cpy #13
		bne :-
		jmp @all_done
:
	ldy #$00
:	lda (temp_addy), y
	sta word_b, y
	iny
	cpy #13
	bne :-
@all_done:
	rts

wrong_word:
	lda correct_offset
	asl a
	tay
	lda wrong_table+1, y
	pha
	lda wrong_table+0, y
	pha
	rts
wrong_table:
	.addr do_zero-1, do_one-1, do_two-1, do_three-1
do_zero:
	lda zero_is_right, x
	tax
	rts
do_one:
	lda one_is_right, x
	tax
	rts
do_two:
	lda two_is_right, x
	tax
	rts
do_three:
	lda three_is_right, x
	tax
	rts
zero_is_right:
.byte $01,$02,$03, $03,$02,$01, $02,$03,$01
one_is_right:
.byte $00,$02,$03, $03,$02,$00, $02,$03,$00
two_is_right:
.byte $01,$00,$03, $03,$00,$01, $00,$03,$01
three_is_right:
.byte $02,$01,$00, $00,$02,$01, $02,$00,$01
random_wrong:
.byte 228,200,172, 144,116, 88,  60, 32,  0


nmi_babelplay:
	lda #$20
	sta $2006
	lda #$64
	sta $2006
	lda word_base+0
	sta $2007
	lda word_base+1
	sta $2007
	lda word_base+2
	sta $2007
	lda word_base+3
	sta $2007
	lda word_base+4
	sta $2007
	lda word_base+5
	sta $2007
	lda word_base+6
	sta $2007
	lda word_base+7
	sta $2007
	lda word_base+8
	sta $2007
	lda word_base+9
	sta $2007
	lda word_base+10
	sta $2007
	lda word_base+11
	sta $2007
	lda word_base+12
	sta $2007
	lda #$20
	sta $2006
	lda #$84
	sta $2006
	lda word_b+0
	sta $2007
	lda word_b+1
	sta $2007
	lda word_b+2
	sta $2007
	lda word_b+3
	sta $2007
	lda word_b+4
	sta $2007
	lda word_b+5
	sta $2007
	lda word_b+6
	sta $2007
	lda word_b+7
	sta $2007
	lda word_b+8
	sta $2007
	lda word_b+9
	sta $2007
	lda word_b+10
	sta $2007
	lda word_b+11
	sta $2007
	lda word_b+12
	sta $2007
	lda #$20
	sta $2006
	lda #$a4
	sta $2006
	lda word_a+0
	sta $2007
	lda word_a+1
	sta $2007
	lda word_a+2
	sta $2007
	lda word_a+3
	sta $2007
	lda word_a+4
	sta $2007
	lda word_a+5
	sta $2007
	lda word_a+6
	sta $2007
	lda word_a+7
	sta $2007
	lda word_a+8
	sta $2007
	lda word_a+9
	sta $2007
	lda word_a+10
	sta $2007
	lda word_a+11
	sta $2007
	lda word_a+12
	sta $2007

	jmp end_nmi

loop_nothing:
	jmp end_loop
nmi_nothing:
	jmp end_nmi

.include "includes\bankFixed\common.asm"
.include "includes\bankFixed\manual.asm"

pause_words:
.byte "PAUSED"

add_chain:
	lda chain_ones
	clc
	adc chain_ones_add
	sta chain_ones
	cmp #$0a
	bcc @do_tens
	lda chain_ones
	sec
	sbc #$0a
	sta chain_ones
	inc chain_tens
@do_tens:
	lda chain_tens
	clc
	adc chain_tens_add
	sta chain_tens
	cmp #$0a
	bcc @do_hundreds
	lda chain_tens
	sec
	sbc #$0a
	sta chain_tens
	inc chain_hundreds
@do_hundreds:
	lda chain_hundreds
	clc
	adc chain_hundreds_add
	sta chain_hundreds
	lda #$00
	sta chain_ones_add
	sta chain_tens_add
	sta chain_hundreds_add
	rts
add_blocks:
	lda blocks_ones
	clc
	adc blocks_ones_add
	sta blocks_ones
	cmp #$0a
	bcc @do_tens
	lda blocks_ones
	sec
	sbc #$0a
	sta blocks_ones
	inc blocks_tens
@do_tens:
	lda blocks_tens
	clc
	adc blocks_tens_add
	sta blocks_tens
	cmp #$0a
	bcc @do_hundreds
	lda blocks_tens
	sec
	sbc #$0a
	sta blocks_tens
	inc blocks_hundreds
@do_hundreds:
	lda blocks_hundreds
	clc
	adc blocks_hundreds_add
	sta blocks_hundreds
	lda #$00
	sta blocks_ones_add
	sta blocks_tens_add
	sta blocks_hundreds_add
	rts
add_score:
	lda score_tens
	clc
	adc score_tens_add
	sta score_tens
	cmp #$0a
	bcc @do_hundreds
	lda score_tens
	sec
	sbc #$0a
	sta score_tens
	inc score_hundreds
@do_hundreds:
	lda score_hundreds
	clc
	adc score_hundreds_add
	sta score_hundreds
	cmp #$0a
	bcc @do_thousands
	lda score_hundreds
	sec
	sbc #$0a
	sta score_hundreds
	inc score_thousands
@do_thousands:
	lda score_thousands
	clc
	adc score_thousands_add
	sta score_thousands
	cmp #$0a
	bcc @do_ten_thousands
	lda score_thousands
	sec
	sbc #$0a
	sta score_thousands
	inc score_ten_thousands
@do_ten_thousands:
	lda score_ten_thousands
	clc
	adc score_ten_thousands_add
	sta score_ten_thousands
	cmp #$0a
	bcc @do_hun_thousands
	lda score_ten_thousands
	sec
	sbc #$0a
	sta score_ten_thousands
	inc score_hun_thousands
@do_hun_thousands:
	lda score_hun_thousands
	clc
	adc score_hun_thousands_add
	sta score_hun_thousands
	cmp #$0a
	bcc @do_millions
	lda score_hun_thousands
	sec
	sbc #$0a
	sta score_hun_thousands
	inc score_millions
@do_millions:
	lda score_millions
	clc
	adc score_millions_add
	sta score_millions
	cmp #$0a
	bcc @do_ten_millions
	lda score_millions
	sec
	sbc #$0a
	sta score_millions
	inc score_ten_millions
@do_ten_millions:
	lda score_ten_millions
	clc
	adc score_ten_millions_add
	sta score_ten_millions
@finish_up:
	lda #$00
	sta score_tens_add
	sta score_hundreds_add
	sta score_thousands_add
	sta score_ten_thousands_add
	sta score_hun_thousands_add
	sta score_millions_add
	sta score_ten_millions_add
	rts


place_s_ram_lo:
.byte <first_ram_s,<secon_ram_s,<third_ram_s,<fourt_ram_s,<fifth_ram_s
.byte <sixth_ram_s,<seven_ram_s,<eight_ram_s,<ninth_ram_s,<tenth_ram_s,<eleve_ram_s
place_s_ram_hi:
.byte >first_ram_s,>secon_ram_s,>third_ram_s,>fourt_ram_s,>fifth_ram_s
.byte >sixth_ram_s,>seven_ram_s,>eight_ram_s,>ninth_ram_s,>tenth_ram_s,>eleve_ram_s
place_i_ram_lo:
.byte <first_ram_i,<secon_ram_i,<third_ram_i,<fourt_ram_i,<fifth_ram_i
.byte <sixth_ram_i,<seven_ram_i,<eight_ram_i,<ninth_ram_i,<tenth_ram_i,<eleve_ram_i
place_i_ram_hi:
.byte >first_ram_i,>secon_ram_i,>third_ram_i,>fourt_ram_i,>fifth_ram_i
.byte >sixth_ram_i,>seven_ram_i,>eight_ram_i,>ninth_ram_i,>tenth_ram_i,>eleve_ram_i
its_lo:
.byte <its_01,<its_02,<its_03,<its_04,<its_05,<its_06,<its_07,<its_08,<its_09,<its_10
its_hi:
.byte >its_01,>its_02,>its_03,>its_04,>its_05,>its_06,>its_07,>its_08,>its_09,>its_10
its_01:
.byte " ",$71,$93,$94," "
its_02:
.byte " ",$72,$8e,$84," "
its_03:
.byte " ",$73,$92,$84," "
its_04:
.byte " ",$74,$94,$88," "
its_05:
.byte " ",$75,$94,$88," "
its_06:
.byte " ",$76,$94,$88," "
its_07:
.byte " ",$77,$94,$88," "
its_08:
.byte " ",$78,$94,$88," "
its_09:
.byte " ",$79,$94,$88," "
its_10:
.byte $71,$70,$94,$88," "
periods:
.byte " ",$7d,$7d,$7d,$7d,$7d," "

scr_table_ppu_lo:
.byte $c3,$03,$43,$83,$c3,$03,$43,$83,$c3,$03
scr_table_ppu_hi:
.byte $24,$25,$25,$25,$25,$26,$26,$26,$26,$27



load_scores:
	ldx #$00
@start_it:
	lda its_lo, x
	sta temp_16bit_1+0
	lda its_hi, x
	sta temp_16bit_1+1
	lda place_i_ram_lo, x
	sta temp_16bit_2+0
	lda place_i_ram_hi, x
	sta temp_16bit_2+1
	lda #<periods
	sta temp_16bit_3+0
	lda #>periods
	sta temp_16bit_3+1
	lda place_s_ram_lo, x
	sta temp_16bit_4+0
	lda place_s_ram_hi, x
	sta temp_16bit_4+1
	txa
	pha

	ldx #$00
	ldy #$00
:	lda (temp_16bit_1), y
	sta line, x
	inx
	iny
	cpy #5
	bne :-

	ldy #$00
:	lda (temp_16bit_2), y
	clc
	adc #$40
	sta line, x
	inx
	iny
	cpy #3
	bne :-

	ldy #$00
:	lda (temp_16bit_3), y
	sta line, x
	inx
	iny
	cpy #7
	bne :-

	ldy #$00
	lda (temp_16bit_4), y
	bne :+
		lda #$00
		beq :++
:
	clc
	adc #$70
:	sta line, x
	iny
	inx
	lda (temp_16bit_4), y
	bne :+
		lda line+15
		bne :+
			lda #$00
			sta line, x
			inx
			sta line, x
			inx
			iny
			jmp :++
:	lda (temp_16bit_4), y
	clc
	adc #$70
	sta line, x
	iny
	inx
	lda #$7c
	sta line, x
	inx
:	lda (temp_16bit_4), y
	bne :+
		lda line+16
		bne :+
			lda line+15
			bne :+
				lda #$00
				beq :++
:	lda (temp_16bit_4), y
	clc
	adc #$70
:	sta line, x
	iny
	inx
	lda (temp_16bit_4), y
	bne :+
		lda line+18
		bne :+
			lda line+16
			bne :+
				lda line+15
				bne :+
					lda #$00
					beq :++
:	lda (temp_16bit_4), y
	clc
	adc #$70
:	sta line, x
	iny
	inx
	lda (temp_16bit_4), y
	clc
	adc #$70
	sta line, x
	iny
	inx
	lda #$7c
	sta line, x
	inx
	lda (temp_16bit_4), y
	clc
	adc #$70
	sta line, x
	iny
	inx
	lda (temp_16bit_4), y
	clc
	adc #$70
	sta line, x
	iny
	inx
	lda (temp_16bit_4), y
	clc
	adc #$70
	sta line, x
	pla
	tax
	lda scr_table_ppu_hi, x
	sta $2006
	lda scr_table_ppu_lo, x
	sta $2006
	ldy #$00
:	lda line, y
	sta $2007
	iny
	cpy #$24
	bne :-
	inx
	cpx #$0a
	beq :+
		jmp @start_it
:	rts



words_same_test:
	ldx #$00
:	lda word_b, x
	cmp word_a, x
	bne :+
		inx
		cpx #13
		bne :-
			lda #$01
			sta both_same
:
	rts

gameover_0:
.byte "NOW NOTHING WILL    "
gameover_1:
.byte "BE RESTRAINED FROM  "
gameover_2:
.byte "THEM, WHICH THEY    "
gameover_3:
.byte "HAVE IMAGINED TO DO."
gameover_4:
.byte "                    "
gameover_5:
.byte "     GAME  OVER     "
gameover_6:
.byte "               SCORE"
gameover_7:
.byte "    RANK:           "
gameover_8:
.byte "    ",$ce,$cf,$d0,$cd,"TO RESET    "
gameover_9:
.byte " ",$ca,$cb,$cc,$cd,"TO SAVE SCORE  "

gover_words_lo:
.byte <gameover_4,<gameover_0,<gameover_1,<gameover_2,<gameover_3,<gameover_5,<gameover_6
.byte <gameover_7,<gameover_8,<gameover_9,<gameover_4
gover_words_hi:
.byte >gameover_4,>gameover_0,>gameover_1,>gameover_2,>gameover_3,>gameover_5,>gameover_6
.byte >gameover_7,>gameover_8,>gameover_9,>gameover_4
gover_ppu_lo:
.byte $88,$64,$a4,$e4,$24,$a6,$68,$60,$26,$e6,$e7
gover_ppu_hi:
.byte $25,$24,$24,$24,$25,$25,$26,$26,$27,$26,$25
loop_gameover:
	lda control_pad
	eor control_old
	and control_pad
	and #select_punch
	beq @no_select_punch
		sta temp_8bit_1
		sta temp_8bit_2
		sta temp_8bit_3
		sta temp_8bit_4
		jsr black_palette
		jsr nmi_wait
		jsr PPU_off
		lda #$00
		sta control_pad
		sta control_old
		jmp reset
@no_select_punch:
		lda ranking
		cmp #$0b
		bcs @no_start_punch
	lda control_pad
	eor control_old
	and control_pad
	and #start_punch
	beq @no_start_punch
;		lda #$00
;		sta reg2000save
;		sta $2000
;		sta reg2001save
;		sta $2001
;		ldy #14
;		jsr bankswitch
		jsr black_palette
		jsr nmi_wait
		lda #$78
		sta saved_gone
		jsr black_palette
		ldx #$00
		lda #$a7
:		sta s_word+0, x
		inx
		inx
		inx
		inx
		cpx #24
		bne :-
		jmp save_scores_jumper
@no_start_punch:
rtn_save_scores:
	jmp end_loop
nmi_gameover:
	ldx temp_8bit_4
	cpx #$0b
	bcc :+
		lda #$26
		sta $2006
		lda #$92
		sta $2006
		jsr do_final_score
;		lda #$24
;		sta nametable
		lda #$78
		sta temp_8bit_4
		lda #<loop_wait2
		sta loop_pointer+0
		lda #>loop_wait2
		sta loop_pointer+1
		lda #<nmi_nothing
		sta nmi_pointer+0
		lda #>nmi_nothing
		sta nmi_pointer+1
		jmp end_nmi
:
	lda temp_8bit_4
	cmp #$09
	bne :+
		lda ranking
		cmp #$0b
		bcs :+++
:
	lda gover_words_lo, x
	sta temp_16bit_1+0
	lda gover_words_hi, x
	sta temp_16bit_1+1
	lda gover_ppu_hi, x
	sta $2006
	lda gover_ppu_lo, x
	sta $2006
	ldy #$00
:	lda (temp_16bit_1), y
	sta $2007
	iny
	cpy #20
	bne :-
:	inx
	stx temp_8bit_4
	jmp end_nmi

test_for_place:
		ldy #14
		jsr bankswitch
	jsr put_score_in_11th
	jsr compare_and_replace
;	ldy #0
;	jsr bankswitch
		lda #<loop_nothing
		sta loop_pointer+0
		lda #>loop_nothing
		sta loop_pointer+1
		lda #<nmi_gameover
		sta nmi_pointer+0
		lda #>nmi_gameover
		sta nmi_pointer+1
	jmp end_loop

nmi_test:
	lda #$26
	sta $2006
	lda #$69
	sta $2006
	ldx ranking
	lda rank_0, x
	sta $2007
	lda rank_1, x
	sta $2007
	lda rank_2, x
	sta $2007
	lda rank_3, x
	sta $2007
	lda #$00
	sta temp_8bit_4
	lda #<loop_gameover
	sta loop_pointer+0
	lda #>loop_gameover
	sta loop_pointer+1
		lda #<nmi_nothing
		sta nmi_pointer+0
		lda #>nmi_nothing
		sta nmi_pointer+1
	jmp end_nmi

loop_wait2:
	dec temp_8bit_4
	bne :+
		ldy #13				; TURN ON PUSH START MUSIC HERE
		jsr bankswitch
		lda #$08
		jsr music_loadsong
		ldy bank
		jsr bank_save

				lda #$0f
				sta pal_address+0
				sta pal_address+16
				lda #$30
				sta pal_address+3
				lda #$24
				sta nametable
		lda #<nmi_test
		sta nmi_pointer+0
		lda #>nmi_test
		sta nmi_pointer+1
:
	jmp end_loop

loop_endpause:
	dec temp_8bit_4
	bne :+
		lda #<loop_tally
		sta loop_pointer+0
		lda #>loop_tally
		sta loop_pointer+1
		lda #<nmi_tally
		sta nmi_pointer+0
		lda #>nmi_tally
		sta nmi_pointer+1
		jmp loop_tally
:
	jmp end_loop


loop_tally:
	lda blocks_hundreds
	bne :++
		lda blocks_tens
		bne :++
			lda blocks_ones
			bne :++
				ldx #$00
:				lda score_ten_millions, x
				clc
				adc #$30
				sta final_score, x
				inx
				cpx #8
				bne :-
				lda #<test_for_place
				sta loop_pointer+0
				lda #>test_for_place
				sta loop_pointer+1
				jmp test_for_place
:

	lda #$01
	sta blocks_ones_add
	lda blocks_ones
	sec
	sbc #$01
	sta blocks_ones
	cmp #$ff
	bne @do_tens
	lda #$09
	sta blocks_ones
	dec blocks_tens
@do_tens:
	lda blocks_tens
	sec
	sbc blocks_tens_add
	sta blocks_tens
	cmp #$ff
	bne @do_hundreds
	lda #$09
	sta blocks_tens
	dec blocks_hundreds
@do_hundreds:
	lda blocks_hundreds
	sec
	sbc blocks_hundreds_add
	sta blocks_hundreds
	lda #$00
	sta blocks_ones_add
	sta blocks_tens_add
	sta blocks_hundreds_add
	lda #$01
	sta score_ten_thousands_add

	jsr add_score


	ldy #13				; TURN ON PUSH START MUSIC HERE
	jsr bankswitch
	lda #$08
	jsr music_loadsfx
	ldy bank
	jsr bank_save

	jmp end_loop
nmi_tally:
	jsr write_blocks
	lda #$26
	sta $2006
	lda #$92
	sta $2006
	jsr do_score

	jmp end_nmi







loop_done:

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
	and #select_punch
	beq @no_select_punch
		lda #$00
		sta temp_8bit_1
		sta temp_8bit_2
		sta temp_8bit_3
		sta temp_8bit_4
		jsr black_palette
		jsr nmi_wait
		jsr PPU_off
		jmp reset
@no_select_punch:
	jmp end_loop
nmi_done:
	lda #$26
	sta $2006
	lda #$e7
	sta $2006
	ldx #$00
	txa
:	sta $2007
	inx
	cpx #17
	bne :-
	jmp end_nmi

rank_0:
.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$31,$4e,$4e
rank_1:
.byte $00,$31,$32,$33,$34,$35,$36,$37,$38,$39,$30,$4f,$4f
rank_2:
.byte $00,$53,$4e,$52,$54,$54,$54,$54,$54,$54,$54,$4e,$4e
rank_3:
.byte $00,$54,$44,$44,$48,$48,$48,$48,$48,$48,$48,$45,$45

howto_spr:
.byte $50,$e6,$00,$30
.byte $50,$e7,$00,$38
.byte $58,$f6,$00,$30
.byte $58,$f7,$00,$38

.byte $50,$e6,$01,$68
.byte $50,$e7,$01,$70
.byte $58,$f6,$01,$68
.byte $58,$f7,$01,$70

.byte $68,$e6,$02,$30
.byte $68,$e7,$02,$38
.byte $70,$f6,$02,$30
.byte $70,$f7,$02,$38

.byte $68,$e6,$03,$68
.byte $68,$e7,$03,$70
.byte $70,$f6,$03,$68
.byte $70,$f7,$03,$70

.byte $50,$c4,$00,$20
.byte $50,$c5,$01,$58
.byte $68,$c6,$02,$20
.byte $68,$c7,$03,$58

.byte $a0,$d3,$02,$bf	; 500
.byte $a0,$d2,$02,$c7
.byte $90,$d5,$02,$bf	; 250
.byte $90,$d4,$02,$c7
.byte $80,$d6,$02,$bf	; 100
.byte $80,$d2,$02,$c7
.byte $70,$d3,$02,$c3	; 50
.byte $70,$d7,$02,$cb
.byte $60,$d5,$02,$c3	; 20
.byte $60,$d7,$02,$cb
.byte $50,$d6,$02,$c3	; 10
.byte $50,$d7,$02,$cb
.byte $27,$dd,$01,$af	; broken chain
.byte $27,$de,$01,$b7
.byte $25,$d1,$02,$c0	; 1,000
.byte $25,$d2,$02,$c8


babelhowto_nam:
.incbin "includes\bankFixed\howto.nam"



loop_flashtitle:
	dec temp_8bit_4
	bne not_yet_flashing
			jsr black_palette
			jsr all_sprites_offscreen
			jsr nmi_wait
;			jsr PPU_off
		lda temp_8bit_1
		bne :+
			jsr PPU_off
			jmp game_setup
:		cmp #$01
		bne :+
		jsr PPU_off
		lda #$c8
		sta arrow_up+1
		lda #$c8
		sta arrow_down+1
		lda #$40
		sta arrow_down+2
			jmp option_setup
:		cmp #$02
		bne :++
;		ldy #13
;		jsr bankswitch
;		lda #0
;		jsr music_loadsong

		jsr all_sprites_offscreen
		jsr black_palette
		jsr vblank_wait
		jsr nmi_wait

:		bit $2002
		bpl :-
		lda #$00
		sta $2000
		sta $2001

			lda #$00
			sta temp_8bit_1
;			jmp story_setup
			jmp loop_chr_load_change

:		cmp #$03
			jsr PPU_off
			jmp howto_setup

not_yet_flashing:
	lda temp_8bit_4
	and #$10
	bne :+
		lda #$00
		sta arrow_up+1
		sta arrow_down+1
	jmp :++
:
		lda #$c8
		sta arrow_up+1
		lda #$c8
		sta arrow_down+1
:
	jmp end_loop




phono_off:
	lda temp_8bit_3
	cmp #$09
	beq :+
		ldy #13
		jsr bankswitch
		lda #$00
		jsr music_loadsong
		ldy #$00
		jsr bankswitch
:
	rts

mus_songs:
.byte $04,$05,$06
load_saved_option_song:
	ldy #13
	jsr bankswitch
	ldx mus_game
	lda mus_songs, x
	jsr music_loadsong
	ldy #$00
	jsr bankswitch
	jmp loop_option
mus0_on:
	ldy #13
	jsr bankswitch
	ldx base_offset+9
	lda mus_songs, x
	jsr music_loadsong
	ldy #$00
	jsr bankswitch
	jmp rtn_music0
mus1_on:
	ldy #13
	jsr bankswitch
	ldx base_offset+9
	lda mus_songs, x
	jsr music_loadsong
	ldy #$00
	jsr bankswitch
	jmp rtn_music1

phono_on:
	lda temp_8bit_3
	cmp #$09
	bne :+
		ldy #13
		jsr bankswitch
:
	rts





.segment "BANKTABLE"
banks:
	.byte $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0a,$0b,$0c,$0d,$0e
bank_save:
	sty bank
bankswitch:
	lda banks, y		; read a byte from the banktable (banks)
.ifdef GTROM
	ora #%01110000
	sta $5000
.else
	sta banks, y		;  and write it back, switching banks
.endif
	rts

.segment "VECTORS"
	.addr nmi, reset, irq
