//Movimiento de camara suavizado
if (follow != noone)
{
    xTo = follow.x;
    yTo = follow.y;
}else 
{
	xTo = positionX
	yTo = positionY
}
x += (xTo - x) / cam_follow_offset;
y += (yTo - y) / cam_follow_offset;

// Reiniciamos el objetivo de zoom a 1.0 (normal)
var zoom_goal = 1.0; 

// ----------------------------------------------------
// Lógica de Zoom Dinámico con Punto Muerto
// ----------------------------------------------------

var nearest_zoom_area = instance_nearest(x, y, obj_zoom_area);

if (nearest_zoom_area != noone)
{
    var max_dist = nearest_zoom_area.influence_radius;
    var current_dist = point_distance(x, y, nearest_zoom_area.x, nearest_zoom_area.y);
    
    if (current_dist < max_dist)
    {
        // 1. Definir la Zona Muerta (R_dead)
        var dead_zone_radius = max_dist * nearest_zoom_area.dead_zone_ratio; 
        
        // 2. Definir el Rango de Interpolación
        // Esta es la distancia que queda entre el radio muerto y el radio de influencia (R_max - R_dead)
        var interpolation_range = max_dist - dead_zone_radius; 
        
        // 3. Distancia Más Allá del Punto Muerto
        // Mide cuánto nos hemos movido fuera del radio muerto (D_cur - R_dead)
        var dist_beyond_dead_zone = current_dist - dead_zone_radius;
        
        // 4. Normalización y Clamping (t)
        // Normalizamos esta distancia al rango de interpolación.
        // Usamos clamp para asegurar que 't' esté siempre entre 0 y 1:
        // - Si estamos DENTRO del punto muerto, el valor será forzado a 0.
        // - Si estamos FUERA, el valor será forzado a 1.
        var t = clamp(dist_beyond_dead_zone / interpolation_range, 0, 1);
        
        // 5. Cálculo del Zoom con LERP
        var zoom_max = nearest_zoom_area.target_zoom;
        var zoom_min = 1.0;
        
        // Si 't' = 0 (punto muerto), el zoom_goal es zoom_max.
        // Si 't' = 1 (borde de influencia), el zoom_goal es zoom_min.
        zoom_goal = lerp(zoom_max, zoom_min, t);
    }
}

// Aplica como objetico de zoom a la variable suavizada

zoomTo = zoom_goal;

//Suavizado del Zoom
zoom_factor += (zoomTo - zoom_factor) * 0.1; // Ajusta el 0.1 para la velocidad de suavizado

//Suavizado de la rotacion
rotation += (rotationTo - rotation) * 0.1;



//Ajusta la camara al zoom
var new_cam_w = (camWidth_base / default_scale) * final_scale * zoom_factor;
var new_cam_h = (camHeight_base / default_scale) * final_scale * zoom_factor;

camera_set_view_size(cam_id, new_cam_w, new_cam_h);

// Establece la posicion de la camara y sus valores maximos de alto y ancho
var camx_unclamped = x - (new_cam_w * 0.5);
var camy_unclamped = y - (new_cam_h * 0.5);

var xmax = max(0, room_width - new_cam_w);
var ymax = max(0, room_height - new_cam_h);

var camx = clamp(camx_unclamped, 0, xmax);
var camy = clamp(camy_unclamped, 0, ymax);

//Aplicar Posicion y Rotacion de camara
camera_set_view_pos(cam_id, camx, camy);	
camera_set_view_angle(cam_id, rotation);