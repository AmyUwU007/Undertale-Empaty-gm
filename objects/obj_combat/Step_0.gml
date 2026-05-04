//obtener input
up_key = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));
left_key = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"));
right_key = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"));
Accept_key = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(ord("Z"));
windowX = window_get_width()
windowY = window_get_height()
//variables de pantalla


if (left_key || right_key) {
    audio_play_sound(snd_move, 0, 0);
    if (pos == 0) pos = 1;
    else if (pos == 1) pos = 0;
    else if (pos == 2) pos = 3;
    else if (pos == 3) pos = 2;
}

if (up_key || down_key) {
    audio_play_sound(snd_move, 0, 0);
    if (pos == 0) pos = 2;
    else if (pos == 2) pos = 0;
    else if (pos == 1) pos = 3;
    else if (pos == 3) pos = 1;
}



//usar las opciones
if Accept_key {
	
var _sml = menu_level;
	
switch(menu_level){
	case 0:
		switch(pos){
			//iniciar juego
			case 0: room_goto(rm_oldStartRoom); audio_play_sound(snd_undertale, 0, 0); break;
			case 1: menu_level = 1; audio_play_sound(snd_select, 0, 0) break;
			case 2: game_end(); break;
			}
	break;
	case 1:
		switch(pos){
			//iniciar juego
			case 0: if windowX + 320 <= screenX && windowY + 240 <= screenY
			{
				window_set_size(windowX+320, windowY+240); alarm[0] = 1; audio_play_sound(snd_epic, 0, 0)
			}else {window_set_size(320, 240); alarm[0] = 1; audio_play_sound(snd_flick, 0, 0)}
			break;
			case 1: audio_play_sound(snd_damage, 0, 0); break;
			case 2: audio_play_sound(snd_damage, 0, 0, 1,0,1.01); break;
			case 3: menu_level = 0; audio_play_sound(snd_flick, 0, 0); break;
			}
	break;
	}
	
if _sml != menu_level { pos=0 };
	
//tamaño de opccion correcto
op_length = array_length(option[menu_level])
}