
module under_slab_penetrations(){
  $fn=60;
  /* main bathroom */
  /* toilet */
  color([0,0,0])
    translate([ft(14)+1.5,ft(3)/2+5.5,0])
    cylinder(r=1.5,h=24);
  /* sink */
  color([0,0,0])
    translate([ft(10)+7,5.5/2,0])
    cylinder(r=1.5/2,h=24);
  /* shower */
  color([0,0,0])
    translate([ft(7)+1.5,ft(3)/2+5.5,0])
    cylinder(r=1,h=24);
  /* laundry */
  color([0,0,0])
    translate([ft(2.75)+1.5,5.5/2,0])
    cylinder(r=1,h=24);
  /* upstairs */
  color([0,0,0])
    SW()
    translate([ft(2.1),-5.5/2,0])
    cylinder(r=1.5,h=ft(9));
  /* kitchen sink */
  color([0,0,0])
    SW()
    translate([ft(14)+9.5,ft(-5.5)-5.5,0])
    cylinder(r=1.5/2,h=24);


}

