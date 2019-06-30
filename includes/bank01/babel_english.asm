eng_lo:
.byte <eng_peop00,<eng_peop01,<eng_peop02,<eng_peop03,<eng_peop04,<eng_peop05,<eng_peop06,<eng_peop07,<eng_peop08,<eng_peop09
.byte <eng_time00,<eng_time01,<eng_time02,<eng_time03,<eng_time04,<eng_time05,<eng_time06,<eng_time07,<eng_time08,<eng_time09
.byte <eng_nums00,<eng_nums01,<eng_nums02,<eng_nums03,<eng_nums04,<eng_nums05,<eng_nums06,<eng_nums07,<eng_nums08,<eng_nums09
.byte <eng_home00,<eng_home01,<eng_home02,<eng_home03,<eng_home04,<eng_home05,<eng_home06,<eng_home07,<eng_home08,<eng_home09
.byte <eng_medi00,<eng_medi01,<eng_medi02,<eng_medi03,<eng_medi04,<eng_medi05,<eng_medi06,<eng_medi07,<eng_medi08,<eng_medi09
.byte <eng_food00,<eng_food01,<eng_food02,<eng_food03,<eng_food04,<eng_food05,<eng_food06,<eng_food07,<eng_food08,<eng_food09
.byte <eng_scho00,<eng_scho01,<eng_scho02,<eng_scho03,<eng_scho04,<eng_scho05,<eng_scho06,<eng_scho07,<eng_scho08,<eng_scho09
.byte <eng_math00,<eng_math01,<eng_math02,<eng_math03,<eng_math04,<eng_math05,<eng_math06,<eng_math07,<eng_math08,<eng_math09
.byte <eng_xtra00,<eng_xtra01,<eng_xtra02,<eng_xtra03,<eng_xtra04,<eng_xtra05,<eng_xtra06,<eng_xtra07,<eng_xtra08,<eng_xtra09
eng_hi:
.byte >eng_peop00,>eng_peop01,>eng_peop02,>eng_peop03,>eng_peop04,>eng_peop05,>eng_peop06,>eng_peop07,>eng_peop08,>eng_peop09
.byte >eng_time00,>eng_time01,>eng_time02,>eng_time03,>eng_time04,>eng_time05,>eng_time06,>eng_time07,>eng_time08,>eng_time09
.byte >eng_nums00,>eng_nums01,>eng_nums02,>eng_nums03,>eng_nums04,>eng_nums05,>eng_nums06,>eng_nums07,>eng_nums08,>eng_nums09
.byte >eng_home00,>eng_home01,>eng_home02,>eng_home03,>eng_home04,>eng_home05,>eng_home06,>eng_home07,>eng_home08,>eng_home09
.byte >eng_medi00,>eng_medi01,>eng_medi02,>eng_medi03,>eng_medi04,>eng_medi05,>eng_medi06,>eng_medi07,>eng_medi08,>eng_medi09
.byte >eng_food00,>eng_food01,>eng_food02,>eng_food03,>eng_food04,>eng_food05,>eng_food06,>eng_food07,>eng_food08,>eng_food09
.byte >eng_scho00,>eng_scho01,>eng_scho02,>eng_scho03,>eng_scho04,>eng_scho05,>eng_scho06,>eng_scho07,>eng_scho08,>eng_scho09
.byte >eng_math00,>eng_math01,>eng_math02,>eng_math03,>eng_math04,>eng_math05,>eng_math06,>eng_math07,>eng_math08,>eng_math09
.byte >eng_xtra00,>eng_xtra01,>eng_xtra02,>eng_xtra03,>eng_xtra04,>eng_xtra05,>eng_xtra06,>eng_xtra07,>eng_xtra08,>eng_xtra09

eng_peop00:
	.byte "You          "
eng_peop01:
	.byte "Me           "
eng_peop02:
	.byte "Us           "
eng_peop03:
	.byte "Them         "
eng_peop04:
	.byte "He           "
eng_peop05:
	.byte "She          "
eng_peop06:
	.byte "Man          "	;
eng_peop07:
	.byte "Woman        "	;
eng_peop08:
	.byte "Boy          "	;
eng_peop09:
	.byte "Girl         "	;



eng_time00:
	.byte "Clock        "	; Clock
eng_time01:
	.byte "Hour         "	; Hour
eng_time02:
	.byte "Minute       "	; Minute
eng_time03:
	.byte "Second       "	; Second
eng_time04:
	.byte "Year         "	; Year
eng_time05:
	.byte "Month        "	; Month
eng_time06:
	.byte "Week         "	; Week
eng_time07:
	.byte "Date         "	; Date
eng_time08:
	.byte "Day          "	; Day
eng_time09:
	.byte "Night        "	; Night

eng_nums00:
	.byte "Zero         "	; Zero
eng_nums01:
	.byte "One          "	; One
eng_nums02:
	.byte "Two          "	; Two
eng_nums03:
	.byte "Three        "	; Three
eng_nums04:
	.byte "Four         "	; Four
eng_nums05:
	.byte "Five         "	; Five
eng_nums06:
	.byte "Six          "	; Six
eng_nums07:
	.byte "Seven        "	; Seven
eng_nums08:
	.byte "Eight        "	; Eight
eng_nums09:
	.byte "Nine         "	; Nine

eng_home00:
	.byte "Bathtub      "	; Bathtub
eng_home01:
	.byte "Toilet       "	; Toilet
eng_home02:
	.byte "Shower       "	; Shower
eng_home03:
	.byte "Soap         "	; Soap
eng_home04:
	.byte "Bed          "	; Bed
eng_home05:
	.byte "Pillow       "	; Pillow
eng_home06:
	.byte "Drawer       "	; Drawer
eng_home07:
	.byte "House        "	; House
eng_home08:
	.byte "Roof         "	; Roof
eng_home09:
	.byte "Sink         "	; Sink

eng_medi00:
	.byte "Doctor       "	; Doctor
eng_medi01:
	.byte "Nurse        "	; Nurse
eng_medi02:
	.byte "Patient      "	; Patient
eng_medi03:
	.byte "Wound        "	; Wound
eng_medi04:
	.byte "Pulse        "	; Pulse
eng_medi05:
	.byte "Bandage      "	; Bandage
eng_medi06:
	.byte "Clinic       "	; Clinic
eng_medi07:
	.byte "Operation    "	; Operation
eng_medi08:
	.byte "Surgeon      "	; Surgeon
eng_medi09:
	.byte "Needle       "	; Needle

eng_food00:
	.byte "Food         "	; Food
eng_food01:
	.byte "Fat          "	; Fat
eng_food02:
	.byte "Meat         "	; Meat
eng_food03:
	.byte "Bacon        "	; Bacon
eng_food04:
	.byte "Ham          "	; Ham
eng_food05:
	.byte "Poultry      "	; Poultry
eng_food06:
	.byte "Cheese       "	; Cheese
eng_food07:
	.byte "Eggs         "	; Eggs
eng_food08:
	.byte "Milk         "	; Milk
eng_food09:
	.byte "Cream        "	; Cream

eng_scho00:
	.byte "Pupil        "	; Pupil
eng_scho01:
	.byte "Notebook     "	; Notebook
eng_scho02:
	.byte "Lesson       "	; Lesson
eng_scho03:
	.byte "Teacher      "	; Teacher
eng_scho04:
	.byte "Thesis       "	; Thesis
eng_scho05:
	.byte "Catalog      "	; Catalog
eng_scho06:
	.byte "Book         "	; Book
eng_scho07:
	.byte "Library      "	; Library
eng_scho08:
	.byte "Degree       "	; Degree
eng_scho09:
	.byte "Pencil       "	; Pencil

eng_math00:
	.byte "Plus         "	; Plus
eng_math01:
	.byte "Minus        "	; Minus
eng_math02:
	.byte "Width        "	; Width
eng_math03:
	.byte "Length       "	; Length
eng_math04:
	.byte "Ruler        "	; Ruler
eng_math05:
	.byte "Angle        "	; Angle
eng_math06:
	.byte "Ratio        "	; Ratio
eng_math07:
	.byte "Compass      "	; Compass
eng_math08:
	.byte "Triangle     "	; Triangle
eng_math09:
	.byte "Algebra      "	; Algebra


eng_xtra00:
	.byte "Ten          "	; Ten
eng_xtra01:
	.byte "Today        "	; Today
eng_xtra02:
	.byte "Tomorrow     "	; Tomorrow
eng_xtra03:
	.byte "Yesterday    "	; Yesterday
eng_xtra04:
	.byte "Fish         "	; Fish
eng_xtra05:
	.byte "Horse        "	; Horse
eng_xtra06:
	.byte "Dog          "	; Dog
eng_xtra07:
	.byte "Cat          "	; Cat
eng_xtra08:
	.byte "Sheep        "	; Sheep
eng_xtra09:
	.byte "Camel        "	; Camel



