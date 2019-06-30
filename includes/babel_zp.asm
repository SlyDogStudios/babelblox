
base_offset:		.res 1
up_offset:			.res 1
down_offset:		.res 1
left_offset:		.res 1
right_offset:		.res 1
region:				.res 1
init0:				.res 1
init1:				.res 1
init2:				.res 1
mus_game:			.res 1
init0l:				.res 1
init1l:				.res 1
init2l:				.res 1

nmi_num:			.res 1
bank:				.res 1
reg2000save:		.res 1
reg2001save:		.res 1 ;$10
control_pad:		.res 1
control_old:		.res 1
control_pad2:		.res 1
control_old2:		.res 1
control_no:			.res 1
scroll_x:			.res 1
scroll_y:			.res 1
temp_8bit_1:		.res 1
temp_8bit_2:		.res 1
temp_8bit_3:		.res 1
temp_8bit_4:		.res 1
temp_8bit_5:		.res 1
loop_pointer:		.res 2
nmi_pointer:		.res 2
temp_16bit_1:		.res 2 ; $21
temp_16bit_2:		.res 2
temp_16bit_3:		.res 2
temp_16bit_4:		.res 2
temp_addy:			.res 2
temp_addy2:			.res 2
guy0_anim_addy:		.res 2
guy1_anim_addy:		.res 2
seed:				.res 1 ; $31
seed2:				.res 1
seed3:				.res 1
seed4:				.res 1
brick_offset:		.res 1
brick_move:			.res 1
level:				.res 1
guy_offset:			.res 1
guy0_state:			.res 1
guy1_state:			.res 1
guy0x_lo:			.res 1
guy1x_lo:			.res 1
guy0_count:			.res 1
guy1_count:			.res 1

level_change:		.res 1

word_offset:		.res 1
correct_offset:		.res 1
b_or_a:				.res 1
correct_wait:		.res 1
speed_em_up:		.res 1

word_base:			.res 13
word_b:				.res 13
word_a:				.res 13

letter_grpb_0:		.res 1
letter_grp0_0:		.res 1
letter_grp1_0:		.res 1
letter_grp2_0:		.res 1
letter_grp3_0:		.res 1

letter_grpb_1:		.res 1
letter_grp0_1:		.res 1
letter_grp1_1:		.res 1
letter_grp2_1:		.res 1
letter_grp3_1:		.res 1

letter_grpb_2:		.res 1
letter_grp0_2:		.res 1
letter_grp1_2:		.res 1
letter_grp2_2:		.res 1
letter_grp3_2:		.res 1

anim_ticker:		.res 1
anim_offset:		.res 1

option_offset:		.res 9

blocks_count:		.res 3

set_do_chain:		.res 1

ranking:			.res 1
hold_offset:		.res 1

speed_up_lt:		.res 1
speed_up_rt:		.res 1

final_score:		.res 8

words_present:		.res 1
chain_shake:		.res 1

option_matching:	.res 1
saved_gone:			.res 1

switch_screen:		.res 1

mus_current:		.res 1


both_same:			.res 1

nametable:			.res 1
TargetBank:			.res 1
TargetAddress:		.res 2
SourceAddress:		.res 1
SourceAddress_h:	.res 1
ReturnBank:			.res 1

