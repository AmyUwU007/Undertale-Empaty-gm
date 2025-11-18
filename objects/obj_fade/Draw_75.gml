//Obtener dimensiones de la insterfaz
var guiWidth = display_get_gui_width()
var guiHeight = display_get_gui_height()

//Dibujar el fade
draw_set_alpha(alpha)
draw_set_colour(color)

draw_rectangle(0, 0, guiWidth, guiHeight, 0);

draw_set_alpha(1);
draw_set_colour(c_black)