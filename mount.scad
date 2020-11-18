include <util.scad>

if(layout) mount_2d();

module mount_2d(d=90) {
    difference() {
        width=7;
        offset(r=-width) {
            circle(d=d+34+2*width);
            distribute(d/2+68/2+8, 0, 4)
                union() {
                    circle(d=25+2*width);
                    translate([-30,-25/2])
                        square([30, 25]);
                }
        }

        circle(d=124-10);
        distribute(d/2+68/2+8, 0, 4)
            union() {
                drill();
                distribute(9, 0, 4)
                    drill();
                translate([-(d/2+68/2+8)+126/2+3/2, 0 ,0])
                    drill();
            }
    }
}

module mount(d=90) {
    translate([0,0,3])
        distribute(d/2+68/2+8) {
            children(0);
            children(1);
            children(2);
            children(3);
        }
    intersection() {
        sheet([200, 200, 12], "PVC");
        e() color(SHEET_COLOR_PVC) linear_extrude(height=3)
            mount_2d(d);
    }
}