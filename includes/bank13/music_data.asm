; This relies on the ability of the assembler to read labels and put data bytes
; and all that other good stuff. No actual assembly is used here, just data.

;;;;;;;;;;;;;;;;;
;;  envelopes  ;;
;;;;;;;;;;;;;;;;;
;; 10 - Jump to position XX
;; FF - Stop envelope

; Each byte is just simply written to register 0 of whatever channel is using the
; envelope, after one of the useless bits being masked out so commands (yep, all
; two of them) could exist. Triangle channel completely ignores envelopes.
; It's *highly* recommended that the first envelope is a silent one.

envelopes:
 .addr env_blank
 .addr env_lead1, env_nse_hat, env_nse_hat2, env_nse_snare, env_lead2
 .addr sq4sound, sq8sound, sq4sound_cont, win_item_env, zecrom_song_env
 .addr rumble_env, inter_env, inter_env1, testes_repeat, testes2_repeat
 .addr march_snare_r, march_snare_l, march_snare_accent, stacc_an_8, drum_up_a_bit
 .addr stacc_an_8_2
env_blank:
 .byte	$00,$FF
env_lead1:
 .byte	$0F,$0D,$0B,$09,$07,$05,$04,$04,$04,$04,$05,$05,$06,$06,$06,$06,$05,$05,$10,$06,$ff
env_nse_hat:
 .byte	$0F,$0C,$00,$FF
env_nse_hat2:
 .byte	$0F,$0B,$07,$03,$FF
env_nse_snare:
 .byte	$0F,$08,$0C,$06,$04,$03,$02,$02,$01,$01,$00,$FF
env_lead2:
 .byte	$8C,$8E,$8F,$8E,$8C,$8A,$89,$88,$87,$86,$85,$84,$FF
sq4sound:
	.byte $4a,$4a,$4d,$4d,$4d,$4a,$43,$43,$43,$43,$43,$43,$43,$43,$43,$43,$43,$ff
sq8sound:
	.byte $8a,$8a,$8d,$8d,$8d,$8a,$8a,$8a,$8d,$8a,$89,$88,$83,$83,$83,$83,$83,$ff
;	.byte $41,$4a,$4d,$4d,$4d,$4a,$4a,$4a,$4d,$4a,$49,$48,$43,$43,$43,$43,$ff
sq4sound_cont:
	.byte $41,$4a,$4d,$4d,$4d,$4a,$43,$43,$43,$43,$43,$43,$43,$43,$43,$43
	.byte $46,$46,$46,$46,$46,$46,$43,$43,$43,$43,$43,$43,$43,$43,$43,$43,$10,$1f
win_item_env:
	.byte $0f,$0f,$0f,$0f,$0e,$0e,$0d,$0d,$0c,$0c,$0d,$0d,$0c,$0c,$0b,$0a,$ff
zecrom_song_env:
	.byte $88,$89,$8a,$8b,$8c,$8d,$8d,$8f,$8e,$8d,$8c,$8b,$8a,$89,$88,$87,$10,$00;,$86
rumble_env:
	.byte $81,$82,$83,$8f,$8d,$8f,$8d,$83,$82,$8f,$10,$00
inter_env1:
	.byte $85,$86,$86,$86,$85,$85,$84,$83,$ff
inter_env:
	.byte $88,$89,$89,$89,$88,$88,$87,$86,$85,$ff
;	.byte $0f,$0f,$0b,$0b,$09,$09,$07,$05,$05,$ff
;testes:
;	.byte $45,$47,$48,$4a,$8a,$8a,$8a,$0a,$ff;,$09,$08,$06,$05,$ff
;testes2:
;	.byte $85,$8a,$89,$8a,$89,$8a,$89,$8a,$09,$0a,$09,$0a,$09,$0a,$49,$48,$ff
testes_repeat:
	.byte $45,$47,$48,$4a,$8a,$8a,$8a,$0a,$10,$00;,$09,$08,$06,$05,$ff
testes2_repeat:
	.byte $85,$8a,$89,$8a,$89,$8a,$89,$8a,$09,$0a,$09,$0a,$09,$0a,$49,$48,$10,$00
march_snare_r:
	.byte $08,$04,$00,$ff
march_snare_l:
	.byte $06,$03,$00,$ff
march_snare_accent:
	.byte $0b,$07,$00,$ff
stacc_an_8:
	.byte $0f,$0e,$0d,$0b,$00,$ff
drum_up_a_bit:
 .byte	$89,$8b,$8c,$8b,$89,$87,$86,$85,$84,$83,$82,$81,$FF
stacc_an_8_2:
	.byte $8f,$8e,$8d,$8b,$00,$ff


;;;;;;;;;;;;;;;;;;
;;  song table  ;;
;;;;;;;;;;;;;;;;;;
; This determines what song is assigned to what value when loading songs
songs:
	.addr silence
	.addr title_song, push_start, game_intro, game_song, catchy_song
	.addr stacc_song, pre_tally_song, over_song

; tims_song, 
;;;;;;;;;;;;;
;;  songs  ;;
;;;;;;;;;;;;;
;; C8 XX - silent rest for XX cycles
;; C0 XX - do nothing (just extend the note for another XX cycles)
;; C1 XX - precut (cut the note XX cycles before it ends)
;; C2 XX - set envelope to XX
;; C3 YY XX ZZ - jump to YYXX, ZZ times
;; C4 YY XX - jump to YYXX
;; C5 XX - set detune to XX (01-7F up, 80-FF down, 00 none)
;; C6 XX - decrease envelope volume by XX
;; C7 XX - set pitch bend to XX (01-7F down, 80-FE up, 00 none)
;; C9 XX - set tempo-independent pitch bend (functions the same as C7)
;; FF - Track end (the track stops playing here)

; The first 4 words in the list are the pointer for square 1, square 2, tri, noise
; in that order, followed by a byte that defines the tempo. Lower values are
; slower, higher are faster, 00 is infinitely slow, making the song stop.
; If you don't use a particular channel for a song, just put $0000 as the pointer.
; All four channels can be used at once. It's *highly* recommended that you reserve
; one song in your playlist to be a silent song.

silence:
	.word $0000, $0000, $0000, $0000
	.byte $00,$00
title_song:
	.addr title_song_sq1, title_song_sq2, title_song_tri, title_song_nse
	.byte $90,$b0
push_start:
	.addr push_start_sq1, push_start_sq2, push_start_tri, $0000
	.byte $90,$b0
game_intro:
	.addr game_intro_sq1, game_intro_sq2, game_intro_tri, game_intro_nse
	.byte $90,$b0
game_song:
	.addr game_song_sq1, game_song_sq2, game_song_tri, game_song_nse
	.byte $90,$b0
catchy_song:
	.addr catchy_song_sq1, catchy_song_sq2, catchy_song_tri, catchy_song_nse
	.byte $a0,$c0
stacc_song:
	.addr stacc_song_sq1, stacc_song_sq2, stacc_song_tri, stacc_song_nse
	.byte $a0,$c0

pre_tally_song:
	.addr pre_tally_sq1, pre_tally_sq2, pre_tally_tri, pre_tally_nse
	.byte $a0,$c0

over_song:
	.addr over_sq1, over_sq2, over_tri, over_nse
	.byte $a0,$c0

tims_song:
	.addr tims_song_sq1, tims_song_sq2, tims_song_tri, tims_song_nse
	.byte $c0,$e0

;water_on_beach_song:
;	.addr $0000,$0000,$0000,water_on_beach_nse
;	.byte $01
;water_on_beach_nse:
;	.byte $c2,$0d
;	.byte $04,$80
;	.byte $ff
;water_on_beach_env1:
;	.byte $8c,$8c,$8c,$8c,$8c,$8c,$8c,$8c,$8e,$8e,$8e,$8e,$8e,$8e,$8e,$8e
;	.byte $8f,$8f,$8f,$8f,$8f,$8f,$8f,$8f,$8e,$8e,$8e,$8e,$8e,$8e,$8e,$8e
;	.byte $8d,$8d,$8d,$8d,$8c,$8c,$8c,$8c,$8b,$8b,$8b,$8b,$8a,$8a,$8a,$8a
;	.byte $89,$89,$89,$89,$88,$88,$88,$88,$87,$87,$87,$87,$86,$86,$86,$86
;	.byte $85,$85,$85,$85,$84,$84,$84,$84,$83,$83,$83,$83,$82,$82,$82,$82
;	.byte $81,$81,$81,$81,$88,$88,$88,$88,$87,$87,$87,$87,$86,$86,$86,$86
;	.byte $85,$85,$85,$85,$86,$86,$86,$86,$87,$87,$87,$87,$88,$88,$88,$88
;	.byte $89,$89,$89,$89,$8a,$8a,$8a,$8a,$8b,$8b,$8b,$8b,$8c,$8c,$8c,$8c
;	.byte $8d,$8e,$8d,$8e,$8c,$86,$85,$86,$87,$88,$89,$8a,$8a,$8a,$8a,$8a, $10,$00

; Song data is just <note> <duration> for each note, or <command> <data>... for
; commands (see table above). For <note>, the higher nybble is the actual note
; (the scale begins with A, so 0x is A, 1x is A#, 2x is B, etc), and the lower
; nybble is the octave. The tracks are state machines, so whatever commands you
; apply (like envelope, detune, pitch bend, etc) will stick until you change them,
; or until a new song is loaded.




over_sq1:
	.byte $ff
over_sq2:
	.byte $ff
over_tri:
	.byte $ff
over_nse:
	.byte $c2,$02
	.byte $00,$08,$00,$08,$00,$04,$00,$04,$00,$08, $00,$08,$00,$08,$00,$08,$00,$08
	.byte $00,$08,$00,$08,$00,$08,$00,$08, $00,$02,$00,$02,$00,$02,$00,$02,$00,$08,$00,$08,$00,$08
	.byte $00,$08,$c2,$01,$05,$08,$c2,$02,$00,$08,$00,$08, $00,$08,$00,$08,$00,$08,$00,$08
	.byte $00,$08,$00,$08,$00,$08,$01,$08, $03,$08,$01,$08,$03,$08,$00,$08

	.byte $01,$02,$03,$02,$01,$02,$03,$02,$00,$08,$00,$08,$03,$02,$03,$02,$01,$02,$03,$02, $00,$08,$00,$08,$00,$08,$00,$08
	.byte $c2,$01,$03,$08,$c2,$02,$00,$08,$c2,$01,$05,$08,$c2,$02,$00,$08, $00,$08,$c2,$01,$03,$08,$c2,$02,$00,$08,$c2,$01,$05,$08,$c2,$02
	.byte $03,$04,$01,$04,$00,$08,$00,$08,$00,$08, $03,$08,$03,$08,$03,$08,$01,$08
	.byte $01,$08,$01,$08,$00,$08,$00,$08, $01,$02,$03,$02,$01,$02,$03,$02,$c2,$01,$01,$08,$c2,$02,$00,$08,$00,$08

	.byte $01,$02,$03,$02,$00,$04,$00,$08,$03,$02,$01,$02,$03,$04,$00,$08, $00,$08,$00,$08,$03,$02,$01,$02,$00,$04,$03,$02,$01,$02,$00,$04
	.byte $0a,$08,$0b,$08,$0c,$08,$0a,$08, $0a,$08,$0b,$08,$00,$08,$01,$02,$03,$02,$00,$04
	.byte $00,$08,$00,$08,$00,$04,$00,$04,$c2,$01,$05,$08,$c2,$02, $00,$02,$00,$02,$00,$08,$03,$04,$00,$08,$00,$08
	.byte $03,$02,$03,$02,$00,$08,$03,$04,$00,$08,$01,$02,$01,$02,$01,$04, $00,$08,$00,$08,$c2,$01,$05,$10,$c2,$02

	.byte $c4,<over_nse,>over_nse
	.byte $ff



pre_tally_sq1:
	.byte $c2,$06
	.byte $c9,$01,$01,$08, $01,$08, $70,$08, $70,$08, $90,$08, $90,$08, $70,$08, $c9,$00, $52,$20
	.byte $ff
pre_tally_sq2:
	.byte $c2,$05
	.byte $c9,$01,$01,$08, $01,$08, $70,$08, $70,$08, $90,$08, $90,$08, $70,$08, $c9,$00, $00,$20
	.byte $ff
pre_tally_tri:
	.byte $c1,$01
	.byte $c9,$01,$03,$08, $03,$08, $72,$08, $72,$08, $92,$08, $92,$08, $72,$08, $c9,$00, $52,$20
	.byte $ff
pre_tally_nse:
	.byte $c2,$02
	.byte $c9,$01,$0a,$08, $0a,$08, $0b,$08, $0b,$08, $0c,$08, $0c,$08, $0d,$08, $0e,$20, $c9,$00
	.byte $ff



title_song_sq1:
	.byte $c2,$0e
	.byte $20,$08,$c8,$08, $20,$08,$c8,$08
	.byte $20,$08,$a0,$18
	.byte $20,$08,$c8,$08, $20,$08,$c8,$08
	.byte $20,$08,$c8,$18;,$30,$18
	.byte $20,$08,$c8,$08, $20,$08,$c8,$08
	.byte $20,$08,$a0,$18
	.byte $20,$08,$c8,$08, $20,$08,$50,$08
	.byte $50,$08,$30,$08,$50,$10
	.byte $c3,<title_song_sq1,>title_song_sq1,$01
title_song_sq1_1:
	.byte $c2,$0e
	.byte $20,$28,$a0,$18
	.byte $20,$28,$30,$18
	.byte $20,$28,$a0,$18
	.byte $20,$18,$50,$08
	.byte $50,$08,$30,$08,$50,$10
	.byte $c3,<title_song_sq1_1,>title_song_sq1_1,$01
	.byte $c4,<title_song_sq1,>title_song_sq1
	.byte $ff
; cheat sheet:
; A=0 #=1 B=2 C=3 #=4 D=5 #=6 E=7 F=8 #=9 G=a #=b
title_song_sq2:
	.byte $c2,$0f
	.byte $90,$08,$c8,$08, $90,$08,$c8,$08
	.byte $90,$08,$51,$18
	.byte $90,$08,$c8,$08, $90,$08,$c8,$08
	.byte $90,$08,$c8,$18;$a0,$18
	.byte $90,$08,$c8,$08, $90,$08,$c8,$08
	.byte $90,$08,$51,$18
	.byte $90,$08,$c8,$08, $90,$08,$01,$08
	.byte $01,$08,$a0,$08,$01,$10
	.byte $c3,<title_song_sq2,>title_song_sq2,$01
title_song_sq2_1:
	.byte $c2,$0f
	.byte $90,$28,$51,$18
	.byte $90,$28,$a0,$18
	.byte $90,$28,$51,$18
	.byte $90,$18,$01,$08
	.byte $01,$08,$a0,$08,$01,$10
	.byte $c3,<title_song_sq2_1,>title_song_sq2_1,$01
	.byte $c4,<title_song_sq2,>title_song_sq2
	.byte $ff
title_song_tri:
	.byte $c1,$01
	.byte $22,$04,$22,$04, $c1,$03,$22,$04,$22,$04,$c1,$01, $22,$04,$22,$04, $c1,$03,$22,$04,$22,$04
	.byte $22,$04,$22,$04,$c1,$01, $a2,$04,$a2,$04,$a2,$04,$a2,$04,$a2,$04,$a2,$04
	.byte $22,$04,$22,$04, $c1,$03,$22,$04,$22,$04,$c1,$01, $22,$04,$22,$04, $c1,$03,$22,$04,$22,$04,$c1,$01
	.byte $22,$04,$22,$04,$c1,$01, $32,$04,$32,$04,$32,$04,$32,$04,$32,$04,$32,$04
	.byte $22,$04,$22,$04, $c1,$03,$22,$04,$22,$04,$c1,$01, $22,$04,$22,$04, $c1,$03,$22,$04,$22,$04,$c1,$01
	.byte $22,$04,$22,$04,$c1,$01, $a2,$04,$a2,$04,$a2,$04,$a2,$04,$a2,$04,$a2,$04
	.byte $22,$04,$22,$04, $c1,$03,$22,$04,$22,$04,$c1,$01, $22,$04,$22,$04, $52,$04,$52,$04
	.byte $52,$04,$52,$04, $32,$04,$32,$04,$52,$04,$52,$04,$52,$04,$52,$04
	.byte $c4,<title_song_tri,>title_song_tri
	.byte $ff
title_song_nse:
	.byte $c2,$02
	.byte $0e,$08,$00,$08,$0e,$08,$00,$08, $0e,$08,$0c,$08,$00,$08,$00,$08
	.byte $0e,$08,$00,$04,$00,$04,$00,$08,$00,$04,$00,$04, $05,$08,$0c,$08,$0e,$08,$c2,$01,$05,$08,$c2,$02
	.byte $0e,$08,$00,$08,$0e,$08,$00,$08, $0e,$08,$0c,$08,$00,$08,$00,$08
	.byte $0e,$08,$00,$08,$0e,$08,$0e,$08, $81,$08,$0c,$08,$0e,$08,$00,$08
	.byte $c3,<title_song_nse,>title_song_nse,$01
title_song_nse1:
	.byte $c2,$06
	.byte $0e,$08,$00,$08,$00,$08,$00,$08, $00,$08,$0c,$08,$00,$08,$00,$08
	.byte $0e,$08,$00,$08,$00,$08,$00,$08, $00,$08,$0c,$08,$00,$08,$00,$08
	.byte $0e,$08,$00,$08,$0e,$08,$00,$08, $0e,$08,$0c,$08,$00,$08,$00,$08
	.byte $0e,$08,$00,$08,$0e,$08,$00,$08, $00,$08,$0c,$08,$00,$08,$0e,$08

	.byte $0e,$08,$00,$08,$00,$08,$00,$08, $00,$08,$0c,$08,$00,$08,$00,$08
	.byte $0e,$08,$00,$08,$00,$08,$00,$08, $00,$08,$0c,$08,$00,$08,$00,$08
	.byte $0e,$08,$00,$08,$0e,$08,$00,$08, $0e,$08,$0c,$08,$00,$08,$00,$08
	.byte $0e,$08,$00,$08,$0e,$08,$c2,$02,$0b,$04,$0b,$04, $0b,$08,$0c,$08,$0a,$04,$0a,$04,$0d,$08
;	.byte $c3,<title_song_nse1,>title_song_nse1,$01
	.byte $c4,<title_song_nse,>title_song_nse
	.byte $ff




stacc_song_sq1:
	.byte $c2,$13
	.byte $00,$08,$00,$08,$30,$08,$70,$08, $30,$08,$00,$08,$00,$08,$30,$08
	.byte $00,$08,$00,$08,$30,$08,$70,$08, $30,$08,$00,$08,$00,$08,$00,$08
stacc_song_sq1_1:
	.byte $c2,$13
	.byte $00,$08,$00,$08,$30,$08,$70,$08, $30,$08,$00,$08,$00,$08,$30,$08
	.byte $00,$08,$00,$08,$30,$08,$70,$08, $30,$08,$00,$08,$00,$08,$00,$08
	.byte $c3,<stacc_song_sq1_1,>stacc_song_sq1_1,$01
stacc_song_sq1_2:
	.byte $c2,$13
	.byte $02,$08,$02,$02,$22,$02,$02,$04,$32,$08,$72,$08, $32,$08,$02,$08,$02,$08,$32,$02,$42,$02,$32,$04
	.byte $02,$08,$02,$08,$32,$08,$72,$08, $32,$08,$02,$08,$02,$08,$02,$08
	.byte $c3,<stacc_song_sq1_2,>stacc_song_sq1_2,$03
stacc_song_sq1_3:
	.byte $c2,$13
	.byte $00,$08,$00,$02,$20,$02,$00,$04,$30,$08,$70,$08, $30,$08,$00,$08,$00,$08,$30,$02,$40,$02,$30,$04
	.byte $00,$08,$00,$08,$30,$08,$70,$08, $30,$08,$00,$08,$00,$08,$00,$08
	.byte $c3,<stacc_song_sq1_3,>stacc_song_sq1_3,$03
stacc_song_sq1_4:
	.byte $72,$20, $03,$20
	.byte $03,$10,$73,$08,$23,$08, $a3,$08,$73,$18
	.byte $73,$08,$73,$08,$73,$08,$73,$08, $03,$08,$03,$08,$03,$08,$03,$08
	.byte $c8,$10,        $73,$08,$23,$08, $a3,$08,$73,$08,$73,$08,$73,$08
	.byte $c3,<stacc_song_sq1_4,>stacc_song_sq1_4,$07
	.byte $c4,<stacc_song_sq1,>stacc_song_sq1
	.byte $ff
stacc_song_sq2:
	.byte $c8,$80
stacc_song_sq2_1:
	.byte $c8,$80
	.byte $c2,$06
	.byte $c6,$04,$00,$08,$00,$08,$30,$08,$70,$08, $c6,$03,$30,$08,$00,$08,$00,$08,$30,$08
	.byte $c6,$02,$00,$08,$00,$08,$30,$08,$70,$08, $c6,$01,$30,$08,$00,$08,$00,$08,$00,$08,$c6,$00
stacc_song_sq2_2:
	.byte $c2,$06
	.byte $00,$08,$00,$08,$30,$08,$70,$08, $30,$08,$00,$08,$00,$08,$30,$08
	.byte $00,$08,$00,$08,$30,$08,$70,$08, $30,$08,$00,$08,$00,$08,$00,$08
	.byte $c3,<stacc_song_sq2_2,>stacc_song_sq2_2,$03
stacc_song_sq2_3:
	.byte $c2,$13
	.byte $70,$08,$70,$02,$90,$02,$70,$04,$a0,$08,$21,$08, $a0,$08,$70,$08,$70,$08,$a0,$02,$b0,$02,$a0,$04
	.byte $70,$08,$70,$08,$a0,$08,$21,$08, $a0,$08,$70,$08,$70,$08,$70,$08
	.byte $c3,<stacc_song_sq2_3,>stacc_song_sq2_3,$07
stacc_song_sq2_4:
	.byte $c2,$06
	.byte $73,$18,$93,$10,$73,$18
	.byte $c8,$18,$22,$08, $a2,$08,$72,$18
	.byte $03,$18,$23,$10,$03,$18
	.byte $c8,$10,        $73,$08,$23,$08, $a3,$08,$73,$08,$73,$08,$73,$08
	.byte $73,$18,$24,$10,$04,$18
	.byte $c8,$18,$22,$08, $a2,$08,$72,$18
	.byte $03,$18,$23,$10,$03,$18
	.byte $c8,$10,        $73,$08,$23,$08, $a3,$08,$73,$08,$73,$08,$73,$08
	.byte $c3,<stacc_song_sq2_4,>stacc_song_sq2_4,$01
stacc_song_sq2_5:
	.byte $c2,$15
	.byte $22,$20, $72,$20
	.byte $72,$10,$22,$08,$92,$08, $52,$08,$22,$18
	.byte $22,$08,$23,$08,$22,$08,$23,$08, $52,$08,$53,$08,$52,$08,$53,$08
	.byte $c8,$10,        $22,$08,$92,$08, $52,$08,$02,$08,$32,$08,$42,$08
	.byte $c3,<stacc_song_sq2_5,>stacc_song_sq2_5,$01
	.byte $c4,<stacc_song_sq2,>stacc_song_sq2
	.byte $ff
stacc_song_tri:
	.byte $c8,$80
stacc_song_tri1:
	.byte $c1,$04
	.byte $00,$08,$00,$08,$30,$08,$70,$08, $30,$08,$00,$08,$00,$08,$30,$08
	.byte $00,$08,$00,$08,$30,$08,$70,$08, $30,$08,$00,$08,$00,$08,$00,$08
	.byte $c3,<stacc_song_tri1,>stacc_song_tri1,$03
stacc_song_tri2:
	.byte $02,$08,$02,$08,$32,$08,$72,$08, $32,$08,$02,$08,$02,$08,$32,$08
	.byte $02,$08,$02,$08,$32,$08,$72,$08, $32,$08,$02,$08,$02,$08,$02,$08
	.byte $c3,<stacc_song_tri2,>stacc_song_tri2,$05
stacc_song_tri3:
	.byte $73,$08,$73,$08,$73,$08,$73,$08, $03,$08,$03,$08,$03,$08,$03,$08
	.byte $03,$08,$03,$08,$73,$08,$23,$08, $a3,$08,$73,$08,$73,$08,$73,$08
	.byte $73,$08,$73,$08,$73,$08,$73,$08, $03,$08,$03,$08,$03,$08,$03,$08
	.byte $c8,$10,        $73,$08,$23,$08, $a3,$08,$73,$08,$73,$08,$73,$08
	.byte $c3,<stacc_song_tri3,>stacc_song_tri3,$06
	.byte $73,$08,$73,$08,$73,$08,$73,$08, $03,$08,$03,$08,$03,$08,$03,$08
	.byte $03,$08,$03,$08,$73,$08,$23,$08, $a3,$08,$73,$08,$73,$08,$73,$08
	.byte $73,$08,$73,$08,$73,$08,$73,$08, $03,$08,$03,$08,$03,$08,$03,$08
	.byte $c8,$40
	.byte $c4,<stacc_song_tri,>stacc_song_tri
	.byte $ff
stacc_song_nse:
	.byte $c8,$80
stacc_song_nse1:
	.byte $c2,$02
	.byte $0e,$08,$0e,$08,$00,$08,$0c,$08, $01,$08,$02,$08,$00,$08,$00,$08
	.byte $0e,$08,$00,$08,$00,$08,$0c,$08, $00,$08,$00,$08,$00,$08,$00,$08
	.byte $c3,<stacc_song_nse1,>stacc_song_nse1,$01
stacc_song_nse2:
	.byte $c2,$14
	.byte $0e,$08,$0e,$04,$0e,$04,$00,$08,$0c,$08, $01,$08,$02,$08,$00,$08,$0e,$04,$0e,$04
	.byte $0e,$08,$00,$08,$00,$08,$0c,$08, $0e,$04,$0e,$04,$00,$08,$00,$08,$00,$08
	.byte $c3,<stacc_song_nse2,>stacc_song_nse2,$03
stacc_song_nse3:
	.byte $c2,$14
	.byte $0e,$08,$00,$08,$0c,$08, $01,$08
	.byte $0e,$08,$00,$08,$0c,$08, $00,$08
	.byte $c3,<stacc_song_nse3,>stacc_song_nse3,$0f
stacc_song_nse4:
	.byte $c2,$14
	.byte $0e,$08,$0e,$08,$00,$08,$0c,$08, $01,$08,$02,$08,$01,$08,$02,$08
	.byte $0e,$08,$04,$08,$06,$08,$0c,$08, $01,$08,$06,$08,$06,$08,$02,$08
	.byte $c3,<stacc_song_nse4,>stacc_song_nse4,$0a
	.byte $0e,$08,$0e,$08,$00,$08,$0c,$08, $01,$08,$02,$08,$01,$08,$02,$08
	.byte $c8,$40
	.byte $c4,<stacc_song_nse,>stacc_song_nse
	.byte $ff




push_start_sq1:
	.byte $c2,$05
	.byte $32,$01,$42,$01,$52,$01,$62,$01,$72,$01, $82,$01,$92,$01,$a2,$01,$b2,$01,$32,$01
	.byte $ff
push_start_sq2:
	.byte $c2,$05
	.byte $31,$01,$41,$01,$51,$01,$61,$01,$71,$01, $81,$01,$91,$01,$a1,$01,$b1,$01,$32,$01
	.byte $ff
push_start_tri:
	.byte $33,$01,$43,$01,$53,$01,$63,$01,$73,$01, $83,$01,$93,$01,$a3,$01,$b3,$01,$33,$01
	.byte $ff




game_intro_sq1:
	.byte $c2,$01
	.byte $52,$08,$72,$08,$22,$20
	.byte $93,$08,$b3,$08,$23,$30
	.byte $ff
game_intro_sq2:
	.byte $c2,$01
	.byte $51,$08,$71,$08,$21,$20
	.byte $91,$08,$b1,$08,$22,$30
	.byte $ff
game_intro_tri:
	.byte $52,$08,$72,$08,$22,$20
	.byte $93,$08,$b3,$08,$22,$30
	.byte $ff
game_intro_nse:
	.byte $c2,$02
	.byte $0b,$08,$0c,$08,$05,$20
	.byte $0c,$08,$0d,$08,$0e,$30
	.byte $ff


game_song_sq1:
	.byte $c2,$06
	.byte $01,$04,$01,$04, $01,$04,$01,$04, $c8,$04,$01,$04, $c8,$04,$01,$04
	.byte $31,$04,$31,$04, $31,$04,$31,$04, $c8,$04,$31,$04, $c8,$04,$31,$04
	.byte $01,$04,$01,$04, $01,$04,$01,$04, $c8,$04,$01,$04, $c8,$04,$01,$04
	.byte $71,$20
	.byte $31,$04,$31,$04, $31,$04,$31,$04, $c8,$04,$31,$04, $c8,$04,$31,$04
	.byte $01,$04,$01,$04, $01,$04,$01,$04, $c8,$04,$01,$04, $c8,$04,$01,$04
	.byte $71,$04,$71,$04, $71,$04,$71,$04, $c8,$04,$71,$04, $c8,$04,$71,$04
	.byte $00,$20
	.byte $c3,<game_song_sq1,>game_song_sq1,$03
game_song_sq1_1:
	.byte $c5,$0c
	.byte $c2,$08
	.byte $03,$18,$73,$04,$33,$04, $33,$18,$73,$04,$33,$04
	.byte $03,$18,$73,$04,$33,$04, $73,$18,$73,$04,$33,$04
	.byte $33,$18,$73,$04,$33,$04, $03,$18,$73,$04,$33,$04
	.byte $73,$18,$73,$04,$33,$04, $03,$18,$73,$04,$33,$04
	.byte $c3,<game_song_sq1_1,>game_song_sq1_1,$01
game_song_sq1_2:
	.byte $c5,$0c
	.byte $c2,$08
	.byte $73,$18,$03,$04,$33,$04, $73,$18,$33,$04,$03,$04
	.byte $33,$18,$03,$04,$73,$04, $03,$20
	.byte $03,$18,$33,$04,$73,$04, $73,$20
	.byte $33,$20, $04,$20
	.byte $c3,<game_song_sq1_2,>game_song_sq1_2,$01
	.byte $c5,$00
	.byte $c4,<game_song_sq1,>game_song_sq1
	.byte $ff

game_song_sq2:
	.byte $c2,$06
	.byte $00,$04,$00,$04, $00,$04,$00,$04, $c8,$04,$00,$04, $c8,$04,$00,$04
	.byte $30,$04,$30,$04, $30,$04,$30,$04, $c8,$04,$30,$04, $c8,$04,$30,$04
	.byte $00,$04,$00,$04, $00,$04,$00,$04, $c8,$04,$00,$04, $c8,$04,$00,$04
	.byte $70,$20
	.byte $30,$04,$30,$04, $30,$04,$30,$04, $c8,$04,$30,$04, $c8,$04,$30,$04
	.byte $00,$04,$00,$04, $00,$04,$00,$04, $c8,$04,$00,$04, $c8,$04,$00,$04
	.byte $70,$04,$70,$04, $70,$04,$70,$04, $c8,$04,$70,$04, $c8,$04,$70,$04
	.byte $00,$20
game_song_sq2_1:
	.byte $c2,$06
	.byte $00,$04,$00,$04, $00,$04,$00,$04, $03,$01,$33,$01,$73,$01,$33,$01, $00,$04, $c8,$04,$00,$04
	.byte $30,$04,$30,$04, $30,$04,$30,$04, $33,$01,$63,$01,$a3,$01,$63,$01, $30,$04, $33,$01,$63,$01,$a3,$01,$63,$01, $30,$04
	.byte $00,$04,$00,$04, $00,$04,$00,$04, $03,$01,$33,$01,$73,$01,$33,$01, $00,$04, $c8,$04,$00,$04
	.byte $73,$04,$33,$04, $43,$04,$c9,$01,$73,$08,$c9,$00,$73,$04, $03,$04,$23,$04	;$70,$20
	.byte $30,$04,$30,$04, $30,$04,$30,$04, $33,$01,$63,$01,$a3,$01,$63,$01, $30,$04, $c8,$04,$30,$04
	.byte $00,$04,$00,$04, $00,$04,$00,$04, $03,$01,$33,$01,$73,$01,$33,$01, $00,$04, $c8,$04,$00,$04
	.byte $70,$04,$70,$04, $70,$04,$70,$04, $73,$01,$a3,$01,$04,$01,$a3,$01, $70,$04, $33,$01,$63,$01,$a3,$01,$63,$01, $70,$04
	.byte $03,$04,$63,$04, $c9,$01,$33,$08,$73,$08,$c9,$00, $33,$01,$63,$01,$a3,$01,$63,$01, $33,$01,$63,$01,$a3,$01,$63,$01	;$00,$20
	.byte $c3,<game_song_sq2_1,>game_song_sq2_1,$01
	.byte $c2,$0e
	.byte $03,$20, $33,$20, $03,$20, $73,$20, $33,$20, $03,$20, $73,$20, $03,$20
game_song_sq2_2:
	.byte $c2,$01
	.byte $03,$18,$73,$04,$33,$04, $33,$18,$73,$04,$33,$04
	.byte $03,$18,$73,$04,$33,$04, $73,$18,$73,$04,$33,$04
	.byte $33,$18,$73,$04,$33,$04, $03,$18,$73,$04,$33,$04
	.byte $73,$18,$73,$04,$33,$04, $03,$18,$73,$04,$33,$04
	.byte $c3,<game_song_sq2_2,>game_song_sq2_2,$01
game_song_sq2_3:
	.byte $c2,$01
	.byte $73,$18,$03,$04,$33,$04, $73,$18,$33,$04,$03,$04
	.byte $33,$18,$03,$04,$73,$04, $03,$20
	.byte $03,$18,$33,$04,$73,$04, $73,$20
	.byte $33,$20, $04,$20
	.byte $c3,<game_song_sq2_3,>game_song_sq2_3,$01
	.byte $c4,<game_song_sq2,>game_song_sq2
	.byte $ff

game_song_tri:
	.byte $03,$20, $33,$20, $03,$20, $73,$20, $33,$20, $03,$20, $73,$20, $03,$20
game_song_tri1:
	.byte $c1,$01
	.byte $02,$04,$02,$04, $02,$04,$02,$04, $02,$04,$02,$04, $02,$04,$02,$04
	.byte $32,$04,$32,$04, $32,$04,$32,$04, $32,$04,$32,$04, $32,$04,$32,$04
	.byte $02,$04,$02,$04, $02,$04,$02,$04, $02,$04,$02,$04, $02,$04,$02,$04
	.byte $72,$04,$72,$04, $72,$04,$72,$04, $72,$04,$72,$04, $72,$04,$72,$04
	.byte $32,$04,$32,$04, $32,$04,$32,$04, $32,$04,$32,$04, $32,$04,$32,$04
	.byte $02,$04,$02,$04, $02,$04,$02,$04, $02,$04,$02,$04, $02,$04,$02,$04
	.byte $72,$04,$72,$04, $72,$04,$72,$04, $72,$04,$72,$04, $72,$04,$72,$04
	.byte $02,$04,$02,$04, $02,$04,$02,$04, $02,$04,$02,$04, $02,$04,$02,$04
	.byte $c3,<game_song_tri1,>game_song_tri1,$02
game_song_tri2:
	.byte $03,$04,$03,$04, $03,$04,$03,$04, $03,$04,$03,$04, $03,$04,$03,$04
	.byte $33,$04,$33,$04, $33,$04,$33,$04, $33,$04,$33,$04, $33,$04,$33,$04
	.byte $03,$04,$03,$04, $03,$04,$03,$04, $03,$04,$03,$04, $03,$04,$03,$04
	.byte $73,$04,$73,$04, $73,$04,$73,$04, $73,$04,$73,$04, $73,$04,$73,$04
	.byte $33,$04,$33,$04, $33,$04,$33,$04, $33,$04,$33,$04, $33,$04,$33,$04
	.byte $03,$04,$03,$04, $03,$04,$03,$04, $03,$04,$03,$04, $03,$04,$03,$04
	.byte $73,$04,$73,$04, $73,$04,$73,$04, $73,$04,$73,$04, $73,$04,$73,$04
	.byte $03,$04,$03,$04, $03,$04,$03,$04, $03,$04,$03,$04, $03,$04,$03,$04
	.byte $c3,<game_song_tri2,>game_song_tri2,$01
game_song_tri3:
	.byte $03,$04,$33,$04, $73,$08, $03,$04,$33,$04, $73,$08
	.byte $03,$04,$33,$04, $73,$08, $03,$04,$33,$04, $73,$08
	.byte $03,$04,$33,$04, $73,$08, $03,$04,$33,$04, $73,$08
	.byte $03,$04,$33,$04, $73,$08, $03,$04,$33,$04, $73,$08
	.byte $33,$04,$73,$04, $a3,$08, $33,$04,$73,$04, $a3,$08
	.byte $33,$04,$73,$04, $a3,$08, $33,$04,$73,$04, $a3,$08
	.byte $73,$04,$a3,$04, $24,$08, $73,$04,$a3,$04, $24,$08
	.byte $73,$04,$a3,$04, $04,$08, $73,$04,$a3,$04, $04,$08
	.byte $c3,<game_song_tri3,>game_song_tri3,$01
	.byte $c4,<game_song_tri,>game_song_tri
	.byte $ff
game_song_nse:
	.byte $c8,$80,$c8,$80
game_song_nse1:
	.byte $c2,$04,$0d,$04, $c2,$01,$00,$04, $c2,$05,$00,$04, $c2,$01,$00,$04, $c2,$04,$0c,$08, $c2,$01,$00,$04,$00,$04
	.byte $c2,$04,$0d,$04,$0d,$04, $c2,$01,$00,$04,$00,$04, $c2,$04,$0c,$08, $c2,$05,$00,$08
	.byte $c2,$04,$0d,$04, $c8,$04, $c2,$01,$00,$02,$00,$02, $00,$04, $c2,$04,$0c,$08, $c2,$01,$00,$04,$00,$04
	.byte $c2,$04,$0d,$04,$0d,$04, $c2,$01,$00,$04,$00,$04, $c2,$04,$0c,$08, $c2,$05,$10,$08
	.byte $c3,<game_song_nse1,>game_song_nse1,$03
game_song_nse2:
	.byte $c2,$04,$0d,$04, $c2,$01,$00,$04,$00,$04,$00,$04, $c2,$04,$0c,$04, $c2,$01,$00,$04,$00,$04,$00,$04
	.byte $c3,<game_song_nse2,>game_song_nse2,$06
	.byte $c2,$04,$0d,$04, $c2,$01,$00,$04,$00,$04,$c2,$04,$0a,$04, $0c,$04, $0b,$04,$0d,$04,$0e,$04
game_song_nse3:
	.byte $c2,$01,$0d,$08, $00,$08, $0c,$08, $00,$08
	.byte $c3,<game_song_nse3,>game_song_nse3,$0e
	.byte $c2,$01,$0c,$08, $0c,$08, $0c,$08, $0c,$08
game_song_nse4:
	.byte $c2,$01,$0d,$04,$00,$04, $00,$08, $0c,$04,$00,$04, $00,$08
	.byte $c3,<game_song_nse4,>game_song_nse4,$0f
game_song_nse5:
	.byte $c2,$01
	.byte $0d,$10,$81,$10, $0c,$10,$81,$08,$81,$08,$0d,$10,$81,$10, $0c,$10,$81,$08,$81,$08
	.byte $0d,$10,$81,$10, $0c,$10,$81,$08,$81,$08,$0d,$10,$81,$10, $0a,$08,$0b,$08,$0c,$08,$0d,$08
	.byte $c4,<game_song_nse1,>game_song_nse1
	.byte $ff



catchy_song_sq1:
	.byte $c2,$01
	.byte $32,$08,$32,$10,$32,$08,$a2,$20, $03,$10, $82,$10, $52,$20
	.byte $52,$08,$52,$10,$52,$08,$a2,$10, $82,$10, $a2,$40
	.byte $72,$08,$72,$10,$72,$08,$a2,$20, $03,$10, $82,$10, $52,$20
	.byte $52,$08,$52,$10,$52,$08,$82,$10, $72,$10, $52,$40
;	.byte $c3,<catchy_song_sq1,>catchy_song_sq1
catchy_song_sq1_1:
	.byte $c2,$06
	.byte $70,$20,$a0,$20, $01,$10, $80,$10, $50,$20
	.byte $50,$20,$a0,$10, $80,$10, $a0,$40
	.byte $30,$20,$a0,$20, $01,$10, $80,$10, $50,$20
	.byte $80,$20,$80,$10, $70,$10, $50,$40
	.byte $c3,<catchy_song_sq1_1,>catchy_song_sq1_1,$01
catchy_song_sq1_2:
	.byte $c2,$0f
	.byte $53,$40
	.byte $83,$40
	.byte $53,$40
	.byte $03,$40
	.byte $c3,<catchy_song_sq1_2,>catchy_song_sq1_2,$03
catchy_song_sq1_3:
	.byte $c2,$06
	.byte $70,$20,$a0,$20, $01,$10, $80,$10, $50,$20
	.byte $50,$20,$a0,$10, $80,$10, $a0,$40
	.byte $30,$20,$a0,$20, $01,$10, $80,$10, $50,$20
	.byte $80,$20,$80,$10, $70,$10, $50,$40
	.byte $31,$08,$32,$08,$31,$08,$32,$08,$a1,$08,$a2,$08,$a1,$08,$a2,$08
	.byte $01,$08,$02,$08,$81,$08,$82,$08,$51,$08,$52,$08,$51,$08,$52,$08

	.byte $51,$08,$52,$08,$51,$08,$52,$08,$a1,$08,$a2,$08,$81,$08,$82,$08
	.byte $a1,$08,$a2,$08,$a1,$08,$a2,$08,$a1,$08,$a2,$08,$a1,$08,$a2,$08

	.byte $71,$08,$72,$08,$71,$08,$72,$08,$a1,$08,$a2,$08,$a1,$08,$a2,$08
	.byte $01,$08,$02,$08,$81,$08,$82,$08,$51,$08,$52,$08,$51,$08,$52,$08

	.byte $51,$08,$52,$08,$51,$08,$52,$08,$81,$08,$82,$08,$71,$08,$72,$08
	.byte $c9,$01,$52,$40,$c9,$00	;$52,$08,$51,$08,$52,$08,$51,$08,$52,$08,$51,$08,$52,$08
;	.byte $c3,<catchy_song_sq1_3,>catchy_song_sq1_3,$01
	.byte $c4,<catchy_song_sq1,>catchy_song_sq1
	.byte $ff
catchy_song_sq2:
	.byte $c2,$06
	.byte $70,$20,$a0,$20, $01,$10, $80,$10, $50,$20
	.byte $50,$20,$a0,$10, $80,$10, $a0,$40
	.byte $30,$20,$a0,$20, $01,$10, $80,$10, $50,$20
	.byte $80,$20,$80,$10, $70,$10, $50,$40
catchy_song_sq2_1:
	.byte $c2,$01
	.byte $03,$20,$a3,$20, $53,$40
	.byte $53,$20, $c9,$01,$a3,$60,$c9,$00
	.byte $73,$20,$a2,$20, $53,$08,$53,$08, $33,$08,$32,$08, $53,$20
	.byte $52,$08,$52,$10,$52,08,$82,$10, $72,$10, $52,$40

	.byte $03,$20,$a3,$20, $53,$10,$83,$10,$03,$10,$53,$10
	.byte $53,$20, $c9,$01,$a3,$5c,$c9,$00, $33,$01,$43,$01,$53,$01,$63,$01
	.byte $73,$20,$a2,$20, $53,$08,$53,$08, $33,$08,$32,$08, $53,$20
	.byte $52,$08,$52,$10,$52,08,$82,$10, $72,$10, $53,$16,$83,$15,$53,$15
catchy_song_sq2_2:
	.byte $c2,$01
	.byte $93,$40
	.byte $04,$40
	.byte $93,$40
	.byte $43,$40
	.byte $c3,<catchy_song_sq2_2,>catchy_song_sq2_2,$01
catchy_song_sq2_3:
	.byte $c2,$0e
	.byte $92,$10,$52,$10,$92,$10, $52,$10
	.byte $02,$10,$82,$10,$02,$10, $82,$10
	.byte $92,$10,$52,$10,$92,$10, $52,$10
	.byte $42,$10,$02,$10,$42,$10, $02,$10
	.byte $c3,<catchy_song_sq2_3,>catchy_song_sq2_3,$01
catchy_song_sq2_4:
	.byte $c2,$0f
	.byte $c6,$06
	.byte $73,$40
	.byte $c6,$05
	.byte $54,$40
	.byte $c6,$04
	.byte $33,$40
	.byte $c6,$03
	.byte $83,$40
	.byte $c6,$02
	.byte $73,$40
	.byte $c6,$01
	.byte $54,$40
	.byte $c6,$00
	.byte $33,$40
	.byte $83,$40
	.byte $73,$40
	.byte $54,$40
	.byte $33,$40
	.byte $83,$40
	.byte $73,$40
	.byte $54,$40
	.byte $33,$40
	.byte $c9,$01,$83,$40,$c9,$00
	.byte $c4,<catchy_song_sq2,>catchy_song_sq2
	.byte $ff
catchy_song_tri:
;	.byte $c8,$80,$c8,$80,$c8,$80,$c8,$80
catchy_song_tri1:
	.byte $31,$08,$32,$08,$31,$08,$32,$08,$a1,$08,$a2,$08,$a1,$08,$a2,$08
	.byte $01,$08,$02,$08,$81,$08,$82,$08,$51,$08,$52,$08,$51,$08,$52,$08

	.byte $51,$08,$52,$08,$51,$08,$52,$08,$a1,$08,$a2,$08,$81,$08,$82,$08
	.byte $a1,$08,$a2,$08,$a1,$08,$a2,$08,$a1,$08,$a2,$08,$a1,$08,$a2,$08

	.byte $71,$08,$72,$08,$71,$08,$72,$08,$a1,$08,$a2,$08,$a1,$08,$a2,$08
	.byte $01,$08,$02,$08,$81,$08,$82,$08,$51,$08,$52,$08,$51,$08,$52,$08

	.byte $51,$08,$52,$08,$51,$08,$52,$08,$81,$08,$82,$08,$71,$08,$72,$08
	.byte $51,$08,$52,$08,$51,$08,$52,$08,$51,$08,$52,$08,$51,$08,$52,$08
	.byte $c3,<catchy_song_tri1,>catchy_song_tri1,$01
	.byte $31,$08,$32,$08,$31,$08,$32,$08,$a1,$08,$a2,$08,$a1,$08,$a2,$08
	.byte $01,$08,$02,$08,$81,$08,$82,$08,$51,$08,$52,$08,$51,$08,$52,$08

	.byte $51,$08,$52,$08,$51,$08,$52,$08,$a1,$08,$a2,$08,$81,$08,$82,$08
	.byte $a1,$08,$a2,$08,$a1,$08,$a2,$08,$a1,$08,$a2,$08,$a1,$08,$a2,$08

	.byte $71,$08,$72,$08,$71,$08,$72,$08,$a1,$08,$a2,$08,$a1,$08,$a2,$08
	.byte $01,$08,$02,$08,$81,$08,$82,$08,$51,$08,$52,$08,$51,$08,$52,$08

	.byte $51,$08,$52,$08,$51,$08,$52,$08,$81,$08,$82,$08,$71,$08,$72,$08
	.byte $51,$16,$82,$15,$03,$15
catchy_song_tri2:
	.byte $c1,$01
	.byte $52,$08,$c8,$08,$52,$08,$52,$08, $52,$08,$c8,$08,$52,$08,$52,$08
	.byte $82,$08,$c8,$08,$82,$08,$82,$08, $82,$08,$c8,$08,$82,$08,$82,$08
	.byte $52,$08,$c8,$08,$52,$08,$52,$08, $52,$08,$c8,$08,$52,$08,$52,$08
	.byte $02,$08,$c8,$08,$02,$08,$02,$08, $02,$08,$c8,$08,$02,$08,$02,$08
	.byte $c3,<catchy_song_tri2,>catchy_song_tri2,$03
catchy_song_tri3:
	.byte $c1,$01
	.byte $72,$20,$a2,$20, $03,$10, $82,$10, $52,$20
	.byte $52,$20,$a2,$10, $82,$10, $a2,$40
	.byte $32,$20,$a2,$20, $03,$10, $82,$10, $52,$20
	.byte $82,$20,$82,$10, $72,$10, $52,$40
	.byte $72,$20,$a2,$20, $03,$10, $82,$10, $52,$20
	.byte $52,$20,$a2,$10, $82,$10, $a2,$40
	.byte $32,$20,$a2,$20, $03,$10, $82,$10, $52,$20
	.byte $82,$20,$82,$10, $72,$10, $c9,$01,$52,$40,$c9,$00
;	.byte $c3,<catchy_song_tri3,>catchy_song_tri3,$01
	.byte $c4,<catchy_song_tri,>catchy_song_tri
	.byte $ff
catchy_song_nse:
;	.byte $c8,$80,$c8,$80,$c8,$80,$c8,$80
catchy_song_nse1:
	.byte $c2,$02
	.byte $0a,$08, $00,$04,$00,$02,$00,$02, $0c,$08, $00,$04,$00,$04
	.byte $0a,$08, $00,$04,$00,$04, $0c,$08, $00,$08
	.byte $c3,<catchy_song_nse1,>catchy_song_nse1,$16
	.byte $0a,$16,$0c,$15,$0e,$15
catchy_song_nse2:
	.byte $c2,$01
	.byte $0a,$08, $00,$08,$00,$08,$00,$08, $0c,$08, $00,$08,$00,$08,$00,$08
	.byte $0a,$08, $00,$08,$00,$08,$00,$08, $0c,$08, $00,$08,$00,$08,$00,$08
	.byte $c3,<catchy_song_nse2,>catchy_song_nse2,$06
	.byte $0a,$08, $00,$08,$00,$08,$00,$08, $0c,$08, $00,$08,$00,$08,$00,$08
	.byte $00,$02,$00,$02,$00,$02,$00,$02, $00,$02,$00,$02,$00,$02,$00,$02
	.byte $00,$08, $00,$04,$00,$04
	.byte $00,$08, $00,$02,$00,$02,$00,$04, $00,$02,$00,$02,$00,$02,$00,$02, $00,$08
catchy_song_nse3:
	.byte $c2,$02
	.byte $00,$04,$00,$02,$00,$02, $00,$04,$00,$02,$00,$02, $00,$08, $00,$04,$00,$04
	.byte $00,$08, $00,$02,$00,$02,$00,$04, $00,$04,$00,$04, $00,$08
	.byte $c3,<catchy_song_nse3,>catchy_song_nse3,$06
	.byte $00,$04,$00,$02,$00,$02, $00,$04,$00,$02,$00,$02, $00,$08, $00,$04,$00,$04
	.byte $0d,$08, $0c,$08, $0b,$04,$0b,$04, $0a,$08
catchy_song_nse4:
	.byte $c2,$01
	.byte $0a,$08,$00,$08,$0c,$08,$00,$08
	.byte $0a,$08,$00,$08,$0c,$08,$00,$08
	.byte $0a,$08,$00,$08,$0c,$08,$00,$08
	.byte $0a,$08,$00,$08,$0c,$08,$00,$08
	.byte $c3,<catchy_song_nse4,>catchy_song_nse4,$02
	.byte $0a,$08,$00,$08,$0c,$08,$00,$08
	.byte $0a,$08,$00,$08,$0c,$08,$00,$08
	.byte $c2,$02
	.byte $0a,$04,$0a,$04,$0b,$08, $0b,$04,$0b,$04,$0c,$08
	.byte $0c,$04,$0c,$04,$0d,$08, $0d,$08,$81,$08
	.byte $c4,<catchy_song_nse,>catchy_song_nse
	.byte $ff







; CDEDCDEF FGAGFG CDEDCDEF DEFEDE
; qeqeqqqq qeqeqh qeqeqqqq qeqeqw
tims_song_sq1:
	.byte $c2,$05
	.byte $30,$10,$50,$08,$70,$10,$50,$08,$30,$10,$50,$10,$70,$10,$80,$10
	.byte $80,$10,$a0,$08,$01,$10,$a0,$08,$80,$10,$a0,$20
	.byte $30,$10,$50,$08,$70,$10,$50,$08,$30,$10,$50,$10,$70,$10,$80,$10
	.byte $50,$10,$70,$08,$80,$10,$70,$08,$50,$10,$70,$40
	.byte $ff
tims_song_sq2:
	.byte $ff
tims_song_tri:
	.byte $ff
tims_song_nse:
	.byte $ff



; Sound effects - Absolutely everything that applies for the music and songs
; applies here too, except sound effects have their own playlist and their
; own envelope table. Also, all sound effects play at tempo $100, which is
; impossible for music, since music tempo only goes up to $FF. When a sound
; effect is playing, it'll interrupt the corresponding channels of the music,
; and then when the sound effect is finished, the music channels it hogged will
; be audible again.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sound effect envelopes  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

sfxenvelopes:
	.addr sfxenv1
	.addr hit_env, han_hit_env, mag_env, win_env, pick_env1
	.addr no_revive_env, zecrom_env, drop_env, save_env, block_env
	.addr punch_env, binger, climb_env
sfxenv1:
 .byte	$8F,$8D,$88,$8F,$8E,$8D,$8C,$8B,$8A,$89,$88,$87,$86,$85,$84,$83,$82,$81,$80,$FF
hit_env:
	.byte $0f,$0e,$0f,$0e,$0f,$0e,$0f,$ff
han_hit_env:
	.byte $82,$8f,$8d,$88,$87,$86,$83,$82,$10,$07
mag_env:
	.byte $8f,$8a,$10,$00
win_env:
	.byte $0f,$0f,$0f,$0f,$0e,$0e,$0d,$0d,$0c,$0c,$0d,$0d,$0c,$0c,$0b,$0a,$ff
pick_env1:
	.byte $4f,$4a,$4e,$49,$4d,$48,$4c,$47,$4b,$46,$4a,$45,$49,$44,$48,$43,$10,$00
no_revive_env:
	.byte $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$10,$00
zecrom_env:
	.byte $88,$89,$8a,$8b,$8c,$8d,$8d,$8f,$8e,$8d,$8c,$8b,$8a,$89,$88,$87,$10,$00;,$86
drop_env:
	.byte $4f,$10,$00
save_env:
	.byte $88,$8e,$8f,$8f,$8f,$8e,$8e,$8d,$8d,$8e,$10,$00
block_env:
	.byte $45,$48,$4a,$8a,$8f,$8f,$0f,$10,$00;,$09,$08,$06,$05,$ff
punch_env:
	.byte $8a,$89,$88,$87,$10,$03	;$ff
binger:
	.byte $45,$45,$85,$86,$8d,$8c,$85,$84,$10,$08	;$ff
climb_env:
	.byte $4b,$42,$ff
;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  sound effect table  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;
sounds:
	.addr sfx_silence
	.addr pause_jingle, block_jingle, thous_jingle, wrong_jingle, right_jingle
	.addr drops_jingle, climb_jingle, tally_jingle

;;;;;;;;;;;;;;;;;;;;;
;;  sound effects  ;;
;;;;;;;;;;;;;;;;;;;;;
sfx_silence:
	.word	$0000, $0000, $0000, $0000

pause_jingle:
	.addr pause_sq1, $0000, $0000, $0000
pause_sq1:
	.byte $c2,$00
	.byte $33,$04, $03,$04, $33,$04, $63,$04, $ff

block_jingle:
	.addr block_sq1, $0000, $0000, block_nse;$0000;
block_sq1:
	.byte $c2,$0a
	.byte $30,$02, $70,$02, $11,$02, $c9,$fe,$81,$08,$c9,$00, $00,$04, $ff
block_nse:
	.byte $c8,$06
	.byte $c2,$00
	.byte $c9,$01,$09,$0c,$c9,$00,$ff

thous_jingle:
	.addr thous_sq1, $0000, $0000, $0000
thous_sq1:
	.byte $c2,$03
	.byte $33,$02, $ff

wrong_jingle:
	.addr wrong_sq1,$0000,$0000,$0000
wrong_sq1:
	.byte $c2,$01
	.byte $30,$08,$c8,$04,$30,$08,$ff

right_jingle:
	.addr right_sq1,$0000,$0000,$0000
right_sq1:
	.byte $c2,$0c
	.byte $63,$04, $c2,$0b, $64,$08, $ff

drops_jingle:
	.addr drops_sq1,$0000,$0000,$0000
drops_sq1:
	.byte $c2,$08
	.byte $c9,$0a, $04,$20, $c9,$00, $ff

climb_jingle:
	.addr climb_sq1,$0000,$0000,$0000
climb_sq1:
	.byte $c2,$0d
	.byte $00,$02, $70,$02, $01,$02, $71,$02, $02,$02, $72,$02, $ff


tally_jingle:
	.addr tally_sq1,$0000,$0000,$0000
tally_sq1:
	.byte $c2,$04, $03,$01, $ff


