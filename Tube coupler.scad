tube_width = 10.5;
tube_height = 20;
available_width = 56.5;
wall_width = 1;
inlet_length = 30;
shell_thickness = 2;
total_width = available_width + (2 * shell_thickness);
total_height = tube_height + (2 * shell_thickness);
feeder_step = tube_width + wall_width;

locator_diameter = 3;

locator = 5;

stack_height = 2 * total_height;
stack_length = 30;

stack_inlet_lap = 2;

module tube_blank() {
    cube([tube_width, inlet_length, tube_height]);
}

module coupler_shell() {
    cube([total_width, inlet_length, total_height]);
    }
   
 module stack_blank() {
     cube([tube_width, stack_length - stack_inlet_lap, stack_height]);
    }
    
module tube_stack_shell(){
    cube([total_width, stack_length, stack_height]);
    }

module tube_stack() {
    difference(){
        translate([- shell_thickness,-stack_length + stack_inlet_lap,- shell_thickness]){
            tube_stack_shell();
        }
        for (a =[1:5]) {
            translate([(feeder_step * a) - feeder_step, -stack_length,0]){
                stack_blank();
            }
        }
        for (a =[1:5]) {
            translate([(feeder_step * a) - feeder_step,-10,0]){
                tube_blank();
            }
        }

    }
}

module coupler(){
    difference(){
        translate([- shell_thickness,0,- shell_thickness]){
            coupler_shell();
        }
        for (a =[1:5]) {
            translate([(feeder_step * a) - feeder_step,0,0]){
                tube_blank();
            }
        }
    }
}

module locators(){
    for (a =[1:5]) {
        translate([(feeder_step * a) - wall_width -(tube_width / 2), locator, 0]) {
            sphere([locator_diameter]);
        }
    }
}


coupler();
tube_stack();
locators();
//difference(){
//    sleeve();
//    translate([-.7,0,1.9]){
//        negative_mold();
//    }
//}

echo(version=version());
