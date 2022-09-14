$fn = 80;

thick = 16;
bafflethick = 8;
width = 330;
depth = 280;
spholer = 231/2;

ctrwidth = 200;
ctrdepth = 90;

angle = 15;

upheight = cos(angle) * width;
upoff = sin(angle) * width;

height = upheight + width;
volume = (height*width/1e4 + height*depth/1e4*2)*(thick/100)
			- 2*(spholer*spholer*3.1416/1e4)*(thick/100)
			- (ctrwidth*ctrdepth/1e4)*thick/100;

echo("height", height);
echo("walnut", volume * 0.57);
echo("pine", volume * 0.42);

translate([0, width + thick*2, 0])
	side();

translate([0, thick, 0])
	side();
	
// bottom
translate([0, 0, -thick])
	cube([depth, width + thick*2, thick]);

translate([0, 0, height])
	top();

// lower speaker
translate([depth - thick*2, thick, 0])
	baffle();

// upper speaker
translate([depth - thick*2, thick, width - 2])
	rotate([0, -angle, 0])
		baffle();

// middle separator
translate([0, 0, width - bafflethick / 2])
	cube([depth - thick*2, width + thick*2, bafflethick]);

module top()
{
	difference()
	{
		cube([depth - upoff, width + thick*2, thick]);
		
		translate([0, thick + (width - ctrwidth) / 2, -1])
			cube([ctrdepth, ctrwidth, thick + 2]);
	}
}

module baffle()
{
	difference()
	{
		cube([bafflethick, width, width]);

		translate([-1, width/2, width/2])
			rotate([0, 90, 0])
				cylinder(bafflethick + 2, spholer, spholer);
	}
}

module side()
{
	rotate([90, 0, 0])
		linear_extrude(thick)
			polygon([	[0, 0],
						[depth, 0],
						[depth, width],
						[depth - upoff, height],
						[0, height]]);
}
