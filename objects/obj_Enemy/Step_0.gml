var dt = 1 / game_get_speed(gamespeed_fps);

var pathLength = path_get_length(0);

var newX = path_get_x(0, age * moveSpeed / pathLength);
var newY = path_get_y(0, age * moveSpeed / pathLength);

var dirX = newX - x;
var dirY = newY - y;

image_xscale = abs(image_xscale) * ((dirX - dirY) > 0 ? 1 : -1);

hspeed = newX - x;
vspeed = newY - y;

age += dt;

var collision = collision_circle(x, y, 32, obj_Bob, false, true);
if (collision != noone)
{
	var pushX = collision.x - x;
	var pushY = collision.y - y;
	var dist = vLength(pushX, pushY);
	
	pushX /= dist;
	pushY /= dist;
	
	var pushForce = 1280;
	
	collision.stun(0.5, pushX * pushForce, pushY * pushForce);
}