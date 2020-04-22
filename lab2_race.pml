byte state = 0;
active proctype A(){
  do ::(state< 100) ->
    state = state + 3;
    printf("MSC: procA %d\n", state);
 od
}
active proctype B(){
 do ::(state< 100) ->
     state = state + 5;
     printf("MSC: procB %d\n", state);
 od
} 
