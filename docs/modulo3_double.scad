include <modulo3_common.scad>

$fn = 120;

thick = 18;
baffle_thick = 10;
baffle_size = 330;
in_depth = 280;
speaker_hole = 231/2;

ctr_width = 200;
ctr_depth = 90;
ctr_height = 70;

angle = 15;

up_back_height = 140;
low_back_height = 140;

up_height	= cos(angle) * baffle_size;
offset		= sin(angle) * baffle_size;
in_height	= up_height + baffle_size;

vol_side	= (in_height * in_depth - up_height * offset / 2) * thick;
vol_top		= ((in_depth - offset) * (baffle_size + thick*2) - (ctr_depth * ctr_width)) * thick;
vol_bottom	= in_depth * (baffle_size + thick*2) * thick;
vol_baffle	= (baffle_size * baffle_size - speaker_hole * speaker_hole * 3.1416) * baffle_thick;
vol_separat	= in_depth * baffle_size * baffle_thick;
vol_up_back	= (baffle_size * up_back_height - ctr_width * ctr_height) * thick;
vol_low_back = baffle_size * low_back_height * thick;
vol_all		= (vol_side*2 + vol_top + vol_bottom + vol_baffle * 2 + vol_separat + vol_low_back + vol_up_back) / 1000;

echo("******************************");
echo("volume cm3 = ", vol_all);
echo("pine kg = ", vol_all * 0.52 / 1000);
echo("size: ", baffle_size + thick*2, in_height + thick*2, in_depth);

translate([0, baffle_size + thick*2, 0])
	side();

translate([0, thick, 0])
	side();

// bottom
translate([0, 0, -thick])
	cube([in_depth, baffle_size + thick*2, thick]);

translate([0, 0, in_height + thick])
	top();

// lower baffle
translate([in_depth - baffle_thick*2, thick, 0])
	baffle();

// upper baffle
translate([in_depth - baffle_thick*2, thick, baffle_size - 1.5])
	rotate([0, -angle, 0])
		baffle();

// middle separator
translate([0, thick, baffle_size])
	cube([in_depth - thick, baffle_size, baffle_thick]);

// lower back
translate([0, thick, 0])
	cube([thick, baffle_size, low_back_height]);

translate([0, thick, in_height - up_back_height])
	upper_back();

module upper_back()
{
	difference()
	{
		cube([thick, baffle_size, up_back_height]);
		
		translate([-1, (baffle_size - ctr_width) / 2, up_back_height - ctr_height])
			cube([thick + 2, ctr_width, ctr_height]);
	}
}

module side()
{
	rotate([90, 0, 0])
		linear_extrude(thick)
			polygon([	[0, 0],
						[in_depth, 0],
						[in_depth, baffle_size],
						[in_depth - offset, in_height],
						[0, in_height]]);
}