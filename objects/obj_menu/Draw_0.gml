//Dinamicamente obtener ancho y alto
var _new_w = 0;
for (var i = 0; i < op_length; i++)
	{
	var _op_w = string_width(option[menu_level, i])
	_new_w = max(_new_w, _op_w)
	}
width = _new_w + op_border*2
height = op_border*2 + string_height(option[0, 0]) + (op_length-1)*op_space;

//Centrar menu
//x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2
//y = (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - height/2)

//dibujar el fondo del menu
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 0)

//dibujar las opciones
draw_set_font(font)
draw_set_valign(fa_top)
draw_set_halign(fa_center)
for (var i = 0; i < op_length; i++)
{
	var _c = c_white;
	if pos == i {_c = #01FFA9};
	draw_text_colour(x, y+op_border + op_space * i, option[menu_level, i], #009960, _c, #AAFFFF, _c, 1);
}
//draw_text_colour(x+op_border, y+op_border + op_space * i, option[menu_level, i], #009960, _c, #AAFFFF, _c, 1);