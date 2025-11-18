function scr_obj_alpha(instance, alpha){



	if instance.image_alpha != alpha{
	if alpha < instance.image_alpha
		instance.image_alpha -= 0.1
		
	}
	if alpha > instance.image_alpha{
		instance.image_alpha += 0.1
	}
}