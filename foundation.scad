
function ft(d) = 12.0*d ;

// Southeast is 0,0,0
slab_north = ft(23)+9+0.25;
slab_west = ft(18)+0.25;
slab_thk = 4;

g_slab_north = ft(8)+9+0.25;
g_slab_west = ft(10)+1+.75;

d_slab_north = ft(18)+10+.5;
d_slab_west = ft(10)+7+0.75;

p_slab_north = ft(6)+1+0.5;
p_slab_west = ft(18)+0.25;

dr_slab_north = ft(6)+1+0.5;
dr_slab_west = ft(5)+7+0.5;

ex_footer_width=ft(1)+6;

toe_down_width=8;

MAIN_SLAB=[slab_north,slab_west,slab_thk];

module concrete(){
  color([0.5,0.5,0.5]) children();
}
module black_steel(){
   color([0,0,0]) children();
}

module APVB66() {
  black_steel()
    union(){
    cube([5,5.5,0.75]);
    difference(){
      union() {
        cube([5,0.125,6]);
        translate([0,5.5,0])
          cube([5,0.125,6]);
      }
      union(){
        translate([1.0,-3,4.5])
          rotate([-90,0,0])
          cylinder(d=0.75,h=10);
        translate([4,-3,4.5])
          rotate([-90,0,0])
          cylinder(d=0.75,h=10);
      }
    }
  }
}
module CB46(){
  black_steel()
    difference(){
    union(){
      translate([0,(3+9/16)/2,0])
        cube([3,0.125,10],center=true);
      translate([0,-(3+9/16)/2,0])
        cube([3,0.125,10],center=true);
      cube([5.5,3+9/16,0.125],center=true);
    }
    union(){
      translate([0,-4,4.325])
        rotate([-90,0,0])
        cylinder(d=0.75,h=10);
      translate([0,-4,2])
        rotate([-90,0,0])
      cylinder(d=0.75,h=10);
    }
  }
}

module j_bolt(){
  color([1,0,0])
    cylinder(d=5/8,h=8,center=true);
}

module wood_column_footing(position){
  depth=18;
  dim=ft(2)+6;
  if(position == 0){
    APVB66();
    concrete()
      translate([-dim/2+5/2,-dim/2+5.5/2,-depth])
      cube([dim,dim,depth]);
  }
  if(position == 1200){
    APVB66();
    concrete()
      translate([-dim/2+5,-dim/4+5.5/2,-depth])
      cube([dim/2,dim/2,depth]);
  }
  if(position == 130){
    APVB66();
    concrete()
      translate([-dim/2+5,0,-depth])
      cube([dim/2,dim/2,depth]);
  }
  if(position == 300){
    APVB66();
    concrete()
      translate([-dim/4+5/2,0,-depth])
      cube([dim/2,dim/2,depth]);
  }
  if(position == 430){
    APVB66();
    concrete()
      translate([0,0,-depth])
      cube([dim/2,dim/2,depth]);
  }
  if(position == 600){
    APVB66();
    concrete()
      translate([0,-dim/4+5.5/2,-depth])
      cube([dim/2,dim/2,depth]);
  }
  if(position == 730){
    APVB66();
    concrete()
      translate([0,-dim/2+5.5,-depth])
      cube([dim/2,dim/2,depth]);
  }
  if(position == 900){
    APVB66();
    concrete()
      translate([-dim/4+5/2,-dim/2+5.5,-depth])
      cube([dim/2,dim/2,depth]);
  }
  if(position == 1030){
    APVB66();
    concrete()
      translate([-dim/4-5/2,-dim/2+5.5,-depth])
      cube([dim/2,dim/2,depth]);
  }
}

module interior_wood_post_footing(){
  translate([0,0,-9])
    concrete()
    cube([ft(2)+6,ft(2)+6,18],center=true);
  CB46();
}

module interior_wall_footing(length,rotation){
  depth=18;
  if(rotation==0) {
    concrete()
      translate([0,0,-depth+slab_thk])
      cube([length,ft(1)+6,depth]);
  } else {
    concrete()
      translate([ft(1)+6,0,-depth+slab_thk])
      rotate([0,0,90])
      cube([length,ft(2)+6,depth]);
  }
}
module exterior_footing(length,rotation){
  depth=18;
  if(rotation==0) {
    concrete()
    translate([0,0,-depth+slab_thk])
      cube([length,ex_footer_width,depth]);
  } else {
    concrete()
    translate([ex_footer_width,0,-depth+slab_thk])
      rotate([0,0,90])
      cube([length,ex_footer_width,depth]);    
  }
}

module toedown_footing(length,rotation){
  depth=toe_down_width;
  if(rotation==0) {
    concrete()
    translate([0,0,-depth+slab_thk])
      cube([length,depth,depth]);
  } else {
    concrete()
      translate([depth,0,-depth+slab_thk])
      rotate([0,0,90])
      cube([length,depth,depth]);    
  }
}

module X(){
  translate([0,0,0]) children();
}
module NW(){
  X()
    translate([slab_north,slab_west,0]) children();
}
module SW(){
  X()
    translate([0,slab_west,0]) children();
}
module SE(){
  X()
    translate([0,0,0]) children();
}
module NE(){
  X()
    translate([slab_north,0,0]) children();
}
// =====================================================
module main_slab() {
  X()
    concrete()
    cube( MAIN_SLAB );

  exterior_footing(slab_north,0);
  exterior_footing(slab_west,1);
  
  SW()
    translate([0,-ex_footer_width,0])
    exterior_footing(slab_north,0);
  
  NE()
    translate([-ex_footer_width,0,0])
    exterior_footing(slab_west,1);
  
  translate([ft(9), ft(2)+9,0])
    interior_wall_footing(ft(11), 0);


  translate([ft(11)+8+0.5, ft(3)+6+0.5,slab_thk])
    interior_wood_post_footing();
  SW()    
    translate([ft(11)+12+0.5,-5.5,slab_thk])
    rotate([0,0,90])
    wood_column_footing(0);

}
module guest_slab() {
  SW()
    concrete()
    cube( [g_slab_north, g_slab_west,slab_thk]);

   SW()
    translate([0,g_slab_west-ex_footer_width,0])
    exterior_footing(g_slab_north,0);

  SW()
    exterior_footing(g_slab_north,1);

  SW()
    translate([g_slab_north-ex_footer_width,0,0])
    exterior_footing(g_slab_north,1);

}
module drive_slab() {
  SW()
    concrete()
    translate([g_slab_north,g_slab_west-d_slab_west,0])
  cube( [ d_slab_north,d_slab_west,slab_thk ] );

  SW()
    translate([g_slab_north,g_slab_west-d_slab_west,0])
    toedown_footing(d_slab_north,0);
   SW()
     translate([g_slab_north,
                g_slab_west-d_slab_west+d_slab_west-toe_down_width,0])
     toedown_footing(d_slab_north,0);
  SW()
    translate([g_slab_north,g_slab_west-d_slab_west,0])
    toedown_footing(d_slab_west,1);
  SW()
    translate([g_slab_north+d_slab_north-toe_down_width,
               g_slab_west-d_slab_west,0])
    toedown_footing(d_slab_west,1);

  SW()
    translate([g_slab_north+d_slab_north-5,
               g_slab_west-5.5,slab_thk])
    wood_column_footing(1030);

  SW()
    translate([g_slab_north+d_slab_north-5,
               -5.5,slab_thk])
    wood_column_footing(130);

  SW()
    translate([g_slab_north+d_slab_north/2-5,
               g_slab_west-5.5,slab_thk])
    wood_column_footing(900);

}
module porch_slab(){
  SE()
    concrete()
    translate([-p_slab_north,0,0])
  cube([p_slab_north,p_slab_west,slab_thk]);

  translate([-p_slab_north,0,0])
    toedown_footing(p_slab_north,0);
  translate([-p_slab_north,p_slab_west-toe_down_width])
    toedown_footing(p_slab_north,0);

  translate([-toe_down_width,0,0])
    toedown_footing(p_slab_west,1);

  translate([-p_slab_north,0,0])
    toedown_footing(p_slab_west,1);

  SE()
    translate([-p_slab_north,0,slab_thk])
    wood_column_footing(430);  
  SE()
    translate([-p_slab_north,p_slab_west-5.5,slab_thk])
    wood_column_footing(730);  
  
}

module door_slab(){
  NE()
    concrete()
    translate([0,ft(4)+6+0.5,0])
    cube([dr_slab_north,dr_slab_west,slab_thk]);
  NE()
    translate([0,ft(4)+6+0.5,0])
    toedown_footing(dr_slab_north,0);
  NE()
    translate([0,ft(4)+6+0.5+dr_slab_west-toe_down_width,0])
    toedown_footing(dr_slab_north,0);

  NE()
    translate([0,ft(4)+6+0.0,0])
    toedown_footing(dr_slab_west,1);

  NE()
    translate([dr_slab_north-toe_down_width,ft(4)+6+0.0,0])
    toedown_footing(dr_slab_west,1);

  NE()
    translate([dr_slab_north-5,ft(4)+6+0.5,slab_thk])
    wood_column_footing(130);
  NE()
    translate([dr_slab_north-5,ft(4)+6+0.5+dr_slab_west-5,slab_thk])
    wood_column_footing(1030);  
}

module interior_slab() {
  main_slab();
  guest_slab();
}

interior_slab();
drive_slab();
porch_slab();
door_slab();

