
module lamp(width, length, height, thickness, bottom_space, hole_count, hole_thickness) {


	module block() {
		cube(size = [width, length, height], center = false);
	}

	module inside() {
		translate([thickness, thickness, thickness])
			cube(size = [width - 2*thickness, length - 2*thickness, height - 2*thickness], center = false);
	}

	module gaps() {
		hole_distance = (height - bottom_space) / hole_count;

		for (i = [1 : hole_count]) {
			translate([-2.5, (i % 2) * 1.5*hole_distance - 2.5, height - hole_distance * i]) {
				cube(size = [width+5, 5+(length - 1.5*hole_distance), hole_thickness], center = false);
			}
		}
	}

	module bottom_hole() {
		translate([width/4, length/2-thickness, -thickness/2])
			cube([width/2, length/2, 2*thickness]);
	}

	difference() {
		difference() {
			difference() {
				block();
				inside();
			}
			gaps();
		}
		bottom_hole();
	}
}

color("orange")
	lamp(200, 80, 60, 6, 25, 8, 1.5);
