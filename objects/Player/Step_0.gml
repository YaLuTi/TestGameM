key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);

//Move
hsp = (key_right-key_left)*wsp;
//Gravity
vsp += grv;
//Jump
if(keyboard_check_pressed(vk_up)&&Jump){
	Jump = 
	vsp = 0;
	vsp -= 6;
}
if(keyboard_check(vk_up)&&Jump){
	vsp -= .1;
}
if(keyboard_check_released(vk_up)){
	Jump = false;
}

//Sprites Animation
if(hsp!=0){
	sprite_index = Walk;
}else{
	sprite_index = Idle;
}

//Face
if(hsp>0){
	image_xscale = 2.5;
}else if(hsp<0){
	image_xscale = -2.5;
}

//CollisonX
if (place_meeting(x+hsp,y,Block)){
	while(!place_meeting(x+sign(hsp),y,Block)){
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//CollisonY
if (place_meeting(x,y+vsp,Block)){
	Jump = true;
	while(!place_meeting(x,y+sign(vsp),Block)){
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;


