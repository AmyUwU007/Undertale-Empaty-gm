function scr_camera_set_zoom(target_zoom_value) {
    if (instance_exists(obj_camera))
    {
        obj_camera.zoomTo = target_zoom_value;
    }
}