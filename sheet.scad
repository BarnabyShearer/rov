SHEET_COLOR_POLYCARBONATE = [1, 1, 1, .2];
SHEET_COLOR_ABS = [.7,.5,.5];
SHEET_COLOR_PVC = [.5,.5,.5];

module sheet(size, material="acrylic") {
    if (!$drill) echo(str(material, " ", size[0], "×", size[1], "×", size[2], "mm"));
    translate([0,0,size[2]])
        children();
    color(material == "polycarbonate" ? SHEET_COLOR_POLYCARBONATE : material == "ABS" ? SHEET_COLOR_ABS: material == "PVC" ? SHEET_COLOR_PVC : [0, 1, 1])
        difference() {
            translate([-size[0]/2, -size[1]/2, 0])
                cube([size[0], size[1], size[2]]);
            $drill=true;
            translate([0,0,size[2]])
                children();
        }
}

module disc(d, h, , material="acrylic") {
    if (!$drill) echo(str(material, " Ø", d, "×", h, "mm"));
    translate([0,0,h])
        children();
    color(material == "polycarbonate" ? SHEET_COLOR_POLYCARBONATE : material == "ABS" ? SHEET_COLOR_ABS: material == "PVC" ? SHEET_COLOR_PVC : [0, 1, 1])
        difference() {
            cylinder(d=d, h=h);
            $drill=true;
            translate([0,0,h])
                children();
        }
}