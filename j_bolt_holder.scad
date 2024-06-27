
$fn=60;

function in(d) = 25.4 * d;

J_BOLT_DIA=in(1/2)+1;

LUMBER_W=1.5;
LUMBER_H=5.5;

8_PENNY_SHANK=0.134;

L=4.8;
T=0.25;
W=1.5;

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

module nail() {
  cylinder(r=in(8_PENNY_SHANK/2),h=in(2.5));
}
/*
translate([0,0,in(-LUMBER_H)])
color([.5,0,.3])
cube([in(LUMBER_W),in(24),in(LUMBER_H)]);

color([0,1,0])
translate([in(LUMBER_W),0,in(0)])
# cube([in(LUMBER_H),in(24),in(LUMBER_W)]);
*/
/* holder */
difference(){
  difference(){
    difference(){
      union(){
        hull(){
          translate([J_BOLT_DIA,J_BOLT_DIA,0])
            cylinder(r=J_BOLT_DIA,h=in(T));
          translate([J_BOLT_DIA,in(W)-J_BOLT_DIA,0])
            cylinder(r=J_BOLT_DIA,h=in(T));
          translate([in(L)-J_BOLT_DIA,J_BOLT_DIA,0])
            cylinder(r=J_BOLT_DIA,h=in(T));
          translate([in(L)-J_BOLT_DIA,in(W)-J_BOLT_DIA,0])
            cylinder(r=J_BOLT_DIA,h=in(T));
        }
        translate([in(LUMBER_W)+in(LUMBER_H/2),in(W/2),0]){
          cylinder(r=J_BOLT_DIA,h=in(LUMBER_W));
        }
        translate([in(1.5),in(W/2)-in(T/2),0]){
          difference(){
            cube([in(2.5),in(T),in(LUMBER_W)]);
            translate([0,-1,0])
              rotate([0,-30,0])
              cube([in(6),in(W),in(6)]);
          }
        }
      }
    translate([in(3.325),0,in(2.3*T)])
      rotate([-90,0,0])
      cylinder(r=in(T),h=100);
    }
    translate([in(LUMBER_W)+in(LUMBER_H/2),in(W/2),in(-8)])
      j_bolt();
  }
  union(){
    translate([in(LUMBER_W/2)-8,in(LUMBER_W/2)-8,-25])
      nail();
    translate([in(LUMBER_W/2)+8,in(LUMBER_W/2)+12,-25])
      nail();
  }
}

