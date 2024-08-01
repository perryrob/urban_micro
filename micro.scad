
include <framing.scad>
include <sheathing.scad>
include <interior_framing.scad>
include <foundation.scad>
include <windows_doors.scad>
include <stair.scad>
include <plumbing.scad>

module site(){  
  translate([0,0,-ft(50)])
    difference(){
    lot();
    slab();
  }
}

module windows_doors(show) {
  if( show ) {
    guest_door(HEADER,DOOR);
    garage_door(HEADER,DOOR);
    front_door(HEADER,WINDOW);
    north_small_windows(HEADER,WINDOW);
    north_kitchen_window(HEADER,WINDOW);
    bedroom_window(HEADER,WINDOW);
    livingroom_window(HEADER,WINDOW);
    guestroom_window(HEADER,WINDOW);
    slider(HEADER,WINDOW);
  } else {
    union(){
      front_door(NO_HEADER,NO_WINDOW);
      north_small_windows(NO_HEADER,NO_WINDOW);
      north_kitchen_window(NO_HEADER,NO_WINDOW);
      bedroom_window(NO_HEADER,NO_WINDOW);
      garage_door(NO_HEADER,NO_DOOR);
      guest_door(NO_HEADER,NO_DOOR);
      livingroom_window(NO_HEADER,NO_WINDOW);
      guestroom_window(NO_HEADER,NO_WINDOW);
      slider(NO_HEADER,NO_WINDOW);
    }
  }
}
module structural_framing(){
  
  upper_sills();
  bottom_plate();

  upper_floor();
  east_west_north_wall();
  
  living_room_framing();
  guest_room_framing();

  bed_room_framing();
  garage_roof();
  main_roof();
  back_porch_roof();
  front_porch_roof();

}

module framing() {

  difference() {
    structural_framing();
    windows_doors(0);
  }

  interior_framing();
}

lot();
slab();
framing();
windows_doors(1);
stairs();
under_slab_penetrations();
/*
EW_wall_sheathing();
S_wall_sheathing();
N_wall_sheathing();
N_Guest_wall_sheathing();
W_Guest_wall_sheathing();
upstairs_floor();
roof_sheathing();
porch_door_roof();
garage_tg_roof();
*/

/*
translate([0,0,-ft(50)]) {
  difference() {
    lot();
    slab();
  }
  under_slab_penetrations();
}
*/
