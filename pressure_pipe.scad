include <util.scad>
include <hardware.scad>

PRESSURE_PIPE_COLOR=[.5,.5,.5,show_pipe ? 1 : .2];

module pressure_pipe(d=90, h=100) {
    if (!$drill) echo(str("Pressure Pipe Ø", d, "×", h, "mm"));
    translate([0, 0, h])
        children();
    color(PRESSURE_PIPE_COLOR)
        difference() {
            cylinder(d=d, h=h);
            e() cylinder(d=d-2*4, h=h);
        }
}

module pressure_end(d=90) {
    if (!$drill) echo(str("Pressure Pipe End Ø", d, "mm"));
    translate([0, 0, 8+4])
        children();
    color(PRESSURE_PIPE_COLOR)
        difference() {
            translate([0, 0, 8+4-63])
                cylinder(d=d+2*7.8, h=63);
            translate([0, 0,-70-8])
                cylinder(d=d-2*4, h=70);
            translate([0, 0, -70])
                cylinder(d=d, h=70);
            $drill=true;
            translate([0, 0, 8+4+1])
                e() children();
        }
}

module pressure_flange(d=90, h=48) {
    if (!$drill) echo(str("Pressure Pipe Flange and Ring Ø", d, "mm"));
    translate([0,0,11.25+15.85]) {
        distribute(80, .5, 4)
            bolt(16, h+45, "plastic")
                nut(16, "plastic");
        children();
    }
    color(PRESSURE_PIPE_COLOR)
        difference() {
            $drill=true;
            union() {
                cylinder(d=d+8*2, h=60);
                translate([0,0,11.25])
                    cylinder(d=d+43*2+8*2, h=15.85);
                cylinder(d=d+17*2, h=11.25);
            }
            translate([0, 0, 5])
                e() cylinder(d=d, h=100);
            e() cylinder(d=d-4*2, h=5);
            translate([0,0,11.25+15.85])
                distribute(80, .5, 4)
                    bolt(16, 20);
        }
}

module pressure_flange_gasket(d=90) {
    if (!$drill) echo(str("Pressure Pipe Flange Gasket Ø", d, "mm"));
    translate([0, 0, 3])
        children();
    color([0, 0, 0])
        difference() {
            translate([0,0,e])
                cylinder(d=d+2*18, h=3);
            e() cylinder(d=d, h=3);
        }
}
