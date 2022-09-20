include <modulo3_common.scad>

$fn = 120;

thick = 16;
baffle_thick = 10;
baffle_size = 330;
in_depth = 260;
speaker_hole = 231/2;

ctr_width = 200;
ctr_depth = 90;
ctr_height = 70;

angle = 10;

back_height = 140;

in_height	= cos(angle) * baffle_size;
offset		= sin(angle) * baffle_size;

vol_side	= (in_height * in_depth - in_height * offset / 2) * thick;
vol_top		= ((in_depth - offset) * (baffle_size + thick*2) - (ctr_depth * ctr_width)) * thick;
vol_bottom	= in_depth * (baffle_size + thick*2) * thick;
vol_baffle	= (baffle_size * baffle_size - speaker_hole * speaker_hole * 3.1416) * baffle_thick;
vol_back	= (baffle_size * back_height - ctr_width * ctr_height) * thick;
vol_all		= (vol_side + vol_top + vol_bottom + vol_baffle + vol_back) / 1000;

echo("******************************");
echo("volume cm3 = ", vol_all);
echo("walnut kg = ", vol_all * 0.57 / 1000);
echo("pine kg = ", vol_all * 0.42 / 1000);

translate([0, baffle_size + thick*2, 0])
	side();

translate([0, thick, 0])
	side();
	
// bottom
translate([0, 0, -thick])
	cube([in_depth, baffle_size + thick*2, thick]);

translate([0, 0, in_height + thick])
	top();

translate([in_depth - baffle_thick*2, thick, -1])
	rotate([0, -angle, 0])
		baffle();

translate([0, thick, in_height - back_height])
	upper_back();

module upper_back()
{
	difference()
	{
		cube([thick, baffle_size, back_height]);
		
		translate([-1, (baffle_size - ctr_width) / 2, back_height - ctr_height])
			cube([thick + 2, ctr_width, ctr_height]);
	}
}

module side()
{
	rotate([90, 0, 0])
		linear_extrude(thick)
			polygon([	[0, 0],
						[in_depth, 0],
						[in_depth - offset, in_height],
						[0, in_height]]);
}
