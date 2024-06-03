
include <framing.scad>
include <foundation.scad>
include <windows_doors.scad>

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
front_door(HEADER,WINDOW);
north_small_windows(HEADER,WINDOW);
north_kitchen_window(HEADER,WINDOW);
bedroom_window(HEADER,WINDOW);
