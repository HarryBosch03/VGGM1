var enemyCount = instance_number(obj_Enemy);
target = noone;
for (var i = 0; i < enemyCount; i++)
{
	var enemy = instance_find(obj_Enemy, i);
	var dist = sqrt(sqr(enemy.x - x) + sqr(enemy.y - y));
	
	if ((target == noone or enemy.age > target.age) and dist <= range)
	{
		target = enemy;
	}
}

if (instance_exists(target))
{
	if (projectile_speed > 0)
	{
		var intercept = calc_intercept(x, y, target.x, target.y, target.hspeed, target.vspeed, projectile_speed);
		if (intercept.exists)
		{
			aimX = intercept.x;
			aimY = intercept.y;
		}
	}
	else
	{
		aimX = target.x;
		aimY = target.y;	
	}
	
	if (faceTarget)
	{
		image_angle = point_direction(x, y, aimX, aimY);
	}
}