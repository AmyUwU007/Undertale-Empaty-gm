function scr_camera_set_rotation(target_angle) {
    if (instance_exists(obj_camera))
    {
        // Establece el ángulo objetivo. El Step se encarga del suavizado.
        obj_camera.rotationTo = target_angle; 
    }
}