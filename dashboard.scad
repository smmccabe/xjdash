module frame() {
    difference() {
        cube([340, 110, 60]);
        translate([2, 2, 1]) {
            cube([336, 106, 60]);
        }
    }

    translate([-5, -5, 56]) {
        difference() {
            cube([350, 120, 4]);
            translate([7, 7, -1]) {
                cube([336, 106, 6]);
            }
            translate([175,0,0])
                rotate([-38,0,0])
                    cube([352,8,6.4], center=true);
            translate([175,120,0])
                rotate([38,0,0])
                    cube([352,8,6.4], center=true);
            translate([0,120,0])
                rotate([0,38,0])
                    cube([8,400,6.4], center=true);
            translate([350,120,0])
                rotate([0,-38,0])
                    cube([8,400,6.4], center=true);
        }
    }
    
    translate([-7, -5, 60]) {
        cube([352, 2, 22]);
    }
    
    translate([-7, -10, 77]) {
        difference() {
            cube([352, 7, 7]);
            rotate([45, 0, 0])
                cube([800, 7.1, 7.1], center=true);
        }
    }
   
    translate([103, 26, 0])
        cube([24,9,7]);
}

module topmount(one, two) {  
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

module botmount() {
    translate([0,-15.5,6]) {
        rotate(a=25, v=[1,0,0]) {
            difference() {
                cube([18,18,3]);
                translate([9,9,-1]) {
                    cylinder(h=5, r=2.5);
                }
            }
        }
    }
    rotate(a=10, v=[1,0,0]) {
        cube([18,3,14]);
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
                cylinder(h=6, r=7);
            }
            cube([10,10,4]);
        }
        rotate(a=-27, v=[0,0,1]) {
            translate([-5,0,-1]) {    
                cube([5,15,6]);
            }
        }
        translate([10,0,-1]) {  
            rotate(a=27, v=[0,0,1]) {
                cube([5,15,6]);
            }
        }
        translate([0,8,-1]) {
            cube([10,4,6]);
        }
    }
    
    $fn=60;
    translate([5,7.7,0]) {
        cylinder(h=4, r=.96);
    }
}

module lightmount (radius) {
    $fn=100;
    
    rotate([0,0,45])
    difference() {
        union() {
            cylinder(h=4, r=radius*.75);
            translate([0,0,2]) {
                cube([radius*2,6.5,4], center=true);
            }
        }
        translate([0,0,-1]) {
            difference() {
                cylinder(h=6, r=radius+2);
                translate([0, 0, -1]) {
                    cylinder(h=8, r=radius);
                }
            }    
        }
    }
}

module plug () {
    rotate(a=75, v=[0,0,1]) {
        rotate(a=180, v=[1,0,0]) {
            difference() {
                union() {
                    translate([-2,1.5,-2]) {
                        cube([71,14,12]);
                    }
                    translate([1,3.5,-2]) {
                        cube([65,10,14]);
                    }
                    translate([1,2.5,0]) {
                        cube([3,12,12]);
                    }
                    translate([2,0,0]) {
                        cube([63,17,12]);   
                    }
                }
                rotate(a=5, v=[1,0,0]) {
                    translate([0,-2,-1]) {
                        cube([69, 3, 11]);
                    }
                }
                rotate(a=-5, v=[1,0,0]) {
                    translate([0,16,.5]) {
                        cube([69, 3, 11]);
                    }
                }
            }
            translate([4, -2, -2])
                cube([3, 21, 14]);
            translate([60, -3, -2])
                cube([3, 23, 14]);
        }
    }
}

module notch(rotate = 0) {
    hull() {
        cylinder(h=3, r=4);
        translate([10, 0, 0]) {
            cylinder(h=3, r=4);
        }
    }
}

module hook(angle) {
    rotate([0, 0, angle]) {
        difference() {
            union() {
                hull() {
                    cylinder(h=2, r=4);
                    translate([12, 0, 0]) {
                        cylinder(h=2, r=4);
                    }
                }
                translate([0,0,-18]) {
                    cylinder(h=18, r=4);
                }
                translate([10, 0, 0]) {
                    cylinder(h=7, r=2);
                }
                translate([0,0,-18])
                    sphere(4);
                translate([0,0,-18])
                    rotate([90+angle,0,0])
                        cylinder(h=4, r=4);
                translate([12,0,0])
                    difference() {
                        sphere(4);
                        translate([-4, -4, 0])
                            cube([8,8,4]);
                    }
                rotate([0,90,0])
                    difference() {
                        cylinder(h=12, r=4);
                        translate([-4, -4, -1])
                            cube([4,8,14]);
                    }
            }
            translate([0,0,-16]) {
                cylinder(h=20, r=1.5);
            }
        }
    }
}

difference() {
    union() {
        frame();
        translate([156,13,0]) {
            rotate(a=75, v=[0,0,1]) {
                cube([69,23,17]);
            }
        }
        translate([68,95,0])
            difference() {
                cylinder(h=60, r=11.5);
                cylinder(h=101, r=9.5);
            }
        translate([170,95,0])
            difference() {
                cylinder(h=60, r=11.5);
                cylinder(h=101, r=9.5);
            }
        translate([272,95,0])
            difference() {
                cylinder(h=60, r=11.5);
                cylinder(h=101, r=9.5);
            }
        // Ribs    
        translate([35,0,0,])
            cube([5, 110, 5]);
        translate([85,0,0,])
            cube([5, 110, 5]);
        translate([125,0,0,])
            cube([5, 110, 5]);
        translate([125,0,0,])
            cube([5, 110, 5]);  
        translate([182,0,0,])
            cube([5, 110, 5]);  
        translate([245,0,0,])
            cube([5, 110, 5]);
        translate([305,0,0,])
            cube([5, 110, 5]);
        // Supports
        translate([65,105,0])
            cube([5, 5, 60]);
        translate([167,105,0])
            cube([5, 5, 60]);
        translate([270,105,0])
            cube([5, 5, 60]);    
    }
    translate([137, 20, 11]) {
        plug();
    }
    translate([325,50,-1]) {
        lightmount(9);
    }
    translate([272,95,-1]) {
        lightmount(9);
    }
    translate([275,67,-1]) {
        lightmount(9);
    }
    translate([275,18,-1]) {
        lightmount(9);
    }
    translate([198,89,-1]) {
        lightmount(9);
    }
    translate([170,13,-1]) {
        lightmount(9);
    }
    translate([170,95,-1]) {
        lightmount(9);
    }
    translate([145,95,-1]) {
        lightmount(9);
    }
    translate([68,95,-1]) {
        lightmount(9);
    }
    translate([64,17,-1]) {
        lightmount(9);
    }
    translate([64,67,-1]) {
        lightmount(9);
    }
    translate([13,48,-1]) {
        lightmount(9);
    }
    translate([18, 111.9, 57.5]) {
        notch();
    }
    translate([313, 111.9, 57.5]) {
        notch();
    }
    translate([80,-8, 81]) {
        cylinder(h=4, r=4);
    }
    translate([270,-8, 81]) {
        cylinder(h=4, r=4);
    }
    // Resistor Notch
    translate([105, 28, -1])
        cube([20,5,5]);
    // Speedo Notch
    translate([225,52,-1])
        cylinder(h=5, r=12.5);
}

translate([29, 112, 56]) {
    hook(180);
}
translate([312, 112, 56]) {
    hook(0);
}

module bothook() {
    difference() {
        union() {
            cylinder(h=16, r=4);
            translate([-4, 0, 0])
                cube([8,4,16]);
            translate([-6, -2, 14])
                difference() {
                    cube([12, 6, 2]);
                    translate([2,-1,0])
                        rotate([0,-135,0])
                            cube([6,8,4]);
                    translate([10,-1,0])
                        rotate([0,45,0])
                            cube([6,8,4]);
                }
            sphere(4);
            translate([0, 4, 0])
                rotate([90,0,0])
                    cylinder(h=4, r=4);
        }
        translate([0,0,2]) {
            cylinder(h=15, r=1.5);
        }
    }
}

$fn=60;
translate([80,-8,66]) {
    bothook();
}

translate([270,-8,66]) {
    bothook();
}

//Top Mounts
translate([73, 112, 60]) {
    topmount(2.5, 2);
}
translate([240, 112, 60]) {
    topmount(2, 2.5);
}

//Bottom Mounts
translate([34,-9,83]) {
    botmount();
}
translate([301,-9,83]) {
    botmount();
}

module highbeam() {
    difference() {
        union() {
            cube([6, 1, 5]);
            translate([0, 2, 0])
                cube([6, 1, 5]);
            translate([0, 4, 0])
                cube([6, 1, 5]);
            translate([0, 6, 0])
                cube([6, 1, 5]);
            translate([0, 8, 0])
                cube([6, 1, 5]);
        }
        translate([20, 4.5, -1])
            cylinder(r=15, h=7);
    }
    translate([21, 4.5, 0]) {
        hull() {
            difference() {
                cylinder(r=15, h=5);
                rotate([0, 0, 15])
                    translate([-15, -40.5, -1])
                        cube([40,40,7]);
                rotate([0, 0, -15])
                    translate([-15, 0.5, -1])
                        cube([40,40,7]);
                translate([-12,-10,-1])
                    cube([20,20,7]);
            }
            translate([-12, 0, 0]) {
                difference() {
                    cylinder(r=3.5, h=5);
                    translate([-5,-5, -1])
                        cube([5,10,7]);
                }
            }
        }
    }
}

// Top Plate Sides
module topside() {
    difference() {
        cube([3, 50, 26]);
        translate([-1, 0, 27])
            rotate([-26, 0, 0])
                cube([5, 100, 100]);
    }
}

// Top Plate
translate([-2,200,60]) {
    difference() {
        cube([345,115,3]);
        translate([21, 112, -1])
            cylinder(h=6, r=2.2);
        translate([31, 112, -1])
            cylinder(h=6, r=1.5);
        translate([324, 112, -1])
            cylinder(h=6, r=2.2);
        translate([314, 112, -1])
            cylinder(h=6, r=1.5);
        translate([74,109,-1])
            cube([31,10,5]);
        translate([244,109,-1])
            cube([31,10,5]);
        translate([74, 90, -1])
            rotate([0, 0, 90])
                turn();
        translate([167, 90, -1])
            highbeam();
        translate([271, 100, -1])
            rotate([0, 0, -90])
                turn();
        // Speedo        
        translate([223, 52, -1])
            cylinder(h=5, r=54.5);
        // Controller    
        translate([310, 75, -1])
            cylinder(h=5, r=26);
        // Amps    
        translate([35, 70, -1])
            cylinder(h=5, r=27);    
    }
    // Lip
    cube([345,4,3]);
    // Sides
    topside();
    translate([342, 0, 0])
        topside();
    
    cube([345, 2, 25]);
    translate([0, -10, 24])
        difference() {
            union() {
                cube([345, 12, 2]);
                translate([82, 2, -2])
                    cylinder(h=4, r=3.75);
                translate([272, 2, -2])
                    cylinder(h=4, r=3.75);
            }
            translate([82, 2, -1])
                cylinder(h=5, r=1.5);
            translate([272, 2, -1])
                cylinder(h=5, r=1.5);
            translate([39, -5, -1])
                cube([20, 10, 4]);
            translate([302, -5, -1])
                cube([20, 10, 4]);
        }
}