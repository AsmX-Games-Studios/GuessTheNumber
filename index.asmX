# ../Guess_the_number_game/index.asmX
#------------------------------------------------
@Execute rand 1 100;
@set randomize Int $math;
#------------------------------------------------

@Using label big_int;
@using label small_int;
@using label winner;
@using subprogram start_v2;

#------------------------------------------------
@call print("Hi! I made a number from 1 to 100.");
@Execute goto_sbp start_v2;
#------------------------------------------------

#------------------------------------------------
# Structures / branches
#------------------------------------------------
@subprogram start_v2:
    @call input("Please enter number: ")
    @Execute eq $urt set::randomize
    @Execute jmp_equal winner
    @Execute cmp $urt set::randomize
    @Execute jmp_great big_int
    @Execute jmp_zero small_int

@label small_int:
    @call print("Too little!")
    @Execute goto_sbp start_v2;

@label big_int:
    @call print("Too much!")
    @Execute goto_sbp start_v2;

@label winner:
    @call print("You've won!")
    @Invoke 0x01;
#------------------------------------------------