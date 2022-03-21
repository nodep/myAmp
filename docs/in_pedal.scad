$fn = 80;

pcb_thick = 1.6;
pcb_width = 105;
pcb_height = 47;
led_r = 3;
led_l = 8;

pot_shaft = 7;
pot_shaft_offset = 6.3;
pot_shaft_len = 6;
pot_depth = 7.05;
pot_height = 11.3;
pot_width = 9.5;

rotenc_shaft_r = 6;
rotenc_shaft_l = 15;

gain_sel_shaft_r = 7;
gain_sel_shaft_l = 15;

module pcb_blank()
{
	cube([pcb_width, pcb_height, pcb_thick]);
}

module pot_up(pos)
{
	translate([pos - pot_width/2, pcb_height - pot_depth, pcb_thick])
	{
		cube([pot_width, pot_depth, pot_height]);
		
		translate([pot_width/2, pot_shaft_len + pot_depth, pot_shaft_offset])
			rotate([90, 0, 0])
				cylinder(pot_shaft_len, pot_shaft / 2, pot_shaft / 2);
	}
}

module pot_down(pos)
{
	translate([pos - pot_width/2, pcb_height - pot_depth, -pot_height])
	{
		cube([pot_width, pot_depth, pot_height]);
		
		translate([pot_width/2, pot_shaft_len + pot_depth, pot_height - pot_shaft_offset])
			rotate([90, 0, 0])
				cylinder(pot_shaft_len, pot_shaft / 2, pot_shaft / 2);
	}
}

module led_up(x, off)
{
	translate([x, pcb_height + led_l / 2, pcb_thick + off])
		rotate([90, 0, 0])
			cylinder(led_l, led_r / 2, led_r / 2);
}

module led_down(x, off)
{
	translate([x, pcb_height + led_l / 2, -off])
		rotate([90, 0, 0])
			cylinder(led_l, led_r / 2, led_r / 2);
}

module rotenc_shaft_down(x)
{
	translate([x, pcb_height + rotenc_shaft_l / 2, -10])
		rotate([90, 0, 0])
			cylinder(rotenc_shaft_l, rotenc_shaft_r / 2, rotenc_shaft_r / 2);
}

module gain_sel_shaft_down(x)
{
	translate([x, pcb_height + gain_sel_shaft_l / 2, pcb_thick + 6.5])
		rotate([90, 0, 0])
			cylinder(gain_sel_shaft_l, gain_sel_shaft_r / 2, gain_sel_shaft_r / 2);
}

module pcb_pa27()
{
	pcb_blank();

	pot_up( 6);
	pot_up(37);
	pot_up(68);
	pot_up(99);
}

module pcb_fv1()
{
	pcb_blank();

	pot_down(6);
	pot_down(21.755);
	pot_up(32);
	pot_down(50);
	pot_up(68);
	
	// clip
	led_down(39.535, 3);
	
	// program
	led_down(76.365, 2);
	led_down(81.445, 2);
	led_down(86.525, 2);
	led_up(76.365, 2);
	led_up(81.445, 2);
	led_up(86.525, 2);
	
	rotenc_shaft_down(96);
}

module pcb_powamp()
{
	pcb_blank();
	
	led_up(10, 2);
	led_up(19.5, 2);
	led_up(29, 2);

	gain_sel_shaft_down(40.17);
}

translate([0, 0, 24 + 1.6])
	pcb_pa27();

translate([0, 0, 0])
	pcb_fv1();

translate([0, 0, -36 - 1.6])
	pcb_powamp();
