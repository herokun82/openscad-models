

module lamp(height, radius, thickness, hole_count, hole_thickness, factor) {

	module ball () {
		scale([1,1,height/(2*radius)])
			sphere(radius, $fn=100);
	}
	module inside () {
		scale([1,1,height/(2*(radius-thickness))])
			sphere(radius-thickness, $fn=100);
	}

	module holes () {
		for (i = [1 : hole_count]) {
			translate([0, 0, (i-1) * (height/(2*hole_count))])
				linear_extrude(thickness)
					circle(radius+2*thickness);
			translate([0, 0, -(i-1) * (height/(2*hole_count))])
				linear_extrude(thickness)
					circle(radius+2*thickness);
		}
	}

	difference() {
		difference() {
			ball();
			inside();
		}
		holes();
	}
}

lamp(
	300, 100, 1,
	24, 1, 5/6
);