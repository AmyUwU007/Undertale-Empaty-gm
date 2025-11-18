if place_meeting(x, y, obj_player){

	if Change_offset == true{
	scr_camera_set_offset(offset)
	}
	
	if Change_position == true{
	scr_camera_set_position(positionX, positionY)
	}

	if Change_rotation == true{
	scr_camera_set_rotation(rotation)
	}

	if Change_target == true{
	scr_camera_set_follow(target)
	}

	if Change_zoom == true{
	scr_camera_set_zoom(zoom)
	}
	

}