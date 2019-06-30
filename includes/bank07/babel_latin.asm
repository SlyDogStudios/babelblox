lat_lo: 
.byte <lat_peop00,<lat_peop01,<lat_peop02,<lat_peop03,<lat_peop04,<lat_peop05,<lat_peop06,<lat_peop07,<lat_peop08,<lat_peop09
.byte <lat_time00,<lat_time01,<lat_time02,<lat_time03,<lat_time04,<lat_time05,<lat_time06,<lat_time07,<lat_time08,<lat_time09
.byte <lat_nums00,<lat_nums01,<lat_nums02,<lat_nums03,<lat_nums04,<lat_nums05,<lat_nums06,<lat_nums07,<lat_nums08,<lat_nums09
.byte <lat_home00,<lat_home01,<lat_home02,<lat_home03,<lat_home04,<lat_home05,<lat_home06,<lat_home07,<lat_home08,<lat_home09
.byte <lat_medi00,<lat_medi01,<lat_medi02,<lat_medi03,<lat_medi04,<lat_medi05,<lat_medi06,<lat_medi07,<lat_medi08,<lat_medi09
.byte <lat_food00,<lat_food01,<lat_food02,<lat_food03,<lat_food04,<lat_food05,<lat_food06,<lat_food07,<lat_food08,<lat_food09
.byte <lat_scho00,<lat_scho01,<lat_scho02,<lat_scho03,<lat_scho04,<lat_scho05,<lat_scho06,<lat_scho07,<lat_scho08,<lat_scho09
.byte <lat_math00,<lat_math01,<lat_math02,<lat_math03,<lat_math04,<lat_math05,<lat_math06,<lat_math07,<lat_math08,<lat_math09
.byte <lat_xtra00,<lat_xtra01,<lat_xtra02,<lat_xtra03,<lat_xtra04,<lat_xtra05,<lat_xtra06,<lat_xtra07,<lat_xtra08,<lat_xtra09
lat_hi:
.byte >lat_peop00,>lat_peop01,>lat_peop02,>lat_peop03,>lat_peop04,>lat_peop05,>lat_peop06,>lat_peop07,>lat_peop08,>lat_peop09
.byte >lat_time00,>lat_time01,>lat_time02,>lat_time03,>lat_time04,>lat_time05,>lat_time06,>lat_time07,>lat_time08,>lat_time09
.byte >lat_nums00,>lat_nums01,>lat_nums02,>lat_nums03,>lat_nums04,>lat_nums05,>lat_nums06,>lat_nums07,>lat_nums08,>lat_nums09
.byte >lat_home00,>lat_home01,>lat_home02,>lat_home03,>lat_home04,>lat_home05,>lat_home06,>lat_home07,>lat_home08,>lat_home09
.byte >lat_medi00,>lat_medi01,>lat_medi02,>lat_medi03,>lat_medi04,>lat_medi05,>lat_medi06,>lat_medi07,>lat_medi08,>lat_medi09
.byte >lat_food00,>lat_food01,>lat_food02,>lat_food03,>lat_food04,>lat_food05,>lat_food06,>lat_food07,>lat_food08,>lat_food09
.byte >lat_scho00,>lat_scho01,>lat_scho02,>lat_scho03,>lat_scho04,>lat_scho05,>lat_scho06,>lat_scho07,>lat_scho08,>lat_scho09
.byte >lat_math00,>lat_math01,>lat_math02,>lat_math03,>lat_math04,>lat_math05,>lat_math06,>lat_math07,>lat_math08,>lat_math09
.byte >lat_xtra00,>lat_xtra01,>lat_xtra02,>lat_xtra03,>lat_xtra04,>lat_xtra05,>lat_xtra06,>lat_xtra07,>lat_xtra08,>lat_xtra09

lat_peop00:
	.byte "Vos          "	; You  
lat_peop01:                        
	.byte "Mihi         "	; Me   
lat_peop02:                        
	.byte "Nobis        "	; Us   
lat_peop03:                        
	.byte "Illis        "	; Them 
lat_peop04:                        
	.byte "Ille         "	; He   
lat_peop05:                        
	.byte "Illa         "	; She  
lat_peop06:                        
	.byte "Vir          "	; Man  
lat_peop07:                        
	.byte "Femina       "	; Woman
lat_peop08:                        
	.byte "Puer         "	; Boy  
lat_peop09:                        
	.byte "Puella       "	; Girl 



lat_time00:
	.byte "Horologium   "	; Clock
lat_time01:
	.byte "Hora         "	; Hour
lat_time02:
	.byte "Minute       "	; Minute
lat_time03:
	.byte "Secundi      "	; Second
lat_time04:
	.byte "Annos singulo"	; Year
lat_time05:
	.byte "Mense        "	; Month
lat_time06:
	.byte "Week         "	; Week
lat_time07:
	.byte "Date         "	; Date
lat_time08:
	.byte "Dies         "	; Day
lat_time09:
	.byte "Noctis       "	; Night

lat_nums00:
	.byte "Nulla        "	; Zero
lat_nums01:
	.byte "Unus         "	; One
lat_nums02:
	.byte "Duo          "	; Two
lat_nums03:
	.byte "Tribus       "	; Three
lat_nums04:
	.byte "Quattuor     "	; Four
lat_nums05:
	.byte "Quinque      "	; Five
lat_nums06:
	.byte "Sex          "	; Six
lat_nums07:
	.byte "Septem       "	; Seven
lat_nums08:
	.byte "Octo         "	; Eight
lat_nums09:
	.byte "Novem        "	; Nine

lat_home00:
	.byte "Solium       "	; Bathtub
lat_home01:
	.byte "Latrina      "	; Toilet
lat_home02:
	.byte "Imbrem       "	; Shower
lat_home03:
	.byte "Saponem      "	; Soap
lat_home04:
	.byte "Lectulo      "	; Bed
lat_home05:
	.byte "Cervical     "	; Pillow
lat_home06:
	.byte "Drawer       "	; Drawer
lat_home07:
	.byte "Domum        "	; House
lat_home08:                        
	.byte "Tectum       "	; Roof 
lat_home09:                        
	.byte "Confluvium   "	; Sink

lat_medi00:
	.byte "Medicus      "	; Doctor
lat_medi01:
	.byte "Nutrix       "	; Nurse
lat_medi02:
	.byte "Curandas     "	; Patient
lat_medi03:
	.byte "Vulnere      "	; Wound
lat_medi04:
	.byte "Pulsus       "	; Pulse
lat_medi05:
	.byte "Fascia       "	; Bandage
lat_medi06:
	.byte "Clinic       "	; Clinic
lat_medi07:
	.byte "Operatio     "	; Operation
lat_medi08:
	.byte "Medicus      "	; Surgeon
lat_medi09:
	.byte "Acus         "	; Needle

lat_food00:
	.byte "Cibus        "	; Food
lat_food01:
	.byte "Crassus      "	; Fat
lat_food02:
	.byte "Cibum        "	; Meat
lat_food03:
	.byte "Plautus      "	; Bacon
lat_food04:
	.byte "Perna        "	; Ham
lat_food05:
	.byte "Gallinis     "	; Poultry
lat_food06:
	.byte "Caseus       "	; Cheese
lat_food07:
	.byte "Ova          "	; Eggs
lat_food08:
	.byte "Lac          "	; Milk
lat_food09:
	.byte "Crepito      "	; Cream

lat_scho00:
	.byte "Pupillam     "	; Pupil
lat_scho01:
	.byte "Pentium      "	; Notebook
lat_scho02:
	.byte "Lectio       "	; Lesson
lat_scho03:
	.byte "Magister     "	; Teacher
lat_scho04:
	.byte "Prima est    "	; Thesis
lat_scho05:
	.byte "Catalog      "	; Catalog
lat_scho06:
	.byte "Liber        "	; Book
lat_scho07:
	.byte "Bibliotheca  "	; Library
lat_scho08:
	.byte "Gradus       "	; Degree
lat_scho09:
	.byte "Plumbum      "	; Pencil

lat_math00:
	.byte "Plus         "	; Plus
lat_math01:
	.byte "Minus        "	; Minus
lat_math02:
	.byte "Latitudo     "	; Width
lat_math03:
	.byte "Longitudo    "	; Length
lat_math04:
	.byte "Princeps     "	; Ruler
lat_math05:
	.byte "Angulus      "	; Angle   
lat_math06:                           
	.byte "Ratio        "	; Ratio   
lat_math07:                           
	.byte "Orbis        "	; Compass 
lat_math08:                           
	.byte "Triangulum   "	; Triangle
lat_math09:                           
	.byte "Algebraica   "	; Algebra 


lat_xtra00:
	.byte "Decem        "	; Ten
lat_xtra01:
	.byte "Hodie        "	; Today
lat_xtra02:
	.byte "Cras         "	; Tomorrow
lat_xtra03:
	.byte "Heri         "	; Yesterday
lat_xtra04:                            
	.byte "Piscium      "	; Fish     
lat_xtra05:                            
	.byte "Equus        "	; Horse    
lat_xtra06:                            
	.byte "Canis        "	; Dog      
lat_xtra07:                            
	.byte "Cattus       "	; Cat      
lat_xtra08:                            
	.byte "Ovium        "	; Sheep    
lat_xtra09:                            
	.byte "Camelus      "	; Camel    



