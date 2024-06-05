
include <framing.scad>
include <foundation.scad>
include <windows_doors.scad>

difference(){
  difference(){
    difference(){
      difference(){
        difference(){
          difference(){
            structural_framing();
            front_door(NO_HEADER,NO_WINDOW);
          }
          north_small_windows(NO_HEADER,NO_WINDOW);
        }
        north_kitchen_window(NO_HEADER,NO_WINDOW);
      }
      bedroom_window(NO_HEADER,NO_WINDOW);
    }
    garage_door(NO_HEADER,NO_DOOR);
  }
  guest_door(NO_HEADER,NO_DOOR);
}
guest_door(HEADER,DOOR);
garage_door(HEADER,DOOR);
front_door(HEADER,WINDOW);
north_small_windows(HEADER,WINDOW);
north_kitchen_window(HEADER,WINDOW);
bedroom_window(HEADER,WINDOW);
