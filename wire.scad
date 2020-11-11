function _add(list, c = 0) = c < len(list) - 1 ? list[c] + _add(list, c + 1) : list[c];

WIRE_COLOR=[.3,.5,1];
FIBER_COLOR=[1,1,.1];

module wire(h=[100], r=[[0,0]], d=1, type="wire") {
    if(!$drill) echo(str(_add(h), "mm ", type));
    _wire(h, r, d, 0, type)
        children();
}

module cat6(h=[100], r=[[0,0]], d=3) {
    if(!$drill) echo(str(_add(h), "mm Cat-6"));
    rj45()
       _wire(h, r, d)
            rj45_end()
                children();
}

module _wire(h=[100], r=[[0,0]], d=1, c = 0, type="wire") {
    rotate(r[c]) {
        color(type=="fiber" ? FIBER_COLOR : WIRE_COLOR)
            cylinder(d=d, h=h[c]);
        translate([0,0,h[c]])
            if(c<len(h)-1)
                _wire(h, r, d, c+1, type)
                    children();
            else
                children();
    }
}

module rj45() {
    color([.9,.9,.9,.5])
        translate([-12/2, -8/2, -10])
            cube([12,8,22]);
    translate([0, 0, 12])
        children();
}

module rj45_end() {
    color([.9,.9,.9,.5])
        translate([-12/2, -8/2, 0])
            cube([12,8,22]);
    translate([0, 0, 12])
        children();
}