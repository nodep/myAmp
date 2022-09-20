module top()
{
	difference()
	{
		top_offset = sin(angle) * thick;

		rotate([-90, 0, 0])
			linear_extrude(baffle_size + thick*2)
				polygon([	[0, 0],
							[0, thick],
							[in_depth - offset, thick],
							[in_depth - offset - top_offset, 0]]);

		translate([0, thick + (baffle_size - ctr_width) / 2, -1 - thick])
			cube([ctr_depth, ctr_width, thick + 2]);
	}
}

module baffle()
{
	difference()
	{
		cube([baffle_thick, baffle_size, baffle_size]);

		translate([-1, baffle_size/2, baffle_size/2])
			rotate([0, 90, 0])
				cylinder(baffle_thick + 2, speaker_hole, speaker_hole);
	}
}