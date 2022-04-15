$fn = 80;

thick = 14;
height = 595;
width = 300;
depth = 220;



echo("walnut", (height*width/1e4 + height*depth/1e4*2)*(thick/100) * 0.57);

echo("pine", (height*width/1e4 + height*depth/1e4*2)*(thick/100) * 0.42);

rotate([90, 0, 90])
	difference()
	{
		linear_extrude(width)
			polygon([	[    0,   0],
						[    0, width],
						[   70, height], 
						[depth, height],
						[depth,   0]]);


		translate([0, 0, thick])
		linear_extrude(width - thick*2)
			polygon([	[thick, thick],
						[thick, width], 
						[   82, height - thick], 
						[depth, height - thick],
						[depth, thick]]);
	}