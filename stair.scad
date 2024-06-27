
include <foundation.scad>

module stringer(run,steps) {
  tread_width = 10.5;
  tread_rise = 7;
  stringer_angle = 33.7;

  rotate([0,stringer_angle,0])
    difference(){
      difference(){
        difference(){
          cube([run,1.5,12]);
          translate([0,-3,0])
            rotate([0,-stringer_angle,0])
            cube([tread_width+12,6,tread_width+3]);
        }
        translate([-1,-2,0])
          rotate([0,90-stringer_angle,0])
          cube([tread_rise,6,tread_width]);
      }
      for(i = [1:1:steps])
        translate([22+(i-1)*12.5,-2,6])              
          rotate([0,-stringer_angle,0])
          union(){
          cube([tread_width,6,tread_width+3]);
          cube([tread_width,6,tread_rise]);
        }
    }
}


module stairs() {

  translate([ft(9.25),5.5,slab_thk+ft(8.75)])
    stringer(ft(13.5),12);
  translate([ft(9.25),5.5+ft(3)-3.5,slab_thk+ft(8.75)])
    stringer(ft(13.5),12);
  
  
  NE()
    translate([-5.5,-5.5+ft(2)+1.5,ft(2)+1.5])
    rotate([0,0,90])
    stringer(ft(4),3);
  
  NE()
    translate([-4-ft(3),-5.5+ft(2)+1.5,ft(2)+1.5])
    rotate([0,0,90])
    stringer(ft(4),3);
  
  
  NE()
    translate([-ft(3)-5.5,5.5,ft(2)+1.5])
    cube([ft(3),ft(3),0.75]);

  
}
