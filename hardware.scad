include <util.scad>
HARDWARE_COLOR_STAINLESS=[.8, .8, .8];
HARDWARE_COLOR_BRASS=[.6,.6,.3];

module washer(m=3, material="stainless") {
    if(!$drill) echo(str(material, " m", m, " washer"));
    color(material=="stainless" ? HARDWARE_COLOR_STAINLESS : HARDWARE_COLOR_BRASS)
        cylinder(d=1.5+1.77*m, h=.13+m*.184);
    translate([0,0,.13+m*.184])
        children();
}

module nut(m=3, material="stainless") {
    if(!$drill) echo(str(material, " m", m, " nut"));
    color(material=="stainless" ? HARDWARE_COLOR_STAINLESS : HARDWARE_COLOR_BRASS)
        cylinder(d=1.4+1.65*m, h=-.41+m*.95, $fn=6);
    translate([0,0,-.41+m*.95])
        children();
}

module bolt(m=3, h=30, material="stainless") {
    if(!$drill) echo(str(material, " m", m, "×", h, "mm bolt"));
    color(material=="stainless" ? HARDWARE_COLOR_STAINLESS : HARDWARE_COLOR_BRASS) {
        cylinder(d=1.4+1.65*m, h=-.41+m*.95, $fn=6);
        translate([0,0,-h])
            cylinder(d=m, h=h);
    }
    translate([0,0,-h])
        children();
}

module rod(m=3, h=30, material="stainless") {
    if(!$drill) echo(str(material, " m", m, "×", h, "mm rod"));
    color(material=="stainless" ? HARDWARE_COLOR_STAINLESS : HARDWARE_COLOR_BRASS) {
        translate([0,0,-h])
            cylinder(d=m, h=h);
    }
    translate([0,0,-h])
        children();
}

module spade(m=3, material="stainless") {
    if(!$drill) echo(str(material, " m", m, " spade terminal"));
    color(material=="stainless" ? HARDWARE_COLOR_STAINLESS : HARDWARE_COLOR_BRASS) {
        translate([0,0,-2])
            cylinder(d=m, h=3);
        translate([0,0,1.77/2*m])
            rotate([0,-90,0])
                cylinder(d=1.77*m, h=.13+m*.184);
    }
}