byte state = 0;
byte mutex = 0;
active proctype A(){
  do ::(state< 100) ->
    (mutex % 2 == 1);
    state = state + 3;
    printf("MSC: procA %d\n", state);
    mutex = mutex + 1;
 od
}
active proctype B(){
 do ::(state< 100) ->
     (mutex % 2 == 0);
     state = state + 5;
     printf("MSC: procB %d\n", state);
     mutex = mutex + 1;
 od
} 
