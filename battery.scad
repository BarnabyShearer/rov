BATTERY_COLOR=[.5,.2,.8];

module lipo(size=[50, 20, 100], s=4) {
    if(!$drill) echo(str("S", s, " LiPo ", size[0], "×", size[1], "×", size[2], "mm"));
    color(BATTERY_COLOR)
        translate([-size[0]/2, -size[1]/2, 0])
            cube(size);
    children();
}