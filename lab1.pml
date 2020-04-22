byte state = 1;
byte f = 2;
active proctype A(){
z: (state==1 ) -> state = f
(state==3 ) -> f = 55
goto z
}
active proctype B(){
 (state==2) -> state = 3
 }