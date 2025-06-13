
var query = collision_line(x, y, x + hspeed, y + vspeed, obj_Damagable, true, true);
if (query != noone)
{
	instance_destroy(query);
	instance_destroy(self);
}

if (x < 0 || y < 0 || x > room_width || y > room_height)
{
	instance_destroy(self);
}