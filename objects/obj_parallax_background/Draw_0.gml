// Evento Draw del mismo objeto

// 1. Obtener la posición actual de la cámara
var _camx = camera_get_view_x(camera_id) 
var _camy = camera_get_view_y(camera_id) 

// 2. Calcular la posición de dibujo aplicando el paralaje.
// Restamos la posición de la cámara de su punto de inicio (0,0 si la room empieza en 0,0)
// y aplicamos el factor _p. 
// Como positionX y positionY son 0, simplemente usamos la posición de la cámara:

var _drawX = _camx * _p + positionX + camera_get_view_width(camera_id)/2; 
var _drawY = _camy * _p + positionY + camera_get_view_height(camera_id)/2;

// Si quisieras que el castillo siempre empezara en (100, 50) por ejemplo, sería:
// var _drawX = _camx * _p + 100;
// var _drawY = _camy * _p + 50;


// 3. Dibujar el sprite
draw_sprite(background, 0, _drawX, _drawY);
