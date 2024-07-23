
include <framing.scad>

module TaG(orientation,length=ft(12) ) {
  l=length;
  w=5.375;
  t=0.656;

  echo("{name='1x6 x 12ft tongue/groove'",",length=",length/12,"type='tg_board'}");

  if( orientation == HORIZONTAL_NORTH ){
    SE()
      translate([0,0,slab_thk])
      %cube([l,w,t]);
  }
  if( orientation == HORIZONTAL_WEST ){
    SE()
      translate([0,0,slab_thk])
      %cube([w,l,t]);
  }  
}

module CDX(orientation,length=ft(8) ) {

  l=length;
  w=ft(4);
  t=0.5;
  
  echo("{name='4x8 CDX'",",length=",length/12,"type='ply'}");

  if( orientation == VERTICAL_NORTH ){
    SE()
      translate([0,0,slab_thk])
      %cube([l,t,w]);
  }
  if( orientation == VERTICAL_WEST ){
    SE()
      translate([0,0,slab_thk])
      %cube([t,l,w]);
  }
  if( orientation == HORIZONTAL_NORTH ){
    SE()
      translate([0,0,slab_thk])
      %cube([l,w,t]);
  }
  if( orientation == HORIZONTAL_WEST ){
    SE()
      translate([0,0,slab_thk])
      %cube([w,l,t]);
  }

}
module PLY(orientation,length=ft(8) ) {

  l=length;
  w=ft(4);
  t=0.5;
  
  echo("{name='4x8 23/32 in. TandG sub-floor'",",length=",length/12,"type='ply'}");

  if( orientation == VERTICAL_NORTH ){
    SE()
      translate([0,0,slab_thk])
      %cube([l,t,w]);
  }
  if( orientation == VERTICAL_WEST ){
    SE()
      translate([0,0,slab_thk])
      %cube([t,l,w]);
  }
  if( orientation == HORIZONTAL_NORTH ){
    SE()
      translate([0,0,slab_thk])
      %cube([l,w,t]);
  }
  if( orientation == HORIZONTAL_WEST ){
    SE()
      translate([0,0,slab_thk])
      %cube([w,l,t]);
  }
}

module upstairs_floor() {

  translate([0,0,ft(8)+11+7/8])
    PLY(HORIZONTAL_WEST,ft(8)-5);

  translate([0,ft(8)-5,ft(8)+11+7/8])
    PLY(HORIZONTAL_WEST);

  translate([0,ft(16)-5,ft(8)+11+7/8])
    PLY(HORIZONTAL_WEST,ft(2)); 
  /*---------------------*/
  translate([ft(4),ft(10)+4,ft(8)+11+7/8])
    PLY(HORIZONTAL_WEST,ft(8)-6);

  translate([ft(4),ft(2)+4,ft(8)+11+7/8])
    PLY(HORIZONTAL_WEST);

  translate([ft(4),0,ft(8)+11+7/8])
    PLY(HORIZONTAL_WEST,ft(2)+6);
  /*---------------------*/
  translate([ft(8),0,ft(8)+11+7/8])
    PLY(HORIZONTAL_WEST,ft(8)-5);

  translate([ft(8),ft(8)-5,ft(8)+11+7/8])
    PLY(HORIZONTAL_WEST);

  translate([ft(8),ft(16)-5,ft(8)+11+7/8])
    PLY(HORIZONTAL_WEST,ft(2));

}
// upstairs_floor();
module roof_sheathing(){
  diff=.132;
  
  for(i=[0:ft(4):ft(24)]){
    translate([-ft(2)+i,ft(-2),ft(18.75)-i*diff])
      rotate([0,main_roof_pitch,0])
      CDX(HORIZONTAL_WEST);
    translate([-ft(2)+i,ft(6),ft(18.75)-i*diff])
      rotate([0,main_roof_pitch,0])
      CDX(HORIZONTAL_WEST);
    translate([-ft(2)+i,ft(14),ft(18.75)-i*diff])
      rotate([0,main_roof_pitch,0])
      CDX(HORIZONTAL_WEST,ft(6));
  }
}
// roof_sheathing();
module EW_wall_sheathing(){
  for(j=[0:ft(4):ft(12)]){
    for(i=[0:ft(8):ft(20)]){
      translate([i,0,j])
        CDX(VERTICAL_NORTH);
    }
  }
  for(j=[0:ft(4):ft(12)]){
    for(i=[0:ft(8):ft(20)]){
      translate([i,ft(18),j])
        CDX(VERTICAL_NORTH);
    }
  }
}
//EW_wall_sheathing();
module S_wall_sheathing(){
  for(j=[0:ft(4):ft(12)]){
    for(i=[0:ft(8):ft(24)]){
      translate([0,i,j])
        CDX(VERTICAL_WEST);
    }
  }
}
//S_wall_sheathing();
module N_wall_sheathing(){
  for(j=[0:ft(4):ft(12)]){
    for(i=[0:ft(8):ft(12)]){
      translate([ft(24),i,j])
        CDX(VERTICAL_WEST);
    }
  }
}
// N_wall_sheathing();
module N_Guest_wall_sheathing(){
  for(j=[0:ft(4):ft(10)]){
    for(i=[0:ft(8):ft(8)]){
      translate([ft(9),i+ft(18),j])
        CDX(VERTICAL_WEST);
    }
  }
}
//N_Guest_wall_sheathing();
module W_Guest_wall_sheathing(){
  for(j=[0:ft(4):ft(10)]){
    for(i=[0:ft(8):ft(8)]){
      translate([0,ft(28)+2,j])
        CDX(VERTICAL_NORTH);
    }
  }
}
module porch_door_roof(){
  diff=0.1;
  for(i=[0:ft(12):ft(16)]){
    for(j=[0:5.375:ft(6)]){
      translate([-5.375-j,i,ft(10)-j*diff])
        rotate([0,-porch_roof_pitch,0])
        TaG(HORIZONTAL_WEST);
    }
  }
}
module garage_tg_roof(){
  diff=0.063;
  for(j=[0:ft(12):ft(24)]){
    for(i=[0:5.375:ft(12)]){
      SW()
        translate([j-ft(1),i,ft(12)-i*diff+2])
        rotate([-porch_roof_pitch,0,0])
        TaG(HORIZONTAL_NORTH);
    }
  }
}

