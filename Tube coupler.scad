tube_width = 10.5;
tube_height = 20;
available_width = 56.5;
wall_width = 1;
inlet_length = 40;
shell_thickness = 2;
total_width = available_width + (2 * shell_thickness);
total_height = tube_height + (2 * shell_thickness);
feeder_step = tube_width + wall_width;
module tube_blank() {
    cube([tube_width, inlet_length, tube_height]);
}

module coupler() {
    cube([total_width, inlet_length, total_height]);
    }

rotate([0,0,0]) difference(){
    translate([- shell_thickness,0,- shell_thickness]){
        coupler();
    }
    for (a =[1:5]) {
        translate([(feeder_step * a) - feeder_step,0,0]){
            tube_blank();
        }
    }
}


//difference(){
//    sleeve();
//    translate([-.7,0,1.9]){
//        negative_mold();
//    }
//}

echo(version=version());
