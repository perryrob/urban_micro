
include <foundation.scad>
include <TJI.scad>
include <stair.scad>

HORIZONTAL_NORTH=0;
HORIZONTAL_WEST=1;
VERTICAL_NORTH=2;
VERTICAL_WEST=3;
main_roof_pitch=7.8;
guest_roof_pitch=main_roof_pitch / 2;
porch_roof_pitch=3.58;


module versa_lam(){
   color([.5,.2,0]) children();
}
module doug_fir(){
  color([.75,.57,0]) children();
}
module ptdf_sill(){
  color([0,.57,0]) children();
}

module post(w,h,l,orientation){
  echo("{name='POST'",",w=",w,",h=",h,",length=",l/12,"type='post'}");
  if( orientation == HORIZONTAL_NORTH ){
    translate([0,0,slab_thk])
      cube([l,h,w]);
  }
  if( orientation == HORIZONTAL_WEST ){
    translate([h,0,slab_thk])
      rotate([0,0,90])
      cube([l,h,w]);
  }
  if( orientation == VERTICAL_NORTH ){
    translate([1.5,0,slab_thk])
      rotate([0,-90,0])
      cube([l,h,w]);
  }
  
}


module guest_roof_joist(length,orientation){
  width=1.5;
  thk=11.5;
  echo("{name='2x12'",",w=",thk,",h=",width,",length=",length/12,"type='board'}");
   echo("{name='Simpson HUS212-2', type='bracket', qty=1}");
   echo("{name='Simpson H3', type='bracket', qty=1}");
  if( orientation == HORIZONTAL_NORTH ){
    translate([0,0,slab_thk])
      doug_fir()
      cube([length,width,thk]);
  }
  if( orientation == HORIZONTAL_WEST ){
    translate([5.5,5.5,slab_thk])
      rotate([0,0,90])
      doug_fir()
      cube([length,width,thk]);
  }
  if( orientation == VERTICAL_NORTH ){
    translate([1.5,0,slab_thk+thk])
      rotate([0,-90,0])
      doug_fir()
        cube([length,width,thk]);
  }
  if( orientation == VERTICAL_WEST ){
    translate([0,0,slab_thk+thk])
      rotate([0,-90,-90])
      doug_fir()
        cube([length,width,thk]);
  }
  
}
module porch_roof_joist(length,orientation){
  width=1.5;
  thk=7.5;
  echo("{name='2x8'",",w=",thk,",h=",width,",length=",length/12,"type='board'}");
  if( orientation == HORIZONTAL_NORTH ){
    translate([0,0,slab_thk])
      doug_fir()
      cube([length,width,thk]);
  }
  if( orientation == HORIZONTAL_WEST ){
    translate([5.5,5.5,slab_thk])
      rotate([0,0,90])
      doug_fir()
      cube([length,width,thk]);
  }
  if( orientation == VERTICAL_NORTH ){
    translate([1.5,0,slab_thk+thk])
      rotate([0,-90,0])
      doug_fir()
        cube([length,width,thk]);
  }
  if( orientation == VERTICAL_WEST ){
    translate([0,0,slab_thk+thk])
      rotate([0,-90,-90])
      doug_fir()
        cube([length,width,thk]);
  }
  
}
/*
module garage_roof_joist(length,orientation){
  width=1.5;
  thk=7.5;
  echo("{name='2x8'",",w=",thk,",h=",width,",length=",length/12,"type='board'}");
  if( orientation == HORIZONTAL_NORTH ){
    translate([0,0,slab_thk])
      doug_fir()
      cube([length,width,thk]);
  }
  if( orientation == HORIZONTAL_WEST ){
    translate([5.5,5.5,slab_thk])
      rotate([0,0,90])
      doug_fir()
      cube([length,width,thk]);
  }
  if( orientation == VERTICAL_NORTH ){
    translate([1.5,0,slab_thk+thk])
      rotate([0,-90,0])
      doug_fir()
        cube([length,width,thk]);
  }
  if( orientation == VERTICAL_WEST ){
    translate([0,0,slab_thk+thk])
      rotate([0,-90,-90])
      doug_fir()
        cube([length,width,thk]);
  }
  
}

*/
module exterior_stud(length,orientation){
  width=5.5;
  thk=1.5;
  echo("{name='2x6'",",w=",thk,",h=",width,",length=",length/12,",type='board'}");
  if( orientation == HORIZONTAL_NORTH ){
    translate([0,0,slab_thk])
      cube([length,width,thk]);
  }
  if( orientation == HORIZONTAL_WEST ){
    translate([5.5,5.5,slab_thk])
      rotate([0,0,90])
      cube([length,width,thk]);
  }
  if( orientation == VERTICAL_NORTH ){
    translate([1.5,0,slab_thk+thk])
      rotate([0,-90,0])
        cube([length,width,thk]);
  }
  if( orientation == VERTICAL_WEST ){
    translate([0,0,slab_thk+thk])
      rotate([0,-90,-90])
        cube([length,width,thk]);
  }
  
}
module interior_stud(length,orientation){
  width=3.5;
  thk=1.5;
  echo("{name='2x4'",",w=",thk,",h=",width,",length=",length/12,"type='board'}");
  if( orientation == HORIZONTAL_NORTH ){
    translate([0,0,slab_thk])
      cube([length,width,thk]);
  }
  if( orientation == HORIZONTAL_WEST ){
    translate([width,0,slab_thk])
      rotate([0,0,90])
      cube([length,width,thk]);
  }
  if( orientation == VERTICAL_NORTH ){
    translate([1.5,0,slab_thk+thk])
      rotate([0,-90,0])
        cube([length,width,thk]);
  }
  if( orientation == VERTICAL_WEST ){
    translate([0,0,slab_thk])
      rotate([0,-90,-90])
        cube([length,width,thk]);
  }
  
}

module east_top_plate(){
   translate([0,0,ft(8)-1.5])
     doug_fir()
    exterior_stud(ft(10),HORIZONTAL_NORTH);
   translate([0,0,ft(8)-3])
     doug_fir()
    exterior_stud(ft(10),HORIZONTAL_NORTH);

}

module west_top_plate(){
  translate([0,ft(18)-5.5,ft(8)-1.5])
    doug_fir()
    exterior_stud(ft(12),HORIZONTAL_NORTH);
    translate([0,ft(18)-5.5,ft(8)-3])
      doug_fir()
    exterior_stud(ft(12),HORIZONTAL_NORTH);

}
module south_top_plate(){
  translate([0,0,ft(8)-3])
    doug_fir()
    exterior_stud(ft(12)-5,HORIZONTAL_WEST);
  translate([0,ft(12)-5,ft(8)-3])
    doug_fir()
    exterior_stud(ft(6)-5,HORIZONTAL_WEST);

  translate([0,0,ft(8)-1.5])
    doug_fir()
    exterior_stud(ft(6)-5,HORIZONTAL_WEST);
  translate([0,ft(6)-5,ft(8)-1.5])
    doug_fir()
    exterior_stud(ft(12)-5,HORIZONTAL_WEST);

}

module east_bottom_plate() {
  echo("{toggle=TREATED_MCA/GREEN}");
  exterior_stud(ft(12),HORIZONTAL_NORTH);
  translate([ft(12),0,0])
    exterior_stud(ft(12)-2.75,HORIZONTAL_NORTH);
  echo("{toggle='NOT_TREATED_MCA/GREEN'}");
}
module south_bottom_plate() {
  echo("{toggle='TREATED_MCA/GREEN'}");
  exterior_stud(ft(12),HORIZONTAL_WEST);
  translate([0,ft(12),0])
    exterior_stud(ft(6)+0.25-5.5,HORIZONTAL_WEST);
  echo("{toggle='NOT_TREATED_MCA/GREEN'}");
}

module roof_diff(){
   translate([5,-ft(5),ft(17.5)])
    rotate([0,main_roof_pitch,0])
    translate([-8,0,0])
     cube([ft(40),ft(45),ft(4)]);
}
module garage_roof_diff(){
  SW()
    translate([-2,-3,ft(11)+4])
    rotate([-guest_roof_pitch,0,0])
    cube([ft(32),ft(12),ft(3)]);
}

module north_wall() {
  NE()
  for( i = [0:16:16*12] ){
    translate([-5.5,i+5.5,0])
      exterior_stud(ft(14)-1.5,VERTICAL_WEST);
  }
  NE()
  translate([-5.5,ft(18)-5.5,0])
    exterior_stud(ft(14)-1.5,VERTICAL_WEST);
}
module north_bottom_plate() {

  translate([slab_north-5.5,0,0])
    doug_fir()
    south_bottom_plate();
}
module west_bottom_plate() {
  echo("{toggle='TREATED_MCA/GREEN'}");
  translate([0,slab_west-5.5,0])
    doug_fir()    
    east_bottom_plate();
  /* counter pony wall plate */
  SW()
    ptdf_sill()    
    //translate([ft(14.75),ft(-10)-5.5,0])
    translate([ft(14.75)-2.5/2,ft(-10),0])
    interior_stud(ft(10)-5.5,HORIZONTAL_WEST);
  echo("{toggle='NOT_TREATED_MCA/GREEN'}");
}
module east_west_north_wall(){
    NE()
      union(){
      versa_lam(){
        echo("{toggle='VERSA_STUD_1.7_2400}");
      for( i = [0:16:16*10] ){
        translate([-i-1.5,0,0])
          exterior_stud(ft(14)-1.5+sin(main_roof_pitch)*i,VERTICAL_NORTH);
      }
      SW(){
        translate([0,-5.5,0])
          for( i = [0:16:16*8] ){
            translate([-i-1.5,0,0])
              exterior_stud(ft(14)-1.5+sin(main_roof_pitch)*i,VERTICAL_NORTH);
          }
      }
    }
      echo("{toggle='NOT_VERSA_STUD'}");
  }
    union(){
      NE()
        translate([-ft(14)+2.5,0,0])
        versa_lam()
        echo("{toggle='VERSA_STUD_1.7_2400}");
        exterior_stud(ft(15)+9,VERTICAL_NORTH);
      NW()
        translate([-ft(12)+2.5,-5.5,0])
        versa_lam()
        echo("{toggle='NOT_VERSA_STUD'}");
        exterior_stud(ft(15)+5,VERTICAL_NORTH);
    }
    echo("{toggle='NOT_VERSA_STUD'}");

  east_top_plate();
  west_top_plate();
  south_top_plate();

  versa_lam()
    echo("{toggle='VERSA_STUD_1.7_2400}");
    north_wall();
    echo("{toggle='NOT_VERSA_STUD'}");
}

module living_room_framing(){
  SE()
    /* main upper floor glue lam */
    echo("{toggle='GLUE_LAM'}");
    translate([ft(12)-5.5,ft(3)+5.5,ft(8)])
    versa_lam()
    post(12,5.125,ft(15)-5.5,HORIZONTAL_WEST);
  translate([ft(10)-5.5,0,ft(8)])
    versa_lam()
    post(12,5.125,ft(3.5),HORIZONTAL_WEST);

  echo("{toggle='NOT_GLUE_LAM'}");
  SE()
    for( i = [0:16:16*13] ){
      translate([0,i,0])
        doug_fir()
      exterior_stud(ft(8)-4.5,VERTICAL_WEST);
    }
  union() {
  SE()
    translate([ft(9)+6.5,0,0])
    translate([5.5-1.5,0,1.5])
    doug_fir()
    post(5.5,5.5,ft(8)-1.5,VERTICAL_NORTH);
  
  SE()
    for( i = [0:16:16*6] ){
      translate([5.5+i,0,0])
        doug_fir()
      exterior_stud(ft(8)-4.5,VERTICAL_NORTH);
    }
  }
  SW()
  union() {
    translate([ft(12)-7.325,0,0])
    translate([5.5,-5.5,1.5])
      doug_fir()
    post(3.5,5.5,ft(8)-1.5,VERTICAL_NORTH);
  SE()
    for( i = [0:16:16*8] ){
      translate([i,-5.5,0])
        doug_fir()
    exterior_stud(ft(8)-4.5,VERTICAL_NORTH);
    }
  }
}

module upper_floor(){
  SE()
    for( i = [0:16:16*1] ){
    translate([1.5,i+5.5,ft(8)])
      versa_lam()
      echo("{name='Simpson ITS2.37/11.88 Top Flange Hanger', type='bracket', qty=1}");
      TJI_230(ft(10)-7, HORIZONTAL_NORTH);
    }
  SE()
    for( i = [0:16:16*9] ){
    translate([1.5,i+42,ft(8)])
      versa_lam()
      echo("{name='Simpson ITS2.37/11.88 Top Flange Hanger', type='bracket', qty=1}");
      TJI_230(ft(12)-7, HORIZONTAL_NORTH);
    }
  translate([1.5,ft(17)-6,ft(8)])
    versa_lam()
      TJI_230(ft(12)-7, HORIZONTAL_NORTH);

  SE()
    translate([0,0,ft(8)])
    tji_rim_board(ft(18),HORIZONTAL_WEST);

  SE()
    translate([0,0,ft(8)])
    tji_rim_board(ft(10),HORIZONTAL_NORTH);

  SW()
    translate([0,-1.5,ft(8)])
    tji_rim_board(ft(12),HORIZONTAL_NORTH);

}

module bed_room_framing(){
  
  difference(){
    SE()
    for( i = [0:16:16*13] ){
      translate([0,i,ft(8)+11+7/8])
        doug_fir()
        exterior_stud(ft(10)-4.5,VERTICAL_WEST);
    }
    roof_diff();
  }
  doug_fir(){
  translate([0,-5.5,ft(8)+11+7/8])
    exterior_stud(ft(12),HORIZONTAL_WEST);
  translate([0,ft(12)-5.5,ft(8)+11+7/8])
    exterior_stud(ft(6)+0.25-5.5,HORIZONTAL_WEST);
  translate([5.0,0,ft(8)+11+7/8])
    exterior_stud(ft(10)+0.25-5.5,HORIZONTAL_NORTH);
  SW()
  translate([0,-5.5,ft(8)+11+7/8])
    exterior_stud(ft(12),HORIZONTAL_NORTH);
  }

  difference(){
    SW()
      for( i = [0:16:16*8] ){
        translate([i,-5.5,ft(8)+11+7/8])
          doug_fir()
          exterior_stud(ft(10)-4.5,VERTICAL_NORTH);
    }
    roof_diff();
  }
  difference(){
    SE()
      for( i = [0:16:16*7] ){
        translate([i,0,ft(8)+11+7/8])
          doug_fir()
          exterior_stud(ft(10)-4.5,VERTICAL_NORTH);
    }
    roof_diff();
  }
}
module guest_room_framing(){
  // Bottom plates
  SW()
    translate([0,-5.5,0])
    ptdf_sill()
    echo("{toggle='TREATED_MCA/GREEN'}");
    exterior_stud(ft(10)+1.75,HORIZONTAL_WEST);
  SW()
    translate([5.5,ft(10)+1.75-5.5,0])
    ptdf_sill()    
    exterior_stud(ft(8)+3.75,HORIZONTAL_NORTH);
  SW()
    translate([ft(9)-8.25,-5.5,0])
    ptdf_sill()    
    exterior_stud(ft(10)-3.5,HORIZONTAL_WEST);
  echo("{toggle='NOT_TREATED_MCA/GREEN'}");
  difference(){
    union(){
      SW()
        for( i = [0:16:16*7] ){
          translate([0,i,0])
            doug_fir()
            exterior_stud(ft(12)-4.5,VERTICAL_WEST);
        }
      SW()
        for( i = [0:16:16*6] ){
          translate([i,ft(10)-3.75,0])
            doug_fir()
            exterior_stud(ft(12)-4.5,VERTICAL_NORTH);
        }
      SW()
        for( i = [0:16:16*7] ){
          translate([ft(9)-8.25,i,0])
            doug_fir()
            exterior_stud(ft(12)-4.5,VERTICAL_WEST);
        }
      SW()
        translate([ft(9)-4.25,ft(10)-3.75,0])
        doug_fir()
        exterior_stud(ft(12)-4.5,VERTICAL_NORTH);
      
    }
    garage_roof_diff();
  }
}
module upper_sills(){
  // NORTH Wall
  delta=3;
  n_wall=14;
  NE()
    translate([-5.5,-5.5,ft(n_wall)])
    doug_fir()
    exterior_stud(ft(12)+5.5,HORIZONTAL_WEST);
  NE()
    translate([-5.5,ft(12),ft(n_wall)])
    doug_fir()
    exterior_stud(ft(5)+7,HORIZONTAL_WEST);
  NE()
    translate([-5.5,-5.5,ft(n_wall)+1.5])
    doug_fir()
    exterior_stud(ft(12)+7,HORIZONTAL_WEST);
  NE()
     translate([-5.5,ft(12),ft(n_wall)+1.5])
    doug_fir()
     exterior_stud(ft(5)+7,HORIZONTAL_WEST);

   // SOUTH Wall
   wall=17.4;
   SE()
    translate([0,-5.5,ft(wall)-delta])
    doug_fir()
     exterior_stud(ft(12)+5.5,HORIZONTAL_WEST);
   SE()
     translate([0,ft(12),ft(wall)-delta])
     doug_fir()
     exterior_stud(ft(5)+7,HORIZONTAL_WEST);
   SE()
     translate([0,-5.5,ft(wall)-delta+1.5])
     doug_fir()
     exterior_stud(ft(12)+7,HORIZONTAL_WEST);
   SE()
     translate([0,ft(12),ft(wall)-delta+1.5])
     doug_fir()
     exterior_stud(ft(5)+7,HORIZONTAL_WEST);
   // East West Wall
   rotate([0,main_roof_pitch,0]){
   SE()
     translate([-ft(2.1),0,ft(wall)-delta-1])
     doug_fir()
     exterior_stud(ft(12),HORIZONTAL_NORTH);
   SE()
     translate([ft(12)-ft(1.7),0,ft(wall)-delta-1])
     doug_fir()
     exterior_stud(ft(11),HORIZONTAL_NORTH);
   }
   rotate([0,main_roof_pitch,0]){
   SE()
     translate([-ft(2.1),0,ft(wall)-2.5])
     doug_fir()
     exterior_stud(ft(12)+5.5,HORIZONTAL_NORTH);
   SE()
     translate([ft(12)-ft(1.7),0,ft(wall)-2.5])
     doug_fir()
     exterior_stud(ft(11),HORIZONTAL_NORTH);
   }
   // West
   rotate([0,main_roof_pitch,0]){
   SW()
     translate([-ft(2.1),-5.5,ft(wall)-delta-1])
     doug_fir()
     exterior_stud(ft(12)+5.5,HORIZONTAL_NORTH);
   SW()
     translate([ft(12)-ft(1.7),-5.5,ft(wall)-delta-1])
     doug_fir()
     exterior_stud(ft(11),HORIZONTAL_NORTH);
   }
   rotate([0,main_roof_pitch,0]){
   SW()
     translate([-ft(2.1),-5.5,ft(wall)-2.5])
     doug_fir()
     exterior_stud(ft(12)+5.5,HORIZONTAL_NORTH);
   SW()
     translate([ft(12)-ft(1.7),-5.5,ft(wall)-2.5])
     doug_fir()
     exterior_stud(ft(11),HORIZONTAL_NORTH);
   }
   // Guest
   translate([0,-5.25,ft(12.3)])
     rotate([-guest_roof_pitch,0,0])
     union(){
     doug_fir()
     union(){
       SW()
         exterior_stud(ft(10)-3,HORIZONTAL_WEST);
       SW()
         translate([ft(8.325)-0.25,0,0])
         exterior_stud(ft(10.185),HORIZONTAL_WEST);
       SW()
         translate([0,ft(10)+2,0])
         exterior_stud(ft(8.75)-5.5,HORIZONTAL_NORTH);
     }
     doug_fir()
     union(){
       SW()
         translate([0,0,1.5])
         exterior_stud(ft(10)-3,HORIZONTAL_WEST);
       SW()
         translate([ft(8.325)-0.25,0,1.5])
         exterior_stud(ft(10)-3.75,HORIZONTAL_WEST);
       SW()
         translate([0,ft(10)+2,1.5])
         exterior_stud(ft(8.75),HORIZONTAL_NORTH);
     }
   }
}
module garage_roof(){
  // Ledger
  base_of_ledger=ft(12)-9.325;
  SW()
    translate([0,0,base_of_ledger])
    guest_roof_joist(ft(12),HORIZONTAL_NORTH);
  SW()
    translate([ft(12),0,base_of_ledger])
    guest_roof_joist(ft(12),HORIZONTAL_NORTH);
  SW()
    translate([ft(24),0,base_of_ledger])
    guest_roof_joist(ft(5),HORIZONTAL_NORTH);

  echo("{toggle='GLUE_LAM'}");
  SW()
    translate([ft(9),ft(10)-3.125,ft(10.5)-8.5])
    versa_lam()
    post(9,5+1/8,ft(8)+ft(1),HORIZONTAL_NORTH);
  SW()
    translate([ft(18),ft(10)-3.125,ft(10.5)-8.5])
    versa_lam()
    post(9,5+1/8,ft(10)+ft(1),HORIZONTAL_NORTH);
  echo("{toggle='NOT_GLUE_LAM'}");
  SW()
    for( i = [0:24:24*13] ){
      translate([i+6.2,-5,base_of_ledger+.75])
        doug_fir()
        rotate([-guest_roof_pitch,0,0])
        guest_roof_joist(ft(13),HORIZONTAL_WEST);
    }
  SW()
    doug_fir()
    translate([ft(18)+1,ft(10)+1.75-5.5,-3])
    post(5.5,5.5,ft(10)+1,VERTICAL_NORTH);
  SW()
    doug_fir()
    translate([ft(27)+6.5,ft(10)+1.75-5.5,-3])
    post(5.5,5.5,ft(10)+1,VERTICAL_NORTH);
  SW()
    doug_fir()
    translate([ft(27)+6.5,0-5.5,-3])
    post(5.5,5.5,ft(12)-6,VERTICAL_NORTH);
  echo("{toggle='GLUE_LAM'}");
  NW()
    versa_lam()
    translate([0,-5.5,ft(11)+3])
    post(9,5+1/8,ft(4)+ft(1),HORIZONTAL_NORTH);
  echo("{toggle='NOT_GLUE_LAM'}");
}
module main_roof(){
  SE()
  for( i = [0:24:24*8] ){
    versa_lam()
      translate([-24.2,i+10,ft(18)-3])
      rotate([0,main_roof_pitch,0])
        TJI_560(ft(28),HORIZONTAL_NORTH);
    echo("{name='Simpson H8', type='bracket', qty=2}");
  }
  // Extra for soffets
  EXTRA()
    %TJI_560(ft(28),HORIZONTAL_NORTH);
  for( i = [0:1:14] ){
    echo("{name='Simpson H3', type='bracket', qty=1}");
  }
}
module back_porch_roof(){
  base_of_porch_ledger=ft(9.0)+2.5;
  // Posts
  SE()
    doug_fir()
    translate([-ft(6)+2.5,0,0])
    post(5.5,5.5,ft(8.5)+4.5,VERTICAL_NORTH);
   SE()
    doug_fir()
     translate([-ft(6)+2.5,ft(18)-5.5,0])
     post(5.5,5.5,ft(8.5)+4.5,VERTICAL_NORTH);
  // Beam
   echo("{toggle='GLUE_LAM'}");
   SE()
     versa_lam()
     translate([-ft(6)-1.5,0,ft(8)+7.5])
     post(9.75,5.5,ft(18)+1.1,HORIZONTAL_WEST);
   echo("{toggle='NOT_GLUE_LAM'}");
  // Ledger
  SE()
    translate([-5.5,-5.5,base_of_porch_ledger])
    doug_fir()
    porch_roof_joist(ft(12),HORIZONTAL_WEST);
  translate([-5.5,ft(12)-5.5,base_of_porch_ledger])
    doug_fir()
    porch_roof_joist(ft(6)+1.5,HORIZONTAL_WEST);

  SE()
    for( i = [0:24:24*9] ){
      echo("{name='Simpson HUC26 2x', type='bracket', qty=2}");
      rotate([0,-porch_roof_pitch,0])
      translate([-ft(5)-2,i,base_of_porch_ledger])
        porch_roof_joist(ft(6)-4,HORIZONTAL_NORTH);
  }
}
module front_porch_roof(){
  base_of_porch_ledger=ft(7);
  // Posts
  NE()
    doug_fir()
    translate([ft(6),ft(4)+6.5,0])
    post(5.5,5.5,base_of_porch_ledger+9,VERTICAL_NORTH);
  NE()
    doug_fir()
     translate([ft(6),ft(10)-3,0])
     post(5.5,5.5,base_of_porch_ledger+9,VERTICAL_NORTH);
  // Beam
  echo("{toggle='GLUE_LAM'}");
   NE()
     versa_lam()
     translate([ft(6)-4,ft(4)+6.5,base_of_porch_ledger+9])
     post(9.75,5.125,ft(6)-4,HORIZONTAL_WEST);
   echo("{toggle='NOT_GLUE_LAM'}");
  // Ledger
   NE()
     translate([-4,ft(4),base_of_porch_ledger+ft(1)+4])
     doug_fir()
     porch_roof_joist(ft(6)-4,HORIZONTAL_WEST);
   translate([0,0,base_of_porch_ledger+ft(1)+4])
   union() {
     NE()
       for( i = [0:24:24*2] ){
         rotate([0,guest_roof_pitch,0])
           translate([-1,i+ft(4)+5.5,0])
           doug_fir()
           porch_roof_joist(ft(6)-3,HORIZONTAL_NORTH);
       }
     NE()
       rotate([0,guest_roof_pitch,0])
       translate([-1,ft(10)+1,0])
       porch_roof_joist(ft(6)-3,HORIZONTAL_NORTH);
   }
}
module bottom_plate(){
  ptdf_sill() {
  north_bottom_plate();
  east_bottom_plate();
  south_bottom_plate();
  west_bottom_plate();
  }
}


