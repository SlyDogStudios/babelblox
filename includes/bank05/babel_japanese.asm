jap_lo:
.byte <jap_peop00,<jap_peop01,<jap_peop02,<jap_peop03,<jap_peop04,<jap_peop05,<jap_peop06,<jap_peop07,<jap_peop08,<jap_peop09
.byte <jap_time00,<jap_time01,<jap_time02,<jap_time03,<jap_time04,<jap_time05,<jap_time06,<jap_time07,<jap_time08,<jap_time09
.byte <jap_nums00,<jap_nums01,<jap_nums02,<jap_nums03,<jap_nums04,<jap_nums05,<jap_nums06,<jap_nums07,<jap_nums08,<jap_nums09
.byte <jap_home00,<jap_home01,<jap_home02,<jap_home03,<jap_home04,<jap_home05,<jap_home06,<jap_home07,<jap_home08,<jap_home09
.byte <jap_medi00,<jap_medi01,<jap_medi02,<jap_medi03,<jap_medi04,<jap_medi05,<jap_medi06,<jap_medi07,<jap_medi08,<jap_medi09
.byte <jap_food00,<jap_food01,<jap_food02,<jap_food03,<jap_food04,<jap_food05,<jap_food06,<jap_food07,<jap_food08,<jap_food09
.byte <jap_scho00,<jap_scho01,<jap_scho02,<jap_scho03,<jap_scho04,<jap_scho05,<jap_scho06,<jap_scho07,<jap_scho08,<jap_scho09
.byte <jap_math00,<jap_math01,<jap_math02,<jap_math03,<jap_math04,<jap_math05,<jap_math06,<jap_math07,<jap_math08,<jap_math09
.byte <jap_xtra00,<jap_xtra01,<jap_xtra02,<jap_xtra03,<jap_xtra04,<jap_xtra05,<jap_xtra06,<jap_xtra07,<jap_xtra08,<jap_xtra09
jap_hi:
.byte >jap_peop00,>jap_peop01,>jap_peop02,>jap_peop03,>jap_peop04,>jap_peop05,>jap_peop06,>jap_peop07,>jap_peop08,>jap_peop09
.byte >jap_time00,>jap_time01,>jap_time02,>jap_time03,>jap_time04,>jap_time05,>jap_time06,>jap_time07,>jap_time08,>jap_time09
.byte >jap_nums00,>jap_nums01,>jap_nums02,>jap_nums03,>jap_nums04,>jap_nums05,>jap_nums06,>jap_nums07,>jap_nums08,>jap_nums09
.byte >jap_home00,>jap_home01,>jap_home02,>jap_home03,>jap_home04,>jap_home05,>jap_home06,>jap_home07,>jap_home08,>jap_home09
.byte >jap_medi00,>jap_medi01,>jap_medi02,>jap_medi03,>jap_medi04,>jap_medi05,>jap_medi06,>jap_medi07,>jap_medi08,>jap_medi09
.byte >jap_food00,>jap_food01,>jap_food02,>jap_food03,>jap_food04,>jap_food05,>jap_food06,>jap_food07,>jap_food08,>jap_food09
.byte >jap_scho00,>jap_scho01,>jap_scho02,>jap_scho03,>jap_scho04,>jap_scho05,>jap_scho06,>jap_scho07,>jap_scho08,>jap_scho09
.byte >jap_math00,>jap_math01,>jap_math02,>jap_math03,>jap_math04,>jap_math05,>jap_math06,>jap_math07,>jap_math08,>jap_math09
.byte >jap_xtra00,>jap_xtra01,>jap_xtra02,>jap_xtra03,>jap_xtra04,>jap_xtra05,>jap_xtra06,>jap_xtra07,>jap_xtra08,>jap_xtra09

jap_peop00:
	.byte "Kimi         "	; You  
jap_peop01:                        
	.byte "Watashi      "	; Me   
jap_peop02:                        
	.byte "Beikoku      "	; Us   
jap_peop03:                        
	.byte "Sorera       "	; Them 
jap_peop04:                        
	.byte "Kare         "	; He   
jap_peop05:                        
	.byte "Kanojo       "	; She  
jap_peop06:                        
	.byte "Otoko        "	; Man  
jap_peop07:                        
	.byte "Josei        "	; Woman
jap_peop08:                        
	.byte "Otokonoko    "	; Boy  
jap_peop09:                        
	.byte "On'nanoko    "	; Girl 



jap_time00:
	.byte "Kurokku      "	; Clock
jap_time01:
	.byte "Jikan        "	; Hour
jap_time02:
	.byte "Bun          "	; Minute
jap_time03:
	.byte "Byo          "	; Second
jap_time04:
	.byte "Toshi        "	; Year
jap_time05:
	.byte "Tsuki        "	; Month
jap_time06:
	.byte "Shukan       "	; Week
jap_time07:
	.byte "Nengappi     "	; Date
jap_time08:
	.byte "Hi           "	; Day
jap_time09:
	.byte "Yoru         "	; Night

jap_nums00:
	.byte "Zero         "	; Zero
jap_nums01:
	.byte "Ichi         "	; One
jap_nums02:
	.byte "Ni           "	; Two
jap_nums03:
	.byte "San          "	; Three
jap_nums04:
	.byte "Shi          "	; Four
jap_nums05:
	.byte "Go           "	; Five
jap_nums06:
	.byte "Roku         "	; Six
jap_nums07:
	.byte "Shichi       "	; Seven
jap_nums08:
	.byte "Hachi        "	; Eight
jap_nums09:
	.byte "Ku           "	; Nine

jap_home00:
	.byte "Basu tabu    "	; Bathtub
jap_home01:
	.byte "Toire        "	; Toilet
jap_home02:
	.byte "Shawa        "	; Shower
jap_home03:
	.byte "Sekken       "	; Soap
jap_home04:
	.byte "Beddo        "	; Bed
jap_home05:
	.byte "Makura       "	; Pillow
jap_home06:
	.byte "Hikidashi    "	; Drawer
jap_home07:
	.byte "Kaoku        "	; House
jap_home08:                        
	.byte "Rufu         "	; Roof 
jap_home09:                        
	.byte "Shinku       "	; Sink 

jap_medi00:
	.byte "Ishi         "	; Doctor
jap_medi01:
	.byte "Nasu         "	; Nurse
jap_medi02:
	.byte "Kanja        "	; Patient
jap_medi03:
	.byte "Kizu         "	; Wound
jap_medi04:
	.byte "Parusu       "	; Pulse
jap_medi05:
	.byte "Houtai       "	; Bandage
jap_medi06:
	.byte "Kurinikku    "	; Clinic
jap_medi07:
	.byte "Sousa        "	; Operation
jap_medi08:
	.byte "Gekai        "	; Surgeon
jap_medi09:
	.byte "Hari         "	;  Needle

jap_food00:
	.byte "Shokuhin     "	; Food
jap_food01:
	.byte "Shibo        "	; Fat
jap_food02:
	.byte "Niku         "	; Meat
jap_food03:
	.byte "Bekon        "	; Bacon
jap_food04:
	.byte "Hamu         "	; Ham
jap_food05:
	.byte "Kakin        "	; Poultry
jap_food06:
	.byte "Chizu        "	; Cheese
jap_food07:
	.byte "Tamago       "	; Eggs
jap_food08:
	.byte "Miruku       "	; Milk
jap_food09:
	.byte "Kurimu       "	; Cream

jap_scho00:
	.byte "Hitomi       "	; Pupil
jap_scho01:
	.byte "Notobukku    "	; Notebook
jap_scho02:
	.byte "Ressun       "	; Lesson
jap_scho03:
	.byte "Sensei       "	; Teacher
jap_scho04:
	.byte "Ronbun       "	; Thesis
jap_scho05:
	.byte "Katarogu     "	; Catalog
jap_scho06:
	.byte "Hon          "	; Book
jap_scho07:
	.byte "Raiburari    "	; Library
jap_scho08:
	.byte "Teido        "	; Degree
jap_scho09:
	.byte "Enpitsu      "	; Pencil

jap_math00:
	.byte "Purasu       "	; Plus
jap_math01:
	.byte "Mainasu      "	; Minus
jap_math02:
	.byte "Haba         "	; Width
jap_math03:
	.byte "Nagasa       "	; Length
jap_math04:
	.byte "Rura         "	; Ruler
jap_math05:
	.byte "Kakudo       "	; Angle    
jap_math06:                            
	.byte "Hi           "	; Ratio    
jap_math07:                            
	.byte "Konpasu      "	; Compass  
jap_math08:                            
	.byte "Sankakkei    "	; Triangle
jap_math09:                            
	.byte "Daisu        "	; Algebra  


jap_xtra00:
	.byte "Ju           "	; Ten
jap_xtra01:
	.byte "Honjitsuha   "	; Today
jap_xtra02:
	.byte "Ashita       "	; Tomorrow
jap_xtra03:
	.byte "Kino         "	;  Yesterday
jap_xtra04:                             
	.byte "Sakana       "	;  Fish     
jap_xtra05:                             
	.byte "Uma          "	;  Horse    
jap_xtra06:                             
	.byte "Inu          "	;  Dog      
jap_xtra07:                             
	.byte "Neko         "	;  Cat      
jap_xtra08:                             
	.byte "Hitsuji      "	;  Sheep    
jap_xtra09:                             
	.byte "Kyameru      "	;  Camel    



