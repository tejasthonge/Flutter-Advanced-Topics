

import 'dart:developer';

void main(){

  workFunction();
}



void workFunction(){
  Timeline.startSync("starting work function");
  int total = 0;

  for(int i = 0; i < 100000; i++){

    total += i;


  }
  log("total: " + total.toString());
  print("total : $total");
  Timeline.finishSync();
}

/*
op:
total : 4999950000

[Done] exited with code=0 in 0.649 seconds 
*/


// by this above we can callulate the how much time required to complite the given funton