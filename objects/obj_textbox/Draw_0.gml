accept_key = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(ord("Z"));
textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]) + 160;
_up    = keyboard_check_pressed(vk_up);
_down  = keyboard_check_pressed(vk_down);
_left  = keyboard_check_pressed(vk_left);
_right = keyboard_check_pressed(vk_right);


// ...______________ Iniciar parametros d: __________...
if setup == false
{
	setup = true
	draw_set_font(fnt_text);
	draw_set_valign(fa_top);
	draw_set_halign(haling);
	draw_set_colour(c_white);

	//bucle de dialogos
	for (var p = 0; p < page_number; p++)
	{
		//encontrar el numero de letra y guardarlo en el "text_length"
		text_length[p] = string_length(text[p]);

		// obtener la posicion x de la caja de dialogo d:
			//Personaje a la izquierda
			text_x_offset[p] = 80
			portrait_x_offset[p] = 25
			text_x_nwidth = 60
			//Personaje a la derecha
			if speaker_side[p] == -1{
				text_x_offset[p] = 4
				portrait_x_offset[p] = 240;
				text_x_nwidth = 60
			}
			//no hay personaje hablando
			if speaker_sprite[p] == noone{
			text_x_offset[p] = 20;
			text_x_nwidth = 0}
			
		//Aca se escribe cada letra individual y se busca donde debe acabar la linea de texto
		for (var c = 0 ; c < text_length[p]; c++)
			{
			var _char_pos = c+1
			//Guardar individualmente las letras en el "char" array
			char[c, p] = string_char_at(text[p], _char_pos);
			
			//conseguir el largo de la linea de texto
			var _txt_up_to_char = string_copy(text[p], 1, _char_pos);
			var _current_txt_w = (string_width(_txt_up_to_char) - string_width(char[c, p] )) * text_scale;
			
			//conseguir el ultimo espacio libre en el texto
			if char[c, p] == " " {last_free_space = _char_pos+1};
			
			//obtener donde se acaba la linea de texto
			if _current_txt_w - line_break_offset[p] > line_width - text_x_nwidth
				{
				line_break_pos[line_break_num[p], p] = last_free_space;
				line_break_num[p]++;
				var _txt_up_to_last_space = string_copy(text[p], 1, last_free_space );
				var _last_free_space_string = string_char_at(text[p], last_free_space);
				line_break_offset[p] = (string_width(_txt_up_to_last_space) - string_width(_last_free_space_string)) * text_scale;
				}
			}
		//conseguir las cordenadas de cada letra
		for (var c = 0; c < text_length[p]; c++)
		{
		var _char_pos = c+1
		var _txt_x = textbox_x + text_x_offset[p] + border;
		var _txt_y = textbox_y + border;
		var _txt_up_to_char = string_copy(text[p], 1, _char_pos);
		var _current_txt_w = (string_width(_txt_up_to_char)- string_width(char[c, p] )) * text_scale;
		var _txt_line = 0; 
		
		//compensar el final de la linea de texto
		for (var lb = 0; lb < line_break_num[p]; lb++)
			{
			if _char_pos >= line_break_pos[lb, p]
				{
					var _str_copy = string_copy(text[p], line_break_pos[lb, p], _char_pos-line_break_pos[lb, p] );
					_current_txt_w = string_width( _str_copy) * text_scale;
					
					//Guardar la "linea" en la que debe estar la letra
					_txt_line = lb+1; // +1 porque lb inicia en 0 :V 
				}
			}
		//añadir a las cordenadas x y y en la nueva informacion
		char_x[c, p] = text_x_offset[p] + border + _current_txt_w; 
		char_y[c, p] = border + _txt_line * (line_sep * text_scale);
		}
	}
}

//..._______________Escribir el texto ________________...
if draw_char < text_length[page]
	{
		draw_char += text_spd;
		 if !audio_is_playing(speak_sound) {audio_play_sound(speak_sound, 2, 0)}
		draw_char = clamp(draw_char, 0, text_length[page]);
	}
// ...______________Pasar los dialogos________________...
	if accept_key
		{
	//si termina de escribir va al siguiente dialogo d:
	if draw_char == text_length[page]
		{
			//pasar a la siguiente pagina
			if page < page_number - 1
			{
			page++;
			draw_char = 0;
			}
			//borrar el cuado de texto
			else
				{
					if option_number > 0 {
						create_textbox(option_link_id[option_pos])
					}
					instance_destroy();
					if instance_exists(obj_player){obj_player.actual_state = 1}
				}
		}
		else if  draw_char > 1
			{
			draw_char = text_length[page];
			}
		}
	
// ...______________dibujar la caja de texto _________...
//var _txtb_x  = textbox_x + text_x_offset[page];
var _txtb_x  = textbox_x + 20;
var _txtb_y  = textbox_y;
txtb_img += txtb_img_spd;
txtb_spr_w = sprite_get_width(txtb_spr[page])
txtb_spr_h = sprite_get_height(txtb_spr[page]);

//fondo de la caja de texto
draw_sprite_ext(txtb_spr[page], txtb_img,_txtb_x,_txtb_y, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0, c_white, 1)

//dibujar al que habla :v
if speaker_sprite[page] != noone {
	
	if draw_char == text_length[page] {image_index = 0}
	sprite_index = speaker_sprite[page];
	var _speaker_x = textbox_x + portrait_x_offset[page];
	if speaker_side[page] == -1 {_speaker_x += sprite_width}
	//dibujar al que habla ahora si (lo otro era configuracion)
	draw_sprite_ext(txtb_spr[page], txtb_img, textbox_x + portrait_x_offset[page], textbox_y, 60/txtb_spr_w, 60/txtb_spr_h, 0, c_white, 0)
	draw_sprite_ext(sprite_index, image_index, _speaker_x, textbox_y + 5, speaker_side[page], 1, 0, c_white, 1)
}


// ..._____________Opciones de dialogo_________________...
if draw_char == text_length[page] && page == page_number - 1 {
    
    // --- 1. Logica de Navegacion d: ---
    if (option_number == 2) {
        if (_right) option_pos = 1;
        if (_left)  option_pos = 0;
    }
    else if (option_number == 3) {
        if (_right) option_pos = 1;
        if (_left)  option_pos = 0;
        if (_down && (option_pos == 0 || option_pos == 1)) option_pos = 2;
        if (_up   && option_pos == 2) option_pos = 0;
    } 
    else if (option_number == 4) {
        // que sea para donde es cuando son 4 :D
        if (_right) option_pos = 1;
        if (_left)  option_pos = 0;
        if (_up)    option_pos = 2;
        if (_down)  option_pos = 3;
    }

    // --- 2. Configuracion visual de las opciones ---
    var _side_margin = 8;
    var _vert_margin = 5;
    var _op_height = 18;
    var _box_w = 100;

    var _x_scale = _box_w / txtb_spr_w;
    var _y_scale = _op_height / txtb_spr_h;
    var option_size = 0.8; 

    var _op_x = array_create(4);
    var _op_y = array_create(4);

    // --- 3. Posicion simetrica d: (mas o menos) ---
    var _mid_y = _txtb_y + (textbox_height / 2) - (_op_height / 2);
    var _center_x = _txtb_x + (textbox_width / 2) - (_box_w / 2);

    // Posicion Opcion A
    _op_x[0] = _txtb_x + _side_margin;
    _op_y[0] = _mid_y;

    // Posicion Opcion B
    if (option_number >= 2) {
        _op_x[1] = (_txtb_x + textbox_width) - _side_margin - _box_w + 8 ;
        _op_y[1] = _mid_y;
    }

    // Posicion de C y D (Cambian si son 3 o 4 opciones)
    if (option_number == 3) {
        _op_x[2] = _center_x + 10;
        _op_y[2] = (_txtb_y + textbox_height) - _vert_margin - _op_height - 2;
    } 
    else if (option_number == 4) {
        _op_x[2] = _center_x + 10;
        _op_y[2] = _txtb_y + _vert_margin;
        
        _op_x[3] = _center_x + 10;
        _op_y[3] = (_txtb_y + textbox_height) - _vert_margin - _op_height - 2;
    }

    // ---  Dibujar todito de las opciones ---
    for (var i = 0; i < option_number; i++) {
        var _col = (option_pos == i) ? c_yellow : c_white;
        
        // Dibujar la caja de las opciones (No se usa pero sirve para acomodar el texto)
        draw_sprite_ext(txtb_spr[page], txtb_img, _op_x[i], _op_y[i], _x_scale, _y_scale, 0, c_white, 0);
        
        // Dibujar el texto
        var _ty = _op_y[i] + 3;
        draw_text_ext_transformed_color(_op_x[i] + 10, _ty - 4, option[i], 13, _box_w, option_size, option_size, 0, _col, _col, _col, _col, 1);
        
        // Corazón empatico 
        if (option_pos == i) {
            // El corazón ahora se dibuja un poco más preciso a la izquierda
            draw_sprite_ext(spr_heart, 1, _op_x[i] -2, _op_y[i] + (_op_height/2) - 2, 0.5, 0.5, 0, c_white, 1);
       }
    if (_up || _down || _left || _right) &! audio_is_playing(snd_select)	{audio_play_sound(snd_select,2, 0)}
	}
}

// ...______________dibujar el texto d: _____________...

for(var c = 0; c < draw_char; c++)
{    
    var _draw_x = textbox_x + char_x[c, page];
    var _draw_y = textbox_y + char_y[c, page];
    draw_text_transformed(_draw_x, _draw_y, char[c, page], text_scale, text_scale, 0);
}

//var _drawtext = string_copy(text[page], 1, draw_char)