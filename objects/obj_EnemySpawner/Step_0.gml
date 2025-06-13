var dt = 1 / game_get_speed(gamespeed_fps);

if (spawnTimer > 1)
{
	spawnTimer -= 1;
	
	instance_create_layer(x, y, layer, obj_Enemy);
}

spawnTimer += dt;