include <util.scad>
include <sheet.scad>

if(layout) window_2d();

module window_2d(d=90) {
    fixing_d=50;
    difference() {
        hull() {
            circle(d=d+36);
            distribute(3/2+fixing_d/2,0,4)
                circle(d=126-fixing_d);
        }
        distribute((d+36)/2+3/2, 0, 4)
            drill(3);
    }
}

module window(d=90) {
    translate([0,0,12])
        children();
    intersection() {
        sheet([130, 130, 12], "polycarbonate");
        e() color(SHEET_COLOR_POLYCARBONATE) linear_extrude(height=12)
            window_2d(d);
    }
}