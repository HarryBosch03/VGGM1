// Inherit the parent event
event_inherited();

var dt = delta_time / 1000000;

if (target != noone)
{
	if (shoot_timer <= 0)
	{
		shoot_timer = 1 / shoot_speed;
		var pInstance = instance_create_layer(x, y, layer, obj_Projectile);
		pInstance.direction = point_direction(x, y, aimX, aimY);
		pInstance.speed = projectile_speed;
		pInstance.image_xscale = 4;
		pInstance.image_yscale = 4;
		pInstance.damage = damage;
	}
}

shoot_timer -= dt;