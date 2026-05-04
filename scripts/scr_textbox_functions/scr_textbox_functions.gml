function scr_set_defaults_for_text() {
	line_break_pos[0, page_number] = 999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	txtb_spr[page_number] = spr_menu_1;
	speaker_sprite[page_number] = noone;
	speaker_side[page_number] = 1;
}

// Parametro que suma una pagina a la actual
// Parametro que elige quien esta hablando
function scr_text(_text){
	scr_set_defaults_for_text();
	
	text[page_number] = _text;

	//Obtener la informacion del personaje
	if argument_count > 1{
		switch(argument[1])
		{
		case "yesica":
		speaker_sprite[page_number] = spr_speak_yesica;
		txtb_spr[page_number] = spr_menu_1;
		break;
		
		
		case "yesica asertive":
		speaker_sprite[page_number] = spr_speak_yesica_asertive;
		txtb_spr[page_number] = spr_menu_1;
		break;
		
		case "yesica confused":
		speaker_sprite[page_number] = spr_speak_yesica_confused;
		txtb_spr[page_number] = spr_menu_1;
		break;
		
		case "yesica exceptic":
		speaker_sprite[page_number] = spr_speak_yesica_exceptic;
		txtb_spr[page_number] = spr_menu_1;
		break;
		
		}
		
	}

	page_number++;
}

// Parametros de opcion y id del texto vinculado
function scr_option(_option, _link_id){

	option[option_number] = _option;
	option_link_id[option_number] = _link_id
	
	option_number++;
	
}

// Parametro inicializacion y id del textbox
function create_textbox(_text_id){
	with ( instance_create_depth(0, 0, -9999, obj_textbox) )
	{
	scr_game_text(_text_id);
	}
}