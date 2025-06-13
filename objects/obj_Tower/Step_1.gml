var enemyCount = instance_number(obj_Enemy);
target = noone;
for (var i = 0; i < enemyCount; i++)
{
	var enemy = instance_find(obj_Enemy, i);
	if (target == noone or enemy.age < target.age)
	{
		target = enemy;
	}
}