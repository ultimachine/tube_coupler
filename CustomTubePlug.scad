baseW = 8;
baseH = 4;
baseL = 7;
indentW = 5.9;
riserW = 3.9;
totalH = 13.5;
totalL = 15;
holeD = 3.5;
chamferH = 2;
chamferD = 6;

module hole() {
    union(){
        cylinder(r=holeD/2,h=baseH,$fn=2*holeD);
        translate([0,0,baseH-chamferH]){
            cylinder(r1=holeD/2,r2=chamferD/2,h=chamferH,$fn=2*holeD);
        }
    }
}

module stopper() {
    union(){
        cube([baseW,totalL,baseH]);
        translate([baseW-indentW,baseL,0]){
            cube([riserW,totalL-baseL,totalH]);
        }
    }
}


//difference(){
  //  sleeve();
    //translate([-.7,0,1.9]){
      //  negative_mold();
//    }
//}
difference(){
    stopper();
    translate([baseW/2,baseL/2,0]){
        hole();
    }
}
echo(version=version());
