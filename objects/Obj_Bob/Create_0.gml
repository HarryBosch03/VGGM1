tilemap = layer_tilemap_get_id("TileLayer");

moveSpeed = 64 * 8;
moveAcceleration = 15;

heldTower = noone;

cellSize = 64;

selectedCellX = 0;
selectedCellY = 0;

interactDistance = 1.5;

cx = 0;
cy = 0;

xVel = 0;
yVel = 0;

distanceCounter = 0;

stunTimer = 0;
framesSinceStunned = 0;

stun = function(time, forceX, forceY)
{
	stunTimer = max(stunTimer, time);
	xVel = forceX;
	yVel = forceY;
	framesSinceStunned = 0;
}