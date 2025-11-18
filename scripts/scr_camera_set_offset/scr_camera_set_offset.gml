function scr_camera_set_offset(offset) {
    if (instance_exists(obj_camera) && offset != obj_camera.cam_follow_offset)
    {
        // Establece el ángulo objetivo. El Step se encarga del suavizado.
        obj_camera.cam_follow_offset = offset; 
    }
}