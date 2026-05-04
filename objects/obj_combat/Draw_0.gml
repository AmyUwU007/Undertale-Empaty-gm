

//Centrar menu
//x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2
//y = (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - height/2)

//dibujar el fondo del menu
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 0)
    var _op_x = array_create(4);
    var _op_y = array_create(4);
	_op_x[0] = 20
	_op_y[0] = 20
	
	_op_x[1] = 460
	_op_y[1] = 20
	
	_op_x[2] = 20
	_op_y[2] = 80
	
	_op_x[3] = 460
	_op_y[3] = 80

//dibujar las opciones
draw_set_font(font)
draw_set_valign(fa_top)
draw_set_halign(fa_center)
for (var i = 0; i < 4; i++)
{
	var _c = c_white;
	var _ca = 0
	if pos == i {_ca = 4};
	draw_sprite_ext(spr_combat, i+_ca, _op_x[i]+x, _op_y[i]+y, 1, 1, 0, _c,1);
}
//draw_text_colour(x+op_border, y+op_border + op_space * i, option[menu_level, i], #009960, _c, #AAFFFF, _c, 1);