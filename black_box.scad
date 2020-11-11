module black_box_media_converter() {
    if(!$drill) echo("Black Box Gigabit Media Converter");
    color([.8,.8,.8])
        translate([-13, -23/2, 0])
            cube([75, 23, 102]);
    rotate([180,0,0])
        translate([40, 0, 0])
            children();
}

module sfp() {
    if(!$drill) echo("SFP Transceiver");
    color([.8,.8,.8])
        translate([0, -8.6/2, -55+13.8])
            cube([13.5, 8.6, 55]);
    translate([13.5/2-4, 0, 5])
        children();
}