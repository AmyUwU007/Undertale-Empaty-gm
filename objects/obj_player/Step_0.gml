right_key = keyboard_check(vk_right) or keyboard_check(ord("D"))
up_key = keyboard_check(vk_up) or keyboard_check(ord("W"))
left_key = keyboard_check(vk_left) or keyboard_check(ord("A"))
down_key = keyboard_check(vk_down) or keyboard_check(ord("S"))
run_key = keyboard_check(vk_shift)
flaute_key = keyboard_check(ord("E"))

//quedarse quieto con texto 
if instance_exists(obj_textbox) {actual_state = 3}

// Obtener valores Xspd y Ysped
 if actual_state != 3 && run_key == 1
	{
		move_spd = 2.5
		actual_state = 2
	}
	else if actual_state != 3 && run_key == 0
	{
	move_spd = 1.3
	actual_state = 1
	}
	else if actual_state == 3 {move_spd = 0}
	
xspd = (right_key - left_key) * move_spd
yspd = (down_key - up_key) * move_spd

if instance_exists(obj_pauser){
actual_state = 3
} else if actual_state == 3
{actual_state = 1}
	
 //poner sprite
mask_index = sprite[DOWN]
if yspd == 0 
	{
		if xspd > 0 {face = RIGHT};
		if xspd < 0 {face = LEFT};
	}
if xspd > 0 && face == LEFT{face = RIGHT};
if xspd < 0 && face == RIGHT{face = LEFT};

if xspd == 0 
	{
		if yspd > 0 {face = DOWN};
		if yspd < 0 {face = UP};
	}
if yspd > 0 && face == UP {face = DOWN};
if yspd < 0 && face == DOWN {face = UP};


//friccion
if  actual_state != 3{
	if yspd == 0{
		if right_key == 1 && place_meeting(x + 2.5, y, obj_wall){
			if place_empty(x + 2.5, y -2.5, obj_wall)
			{
				y -= (yspd + 1)* move_spd
			}

			if  place_empty(x + 2.5, y + 2.5, obj_wall)
			{
				y += (yspd + 1)* move_spd
			}
		}
		if left_key == 1 && place_meeting(x - 2.5, y, obj_wall){
			if place_empty(x - 2.5, y - 2.5, obj_wall)
			{
				y -= (yspd + 1)* move_spd
			}

			if  place_empty(x - 2.5, y + 2.5, obj_wall)
			{
				y += (yspd + 1)* move_spd
			}
		}
	}
	if xspd == 0{
		if up_key == 1 && place_meeting(x, y - 2.5, obj_wall){
			if place_empty(x - 2.5, y - 2.5, obj_wall)
			{
				x -= (xspd + 1)* move_spd
			}

			if  place_empty(x + 2.5, y - 2.5, obj_wall)
			{
				x += (xspd + 1)* move_spd
			}
		}
		if down_key == 1 && place_meeting(x, y + 2.5, obj_wall){
			if place_empty(x - 2.5, y + 2.5, obj_wall)
			{
				x -= (xspd + 1)* move_spd
			}

			if  place_empty(x + 2.5, y + 2.5, obj_wall)
			{
				x += (xspd + 1)* move_spd
			}
		}
	}
}

//Colisiones
if place_meeting(x + xspd, y, obj_wall)
 {
	 xspd = 0;
 }

if place_meeting(x, y + yspd, obj_wall)
 {
	 yspd = 0;
 }


//cambiar el sprite cuando corre xd 

if actual_state == 2
{
	if xspd != 0{
		if face == RIGHT {face = RIGHTRUN}
		if face == LEFT {face = LEFTRUN}
	}
	if yspd != 0 {
		if face == UP {face = UPRUN}
		if face == DOWN {face = DOWNRUN}
	}
} 

sprite_index = sprite[face]

 
//Mover a Yesica :V
if actual_state != 3{
x += xspd;
y += yspd;
}

//Animar a la wey cuando esta quita
if xspd == 0 && yspd == 0 
	{
	image_index = 0
	}
 
 //Profundidad d:
 depth = -bbox_bottom