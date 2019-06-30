.segment "BANK14"
.segment "SAVESPOT"
save_here:

place01score:
.byte 0,0, 9,0,0, 0,0,0
place02score:
.byte 0,0, 7,5,0, 0,0,0
place03score:
.byte 0,0, 6,0,0, 0,0,0
place04score:
.byte 0,0, 5,0,0, 0,0,0
place05score:
.byte 0,0, 4,5,5, 0,0,0
place06score:
.byte 0,0, 1,0,0, 0,0,0
place07score:
.byte 0,0, 0,5,0, 0,0,0
place08score:
.byte 0,0, 0,4,3, 0,0,0
place09score:
.byte 0,0, 0,4,2, 0,0,0
place10score:
.byte 0,0, 0,4,0, 0,0,0
place11score:
.byte 0,0, 0,0,0, 0,0,0


place01init:
.byte "KSH"
place02init:
.byte "BDH"
place03init:
.byte "TJW"
place04init:
.byte "RLB"
place05init:
.byte "MDS"
place06init:
.byte "JDW"
place07init:
.byte "JAP"
place08init:
.byte "BRB"
place09init:
.byte "SOF"
place10init:
.byte "GDB"
place11init:
.byte "AAA"


.segment "SAVEOPTIONS"
save_options:
.byte $00,$04,$02,$03,$01, $00, $00,$00,$00, $00


.segment "SAVESTUFF"
;Some macro defines for calling the functions.  You must include this file in whatever bank this code is going to be run from, then make the calls to
;these macros.
	

.macro CallWriteVerify			;Internally used by CallEraseSector and CallWriteByte.
	
.endmacro
	
;CallSoftwareIdentify - Returns Chip Manufacturer and Chip ID information. THis can be used
;to determine how much free space you have, if for example, your game only uses 128KB, but is flashed
;to a 256KB or 512KB flash chip.  The chip manufacturer for most of the installed chips is likely to
;be 0xBF, and Chip ID be 0xB5 for 128KB, 0xB6 for 256KB or 0xB7 for 512KB.
;
;This is the one command you can attempt to execute to determine if flash saving is enabled on the cart or not.
;Just make sure you don't have 0xBF in address 0, and 0xB5/0xB6/0xB7 in address 1, as these are the addresses this command
;actually reads.

.macro CallSoftwareIdentify		;Uses ReturnBank. A destroyed, X = Chip Manufacturer, Y = Chip ID
	JSR (FlashRamPage+(SoftwareIdentify-WriteVerify))
.endmacro
	
;CallEraseSector - Used to erase a 4KB sector of flash.
;Erasing sets every single byte in that sector to 0xFF.
;If there are any values you wish to save, read them out before 
;erasing the sector.

.macro CallEraseSector			;Uses TargetBank, TargetAddress, ReturnBank. A & Y destroyed.
	jsr FlashRamPage + (EraseSector-WriteVerify)
.endmacro
	
;CallWriteByte - Used to write a byte to flash.
;The byte actually written is a logical bitwise AND of the desired value to write, and the value currently stored in flash.
;Because of this, writes will progress from 0xFF towards 0x00.  Flash bits can only be cleared with this function.

.macro CallWriteByte			;Byte to Write in A, Address is TargetAddress+Y. Uses TargetBank, TargetAddress, ReturnBank.
	jsr FlashRamPage + (WriteByte-WriteVerify)
.endmacro
	
;JmpExitBank - mostly needed only for flash saving hacks. Put the bank to exit with on the A register, then use this macro.

.macro JmpExitBank				;Bank to switch to on return in A register.
	JMP (FlashRamPage+(ReturnToBank-WriteVerify))
.endmacro


; 9 bytes
WriteVerify:
;	nop
;	nop
	lda (TargetAddress), y
	cmp (TargetAddress), y
	bne WriteVerify
	rts




.ifdef GTROM

EraseSector:

;  5555=AA
  lda #$AA
  sta $D555

;  2AAA=55
  lda #$55
  sta $AAAA

;  5555=80
  lda #$80
  sta $D555

;  5555=AA
  lda #$AA
  sta $D555

;  2AAA=55
  lda #$55
  sta $AAAA

;  sector address=30
  lda TargetBank
  ora #%00110000
  sta $5000       ;;set bank address = sector / 4
  ldy #$00
  lda #$30
  sta (TargetAddress), y   ;;erase the sector

  jsr FlashRamPage
  lda ReturnBank
  ora #%01110000
  sta $5000
  rts

WriteByte:

  pha
;  5555=AA
  lda #$AA
  sta $D555

;  2AAA=55
  lda #$55
  sta $AAAA

;  5555=A0
  lda #$A0
  sta $D555

;  addr=data
  lda TargetBank
  ora #%00110000
  sta $5000
  pla
  sta (TargetAddress), y

  jsr FlashRamPage
  lda ReturnBank
  ora #%01110000
  sta $5000
  rts

.else
; 71 bytes
EraseSector:
	lda #$01
	sta $c000
	lda #$aa
	sta $9555
	lda #$00
	sta $c000
	lda #$55
	sta $aaaa
	lda #$01
	sta $c000
	lda #$80
	sta $9555
	lda #$01
	sta $c000
	lda #$aa
	sta $9555
	lda #$00
	sta $c000
	lda #$55
	sta $aaaa
	lda TargetBank
	sta $c000
	ldy #$00
	lda #$30
	sta (TargetAddress), y
	jsr FlashRamPage
	lda ReturnBank
ReturnToBank:
	sta $c000
	rts ;jmp rtnErase

; 49 bytes
WriteByte:
	pha
	lda #$01
	sta $c000
	lda #$aa
	sta $9555
	lda #$00
	sta $c000
	lda #$55
	sta $aaaa
	lda #$01
	sta $c000
	lda #$a0
	sta $9555
	lda TargetBank
	sta $c000
	pla
	sta (TargetAddress), y
	jsr FlashRamPage
	lda ReturnBank
	sta $c000
	rts
.endif
; 60 bytes
SoftwareIdentify:
	lda #$80
	sta TargetAddress+1
	lda #$01
	sta TargetAddress+0
	sta $c000
	lda #$aa
	sta $9555
	lda #$00
	sta $c000
	lda #$55
	sta $aaaa
	lda #$01
	sta $c000
	lda #$90
	sta $9555
	jsr FlashRamPage
	lda $8000
	tax
	lda $8001
	tay
	lda #$f0
	sta $8000
	jsr FlashRamPage
	lda ReturnBank
	sta $c000
	rts

;Call this routine to copy all the flash related functions into ram.
CopyFlashRoutine:
	ldy #$00
CopyFlashRoutineLoop:
	lda WriteVerify, y
	sta FlashRamPage, y
	iny
	cpy #(CopyFlashRoutine - WriteVerify)
	bne CopyFlashRoutineLoop
	rts

loop_save:
	ldy #$00
	tya
:	sta FlashRamPage, y
	iny
	bne :-

	lda #14
	sta TargetBank
	lda #<save_here
	sta TargetAddress+0
	lda #>save_here
	sta TargetAddress+1
	lda #$00;games+0
	sta SourceAddress
	lda #$05;games+1
	sta SourceAddress_h
	lda #14
	sta ReturnBank
	jsr CopyFlashRoutine

	ldy #$00
	CallEraseSector

	ldy #$00
save_some_more0:
	lda (SourceAddress), y
		CallWriteByte
	iny
	cpy #$79
	bne save_some_more0

	jmp rtn_from_saving_score


sds:
.byte "SDS",$1a

loop_save_options:
	ldy #$00
	tya
:	sta FlashRamPage, y
	iny
	bne :-

	lda #14
	sta TargetBank
	lda #<save_options
	sta TargetAddress+0
	lda #>save_options
	sta TargetAddress+1
	lda #$00;games+0
	sta SourceAddress
	lda #$00;games+1
	sta SourceAddress_h
	lda #14
	sta ReturnBank
	jsr CopyFlashRoutine

	ldy #$00
	CallEraseSector

	ldy #$00
saving_the_options:
:	lda (SourceAddress), y
		CallWriteByte
	iny
	cpy #$0a
	bne :-
	jmp rtn_from_saving_options


place_i_lo:
.byte <place01init,<place02init,<place03init,<place04init,<place05init
.byte <place06init,<place07init,<place08init,<place09init,<place10init,<place11init
place_i_hi:
.byte >place01init,>place02init,>place03init,>place04init,>place05init
.byte >place06init,>place07init,>place08init,>place09init,>place10init,>place11init

place_s_lo:
.byte <place01score,<place02score,<place03score,<place04score,<place05score
.byte <place06score,<place07score,<place08score,<place09score,<place10score,<place11score
place_s_hi:
.byte >place01score,>place02score,>place03score,>place04score,>place05score
.byte >place06score,>place07score,>place08score,>place09score,>place10score,>place11score





load_saved_into_ram:
	ldx #$00
:	lda save_options, x	;initial_options, x
	sta base_offset, x
	inx
	cpx #$0a
	bne :-

	ldx #$00
:	lda place_i_lo, x
	sta temp_16bit_1+0
	lda place_i_hi, x
	sta temp_16bit_1+1
	lda place_i_ram_lo, x
	sta temp_16bit_2+0
	lda place_i_ram_hi, x
	sta temp_16bit_2+1
	ldy #$00
:	lda (temp_16bit_1), y
	sta (temp_16bit_2), y
	iny
	cpy #$03
	bne :-
	inx
	cpx #$0b
	bne :--

	ldx #$00
:	lda place_s_lo, x
	sta temp_16bit_1+0
	lda place_s_hi, x
	sta temp_16bit_1+1
	lda place_s_ram_lo, x
	sta temp_16bit_2+0
	lda place_s_ram_hi, x
	sta temp_16bit_2+1
	ldy #$00
:	lda (temp_16bit_1), y
	sta (temp_16bit_2), y
	iny
	cpy #$08
	bne :-
	inx
	cpx #$0b
	bne :--
	rts

put_score_in_11th:
	ldx #$00
:	lda score_ten_millions, x
	sta eleve_ram_s, x
	inx
	cpx #8
	bne :-
	ldx #$00
:	lda init0, x
	tay
	lda letters, y
	sta init0l, x
	sta eleve_ram_i, x
	inx
	cpx #3
	bne :-
	rts

compare_and_replace:
	lda #<score_ten_millions
	sta temp_16bit_3+0
	lda #>score_ten_millions
	sta temp_16bit_3+1
	lda #<init0l
	sta temp_16bit_4+0
	lda #>init0l
	sta temp_16bit_4+1

	ldx #$09

start_tests:
	lda place_i_ram_lo, x		; this grouping will be next score to compare and initials
	sta temp_addy2+0
	lda place_i_ram_hi, x
	sta temp_addy2+1
	lda place_s_ram_lo, x
	sta temp_16bit_2+0
	lda place_s_ram_hi, x
	sta temp_16bit_2+1

	inx

	lda place_i_ram_lo, x		; this grouping will be player stuff
	sta temp_addy+0
	lda place_i_ram_hi, x
	sta temp_addy+1
	lda place_s_ram_lo, x
	sta temp_16bit_1+0
	lda place_s_ram_hi, x
	sta temp_16bit_1+1

	dex

	ldy #$00
:	lda (temp_16bit_2), y
	cmp (temp_16bit_1), y
	bcc :+++
	beq :+
	bcs :++
:		iny
		cpy #8
		bne :--
:			inx
			inx
			stx ranking
			rts
:
	ldy #$00
:	lda (temp_16bit_2), y		; put above placement into spot where
	sta (temp_16bit_1), y		;  we had player's score
	lda (temp_16bit_3), y		; put player score into spot where
	sta (temp_16bit_2), y		;  we had above placement
	iny
	cpy #8
	bne :-
	ldy #$00
:	lda (temp_addy2), y
	sta (temp_addy), y
	lda (temp_16bit_4), y
	sta (temp_addy2), y
	iny
	cpy #3
	bne :-

	dex
	cpx #$ff
	bne start_tests
	lda #$01
	sta ranking
	rts
letters:
.asciiz "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"


