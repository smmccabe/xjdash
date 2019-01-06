module frame() {
    difference() {
        cube([340, 110, 60]);
        translate([2, 2, 2]) {
            cube([336, 106, 60]);
        }
    }

    translate([-5, -5, 58]) {
        difference() {
            cube([350, 120, 2]);
            translate([7, 7, -1]) {
                cube([336, 106, 4]);
            }
        }
    }
    
    translate([-7, -5, 60]) {
        cube([352, 2, 22]);
    }
    
    translate([-7, -10, 82]) {
        cube([352, 7, 2]);
    }
    
    translate([-7, -5, 58]) {
        difference() {
            cube([2, 119, 72]);
            translate([-1,-1,27]) {
                rotate(a=20.5, v=[1,0,0]) {
                    cube([4, 150, 100]);
                }
            }
        }
    }
    
    translate([-90, -8, 82]) {
        rotate(a=20.5, v=[1,0,0]) {
            cube([85, 130, 2]);
        }
    }
}

module topmount(flip) {
    one=2.5;
    two=2;
    if(flip) {
        one=2;
        two=2.5;
    }
    
    cube([28, 3, 14]);
    translate([0,2.12,11.88]) {
        rotate(a=45, v=[1,0,0]) {
            difference() {
                cube([28, 14, 3]);
                translate([9, 7, -1]) {
                    $fn=30;
                    cylinder(h=5, r=one);
                }
                translate([19, 7, -1]) {
                    $fn=20;
                    cylinder(h=5, r=two);
                }
            }
        }
    }
    support();
    translate([26, 0, 0]) {
        support();
    }
}

module support() {
    difference() {
        translate([0,-3.5,0]) {
            rotate(a=-22.5, v=[1, 0, 0]) {
                cube([2, 6, 26.05]);
            }
        }
        translate([-1,-5,-5]) {
            cube([10,10,5]);
        }
        translate([-1, 0, 14]) {
            rotate(a=45, v=[1,0,0]) {
                cube([5,20,10]);
            }
        }
    }    
}

module turn() {
    difference() {
        union() {
            translate([5,4.9,0]) {
                cylinder(h=2, r=7);
            }
            cube([10,10,2]);
        }
        rotate(a=-27, v=[0,0,1]) {
            translate([-5,0,-1]) {    
                cube([5,15,4]);
            }
        }
        translate([10,0,-1]) {  
            rotate(a=27, v=[0,0,1]) {
                cube([5,15,4]);
            }
        }
        translate([0,8,-1]) {
            cube([10,4,4]);
        }
    }
    
    $fn=60;
    translate([5,7.7,0]) {
        cylinder(h=2, r=.96);
    }
}

frame();
translate([73, 112, 60]) {
    topmount();
}
translate([243, 112, 60]) {
    topmount(true);
}