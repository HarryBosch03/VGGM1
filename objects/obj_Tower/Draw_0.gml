if (debug_mode)
{
	draw_set_color(c_red);

	if (instance_exists(target))
	{
		draw_line(x, y, target.x, target.y);
	}
	
	draw_circle(x, y, range, true);
}

draw_set_color(c_white);

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);