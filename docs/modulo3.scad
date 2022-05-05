$fn = 80;

thick = 16;
width = 300;
depth = 240;
speaker = 259;
spholer = 231/2;

ctrwidth = 200;
ctrdepth = 60;

angle = 18;

upheight = cos(angle) * width;
upoff = sin(angle) * width;

height = upheight + width;
volume = (height*width/1e4 + height*depth/1e4*2)*(thick/100)
			- 2*(spholer*spholer*3.1416/1e4)*(thick/100)
			- (ctrwidth*ctrdepth/1e4)*thick/100;

echo("height", height);
echo("walnut", volume * 0.57);
echo("pine", volume * 0.42);

difference()
{
	rotate([90, 0, 90])
		difference()
		{
			linear_extrude(width)
				polygon([	[    0, 0],
							[    0, width],
							[upoff, height], 
							[depth, height],
							[depth, 0]]);


			translate([0, 0, thick])
			linear_extrude(width - thick*2)
				polygon([	[thick, thick],
							[thick, width], 
							[upoff + thick, height - thick], 
							[depth, height - thick],
							[depth, thick]]);
		}

	translate([width / 2, thick+1, width / 2])
		rotate([90, 0, 0])
			cylinder(thick + 2, spholer, spholer);

	translate([width/2, upoff/2 + thick*2, height - upheight/2])
		rotate([90 - angle, 0, 0])
			cylinder(thick * 2, spholer, spholer);

	translate([width/2 - ctrwidth/2, depth - ctrdepth, height - thick - 1])
		cube([ctrwidth, ctrdepth, thick + 2]);
}

