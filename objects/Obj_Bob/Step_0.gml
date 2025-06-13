var xInput = 0;
var yInput = 0;

var dt = delta_time / 1000000;

// --- Input Polling ---
var inputX = 0;
var inputY = 0;
var placeTower = 0;
if (stunTimer > 0)
{
	stunTimer -= dt;
}
else
{
	inputX = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	inputY = keyboard_check(ord("S")) - keyboard_check(ord("W"));
	placeTower = keyboard_check_pressed(vk_space);
}

var len = vLength(inputX, inputY);
if (len > 1)
{
	inputX /= len;
	inputY /= len;
}

// --- Movement ---

xVel += (inputX * moveSpeed - xVel) * moveAcceleration * dt;
yVel += (inputY * moveSpeed - yVel) * moveAcceleration * dt;

// --- Tower Interaction

selectedCellX = cx;
selectedCellY = cy;

if (placeTower)
{
	var cellPosX = selectedCellX * cellSize;
	var cellPosY = selectedCellY * cellSize;
	
	if (heldTower == noone)
	{
		var query = collision_point(cellPosX, cellPosY, obj_Tower, false, true);
		heldTower = query;
	}
	else
	{
		heldTower.x = cellPosX;
		heldTower.y = cellPosY;
		
		heldTower = noone;	
	}
}

// -- Collision
var room_lower_x = 64;
var room_upper_x = room_width - 64;
var room_lower_y = 64;
var room_upper_y = room_height - 64;

if (x < room_lower_x)
{
	x = room_lower_x;
	xVel = max(xVel, 0);
}
if (x > room_upper_x)
{
	x = room_upper_x;
	xVel = min(xVel, 0);
}
if (y < room_lower_y)
{
	y = room_lower_y;
	yVel = max(yVel, 0);
}
if (y > room_upper_y)
{
	y = room_upper_y;
	yVel = min(yVel, 0);
}

x += xVel * dt;
y += yVel * dt;

cx = round(x / cellSize);
cy = round(y / cellSize);

if (heldTower)
{
	heldTower.x = x;
	heldTower.y = y - (sprite_height / 2 + heldTower.sprite_height / 2);
}