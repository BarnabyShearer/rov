include <util.scad>

CAMLOCK_COLOR = [.95,.95,.95, show_pipe ? 1 : .2];

module camlock_f75() {
    if(!$drill) echo("Camlock ¾\" Type-F");
    translate([0,0,40])
        children();
    color(CAMLOCK_COLOR)
        difference() {
            union() {
                translate([0, 0, -18.75])
                    cylinder(d1=25.4, d2=27, h=18.75);
                cylinder(d=34.5, h=13.5, $fn=8);
                translate([0, 0, 13.5])
                    cylinder(d=32, h=27);
            }
            if(!$drill)
                translate([0, 0, -18.75])
                    e() cylinder(d2=21, d1=17.4, h=60);
        }
}

module camlock_c75() {
    if(!$drill) echo("Camlock ¾\" Type-C");
    translate([0,0,10])
        children();
    color(CAMLOCK_COLOR) {
        difference() {
            translate([0,0,-25]) {
                cylinder(d=40, h=34);
                cylinder(d=18.8, h=80);
            }
            translate([0,0,-25-e])
                e() cylinder(d=32.5, h=25+2);
            e() cylinder(d=20, h=3);
            e() cylinder(d=13.3, h=100);
        }
        translate([0,0,-10])
            distribute(22) {
                cylinder(d=5, h=40);
                cylinder(d=5, h=40);
            }
    }
}