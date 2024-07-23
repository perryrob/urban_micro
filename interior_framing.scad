
include <framing.scad>
include <windows_doors.scad>



module living_room_post(){
  SE()
    translate([ft(11)+8.5,ft(3)+5.5,0])
    post(3.5,3.5,ft(8),VERTICAL_NORTH);
}

module bottom_wall(){
  SE()
    /* bottom plates */
    color([0,1,0])
    {
      translate([5.5,ft(3)+5.5,0])
        interior_stud(ft(12),HORIZONTAL_NORTH);
      translate([5.5+ft(8),ft(3)+5.5,0])
        interior_stud(ft(12),HORIZONTAL_NORTH);
      translate([ft(14),5.5,0])
        interior_stud(ft(3),HORIZONTAL_WEST);
      translate([ft(5.5),5.5,0])
        interior_stud(ft(3),HORIZONTAL_WEST);      
    }
  /* interior walls */
  translate([ft(14),5.5,1.5])
      interior_stud(ft(6.2),VERTICAL_WEST);
  translate([ft(14),5.5+24,1.5])
      interior_stud(ft(6.2),VERTICAL_WEST);
  translate([ft(14),ft(3)-1.5,1.5])
      interior_stud(ft(6.2),VERTICAL_WEST);
  /*-----------------*/
  translate([ft(5.5),5.5,1.5])
      interior_stud(ft(8),VERTICAL_WEST);
  translate([ft(5.5),5.5+24,1.5])
      interior_stud(ft(8),VERTICAL_WEST);
  translate([ft(5.5),ft(3)-1.5,1.5])
      interior_stud(ft(8),VERTICAL_WEST);

  /* Top plates */
  translate([5.5,ft(3)+5.5,ft(8)])
        interior_stud(ft(10),HORIZONTAL_NORTH);
  translate([ft(14),5.5,ft(6.25)])
    interior_stud(ft(3),HORIZONTAL_WEST);
  translate([ft(5.5),5.5,ft(8)])
        interior_stud(ft(3),HORIZONTAL_WEST); 
  /* shear wall under stairs */
  for(i=[0:16:ft(9)]){
    translate([i+ft(11)+10,ft(3)+5.5,0])
      interior_stud(ft(8)-1.5-cos(33.7)*i,VERTICAL_NORTH);
  }
  /* fridge wall */
  color([0,1,0])
    translate([ft(23.25)-ft(2.5),ft(9),0])
    interior_stud(ft(2.5),HORIZONTAL_NORTH);
  for(i=[0:24:ft(2.5)]){
    translate([i+ft(23.5)-ft(2.5)-3,ft(9),0])
      interior_stud(ft(8),VERTICAL_NORTH);
  }
  translate([ft(23.25)-ft(2.5),ft(9),ft(8)])
    interior_stud(ft(2.5),HORIZONTAL_NORTH);
  /* bathroom laundry */
    for(i=[0:24:ft(10)]){
    translate([i+5.5,ft(3)+5.5,0])
      interior_stud(ft(8),VERTICAL_NORTH);
  }
    
}
module bedroom_wall(){
  /* bottom back wall */
  translate([ft(12)-4,ft(3)+5.5,ft(9)])
    interior_stud(ft(12),HORIZONTAL_WEST);
  translate([ft(12)-4,ft(3)+ft(12)+5.5,ft(9)])
    interior_stud(ft(3)-5.5,HORIZONTAL_WEST);
  /* ----------------*/
  translate([ft(12)-4,ft(3)+5.5,ft(9)+ft(6.75)])
    interior_stud(ft(12),HORIZONTAL_WEST);
  translate([ft(12)-4,ft(3)+ft(12),ft(9)+ft(6.75)])
    interior_stud(ft(3)-5.5,HORIZONTAL_WEST);
  for(i=[0:24:ft(15)]) {
    translate([ft(12)-4,ft(3)+5.5+i,ft(9)+1.5])
      interior_stud(ft(6.9)-3,VERTICAL_WEST);
  }
  /* bathroom bottom plate */
  translate([5.5,ft(14)+6,ft(9)])
    interior_stud(ft(12)-9,HORIZONTAL_NORTH);
  for(i=[0:24:ft(11)]){
      translate([5.5+i,ft(14)+6,ft(9)])
        interior_stud((ft(9)+.625-1.5-9)-i*cos(90-7.8),VERTICAL_NORTH);
      
    }
  translate([5.5,ft(14)+6,ft(17)+3.375])
    rotate([0,7.8,0])
    interior_stud(ft(12)-9,HORIZONTAL_NORTH);
}

module 2xinterior_framing(){
  bedroom_wall();
  living_room_post();
  bottom_wall();
}

module interior_framing(){
  difference(){
    difference(){
      2xinterior_framing();
      main_bathroom_door(HEADER,NO_DOOR);
    }
    /* tweak */
    translate([0,-8,0])
      laundry_slider(NO_HEADER,NO_WINDOW);
  }
  main_bathroom_door(NO_HEADER,DOOR);
  laundry_slider(HEADER,WINDOW);
}
