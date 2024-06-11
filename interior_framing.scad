
include <framing.scad>

module living_room_post(){
  SE()
    translate([ft(11)+8.5,ft(3)+5,0])
    post(3.5,3,ft(8),VERTICAL_NORTH);
}





module interior_framing(){
  living_room_post();
}

interior_framing();
