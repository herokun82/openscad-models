use <../lib/pyramid.scad>;

module oil_burner(length, width, height, wall, candle_diameter, oil_sink_depth, oil_wall, oil_sink_wall) {

	module main () {
		cube([length, width, height]);
	}

	module hole() {
		translate([wall, wall, wall])
			cube([length - 2*wall, width - 2*wall, height - wall - 1.5*oil_sink_depth - oil_sink_wall]);
	}

	module candle_hole () {
		translate([-wall, wall, wall])
			cube([length + 2*wall, width - 2*wall, width - 2*wall]);
	}

	module candle_stand () {
		translate([length/2, width/2, wall/2]) {
			difference() {
				linear_extrude(wall)
					circle(candle_diameter/2);
				translate([0,0,1])
					linear_extrude(wall*2)
						circle((candle_diameter-wall)/2);
			}
		}
	}

	module oil_sink () {
		translate([length/2, width/2, height - oil_sink_depth/2])
			mirror([0,0,1])
				cylinder(oil_sink_depth, width/2 - wall, 0);
		translate([wall, wall, height - oil_sink_depth/2])
			cube([length - 2*wall, width - 2*wall, oil_sink_depth/2]);
	}

	difference () {
		difference() {
			main();
			hole();
		}
		candle_hole();
		color("orange")
			oil_sink();
	}

	color("red")
		candle_stand();
}

oil_burner(100, 100, 150, 8, 60, 8, 7, 2);