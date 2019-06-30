spa_lo: 
.byte <spa_peop00,<spa_peop01,<spa_peop02,<spa_peop03,<spa_peop04,<spa_peop05,<spa_peop06,<spa_peop07,<spa_peop08,<spa_peop09
.byte <spa_time00,<spa_time01,<spa_time02,<spa_time03,<spa_time04,<spa_time05,<spa_time06,<spa_time07,<spa_time08,<spa_time09
.byte <spa_nums00,<spa_nums01,<spa_nums02,<spa_nums03,<spa_nums04,<spa_nums05,<spa_nums06,<spa_nums07,<spa_nums08,<spa_nums09
.byte <spa_home00,<spa_home01,<spa_home02,<spa_home03,<spa_home04,<spa_home05,<spa_home06,<spa_home07,<spa_home08,<spa_home09
.byte <spa_medi00,<spa_medi01,<spa_medi02,<spa_medi03,<spa_medi04,<spa_medi05,<spa_medi06,<spa_medi07,<spa_medi08,<spa_medi09
.byte <spa_food00,<spa_food01,<spa_food02,<spa_food03,<spa_food04,<spa_food05,<spa_food06,<spa_food07,<spa_food08,<spa_food09
.byte <spa_scho00,<spa_scho01,<spa_scho02,<spa_scho03,<spa_scho04,<spa_scho05,<spa_scho06,<spa_scho07,<spa_scho08,<spa_scho09
.byte <spa_math00,<spa_math01,<spa_math02,<spa_math03,<spa_math04,<spa_math05,<spa_math06,<spa_math07,<spa_math08,<spa_math09
.byte <spa_xtra00,<spa_xtra01,<spa_xtra02,<spa_xtra03,<spa_xtra04,<spa_xtra05,<spa_xtra06,<spa_xtra07,<spa_xtra08,<spa_xtra09
spa_hi:
.byte >spa_peop00,>spa_peop01,>spa_peop02,>spa_peop03,>spa_peop04,>spa_peop05,>spa_peop06,>spa_peop07,>spa_peop08,>spa_peop09
.byte >spa_time00,>spa_time01,>spa_time02,>spa_time03,>spa_time04,>spa_time05,>spa_time06,>spa_time07,>spa_time08,>spa_time09
.byte >spa_nums00,>spa_nums01,>spa_nums02,>spa_nums03,>spa_nums04,>spa_nums05,>spa_nums06,>spa_nums07,>spa_nums08,>spa_nums09
.byte >spa_home00,>spa_home01,>spa_home02,>spa_home03,>spa_home04,>spa_home05,>spa_home06,>spa_home07,>spa_home08,>spa_home09
.byte >spa_medi00,>spa_medi01,>spa_medi02,>spa_medi03,>spa_medi04,>spa_medi05,>spa_medi06,>spa_medi07,>spa_medi08,>spa_medi09
.byte >spa_food00,>spa_food01,>spa_food02,>spa_food03,>spa_food04,>spa_food05,>spa_food06,>spa_food07,>spa_food08,>spa_food09
.byte >spa_scho00,>spa_scho01,>spa_scho02,>spa_scho03,>spa_scho04,>spa_scho05,>spa_scho06,>spa_scho07,>spa_scho08,>spa_scho09
.byte >spa_math00,>spa_math01,>spa_math02,>spa_math03,>spa_math04,>spa_math05,>spa_math06,>spa_math07,>spa_math08,>spa_math09
.byte >spa_xtra00,>spa_xtra01,>spa_xtra02,>spa_xtra03,>spa_xtra04,>spa_xtra05,>spa_xtra06,>spa_xtra07,>spa_xtra08,>spa_xtra09


spa_peop00:
	.byte "T",$bc,"           "	; You (u tick right)
spa_peop01:                        
	.byte "Yo           "	; Me   
spa_peop02:                        
	.byte "Nosotros     "	; Us   
spa_peop03:                        
	.byte "Ellos        "	; Them 
spa_peop04:                        
	.byte $b1,"l           "	; He (capital e tick right)
spa_peop05:                        
	.byte "Ella         "	; She  
spa_peop06:                        
	.byte "Hombre       "	; Man  
spa_peop07:                        
	.byte "Mujer        "	; Woman
spa_peop08:                        
	.byte "Ni",$bd,"o         "	; Boy (n squiggle)
spa_peop09:                        
	.byte "Ni",$bd,"a         "	; Girl (n squiggle)



spa_time00:
	.byte "Reloj        "	; Clock
spa_time01:
	.byte "Hora         "	; Hour
spa_time02:
	.byte "Minuto       "	; Minute
spa_time03:
	.byte "Segundo      "	; Second
spa_time04:
	.byte "A",$bd,"o          "	; Year (n squiggly)
spa_time05:
	.byte "Mes          "	; Month
spa_time06:
	.byte "Semana       "	; Week
spa_time07:
	.byte "Fecha        "   ; Date
spa_time08:
	.byte "D",$ba,"a          "	; Day (i tick right)
spa_time09:
	.byte "Noche        "	; Night

spa_nums00:
	.byte "Cero         "	; Zero
spa_nums01:
	.byte "Uno          "	; One
spa_nums02:
	.byte "Dos          "	; Two
spa_nums03:
	.byte "Tres         "	; Three
spa_nums04:
	.byte "Cuatro       "	; Four
spa_nums05:
	.byte "Cinco        "	; Five
spa_nums06:
	.byte "Seis         "	; Six
spa_nums07:
	.byte "Siete        "	; Seven
spa_nums08:
	.byte "Ocho         "	; Eight
spa_nums09:
	.byte "Nueve        "	; Nine

spa_home00:
	.byte "Ba",$bd,"era       "	; Bathtub (n squiggly)
spa_home01:
	.byte "W",$b8,"ter        "	; Toilet (a tick right)
spa_home02:
	.byte "Ducha        "	; Shower
spa_home03:
	.byte "Jab",$bb,"n        "	; Soap (o tick right)
spa_home04:
	.byte "Cama         "	; Bed
spa_home05:
	.byte "Almohada     "	; Pillow
spa_home06:
	.byte "Caj",$bb,"n        "	; Drawer (o tick right)
spa_home07:
	.byte "Casa         "	; House
spa_home08:                        
	.byte "Techo        "	; Roof 
spa_home09:                        
	.byte "Lavabo       "	; Sink 

spa_medi00:
	.byte "M",$b9,"dico       "	; Doctor (e tick right)
spa_medi01:
	.byte "Enfermera    "	; Nurse
spa_medi02:
	.byte "Paciente     "	; Patient
spa_medi03:
	.byte "Herida       "	; Wound
spa_medi04:
	.byte "Pulso        "	; Pulse
spa_medi05:
	.byte "Venda        "	; Bandage
spa_medi06:
	.byte "Cl",$ba,"nica      "	; Clinic (i tick right)
spa_medi07:
	.byte "Operaci",$bb,"n    "	; Operation (o tick right)
spa_medi08:
	.byte "Cirujano     "	; Surgeon
spa_medi09:
	.byte "Aguja        "	; Needle

spa_food00:
	.byte "Comida       "	; Food
spa_food01:
	.byte "Grasa        "	; Fat
spa_food02:
	.byte "Carne        "	; Meat
spa_food03:
	.byte "Bac",$bb,"n        "	; Bacon (o tick right)
spa_food04:
	.byte "Jam",$bb,"n        "	; Ham (o tick right)
spa_food05:
	.byte "Aves         "	; Poultry
spa_food06:
	.byte "Queso        "	; Cheese
spa_food07:
	.byte "Huevos       "	; Eggs
spa_food08:
	.byte "Leche        "	; Milk
spa_food09:
	.byte "Nata         "	; Cream


spa_scho00:
	.byte "Alumno       "	; Pupil
spa_scho01:
	.byte "Cuaderno     "	; Notebook
spa_scho02:
	.byte "Lecci",$bb,"n      "	; Lesson (o tick right)
spa_scho03:
	.byte "Profesora    "	; Teacher
spa_scho04:
	.byte "Tesis        "	; Thesis
spa_scho05:
	.byte "Cat",$b8,"logo     "	; Catalog (a tick right)
spa_scho06:
	.byte "Libro        "	; Book
spa_scho07:
	.byte "Biblioteca   "	; Library
spa_scho08:
	.byte "Carrera      "	; Degree
spa_scho09:
	.byte "L",$b8,"piz        "	; Pencil (a tick right)

spa_math00:
	.byte "M",$b8,"s          "	; Plus (a tick right)
spa_math01:
	.byte "Menos        "	; Minus
spa_math02:
	.byte "Anchura      "	; Width
spa_math03:
	.byte "Longitud     "	; Length
spa_math04:
	.byte "Regla        "	; Ruler
spa_math05:
	.byte $c0,"ngulo       "	; Angle (capital A tick right)
spa_math06:                            
	.byte "Proporci",$bb,"n   "	; Ratio (3rd o tick right)
spa_math07:                            
	.byte "Br",$bc,"jula      "	; Compass (1st u tick right
spa_math08:                            
	.byte "Tri",$b8,"ngulo    "	; Triangle (a tick right)
spa_math09:                            
	.byte $c0,"lgebra      "	; Algebra (capital A tick right)


spa_xtra00:
	.byte "Hoy          "	; Today
spa_xtra01:
	.byte "Ma",$bd,"ana       "	; Tomorrow (n squiggly)
spa_xtra02:
	.byte "Diez         "	; Ten
spa_xtra03:
	.byte "Ayer         "	; Yesterday
spa_xtra04:                            
	.byte "Pescado      "	; Fish     
spa_xtra05:                            
	.byte "Caballo      "	; Horse    
spa_xtra06:                            
	.byte "Perro        "	; Dog      
spa_xtra07:                            
	.byte "Gato         "	; Cat      
spa_xtra08:                            
	.byte "Oveja        "	; Sheep    
spa_xtra09:                            
	.byte "Camello      "	; Camel    





