loop_chr_load_change:
	ldx temp_8bit_1
	lda chr_load_lo, x
	sta temp_16bit_1+0
	lda chr_load_hi, x
	sta temp_16bit_1+1
	ldy #10
	jsr bank_save

	ldy #0
	sty $2006
	sty $2006
	ldx #16
	jsr load_PPU_16bit

	ldx temp_8bit_1
	lda nam_load_lo, x
	sta temp_16bit_1+0
	lda nam_load_hi, x
	sta temp_16bit_1+1
	ldy nam_bank, x
	jsr bank_save

	ldy #$00
	ldx #$04
	lda #$24
	sta $2006
	lda #$00
	sta $2006
	jsr load_PPU_16bit

;	jmp loop_manual
:	bit $2002
	bpl :-
	lda #$00
	sta $2006
	sta $2006
	lda #%10001001
	sta $2000
	lda #%00011010
	sta $2001

	lda #$24
	sta nametable

		jsr nmi_wait
		lda #<loop_manual
		sta loop_pointer+0
		lda #>loop_manual
		sta loop_pointer+1
	jmp end_loop

chr_load_lo:
	.byte  <man_mnl_cvr, <man_mnl_cvr, <man_mnl_cvr
	.byte  <man_mnl_cvr, <man_mnl_cvr, <man_chr_ctl
	.byte  <man_chr_ctl, <man_chr_ctl, <man_chr_ctl
	.byte  <man_chr_ctl, <man_chr_ctl, <man_mnl_cvr
	.byte  <man_mnl_cvr, <man_mnl_cvr, <man_mnl_cvr
	.byte  <man_chr_ctl, <man_chr_ctl, <man_chr_ctl
chr_load_hi:
	.byte  >man_mnl_cvr, >man_mnl_cvr, >man_mnl_cvr
	.byte  >man_mnl_cvr, >man_mnl_cvr, >man_chr_ctl
	.byte  >man_chr_ctl, >man_chr_ctl, >man_chr_ctl
	.byte  >man_chr_ctl, >man_chr_ctl, >man_mnl_cvr
	.byte  >man_mnl_cvr, >man_mnl_cvr, >man_mnl_cvr
	.byte  >man_chr_ctl, >man_chr_ctl, >man_chr_ctl
nam_bank:
	.byte                 11,                11,                11
	.byte                 11,                11,                11
	.byte                 11,                11,                11
	.byte                 11,                11,                11
	.byte                 11,                11,                11
	.byte                 11,                10,                10
nam_load_lo:
	.byte            <page00,          <page01,         <page02
	.byte            <page03,          <page04,         <page05
	.byte            <page06,          <page07,         <page08
	.byte            <page09,          <page10,         <page11
	.byte            <page12,          <page13,         <page14
	.byte            <page15,          <page16,         <page17
nam_load_hi:
	.byte            >page00,          >page01,         >page02
	.byte            >page03,          >page04,         >page05
	.byte            >page06,          >page07,         >page08
	.byte            >page09,          >page10,         >page11
	.byte            >page12,          >page13,         >page14
	.byte            >page15,          >page16,         >page17

loop_manual:
	lda control_pad
	eor control_old
	and control_pad
	and #left_punch
	beq :+
		ldx temp_8bit_1
		beq :++
			dex
			stx temp_8bit_1
		jsr black_palette
		jsr nmi_wait
		lda #$00
		sta $2000
		sta $2001
		jsr black_palette_ppu
		jsr vblank_wait
		jmp loop_chr_load_change
		jmp end_loop
:
	lda control_pad
	eor control_old
	and control_pad
	and #right_punch
	beq :+
		ldx temp_8bit_1
		cpx #17
		beq :++
			inx
			stx temp_8bit_1
		jsr black_palette
		jsr nmi_wait
		lda #$00
		sta $2000
		sta $2001
		jsr black_palette_ppu
		jsr vblank_wait
		jmp loop_chr_load_change
:

	lda control_pad
	eor control_old
	and control_pad
	and #b_punch
	beq :+
		jsr black_palette
		jsr nmi_wait
		jmp reset
:
; temp_8bit_1				; TELLS WHICH PAGE YOU ARE ON

	ldx #$00
:	lda pal_manual, x
	sta pal_address, x
	inx
	cpx #$11
	bne :-

	jmp end_loop

black_palette_ppu:
		lda #$3f
		sta $2006
		lda #$00
		sta $2006
		lda #$0f
:		sta $2007
		inx
		cpx #$20
		bne :-
		rts

load_PPU_16bit:
:	lda (temp_16bit_1), y
	sta $2007
	iny
	bne :-
	inc temp_16bit_1+1
	dex
	bne :-
	rts


pal_manual:
.incbin "includes\bankFixed\babel_mnl_pal.pal"
.byte $30

