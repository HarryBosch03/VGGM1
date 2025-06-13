var cellPosX = selectedCellX * cellSize;
var cellPosY = selectedCellY * cellSize;

//if (heldTower != noone)
{
	draw_sprite(spr_SelSquare, 0, cellPosX, cellPosY);
}

var dt = delta_time / 1000000;
var vel = vLength(xVel, yVel);
distanceCounter += vel * dt;

var spriteX = x;
var spriteY = y;

spriteY -= abs(sin(distanceCounter * 0.03)) * 8 * (vel / moveSpeed);

image_xscale = lerp(image_xscale, xVel > 0 ? -1 : 1, dt * 15);
image_yscale = stunTimer > 0 ? -1 : 1;

draw_sprite_ext(spr_DropShadow, 0, x, y + 20, image_xscale, image_yscale, 0, c_white, 0.5);

if (framesSinceStunned < 10) shader_set(shr_Flash);
draw_sprite_ext(sprite_index, image_index, spriteX, spriteY, image_xscale, image_yscale, 0, c_white, 1);
shader_reset();

framesSinceStunned++;