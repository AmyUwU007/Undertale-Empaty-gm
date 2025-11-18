function scr_camera_set_follow(target_instance) {
    if (instance_exists(obj_camera) && obj_camera.follow != obj_player && obj_camera.follow != target_instance)
    {
        // 'target_instance' puede ser una instancia ID (ej. obj_player) o 'noone'
        obj_camera.follow = target_instance;
        
    }
}