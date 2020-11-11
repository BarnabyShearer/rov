include <util.scad>

PIPE_COLOR=[.75,.75,.75,show_pipe ? 1 : .2];

module pipe(d=90, h=100) {
    if (!$drill) echo(str("Pipe Ø", d, "×", h, "mm"));
    translate([0, 0, h])
        children();
    color(PRESSURE_PIPE_COLOR)
        difference() {
            cylinder(d=d, h=h);
            e() cylinder(d=d-2*1, h=h);
        }
}