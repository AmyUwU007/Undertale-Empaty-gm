function scr_camera_set_position(target_x, target_y) {
    if (instance_exists(obj_camera))
    {
        // 1. Asegúrate de que no está siguiendo a nadie para evitar conflictos
        obj_camera.follow = noone; 
        
        // 2. Establece el objetivo de movimiento. El Evento Step se encargará del suavizado:
        obj_camera.positionX = target_x; 
        obj_camera.positionY = target_y;
    }
}