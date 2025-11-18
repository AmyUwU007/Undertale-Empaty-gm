// Evento Room Start (obj_camera)
x = follow.x;
y = follow.y;
var cam_id = view_camera[0];

// 2. Cálculo de Escala (Manteniendo 4:3)
var max_scale_w = room_width / ratio_w;
var max_scale_h = room_height / ratio_h;

//Ajusta la escala a la que se tiene que llegar con el tamaño maximo de la habitacion
final_scale = min(default_scale, min(max_scale_w, max_scale_h));

// Si necesitas cam_w/cam_h en el Step para el clamping:
cam_w = ratio_w * final_scale * zoom_factor;
cam_h = ratio_h * final_scale * zoom_factor; 

// 3. Tamaño de la Cámara (View Size) - Inicial
camera_set_view_size(cam_id, cam_w, cam_h);

