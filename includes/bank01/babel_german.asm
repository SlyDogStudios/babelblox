ger_lo: 
.byte <ger_peop00,<ger_peop01,<ger_peop02,<ger_peop03,<ger_peop04,<ger_peop05,<ger_peop06,<ger_peop07,<ger_peop08,<ger_peop09
.byte <ger_time00,<ger_time01,<ger_time02,<ger_time03,<ger_time04,<ger_time05,<ger_time06,<ger_time07,<ger_time08,<ger_time09
.byte <ger_nums00,<ger_nums01,<ger_nums02,<ger_nums03,<ger_nums04,<ger_nums05,<ger_nums06,<ger_nums07,<ger_nums08,<ger_nums09
.byte <ger_home00,<ger_home01,<ger_home02,<ger_home03,<ger_home04,<ger_home05,<ger_home06,<ger_home07,<ger_home08,<ger_home09
.byte <ger_medi00,<ger_medi01,<ger_medi02,<ger_medi03,<ger_medi04,<ger_medi05,<ger_medi06,<ger_medi07,<ger_medi08,<ger_medi09
.byte <ger_food00,<ger_food01,<ger_food02,<ger_food03,<ger_food04,<ger_food05,<ger_food06,<ger_food07,<ger_food08,<ger_food09
.byte <ger_scho00,<ger_scho01,<ger_scho02,<ger_scho03,<ger_scho04,<ger_scho05,<ger_scho06,<ger_scho07,<ger_scho08,<ger_scho09
.byte <ger_math00,<ger_math01,<ger_math02,<ger_math03,<ger_math04,<ger_math05,<ger_math06,<ger_math07,<ger_math08,<ger_math09
.byte <ger_xtra00,<ger_xtra01,<ger_xtra02,<ger_xtra03,<ger_xtra04,<ger_xtra05,<ger_xtra06,<ger_xtra07,<ger_xtra08,<ger_xtra09
ger_hi:
.byte >ger_peop00,>ger_peop01,>ger_peop02,>ger_peop03,>ger_peop04,>ger_peop05,>ger_peop06,>ger_peop07,>ger_peop08,>ger_peop09
.byte >ger_time00,>ger_time01,>ger_time02,>ger_time03,>ger_time04,>ger_time05,>ger_time06,>ger_time07,>ger_time08,>ger_time09
.byte >ger_nums00,>ger_nums01,>ger_nums02,>ger_nums03,>ger_nums04,>ger_nums05,>ger_nums06,>ger_nums07,>ger_nums08,>ger_nums09
.byte >ger_home00,>ger_home01,>ger_home02,>ger_home03,>ger_home04,>ger_home05,>ger_home06,>ger_home07,>ger_home08,>ger_home09
.byte >ger_medi00,>ger_medi01,>ger_medi02,>ger_medi03,>ger_medi04,>ger_medi05,>ger_medi06,>ger_medi07,>ger_medi08,>ger_medi09
.byte >ger_food00,>ger_food01,>ger_food02,>ger_food03,>ger_food04,>ger_food05,>ger_food06,>ger_food07,>ger_food08,>ger_food09
.byte >ger_scho00,>ger_scho01,>ger_scho02,>ger_scho03,>ger_scho04,>ger_scho05,>ger_scho06,>ger_scho07,>ger_scho08,>ger_scho09
.byte >ger_math00,>ger_math01,>ger_math02,>ger_math03,>ger_math04,>ger_math05,>ger_math06,>ger_math07,>ger_math08,>ger_math09
.byte >ger_xtra00,>ger_xtra01,>ger_xtra02,>ger_xtra03,>ger_xtra04,>ger_xtra05,>ger_xtra06,>ger_xtra07,>ger_xtra08,>ger_xtra09

ger_peop00:
	.byte "Sie          "	; You  
ger_peop01:                        
	.byte "Mich         "	; Me   
ger_peop02:                        
	.byte "Uns          "	; Us   
ger_peop03:                        
	.byte "Sie          "	; Them 
ger_peop04:                        
	.byte "Er           "	; He   
ger_peop05:                        
	.byte "Sie          "	; She  
ger_peop06:                        
	.byte "Mann         "	; Man  
ger_peop07:                        
	.byte "Frau         "	; Woman
ger_peop08:                        
	.byte "Junge        "	; Boy  
ger_peop09:                        
	.byte "M",$b3,"dchen      "	; Girl (a two dots)



ger_time00:
	.byte "Uhr          "	; Clock
ger_time01:
	.byte "Stunde       "	; Hour
ger_time02:
	.byte "Minute       "	; Minute
ger_time03:
	.byte "Zweite       "	; Second
ger_time04:
	.byte "Jahr         "	; Year
ger_time05:
	.byte "Monat        "	; Month
ger_time06:
	.byte "Woche        "	; Week
ger_time07:
	.byte "Datum        "	; Date
ger_time08:
	.byte "Tag          "	; Day
ger_time09:
	.byte "Nacht        "	; Night

ger_nums00:
	.byte "Null         "	; Zero
ger_nums01:
	.byte "Ein          "	; One
ger_nums02:
	.byte "Zwei         "	; Two
ger_nums03:
	.byte "Drei         "	; Three
ger_nums04:
	.byte "Vier         "	; Four
ger_nums05:
	.byte "F",$b7,"nf         "	; Five (u two dots)
ger_nums06:
	.byte "Sechs        "	; Six
ger_nums07:
	.byte "Sieben       "	; Seven
ger_nums08:
	.byte "Acht         "	; Eight
ger_nums09:
	.byte "Neun         "	; Nine

ger_home00:
	.byte "Badewanne    "	; Bathtub
ger_home01:
	.byte "Toilette     "	; Toilet
ger_home02:
	.byte "Dusche       "	; Shower
ger_home03:
	.byte "Seife        "	; Soap
ger_home04:
	.byte "Bett         "	; Bed
ger_home05:
	.byte "Kissen       "	; Pillow
ger_home06:
	.byte "Schublade    "	; Drawer
ger_home07:
	.byte "Haus         "	; House
ger_home08:                        
	.byte "Dach         "	; Roof 
ger_home09:                        
	.byte "Sinken       "	; Sink 

ger_medi00:
	.byte "Arzt         "	; Doctor
ger_medi01:
	.byte "Pflegerin    "	; Nurse
ger_medi02:
	.byte "Geduldig     "	; Patient
ger_medi03:
	.byte "Wunde        "	; Wound
ger_medi04:
	.byte "Impuls       "	; Pulse
ger_medi05:
	.byte "Bandage      "	; Bandage
ger_medi06:
	.byte "Klinik       "	; Clinic
ger_medi07:
	.byte "Betrieb      "	; Operation
ger_medi08:
	.byte "Chirurg      "	; Surgeon
ger_medi09:
	.byte "Nadel        "	; Needle

ger_food00:
	.byte "Essen        "	; Food
ger_food01:
	.byte "Fett         "	; Fat
ger_food02:
	.byte "Fleisch      "	; Meat
ger_food03:
	.byte "Speck        "	; Bacon
ger_food04:
	.byte "Schinken     "	; Ham
ger_food05:
	.byte "Gefl",$b7,"gel     "	; Poultry (u two dots)
ger_food06:
	.byte "K",$b3,"se         "	; Cheese (a with two dots)
ger_food07:
	.byte "Eier         "	; Eggs
ger_food08:
	.byte "Milch        "	; Milk
ger_food09:
	.byte "Sahne        "	; Cream

ger_scho00:
	.byte "Sch",$b7,"ler      "	; Pupil (u two dots)
ger_scho01:
	.byte "Notizbuch    "	; Notebook
ger_scho02:
	.byte "Lektion      "	; Lesson
ger_scho03:
	.byte "Lehrer       "	; Teacher
ger_scho04:
	.byte "These        "	; Thesis
ger_scho05:
	.byte "Katalog      "	; Catalog
ger_scho06:
	.byte "Buch         "	; Book
ger_scho07:
	.byte "Bibliothek   "	; Library
ger_scho08:
	.byte "Grad         "	; Degree
ger_scho09:
	.byte "Bleistift    "	; Pencil

ger_math00:
	.byte "Plus         "	; Plus
ger_math01:
	.byte "Minus        "	; Minus
ger_math02:
	.byte "Breite       "	; Width
ger_math03:
	.byte "L",$b3,"nge        "	; Length (a with two dots)
ger_math04:
	.byte "Zollstock    "	; Ruler
ger_math05:
	.byte "Winkel       "	; Angle    
ger_math06:                            
	.byte "Verh",$b3,"ltnis   "	; Ratio  (a with two dots)
ger_math07:                            
	.byte "Kompass      "	; Compass  
ger_math08:                            
	.byte "Dreieck      "	; Triangle
ger_math09:                            
	.byte "Algebra      "	; Algebra  


ger_xtra00:
	.byte "Zehn         "	; Ten
ger_xtra01:
	.byte "Heute        "	; Today
ger_xtra02:
	.byte "Morgen       "	; Tomorrow
ger_xtra03:
	.byte "Gestern      "	; Yesterday
ger_xtra04:                            
	.byte "Fisch        "	; Fish     
ger_xtra05:                            
	.byte "Pferd        "	; Horse    
ger_xtra06:                            
	.byte "Hund         "	; Dog      
ger_xtra07:                            
	.byte "Katze        "	; Cat      
ger_xtra08:                            
	.byte "Schaf        "	; Sheep    
ger_xtra09:                            
	.byte "Kamel        "	; Camel    



