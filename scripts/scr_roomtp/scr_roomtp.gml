function scr_roomtp(target_x, target_y, target_rm, target_face) {
	if !instance_exists(obj_fade){
	    var inst = instance_create_depth(0, 0, -9999, obj_fade);
	inst.target_rm = target_rm;
	inst.target_x = target_x;
	inst.target_y = target_y;
	inst.duration = 12;
	inst.color = c_black;
	inst.target_face = target_face;
	}
}