grk_lo: 
.byte <grk_peop00,<grk_peop01,<grk_peop02,<grk_peop03,<grk_peop04,<grk_peop05,<grk_peop06,<grk_peop07,<grk_peop08,<grk_peop09
.byte <grk_time00,<grk_time01,<grk_time02,<grk_time03,<grk_time04,<grk_time05,<grk_time06,<grk_time07,<grk_time08,<grk_time09
.byte <grk_nums00,<grk_nums01,<grk_nums02,<grk_nums03,<grk_nums04,<grk_nums05,<grk_nums06,<grk_nums07,<grk_nums08,<grk_nums09
.byte <grk_home00,<grk_home01,<grk_home02,<grk_home03,<grk_home04,<grk_home05,<grk_home06,<grk_home07,<grk_home08,<grk_home09
.byte <grk_medi00,<grk_medi01,<grk_medi02,<grk_medi03,<grk_medi04,<grk_medi05,<grk_medi06,<grk_medi07,<grk_medi08,<grk_medi09
.byte <grk_food00,<grk_food01,<grk_food02,<grk_food03,<grk_food04,<grk_food05,<grk_food06,<grk_food07,<grk_food08,<grk_food09
.byte <grk_scho00,<grk_scho01,<grk_scho02,<grk_scho03,<grk_scho04,<grk_scho05,<grk_scho06,<grk_scho07,<grk_scho08,<grk_scho09
.byte <grk_math00,<grk_math01,<grk_math02,<grk_math03,<grk_math04,<grk_math05,<grk_math06,<grk_math07,<grk_math08,<grk_math09
.byte <grk_xtra00,<grk_xtra01,<grk_xtra02,<grk_xtra03,<grk_xtra04,<grk_xtra05,<grk_xtra06,<grk_xtra07,<grk_xtra08,<grk_xtra09
grk_hi:
.byte >grk_peop00,>grk_peop01,>grk_peop02,>grk_peop03,>grk_peop04,>grk_peop05,>grk_peop06,>grk_peop07,>grk_peop08,>grk_peop09
.byte >grk_time00,>grk_time01,>grk_time02,>grk_time03,>grk_time04,>grk_time05,>grk_time06,>grk_time07,>grk_time08,>grk_time09
.byte >grk_nums00,>grk_nums01,>grk_nums02,>grk_nums03,>grk_nums04,>grk_nums05,>grk_nums06,>grk_nums07,>grk_nums08,>grk_nums09
.byte >grk_home00,>grk_home01,>grk_home02,>grk_home03,>grk_home04,>grk_home05,>grk_home06,>grk_home07,>grk_home08,>grk_home09
.byte >grk_medi00,>grk_medi01,>grk_medi02,>grk_medi03,>grk_medi04,>grk_medi05,>grk_medi06,>grk_medi07,>grk_medi08,>grk_medi09
.byte >grk_food00,>grk_food01,>grk_food02,>grk_food03,>grk_food04,>grk_food05,>grk_food06,>grk_food07,>grk_food08,>grk_food09
.byte >grk_scho00,>grk_scho01,>grk_scho02,>grk_scho03,>grk_scho04,>grk_scho05,>grk_scho06,>grk_scho07,>grk_scho08,>grk_scho09
.byte >grk_math00,>grk_math01,>grk_math02,>grk_math03,>grk_math04,>grk_math05,>grk_math06,>grk_math07,>grk_math08,>grk_math09
.byte >grk_xtra00,>grk_xtra01,>grk_xtra02,>grk_xtra03,>grk_xtra04,>grk_xtra05,>grk_xtra06,>grk_xtra07,>grk_xtra08,>grk_xtra09

grk_peop00:
	.byte "Eseis        "	; You  
grk_peop01:                        
	.byte "Mou          "	; Me   
grk_peop02:                        
	.byte "Mas          "	; Us   
grk_peop03:                        
	.byte "Tous         "	; Them 
grk_peop04:                        
	.byte "Autos        "	; He   
grk_peop05:                        
	.byte "Aute         "	; She  
grk_peop06:                        
	.byte "Andras       "	; Man  
grk_peop07:                        
	.byte "Gynaika      "	; Woman
grk_peop08:                        
	.byte "Agori        "	; Boy  
grk_peop09:                        
	.byte "Koritsi      "	; Girl 



grk_time00:
	.byte "Roloi        "	; Clock
grk_time01:
	.byte "Ora          "	; Hour
grk_time02:
	.byte "Lepto        "	; Minute
grk_time03:
	.byte "Deuteros     "	; Second
grk_time04:
	.byte "Etos         "	; Year
grk_time05:
	.byte "Menas        "	; Month
grk_time06:
	.byte "Ebdomada     "	; Week
grk_time07:
	.byte "Emeromenia   "	; Date
grk_time08:
	.byte "Emera        "	; Day
grk_time09:
	.byte "Nychta       "	; Night

grk_nums00:
	.byte "Meden        "	; Zero
grk_nums01:
	.byte "Enas         "	; One
grk_nums02:
	.byte "Dyo          "	; Two
grk_nums03:
	.byte "Tria         "	; Three
grk_nums04:
	.byte "Tessera      "	; Four
grk_nums05:
	.byte "Pente        "	; Five
grk_nums06:
	.byte "Exi          "	; Six
grk_nums07:
	.byte "Epta         "	; Seven
grk_nums08:
	.byte "Okto         "	; Eight
grk_nums09:
	.byte "Ennea        "	; Nine

grk_home00:
	.byte "Mpaniera     "	; Bathtub
grk_home01:
	.byte "Toualeta     "	; Toilet
grk_home02:
	.byte "Ntous        "	; Shower
grk_home03:
	.byte "Sapouni      "	; Soap
grk_home04:
	.byte "Krebati      "	; Bed
grk_home05:
	.byte "Maxilari     "	; Pillow
grk_home06:
	.byte "Syrtari      "	; Drawer
grk_home07:
	.byte "Spiti        "	; House
grk_home08:                        
	.byte "Stege        "	; Roof 
grk_home09:                        
	.byte "Nerochytes   "	; Sink 

grk_medi00:
	.byte "Giatros      "	; Doctor
grk_medi01:
	.byte "Nosokoma     "	; Nurse
grk_medi02:
	.byte "Ypomonoetikos"	; Patient
grk_medi03:
	.byte "Plege        "	; Wound
grk_medi04:
	.byte "Sphygmos     "	; Pulse
grk_medi05:
	.byte "Epidesmos    "	; Bandage
grk_medi06:
	.byte "Klinike      "	; Clinic
grk_medi07:
	.byte "Leitourgia   "	; Operation
grk_medi08:
	.byte "Cheirourgos  "	; Surgeon
grk_medi09:
	.byte "Belona       "	; Needle

grk_food00:
	.byte "Trophe       "	; Food
grk_food01:
	.byte "Lipos        "	; Fat
grk_food02:
	.byte "Kreas        "	; Meat
grk_food03:
	.byte "Mpeikon      "	; Bacon
grk_food04:
	.byte "Zampon       "	; Ham
grk_food05:
	.byte "Poulerika    "	; Poultry
grk_food06:
	.byte "Tyri         "	; Cheese
grk_food07:
	.byte "Auga         "	; Eggs
grk_food08:
	.byte "Gala         "	; Milk
grk_food09:
	.byte "Krema        "	; Cream

grk_scho00:
	.byte "Mathetes     "	; Pupil
grk_scho01:
	.byte "Semeiomatario"	; Notebook
grk_scho02:
	.byte "Mathema      "	; Lesson
grk_scho03:
	.byte "Daskalos     "	; Teacher
grk_scho04:
	.byte "Diatribe     "	; Thesis
grk_scho05:
	.byte "Katalogos    "	; Catalog
grk_scho06:
	.byte "Biblio       "	; Book
grk_scho07:
	.byte "Bibliotheke  "	; Library
grk_scho08:
	.byte "Bathmos      "	; Degree
grk_scho09:
	.byte "Molybi       "	; Pencil

grk_math00:
	.byte "Syn          "	; Plus
grk_math01:
	.byte "Meion        "	; Minus
grk_math02:
	.byte "Platos       "	; Width
grk_math03:
	.byte "Mekos        "	; Length
grk_math04:
	.byte "Charakas     "	; Ruler
grk_math05:
	.byte "Gonia        "	; Angle   
grk_math06:                           
	.byte "Analogia     "	; Ratio   
grk_math07:                           
	.byte "Pyxida       "	; Compass 
grk_math08:                           
	.byte "Trigono      "	; Triangle
grk_math09:                           
	.byte "Algebra      "	; Algebra 


grk_xtra00:
	.byte "Deka         "	; Ten
grk_xtra01:
	.byte "Semera       "	; Today
grk_xtra02:
	.byte "Aurio        "	; Tomorrow
grk_xtra03:
	.byte "Echthes      "	; Yesterday
grk_xtra04:                            
	.byte "Psari        "	; Fish     
grk_xtra05:                            
	.byte "Alogo        "	; Horse    
grk_xtra06:                            
	.byte "Skylos       "	; Dog      
grk_xtra07:                            
	.byte "Gata         "	; Cat      
grk_xtra08:                            
	.byte "Probato      "	; Sheep    
grk_xtra09:                            
	.byte "Kamela       "	; Camel    



