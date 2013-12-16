
$fn=100;

module lamp(width, height, thickness, gap_size) {

	module spiral () {
		linear_extrude(height=height-2*thickness, center=true, convexity=10, twist = 1440)
			square([width+thickness,gap_size], center=true);
	}

	difference() {
		difference() {
			cylinder(height, width/2, width/2, center=true);
			cylinder(height+2*thickness, width/2-thickness, width/2-thickness, center=true);
		}
		spiral();
	}
}

lamp(200, 200, 3, 50);
