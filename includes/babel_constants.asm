; remap some punctuation for ascii
.charmap $21,$3e	; !
.charmap $22,$5b	; "
.charmap $27,$5c	; '
.charmap $2b,$5d	; +
.charmap $2c,$3c	; ,
.charmap $2d,$5e	; -
.charmap $2e,$3d	; .
.charmap $20,$00	; (space)
;.charmap $a0,$b8	; á
;.charmap $82,$b9	; é
;.charmap $a1,$ba	; í
;.charmap $a2,$bb	; ó
;.charmap $a3,$bc	; ú
;.charmap $84,$b3	; ä
;.charmap $89,$b4	; ë
;.charmap $8b,$b5	; ï
;.charmap $94,$b6	; ö
;.charmap $81,$b7	; ü
;.charmap $e1,$be	; ß
;.charmap $a4,$bd	; ñ


; Constants

a_punch				=	$01
b_punch				=	$02
select_punch		=	$04
start_punch			=	$08
up_punch			=	$10
down_punch			=	$20
left_punch			=	$40
right_punch			=	$80
up_left				=	$50
up_right			=	$90
down_left			=	$60
down_right			=	$a0


pal_address			=	$100

OAM_ram				=	$200

arrow_up			=	$200
arrow_down			=	$204
arrow_left			=	$208
arrow_right			=	$20c
bubble0				=	$210
bubble1				=	$214
bubble2				=	$218
bubble3				=	$21c
brick0				=	$220
brick1				=	$224
brick2				=	$228
brick3				=	$22c
guy0_0				=	$230
guy0_1				=	$234
guy0_2				=	$238
guy0_3				=	$23c
guy1_0				=	$240
guy1_1				=	$244
guy1_2				=	$248
guy1_3				=	$24c
check_b				=	$250
check_a				=	$254
letter0				=	$258
letter1				=	$25c
letter2				=	$260
level_ones			=	$264
level_tens			=	$268
chain0				=	$26c
chain1				=	$270
notice0				=	$274
notice1				=	$278
s_word				=	$27c

howto_sprites		=	$270

music_save			=	$400
;opt0				=	$400
;opt1				=	$410
;opt2				=	$420
;opt3				=	$430
;opt4				=	$440
;opt5				=	$450
;opt6				=	$460
;line				=	$470
;sds_thingy			=	$4fc

first_ram_s			=	$500
secon_ram_s			=	$508
third_ram_s			=	$510
fourt_ram_s			=	$518
fifth_ram_s			=	$520
sixth_ram_s			=	$528
seven_ram_s			=	$530
eight_ram_s			=	$538
ninth_ram_s			=	$540
tenth_ram_s			=	$548
eleve_ram_s			=	$550
first_ram_i			=	$558
secon_ram_i			=	$55b
third_ram_i			=	$55e
fourt_ram_i			=	$561
fifth_ram_i			=	$564
sixth_ram_i			=	$567
seven_ram_i			=	$56a
eight_ram_i			=	$56d
ninth_ram_i			=	$570
tenth_ram_i			=	$573
eleve_ram_i			=	$576
sds_thingy			=	$579
; $57d is next
opt0				=	$580
opt1				=	$590
opt2				=	$5a0
opt3				=	$5b0
opt4				=	$5c0
opt5				=	$5d0
opt6				=	$5e0
opt7				=	$5f0

score_ten_millions		=	$64d
score_millions			=	$64e
score_hun_thousands		=	$64f
score_ten_thousands		=	$650
score_thousands			=	$651
score_hundreds			=	$652
score_tens				=	$653
score_ones				=	$654
score_tens_add			=	$655
score_hundreds_add		=	$656
score_thousands_add		=	$657
score_ten_thousands_add	=	$658
score_hun_thousands_add	=	$659
score_millions_add		=	$65a
score_ten_millions_add	=	$65b
blocks_ones				=	$65c
blocks_tens				=	$65d
blocks_hundreds			=	$65e
blocks_ones_add			=	$65f
blocks_tens_add			=	$660
blocks_hundreds_add		=	$661
chain_ones				=	$662
chain_tens				=	$663
chain_hundreds			=	$664
chain_ones_add			=	$665
chain_tens_add			=	$666
chain_hundreds_add		=	$667
;hi_ones					=	$664
;hi_tens					=	$665
;hi_huns					=	$666
;hi_thous				=	$667
;hi_ten_thous			=	$668
;hi_hun_thous			=	$669
;hi_mills				=	$66a
line				=	$670

FlashRamPage		=	$700
spr_save			=	$700




