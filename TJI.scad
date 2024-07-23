include <foundation.scad>


HORIZONTAL_NORTH=0;
HORIZONTAL_WEST=1;
VERTICAL_NORTH=2;
VERTICAL_WEST=3;

module tji_rim_board(length,orientation){
  
  w=1.5;
  h=11+7/8;

  echo("{name='Rim Board 2x11 7/8'",",w=",w,",h=",h,",length=",length/12,"type='engineered lumber'}");
  if( orientation == HORIZONTAL_NORTH ){
    translate([0,0,slab_thk])
      versa_lam()
      cube([length,w,h]);
  }
  if( orientation == HORIZONTAL_WEST ){
    translate([w,0,slab_thk])
      rotate([0,0,90])
      versa_lam()
      cube([length,w,h]);
  }
  if( orientation == VERTICAL_NORTH ){
    translate([0,0,slab_thk+thk])
      rotate([0,-90,0])
      versa_lam()
        cube([length,w,h]);
  }
  if( orientation == VERTICAL_WEST ){
    translate([0,0,slab_thk])
      rotate([0,-90,-90])
      versa_lam()
        cube([length,w,h]);
  }
  
}


module TJI_230(length, orientation){
  web=3/8;
  height=11+7/8;
 
  w=2+5/16;
  h=1+3/8;

  echo("{name='TJI 230 11 7/8'",",w=",w,",h=",height,",length=",length/12,"type='engineered lumber'}");
  
  if( orientation == HORIZONTAL_NORTH ){
    translate([0,0,slab_thk])
    union(){
      cube([length,w,h]);
      translate([0,w/2,0])
        cube([length,web,height]);
      translate([0,0,height-h])
        cube([length,w,h]);
    }
  }
  if( orientation == HORIZONTAL_WEST ){
      translate([w,0,slab_thk])
        rotate([0,0,90])
    union(){
      cube([length,w,h]);
      translate([0,w/2,0])
        cube([length,web,height]);
      translate([0,0,height-h])
        cube([length,w,h]);
    }
  }
}

module TJI_560(length, orientation){
  web=3/8;
  height=11+7/8;
 
  w=2+5/16;
  h=1+3/8;
  echo("{name='TJI 560 11 7/8'",",w=",w,",h=",height,",length=",length/12,"type='engineered lumber'}");
  
  if( orientation == HORIZONTAL_NORTH ){
    translate([0,0,slab_thk])
    union(){
      cube([length,w,h]);
      translate([0,w/2,0])
        cube([length,web,height]);
      translate([0,0,height-h])
        cube([length,w,h]);
    }
  }
  if( orientation == HORIZONTAL_WEST ){
      translate([w,0,slab_thk])
        rotate([0,0,90])
    union(){
      cube([length,w,h]);
      translate([0,w/2,0])
        cube([length,web,height]);
      translate([0,0,height-h])
        cube([length,w,h]);
    }
  }
}


