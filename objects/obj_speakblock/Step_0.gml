Accept_key = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(ord("Z"));
if instance_exists(obj_player){
	if place_meeting(x, y, obj_player) && obj_player.actual_state != 3 && Accept_key == 1 && !instance_exists(obj_textbox){
		obj_player.actual_state = 3
		create_textbox(text_id);
	}
}
