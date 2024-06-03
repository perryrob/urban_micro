
NO_HEADER=0;
HEADER=1;
NO_WINDOW=0;
WINDOW=1;

module front_door(header,window){
  if(header == NO_HEADER){
    NE()
      translate([-ft(1),ft(6),0])
      cube([ft(2),36,96]);
  }
  if(window == WINDOW){
    NE()
      color([0.5,0.5,0.5])
      translate([-2,ft(6),0])
      cube([ft(0.1),36,96]);
  }
}

module north_small_windows(header,window){
  if(header == NO_HEADER){
    NE()
      for( i = [0:1:2] ){
        translate([-ft(1),ft(i*5)+ft(3),ft(10)+1.5])
          cube([ft(2),ft(2),ft(2)]);
    }
  }
  if(window == WINDOW){
    NE()
      for( i = [0:1:2] ){
        color([0.5,0.5,0.5])
          translate([-2,ft(i*5)+ft(3),ft(10)+1.5])
          cube([ft(0.1),ft(2),ft(2)]);
      }
  }
}

module north_kitchen_window(header,window){
  if(header == NO_HEADER){
    NW()
      translate([-ft(1),-ft(5),ft(3.5)])
      cube([ft(2),ft(3),ft(4.5)]);    
  }
  if(window == WINDOW){
    NW()
      color([0.5,0.5,0.5])
      translate([-2,-ft(5),ft(3.5)])
      cube([ft(0.1),ft(3),ft(4.5)]);    
  }
}
module bedroom_window(header,window){

  if(header == NO_HEADER){
    SE()
      translate([-ft(1),ft(5.5),ft(12)])
      cube([ft(4),ft(7),ft(4)]);    
  }
  if(window == WINDOW){
    SE()
      color([0.5,0.5,0.5])
      translate([2,ft(5.5),ft(12)])
      cube([ft(0.1),ft(7),ft(4)]);    
  }
 
}
