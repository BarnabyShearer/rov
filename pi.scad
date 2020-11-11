PCB_COLOR=[.1,.5,.1];
COMPONENT_COLOR=[.9,.9,.9];

module pi_hd_camera() {
    if(!$drill) echo("HD Pi-camera");
    color(PCB_COLOR)
        translate([-19,-19,18.4-1.6])
            cube([38,38,1.6]);
    color([0, 0, 0])
        cylinder(d=36, h=18.4-1.6);
    translate([0,0,20])
        children();
}

module pi1(){
    if(!$drill) echo("PI 1");
    translate([-54/2,0,0])
        rotate([0, 0, 270]) {
            color([.1,.5,.1])
                cube([81.9, 54, 1.8]);
            color(COMPONENT_COLOR) {
                translate([12.2,6.2,1.8])
                    cylinder(r=3.4, h=10.1);
                translate([-3.9,2.2,1.8])
                    cube([7.8, 7.6, 2.9]);
                translate([37.1,-2.1,1.8])
                    cube([12.4, 12, 4.6]);
                translate([63.9,2.2,1.8])
                    cube([20.9, 15, 12]);
                translate([73.2,25.1,1.8])
                    cube([14.7, 12, 9.9]);
                translate([55.3,0,1.8])
                    cube([4.4, 22, 5]);
                translate([7.9,16.9,1.8])
                    cube([4.4, 22, 5]);
                translate([1.4,48.4,1.8])
                    cube([31.2, 4.8, 2.4]);
                translate([2.1,49.1,1.8])
                    cube([29.8, 3.4, 6]);
                rotate([270,0,0]) {
                    translate([56.2, -8.5, 44.1]) {
                        cube([13,7.5,12]);
                        translate([6.5,3.5,12])
                            cylinder(r=3, h=4);
                    }
                    translate([39.6,-11.5,43.8]) {
                        cube([10,10.5,10.2]);
                        translate([5,5,10.2])
                            cylinder(r=3.95, h=8);
                    }
                }
            }
        }
    translate([-17,-85, 8])
        rotate([90, 0, 0])
            children();
}

module c_mount_lense(h) {
    if(!$drill) echo(h, "mm long C Mount lense");
    color([0, 0, 0])
        cylinder(d=30, h=h);
    translate([0,0,h]) 
        children();
}