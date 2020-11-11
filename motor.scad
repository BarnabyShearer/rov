module motor_f2838(cc=1) {
    if (!$drill) echo("F2838-350KV Underwater Thruster");
    color([.2, .2, .2]) {
        translate([0,0,-5])
            cylinder(d=10, h=5+38.4+5);
        difference() {
            cylinder(d=28.4, h=38.4);
            e() distribute(9, .5, 4)
                cylinder(d=3, h=3.5);
            translate([0, 0, 38.4-3.5])
                e() distribute(9, 0, 2)
                    cylinder(d=3, h=3.5);
        }
    }
    translate([0,0,5+38.4])
        children();
}

module prop_f2838(cc=1) {
    if (!$drill) 
        if (cc) echo("F2838 CCW Propeller");
        else echo("F2838 CW Propeller");
    color([.3,.5,1])
        translate([0,0,-38.4+5]) {
            cylinder(d=30, h=35);
            distribute(14, 0, 3)
                _prop_blade(cc);
        }
    translate([0, 0, 2])
        distribute(9, 0, 2)
            bolt(3, 5);
}

module _prop_blade(cc=1) {
    for (z = [0:40])
        rotate(z*2*(cc-.5))
            translate([0,0,z*.5+5])
                rotate([90,0,0])
                    cube(size = [min(32,z)/2,1,1]);
}