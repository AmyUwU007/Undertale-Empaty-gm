right_key = keyboard_check(vk_right) or keyboard_check(ord("D"))
up_key = keyboard_check(vk_up) or keyboard_check(ord("W"))
left_key = keyboard_check(vk_left) or keyboard_check(ord("A"))
down_key = keyboard_check(vk_down) or keyboard_check(ord("S"))
run_key = keyboard_check(vk_shift)


// Obtener valores Xspd y Ysped
 if run_key > 0 && move_spd < 4
	{
		move_spd = 2.15
		running = 1
	}
	else if move_spd
	{
	move_spd = 1.1
	runnning = 0
	}
	
xspd = (right_key - left_key) * move_spd
yspd = (down_key - up_key) * move_spd

if instance_exists(obj_pauser){
xspd = 0
yspd = 0
}
	
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

//cambiar el sprite cuando corre xd 

if running == 1 && run_key == 1
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



//Colisiones
if place_meeting(x + xspd, y, obj_wall)
 {
	 xspd = 0;
 }

if place_meeting(x, y + yspd, obj_wall)
 {
	 yspd = 0;
 }
 
//Mover a Yesica :V
x += xspd;
y += yspd;

//Animar a la wey cuando esta quita
if xspd == 0 && yspd == 0 
	{
	image_index = 0
	}
 