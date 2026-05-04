depth = -999999

//Parametros de la caja de texto d:
textbox_width = 280;
textbox_height = 60;
border = 5
line_width = textbox_width - border*2 - 8
line_sep = 13
txtb_spr[0] = spr_menu_1;
txtb_img = 0;
txtb_img_spd = 0;
haling = fa_left
speak_sound = snd_move;

//Manejar el texto OwO
page = 0;
page_number = 0;
text[0] = "";
text_length[0] = string_length(text[0]);
char[0, 0] = "";
char_x[0, 0] = 0;
char_y[0, 0] = 0;
draw_char = 0;
text_spd = 0.5;
text_scale = 0.8

//Opciones
option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;
option_size = 1
setup = false;

//Efectos UwU
scr_set_defaults_for_text();
last_free_space = 0;