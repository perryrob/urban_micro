
VERTICAL_NORTH=2;
VERTICAL_WEST=3;


NO_HEADER=0;
HEADER=1;
NO_WINDOW=0;
WINDOW=1;

NO_DOOR=0;
DOOR=1;
RH_DOOR=0;
LH_DOOR=1;

module window(size,header,show_window,orientation) {

  if(header == NO_HEADER){
    if(orientation == VERTICAL_NORTH)
      cube([size[0],ft(2),size[1]]);
    if(orientation == VERTICAL_WEST)
      cube([ft(2),size[0],size[1]]);
  }
  if(show_window == WINDOW){
    echo("{name='Window',w=",size[0],",h=",size[1],"type='window'}");
    color([0.5,0.5,0.5]){
      if(orientation == VERTICAL_NORTH)
        cube([size[0],ft(0.1),size[1]]);
      if(orientation == VERTICAL_WEST)
      cube([ft(0.1),size[0],size[1]]);
    }
  }
}

module door_def(size,header,show_door,orientation,type){

      w=size[0];
      h=size[1];
      
      jam_t=1;
      jam_w=5.5;
      door_angle=30;
        if( show_door == DOOR ){
          color([1,1,1]) {
            union(){
              cube([jam_w,jam_t,h-jam_t]);
              translate([0,w-jam_t,0])
                cube([jam_w,jam_t,h-jam_t]);
              translate([0,0,0])
                cube([jam_w,w,jam_t]);
              translate([0,0,h-jam_t])
                cube([jam_w,w,jam_t]);
              if(type == RH_DOOR){
                echo("{name='RH_Door',w=",size[0],",h=",size[1],"type='door'}");
                translate([jam_t/2,jam_t,jam_t])
                  rotate([0,0,door_angle])
                  difference(){          
                  cube([1, w - 2*jam_t, h - 2*jam_t]);
                  translate([0,w-jam_t-5,45])
                    rotate([0,90,0])
                    cylinder(d=3.5,h=6,center=true);
                }
              }
              if(type == LH_DOOR){
                echo("{name='LH_Door',w=",size[0],",h=",size[1],"type='door'}");
                translate([jam_t/2,jam_t,jam_t])
                  rotate([0,0,-door_angle])
                  difference(){      
                  cube([1, w - 2*jam_t, h - 2*jam_t]);
                  translate([0,w-jam_t-5,45])
                    rotate([0,90,0])
                  cylinder(d=3.5,h=6,center=true);
                }
              }
            }
          }
        }
        else { /* no_door */
          translate([-ft(1),0,0])
            color([0,0,0])
            cube([ft(2),w,h]);
        }
}

module plain_door(size,header,show_door,orientation,type){
  w=size[0];
  h=size[1];
  
  jam_t=1;
  jam_w=5.5;
  door_angle=30;
  
      
  if(orientation == VERTICAL_WEST){
    door_def(size,header,show_door,orientation,type);
  }
  if(orientation == VERTICAL_NORTH){    
    rotate([0,0,-90])
      translate([-5.5,0,0])
      door_def(size,header,show_door,orientation,type);
  }
  
}

module front_door(header,door){
  NE()
    translate([0,ft(6)+36,slab_thk])
    rotate([0,0,180])
    plain_door([36,96],header,door,VERTICAL_WEST,LH_DOOR);
}

module garage_door(header,door){
  SW()
    translate([ft(9),-5.5,slab_thk])
    plain_door([32,80],header,door,VERTICAL_NORTH,LH_DOOR);
}

module guest_door(header,door){
  SW()
    translate([ft(8),0,slab_thk])
        rotate([0,0,180])
    plain_door([32,80],header,door,VERTICAL_NORTH,LH_DOOR);
}

module main_bathroom_door(header,door){
  translate([ft(11.5),ft(3)+5.5+4,slab_thk])
        rotate([0,0,180])
    plain_door([32,80],header,door,VERTICAL_NORTH,LH_DOOR);

}
module laundry_slider(header,window) {
  translate([12,ft(3)+6.5,0])
  window([48,80],header,window,VERTICAL_NORTH);

}
module north_small_windows(header,window){
  if(header == NO_HEADER){
    NE()
      for( i = [0:1:2] ){
        translate([-ft(1),ft(i*5)+ft(3),ft(10)+1.5])
          window([ft(2),ft(2)],header,window,VERTICAL_WEST);
    }
  }
  if(window == WINDOW){
    NE()
      for( i = [0:1:2] ){
          translate([-2,ft(i*5)+ft(3),ft(10)+1.5])
            window([ft(2),ft(2)],header,window,VERTICAL_WEST);
      }
  }
}

module north_kitchen_window(header,window){
  /* rough opening */
  h=ft(3.5);
  w=ft(5);

  /* position VERT_WEST */
  west=-ft(6)-7;
  north=-2;
  elev=ft(3.5);

  if(header == NO_HEADER){
    NW()
      translate([north-ft(1),west,elev])
      window([w,h],header,window,VERTICAL_WEST);
  }
  if(window == WINDOW){
    NW()
      translate([north,west,elev])
      window([w,h],header,window,VERTICAL_WEST);
  }
}
module bedroom_window(header,window){

  if(header == NO_HEADER){
    SE()
      translate([-ft(1),ft(5.5),ft(12)])
      window([ft(7),ft(4)],header,window,VERTICAL_WEST);
  }
  if(window == WINDOW){
    SE()
      translate([2,ft(5.5),ft(12)])
      window([ft(7),ft(4)],header,window,VERTICAL_WEST);
  }
}
module livingroom_window(header,window){
  /* rough opening */
  h=ft(5);
  w=ft(3);

  /* position VERT_WEST */
  west=ft(13);
  north=5.5/2;
  elev=ft(3);

  if(header == NO_HEADER){
    SE()
      translate([north-ft(1),west,elev])
      window([w,h],header,window,VERTICAL_WEST);
  }
  if(window == WINDOW){
    SE()
      translate([north,west,elev])
      window([w,h],header,window,VERTICAL_WEST);
  }
}
module guestroom_window(header,window){
  /* rough opening */
  h=ft(5);
  w=ft(4);

  /* position VERT_WEST */
  west=ft(21);
  north=5.5/2;
  elev=ft(3);

  if(header == NO_HEADER){
    SE()
      translate([north-ft(1),west,elev])
      window([w,h],header,window,VERTICAL_WEST);
  }
  if(window == WINDOW){
    SE()
      translate([north,west,elev])
      window([w,h],header,window,VERTICAL_WEST);
  }
}
module slider(header,window){
  /* rough opening */
  h=ft(8);
  w=ft(6);
  
  /* position VERT_WEST */
  west=ft(4);
  north=5.5/2;
  elev=0;

  if(header == NO_HEADER){
    SE()
      translate([north-ft(1),west,elev])
      window([w,h],header,window,VERTICAL_WEST);
  }
  if(window == WINDOW){
    SE()
      translate([north,west,elev])
      window([w,h],header,window,VERTICAL_WEST);
  }
}

