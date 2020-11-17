show_pipe = true;
show_tether = true;
pipe_length = 180;

include <util.scad>
include <camlock.scad>
include <motor.scad>
include <pipe.scad>
include <pressure_pipe.scad>
include <sheet.scad>
include <wire.scad>
include <pi.scad>
include <black_box.scad>
include <battery.scad>

disc(130, 12, "polycarbonate") {
    c_mount_lense(50)
        pi_hd_camera() {
            translate([0, -22, 0])
                lipo();
            translate([0, 18, 0])
                rotate([-90,0,0])
                    pi1()
                        cat6([22, 22, 5], [[0, 0, -20],[90, 0, 0],[90, 20, 0]])
                            black_box_media_converter()
                                sfp()
                                    if(show_tether)
                                        wire([20, 18, 100000-18-20],[[0,0,10],[0,-90,0],[0,90,0]],1,"fiber");
        }
    distribute(30, 0, 6)
        led();
    pressure_flange_gasket(90)
        pressure_flange(90, 12) {
            pressure_pipe(90, pipe_length)
                end_potting(5)
                    pressure_end(90) {
                        camlock_f75()
                            if(show_tether)
                                camlock_c75() {
                                    hose();
                                    camlock_potting();
                                }
                        distribute(30, -.2, 4)
                            distribute(6, 0, 3)
                                busbar();
                    }
            distribute(90/2+68/2+8, 0, 2) {
                shroud()
                    motor_f2838()
                        prop_f2838(0);
                shroud()
                    motor_f2838()
                        prop_f2838(1);
            }
        }
}

module shroud() {
    translate([-12.5, 0, e])
        sheet([45, 20, 3], "PVC")
            translate([12.5, 0, 0]) {
                translate([0, 0, -3])
                    rotate([180,0,0])
                        distribute(9, .5, 4)
                            bolt(3, 6);
                children();
                line(5) {
                    wire([39, pipe_length+15.3, 22], [[0,-90, 20],[0, 90, 0],[0, -90, -30]])
                        spade(3, "brass");
                    wire([40, pipe_length+15.3, 13], [[0,-90, 25],[0, 90, 0],[0, -90, -45]])
                        spade(3, "brass");
                    wire([41, pipe_length+15.3, 22], [[0,-90, 30],[0, 90, 0],[0, -90, -58]])
                        spade(3, "brass");
                }
                translate([-22,0,0])
                    bolt(3, 32.5)
                        nut()
                            washer();
            }
    pipe(68, 55);
}

module hose(h=150) {
    if(!$drill) echo(str(h, "mm Hose"));
    color([.5, .9, .5])
        difference() {
            cylinder(d=25, h=h);
            e() cylinder(d=18.8, h=h);
        }
}

module end_potting(h=5) {
    if(!$drill) echo(str(PI * pow(90/2,2) * 5/1000 + PI * pow((90-2*4)/2,2) * 8/1000, "ml hard potting"));
    color([.2, .5, .5, .5]) {
        cylinder(d=90, h=5);
        cylinder(d=90-2*4, h=5+8);
    }
    translate([0,0,5])
        children();
}

module camlock_potting(h=150) {
    if(!$drill) echo(str(PI * pow(13.5/2,2) * 45/1000, "ml hard potting"));
    if(!$drill) echo(str(PI * pow(18.8/2,2) * (h-45)/1000, "ml soft potting"));
    color([.2, .5, .5, .5]) {
        cylinder(d=13.5, h=45);
        translate([0, 0, 45])
            cylinder(d=18.8, h=h-45);
    }
}

module busbar(m=3, h=26) {
    washer(m, "brass")
        translate([0,0,.6])
            washer(m, "brass")
                nut(m, "brass")
                    rod(m, h, "brass")
                        nut(m, "brass")
                            washer(m, "brass")
                                translate([0,0,.6])
                                    washer(m, "brass");
}

module led() {
    if(!$drill) echo("LED");
    color([1,1,1])
        translate([0,-5,0])
            cube([10, 10, 10]);
}