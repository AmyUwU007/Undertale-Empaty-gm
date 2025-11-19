follow = obj_player;
cam_id = view_camera[0];

// Posición Inicial
x = follow.x;
y = follow.y;
xTo = x;
yTo = y;
positionX = 0;
positionY = 0;

// Lo rapido que se acerca la camara (distancia de la camara/offset)
//mienstras mas tenga, mas lento 1/4 = 25% lentitud 1/10 = 100%
cam_follow_offset = 4;

// Variables de Zoom
zoom_factor = 1.0; 
zoomTo = 1.0;

// Constantes de Radio de escala
ratio_w = 4;
ratio_h = 3;

// Tamaño base de la cámara es la proporcion 1 a 1 :V
camWidth_base = 320; 
camHeight_base = 240;

// toma los valores base y de radio para comvertirlos en un valor de escala que 
//usar despues
default_scale = camWidth_base / ratio_w;

// Variables de rotacion (en grados)
rotation = 0;   // Rotación actual de la cámara
rotationTo = 0; // Objetivo de rotación

