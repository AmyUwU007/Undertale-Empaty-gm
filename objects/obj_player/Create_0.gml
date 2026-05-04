xspd = 0;
yspd = 0;

move_spd = 1.5;

enum states {
normal = 1,
running = 2,
paused = 3
}

actual_state = 1

sprite[RIGHT] = spr_player_right_walk
sprite[UP] = spr_player_up_walk
sprite[LEFT] = spr_player_left_walk
sprite[DOWN] = spr_player_down_walk

sprite[RIGHTRUN] = spr_player_right_run
sprite[UPRUN] = spr_player_up_run
sprite[LEFTRUN] = spr_player_left_run
sprite[DOWNRUN] = spr_player_down_run


face = DOWN;