
function in(d) = 25.4 * d;

J_BOLT_DIA=in(1/2);

LUMBER_W=1.5;
LUMBER_H=5.5;

module j_bolt(){

  dia=J_BOLT_DIA;
  
  color([1,0,0])
    translate([0,0,-in(01.5)])
    cylinder(d=dia, h=in(12));
  translate([0,0,in(9.5)])
  color([1,0,0])
    cylinder(d=in(2), h=in(0.125));
  translate([0,0,in(9.9)])
    color([1,0,0])
    cube([in(1),in(1),in(0.5)],center=true);
}


translate([0,0,in(-LUMBER_H)])
cube([in(LUMBER_W),in(24),in(LUMBER_H)]);

color([0,1,0])
translate([in(LUMBER_W),0,in(0)])
# cube([in(LUMBER_H),in(24),in(LUMBER_W)]);


cube([in(6),in(2),in(1/4)]);

translate([in(LUMBER_W)+in(LUMBER_H/2),in(1),in(-8)])
j_bolt();

