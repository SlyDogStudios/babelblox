swa_lo:
.byte <swa_peop00,<swa_peop01,<swa_peop02,<swa_peop03,<swa_peop04,<swa_peop05,<swa_peop06,<swa_peop07,<swa_peop08,<swa_peop09
.byte <swa_time00,<swa_time01,<swa_time02,<swa_time03,<swa_time04,<swa_time05,<swa_time06,<swa_time07,<swa_time08,<swa_time09
.byte <swa_nums00,<swa_nums01,<swa_nums02,<swa_nums03,<swa_nums04,<swa_nums05,<swa_nums06,<swa_nums07,<swa_nums08,<swa_nums09
.byte <swa_home00,<swa_home01,<swa_home02,<swa_home03,<swa_home04,<swa_home05,<swa_home06,<swa_home07,<swa_home08,<swa_home09
.byte <swa_medi00,<swa_medi01,<swa_medi02,<swa_medi03,<swa_medi04,<swa_medi05,<swa_medi06,<swa_medi07,<swa_medi08,<swa_medi09
.byte <swa_food00,<swa_food01,<swa_food02,<swa_food03,<swa_food04,<swa_food05,<swa_food06,<swa_food07,<swa_food08,<swa_food09
.byte <swa_scho00,<swa_scho01,<swa_scho02,<swa_scho03,<swa_scho04,<swa_scho05,<swa_scho06,<swa_scho07,<swa_scho08,<swa_scho09
.byte <swa_math00,<swa_math01,<swa_math02,<swa_math03,<swa_math04,<swa_math05,<swa_math06,<swa_math07,<swa_math08,<swa_math09
.byte <swa_xtra00,<swa_xtra01,<swa_xtra02,<swa_xtra03,<swa_xtra04,<swa_xtra05,<swa_xtra06,<swa_xtra07,<swa_xtra08,<swa_xtra09
swa_hi:
.byte >swa_peop00,>swa_peop01,>swa_peop02,>swa_peop03,>swa_peop04,>swa_peop05,>swa_peop06,>swa_peop07,>swa_peop08,>swa_peop09
.byte >swa_time00,>swa_time01,>swa_time02,>swa_time03,>swa_time04,>swa_time05,>swa_time06,>swa_time07,>swa_time08,>swa_time09
.byte >swa_nums00,>swa_nums01,>swa_nums02,>swa_nums03,>swa_nums04,>swa_nums05,>swa_nums06,>swa_nums07,>swa_nums08,>swa_nums09
.byte >swa_home00,>swa_home01,>swa_home02,>swa_home03,>swa_home04,>swa_home05,>swa_home06,>swa_home07,>swa_home08,>swa_home09
.byte >swa_medi00,>swa_medi01,>swa_medi02,>swa_medi03,>swa_medi04,>swa_medi05,>swa_medi06,>swa_medi07,>swa_medi08,>swa_medi09
.byte >swa_food00,>swa_food01,>swa_food02,>swa_food03,>swa_food04,>swa_food05,>swa_food06,>swa_food07,>swa_food08,>swa_food09
.byte >swa_scho00,>swa_scho01,>swa_scho02,>swa_scho03,>swa_scho04,>swa_scho05,>swa_scho06,>swa_scho07,>swa_scho08,>swa_scho09
.byte >swa_math00,>swa_math01,>swa_math02,>swa_math03,>swa_math04,>swa_math05,>swa_math06,>swa_math07,>swa_math08,>swa_math09
.byte >swa_xtra00,>swa_xtra01,>swa_xtra02,>swa_xtra03,>swa_xtra04,>swa_xtra05,>swa_xtra06,>swa_xtra07,>swa_xtra08,>swa_xtra09

swa_peop00:
	.byte "Wewe         "	; You  
swa_peop01:                        
	.byte "Mimi         "	; Me   
swa_peop02:                        
	.byte "Sisi         "	; Us   
swa_peop03:                        
	.byte "Wao          "	; Them 
swa_peop04:                        
	.byte "Yeye         "	; He   
swa_peop05:                        
	.byte "Yeye         "	; She  
swa_peop06:                        
	.byte "Mtu          "	; Man  
swa_peop07:                        
	.byte "Mwanamke     "	; Woman
swa_peop08:                        
	.byte "Mvulana      "	; Boy  
swa_peop09:                        
	.byte "Msichana     "	; Girl 



swa_time00:
	.byte "Saa          "	; Clock
swa_time01:
	.byte "Saa          "	; Hour
swa_time02:
	.byte "Dakika       "	; Minute
swa_time03:
	.byte "Pili         "	; Second
swa_time04:
	.byte "Mwaka        "	; Year
swa_time05:
	.byte "Mwezi        "	; Month
swa_time06:
	.byte "Wiki         "	; Week
swa_time07:
	.byte "Tarehe       "	; Date
swa_time08:
	.byte "Siku         "	; Day
swa_time09:
	.byte "Usiku        "	; Night

swa_nums00:
	.byte "Sufuri       "	; Zero
swa_nums01:
	.byte "Moja         "	; One
swa_nums02:
	.byte "Mbili        "	; Two
swa_nums03:
	.byte "Tatu         "	; Three
swa_nums04:
	.byte "Nne          "	; Four
swa_nums05:
	.byte "Tano         "	; Five
swa_nums06:
	.byte "Sita         "	; Six
swa_nums07:
	.byte "Saba         "	; Seven
swa_nums08:
	.byte "Nane         "	; Eight
swa_nums09:
	.byte "Tisa         "	; Nine

swa_home00:
	.byte "Bafu         "	; Bathtub
swa_home01:
	.byte "Choo         "	; Toilet
swa_home02:
	.byte "Kuoga        "	; Shower
swa_home03:
	.byte "Sabuni       "	; Soap
swa_home04:
	.byte "Kitanda      "	; bed   
swa_home05:                         
	.byte "Mto          "	; pillow
swa_home06:                         
	.byte "Mchoro       "	; drawer
swa_home07:
	.byte "Nyumba       "	; House
swa_home08:                        
	.byte "Toa          "	; Roof 
swa_home09:                        
	.byte "Kuzama       "	; Sink 

swa_medi00:
	.byte "Daktari      "	; Doctor
swa_medi01:
	.byte "Muuguzi      "	; Nurse
swa_medi02:
	.byte "Mgonjwa      "	; Patient
swa_medi03:
	.byte "Jeraha       "	; Wound
swa_medi04:
	.byte "Pigo         "	; Pulse
swa_medi05:
	.byte "Bandeji      "	; Bandage
swa_medi06:
	.byte "Kliniki      "	; Clinic
swa_medi07:
	.byte "Uendeshaji   "	; Operation
swa_medi08:
	.byte "Upasuaji     "	; Surgeon
swa_medi09:
	.byte "Sindano      "	;  Needle

swa_food00:
	.byte "Chakula      "	; food   
swa_food01:                          
	.byte "Mafuta       "	; fat    
swa_food02:                          
	.byte "Nyama        "	; meat   
swa_food03:                          
	.byte "Bacon        "	; bacon  
swa_food04:                          
	.byte "Ham          "	; ham    
swa_food05:                          
	.byte "Kuku         "	; poultry
swa_food06:                          
	.byte "Jibini       "	; cheese 
swa_food07:                          
	.byte "Mayai        "	; eggs   
swa_food08:                          
	.byte "Maziwa       "	; milk   
swa_food09:                          
	.byte "Cream        "	; cream  

swa_scho00:
	.byte "Mwanafunzi   "	; pupil   
swa_scho01:                           
	.byte "Daftari      "	; notebook
swa_scho02:                           
	.byte "Somo         "	; lesson  
swa_scho03:                           
	.byte "Mwalimu      "	; teacher 
swa_scho04:                           
	.byte "Thesis       "	; thesis  
swa_scho05:                           
	.byte "Orodha       "	; catalog 
swa_scho06:                           
	.byte "Kitabu       "	; book    
swa_scho07:                           
	.byte "Maktaba      "	; library 
swa_scho08:                           
	.byte "Shahada      "	; degree  
swa_scho09:
	.byte "Penseli      "	; Pencil

swa_math00:
	.byte "Pamoja       "	; plus  
swa_math01:                         
	.byte "Fanya        "	; minus 
swa_math02:                         
	.byte "Upana        "	; width 
swa_math03:                         
	.byte "Urefu        "	; length
swa_math04:                         
	.byte "Mtawala      "	; ruler 
swa_math05:
	.byte "Angle        "	; Angle    
swa_math06:                             
	.byte "Uwiano       "	; Ratio    
swa_math07:                             
	.byte "Dira         "	; Compass  
swa_math08:                             
	.byte "Pembetatu    "	; Triangle
swa_math09:                             
	.byte "Algebra      "	; Algebra  


swa_xtra00:
	.byte "Kumi         "	; ten     
swa_xtra01:                           
	.byte "Leo          "	; today   
swa_xtra02:                           
	.byte "Kesho        "	; tomorrow
swa_xtra03:
	.byte "Jana         "	;  Yesterday
swa_xtra04:                             
	.byte "Samaki       "	;  Fish     
swa_xtra05:                             
	.byte "Farasi       "	;  Horse    
swa_xtra06:                             
	.byte "Mbwa         "	;  Dog      
swa_xtra07:                             
	.byte "Paka         "	;  Cat      
swa_xtra08:                             
	.byte "Kondoo       "	;  Sheep    
swa_xtra09:                             
	.byte "Ngamia       "	;  Camel    



