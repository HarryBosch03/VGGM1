function calc_intercept(sourceX, sourceY, targetX, targetY, targetVelX, targetVelY, sourceSpeed)
{
	var intercept = {};
	intercept.exists = false;
	
	var P0 = { x: targetX, y: targetY };
	var V0 = { x: targetVelX, y: targetVelY };
	var P1 = { x: sourceX, y: sourceY };
    var s1 = sourceSpeed;
	
	var a = (V0.x * V0.x) + (V0.y * V0.y) - (s1 * s1);
    var b = 2 * ((P0.x * V0.x) + (P0.y * V0.y) - (P1.x * V0.x) - (P1.y * V0.y));
    var c = (P0.x * P0.x) + (P0.y * P0.y) + (P1.x * P1.x) + (P1.y * P1.y) - (2 * P1.x * P0.x) - (2 * P1.y * P0.y);
	
	var d = sqrt((b * b) - (4 * a * c));
    var e = 2 * a;
    var t1 = (-b + d) / e;
    var t2 = (-b - d) / e;
	
	var t = 0;
    if (t1 == NaN || t1 <= 0)
    {
        if ((t2) == NaN || t2 <= 0)
            return intercept;
		t = t2;
    }
    else if (t2 == NaN || t2 <= 0)
        t = t1;
    else
        t = min(t1, t2);

    // Find the intercept position based on the calculated time value
	intercept.exists = true;
	intercept.x = targetX + targetVelX * t;
	intercept.y = targetY + targetVelY * t;

    return intercept;
}