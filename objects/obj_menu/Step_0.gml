//obtener input
up_key = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));
Accept_key = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(ord("Z"));
windowX = window_get_width()
windowY = window_get_height()
//variables de pantalla


//guardar en numero de opccion en el array
op_length = array_length(option[menu_level])

//moverse en el menu
pos += down_key - up_key
if pos >= op_length {pos = 0};
if pos < 0 {pos = op_length-1};

//usar las opciones
if Accept_key {
	
var _sml = menu_level;
	
switch(menu_level){
	case 0:
		switch(pos){
			//iniciar juego
			case 0: room_goto_next(); break;
			case 1: menu_level = 1; break;
			case 2: game_end(); break;
			}
	break;
	case 1:
		switch(pos){
			//iniciar juego
			case 0: if windowX + 320 <= screenX && windowY + 240 <= screenY
			{
				window_set_size(windowX+320, windowY+240); alarm[0] = 1;
			}else {window_set_size(320, 240); alarm[0] = 1;}
			break;
			case 1: break;
			case 2: break;
			case 3: menu_level = 0; break;
			}
	break;
	}
	
if _sml != menu_level { pos=0 };
	
//tamaño de opccion correcto
op_length = array_length(option[menu_level])
}