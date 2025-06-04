var xInput = 0;
var yInput = 0;

var inputLeft = keyboard_check(ord("A"));
var inputRight = keyboard_check(ord("D"));

xVel += ((inputRight - inputLeft) * 6 - xVel);
yVel += 0.1;

if place_meeting(x + xVel, y, tilemap)
{
	while (!place_meeting(x + sign(xVel), y, tilemap))
	{
		x += sign(xVel);
	}
	xVel = 0;
}

x += xVel;

if place_meeting(x, y + yVel, tilemap)
{
	while (!place_meeting(x, y + sign(yVel), tilemap))
	{
		y += sign(yVel);
	}
	yVel = 0;
}

yVel = clamp(yVel, -24, 24);
y += yVel;

if (x < 0) x += room_width;
if (x > room_width) x -= room_width;

if (y < 0) y += room_height;
if (y > room_height) y -= room_height;