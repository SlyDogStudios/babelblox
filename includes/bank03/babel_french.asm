fre_lo:
.byte <fre_peop00,<fre_peop01,<fre_peop02,<fre_peop03,<fre_peop04,<fre_peop05,<fre_peop06,<fre_peop07,<fre_peop08,<fre_peop09
.byte <fre_time00,<fre_time01,<fre_time02,<fre_time03,<fre_time04,<fre_time05,<fre_time06,<fre_time07,<fre_time08,<fre_time09
.byte <fre_nums00,<fre_nums01,<fre_nums02,<fre_nums03,<fre_nums04,<fre_nums05,<fre_nums06,<fre_nums07,<fre_nums08,<fre_nums09
.byte <fre_home00,<fre_home01,<fre_home02,<fre_home03,<fre_home04,<fre_home05,<fre_home06,<fre_home07,<fre_home08,<fre_home09
.byte <fre_medi00,<fre_medi01,<fre_medi02,<fre_medi03,<fre_medi04,<fre_medi05,<fre_medi06,<fre_medi07,<fre_medi08,<fre_medi09
.byte <fre_food00,<fre_food01,<fre_food02,<fre_food03,<fre_food04,<fre_food05,<fre_food06,<fre_food07,<fre_food08,<fre_food09
.byte <fre_scho00,<fre_scho01,<fre_scho02,<fre_scho03,<fre_scho04,<fre_scho05,<fre_scho06,<fre_scho07,<fre_scho08,<fre_scho09
.byte <fre_math00,<fre_math01,<fre_math02,<fre_math03,<fre_math04,<fre_math05,<fre_math06,<fre_math07,<fre_math08,<fre_math09
.byte <fre_xtra00,<fre_xtra01,<fre_xtra02,<fre_xtra03,<fre_xtra04,<fre_xtra05,<fre_xtra06,<fre_xtra07,<fre_xtra08,<fre_xtra09
fre_hi:
.byte >fre_peop00,>fre_peop01,>fre_peop02,>fre_peop03,>fre_peop04,>fre_peop05,>fre_peop06,>fre_peop07,>fre_peop08,>fre_peop09
.byte >fre_time00,>fre_time01,>fre_time02,>fre_time03,>fre_time04,>fre_time05,>fre_time06,>fre_time07,>fre_time08,>fre_time09
.byte >fre_nums00,>fre_nums01,>fre_nums02,>fre_nums03,>fre_nums04,>fre_nums05,>fre_nums06,>fre_nums07,>fre_nums08,>fre_nums09
.byte >fre_home00,>fre_home01,>fre_home02,>fre_home03,>fre_home04,>fre_home05,>fre_home06,>fre_home07,>fre_home08,>fre_home09
.byte >fre_medi00,>fre_medi01,>fre_medi02,>fre_medi03,>fre_medi04,>fre_medi05,>fre_medi06,>fre_medi07,>fre_medi08,>fre_medi09
.byte >fre_food00,>fre_food01,>fre_food02,>fre_food03,>fre_food04,>fre_food05,>fre_food06,>fre_food07,>fre_food08,>fre_food09
.byte >fre_scho00,>fre_scho01,>fre_scho02,>fre_scho03,>fre_scho04,>fre_scho05,>fre_scho06,>fre_scho07,>fre_scho08,>fre_scho09
.byte >fre_math00,>fre_math01,>fre_math02,>fre_math03,>fre_math04,>fre_math05,>fre_math06,>fre_math07,>fre_math08,>fre_math09
.byte >fre_xtra00,>fre_xtra01,>fre_xtra02,>fre_xtra03,>fre_xtra04,>fre_xtra05,>fre_xtra06,>fre_xtra07,>fre_xtra08,>fre_xtra09

fre_peop00:
	.byte "Toi          "	; You  
fre_peop01:                        
	.byte "Moi          "	; Me   
fre_peop02:                        
	.byte "Nous         "	; Us   
fre_peop03:                        
	.byte "Leur         "	; Them 
fre_peop04:                        
	.byte "Il           "	; He   
fre_peop05:                        
	.byte "Elle         "	; She  
fre_peop06:                        
	.byte "Homme        "	; Man  
fre_peop07:                        
	.byte "Femme        "	; Woman
fre_peop08:                        
	.byte "Gar",$bf,"on       "	; Boy (c dangler)
fre_peop09:                        
	.byte "Fille        "	; Girl 



fre_time00:
	.byte "Horloge      "	; Clock
fre_time01:
	.byte "Heure        "	; Hour
fre_time02:
	.byte "Minute       "	; Minute
fre_time03:
	.byte "Seconde      "	; Second
fre_time04:
	.byte "An           "	; Year
fre_time05:
	.byte "Mois         "	; Month
fre_time06:
	.byte "Semaine      "	; Week
fre_time07:
	.byte "Date         "	; Date
fre_time08:
	.byte "Journ",$b9,"e      "	; Day (e tick to the right)
fre_time09:
	.byte "Nuit         "	; Night

fre_nums00:
	.byte "Z",$b9,"ro         "	; Zero (e tick to the right)
fre_nums01:
	.byte "Un           "	; One
fre_nums02:
	.byte "Deux         "	; Two
fre_nums03:
	.byte "Trois        "	; Three
fre_nums04:
	.byte "Quatre       "	; Four
fre_nums05:
	.byte "Cinq         "	; Five
fre_nums06:
	.byte "Six          "	; Six
fre_nums07:
	.byte "Sept         "	; Seven
fre_nums08:
	.byte "Huit         "	; Eight
fre_nums09:
	.byte "Neuf         "	; Nine

fre_home00:
	.byte "Baignoire    "	; Bathtub
fre_home01:
	.byte "Toilette     "	; Toilet
fre_home02:
	.byte "Douche       "	; Shower
fre_home03:
	.byte "Savon        "	; Soap
fre_home04:
	.byte "Lit          "	; Bed
fre_home05:
	.byte "Oreiller     "	; Pillow
fre_home06:
	.byte "Tiroir       "	; Drawer
fre_home07:
	.byte "Maison       "	; House
fre_home08:                        
	.byte "Toit         "	; Roof 
fre_home09:                        
	.byte $b1,"vier        "	; Sink (capital E tick right)

fre_medi00:
	.byte "Docteur      "	; Doctor
fre_medi01:
	.byte "Infirmi",$b2,"re   "	; Nurse (e with tick to left)
fre_medi02:
	.byte "Patient      "	; Patient
fre_medi03:
	.byte "Blessure     "	; Wound
fre_medi04:
	.byte "Impulsion    "	; Pulse
fre_medi05:
	.byte "Bandage      "	; Bandage
fre_medi06:
	.byte "Clinique     "	; Clinic
fre_medi07:
	.byte "Op",$b9,"ration    "	; Operation (e tick right)
fre_medi08:
	.byte "Chirurgien   "	; Surgeon
fre_medi09:
	.byte "Aiguille     "	; Needle

fre_food00:
	.byte "Aliments     "	; Food
fre_food01:
	.byte "Graisse      "	; Fat
fre_food02:
	.byte "Viande       "	; Meat
fre_food03:
	.byte "Bacon        "	; Bacon
fre_food04:
	.byte "Jambon       "	; Ham
fre_food05:
	.byte "Volaille     "	; Poultry
fre_food06:
	.byte "Fromage      "	; Cheese
fre_food07:
	.byte "Oeuf         "	; Eggs (o and e together thing maybe)
fre_food08:
	.byte "Lait         "	; Milk
fre_food09:
	.byte "Cr",$b2,"me        "	; Cream (e tick left)

fre_scho00:
	.byte $b1,"l",$b2,"ve        "	; Pupil (captial E tick right then e tick left)
fre_scho01:
	.byte "Carnet       "	; Notebook
fre_scho02:
	.byte "Le",$bf,"on        "	; Lesson (c dangler)
fre_scho03:
	.byte "Prof         "	; Teacher
fre_scho04:
	.byte "Th",$b2,"se        "	; Thesis (e tick left)
fre_scho05:
	.byte "Catalogue    "	; Catalog
fre_scho06:
	.byte "Livre        "	; Book
fre_scho07:
	.byte "Biblioth",$b2,"que "	; Library (e tick left)
fre_scho08:
	.byte "Degr",$b9,"        "	; Degree (e tick right)
fre_scho09:
	.byte "Crayon       "	; Pencil

fre_math00:
	.byte "Plus         "	; Plus
fre_math01:
	.byte "Moins        "	; Minus
fre_math02:
	.byte "Largeur      "	; Width
fre_math03:
	.byte "Longueur     "	; LengthPlus
fre_math04:
	.byte "R",$b2,"gle        "	; Ruler (e tick left)
fre_math05:
	.byte "Angle        "	; Angle    
fre_math06:                            
	.byte "Rapport      "	; Ratio    
fre_math07:                            
	.byte "Boussole     "	; Compass  
fre_math08:                            
	.byte "Triangle     "	; Triangle
fre_math09:                            
	.byte "Alg",$b2,"bre      "	; Algebra (e tick left)


fre_xtra00:
	.byte "Dix          "	; Ten
fre_xtra01:
	.byte "Aujourd'hui  "	; Today
fre_xtra02:
	.byte "Demain       "	; Tomorrow
fre_xtra03:
	.byte "Hier         "	; Yesterday
fre_xtra04:                            
	.byte "Poisson      "	; Fish     
fre_xtra05:                            
	.byte "Cheval       "	; Horse    
fre_xtra06:                            
	.byte "Chien        "	; Dog      
fre_xtra07:                            
	.byte "Chat         "	; Cat      
fre_xtra08:                            
	.byte "Mouton       "	; Sheep    
fre_xtra09:                            
	.byte "Chameau      "	; Camel    



