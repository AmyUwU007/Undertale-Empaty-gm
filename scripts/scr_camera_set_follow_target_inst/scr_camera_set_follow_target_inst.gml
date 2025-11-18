function scr_camera_set_follow_target_inst(){
      if (instance_exists(obj_camera) && obj_camera.follow != obj_player && obj_camera.follow != target_instance)
    {
        // 'target_instance' puede ser una instancia ID (ej. obj_player) o 'noone'
        obj_camera.follow = target_instance;
        
		  // OPCIONAL: Detener la inercia (suavizado) y fijar la cámara al nuevo objetivo de inmediato
        if (target_instance != noone)
        {
            obj_camera.x = target_instance.x;
            obj_camera.y = target_instance.y;
        }
		
    }

}