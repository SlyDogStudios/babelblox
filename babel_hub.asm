.include "includes\babel_constants.asm"
.include "includes\bank13\music_declarations.asm"

.segment "ZEROPAGE"
.include "includes\babel_zp.asm"

.include "includes\bank00\bank00.asm"		; graphics, title, options, scores
.include "includes\bank01\bank01.asm"		; english, german
.include "includes\bank02\bank02.asm"		; (open)
.include "includes\bank03\bank03.asm"		; french, italian
.include "includes\bank04\bank04.asm"		; (open)
.include "includes\bank05\bank05.asm"		; spanish, japanese, hebrew
.include "includes\bank06\bank06.asm"		; (open)
.include "includes\bank07\bank07.asm"		; greek, latin, swahili
.include "includes\bank08\bank08.asm"		; (open)
.include "includes\bank09\bank09.asm"		; (open)
.include "includes\bank10\bank10.asm"		; manual chr 1, manual pages 2
.include "includes\bank11\bank11.asm"		; manual pages 1
.include "includes\bank12\bank12.asm"		; score, loops, nmis, brick data, movement
.include "includes\bank13\bank13.asm"		; sound
.include "includes\bank14\bank14.asm"		; saving, find score placing
.include "includes\bankFixed\bankFixed.asm"	; main code (bankswitching, vectors)
