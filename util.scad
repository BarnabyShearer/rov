e=$preview ? .001 : 0;
$drill=false;
$fs = .1;

module e() {
    translate([0,0,-e])
        scale(1+e)
            children();
}

module distribute(d=100, offset=0, repeat=1) {
    for(i=[0:$children*repeat-1])
        rotate((i+offset)*360/($children*repeat))
            translate([d, 0, 0])
                children(i%$children);
}

module line(d=100, repeat=1) {
    for(i=[0:$children*repeat-1])
        translate([0, i*2*d/($children*repeat-1)-d, 0])
            children(i%$children);
}
