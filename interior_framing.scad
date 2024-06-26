
include <framing.scad>

module living_room_post(){
  SE()
    translate([ft(11)+8.5,ft(3)+5,0])
    post(3.5,3,ft(8),VERTICAL_NORTH);
}
module stair_framing(){
  NE()
    //translate([-ft(3)+7,ft(3)+6.5,0])
    interior_stud(ft(8),VERTICAL_NORTH);
}




module interior_framing(){
  living_room_post();
  stair_framing();
}

interior_framing();
