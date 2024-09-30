
import "dart:developer";
import "dart:isolate";

import "package:flutter/material.dart";
import "package:lottie/lottie.dart";

//In dart only one thread is present 
//but in other programing languages when block the one thread then the to perfom te the other opretions they uses the other thred known as muilty threading 
//but in dart thire are other concept known as isolate 

void main(){

  runApp(MyApp());
}

double? tottal=0;

class MyApp extends StatelessWidget {

  @override 
  Widget build(BuildContext context){
    return const MaterialApp(
      
      home:IcolateView(),
    );
  }

}


class IcolateView extends StatefulWidget {
  const IcolateView({super.key});

  @override
  State<IcolateView> createState() => _IcolateViewState();
}

//double 
class _IcolateViewState extends State<IcolateView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 


      body: Center(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [  
        
            LottieBuilder.network(
              "https://lottie.host/805c6f55-acf7-43ac-9685-863f639708b3/AgErf9OVZQ.json"
            ),
        
            Text(tottal.toString()),
        
          ElevatedButton(
            onPressed: (){
              complexTask();  //her we call the the complex task 
                              //due to that the main isolate is loadded and ui is stoped to show the gif 
                              //gif view is just for undstand the what is hoppening when we call any complex tastk

              //dou of that comlex task ui is bolocked to avid this we can use another isolate to perofom the these complex task

            },
             child: const Text("without Isolate")),


//Isolate:
              ElevatedButton(
              onPressed: ()async{

                final recevePort = ReceivePort();

                //Isolate.spawn is createing the new instance
                await Isolate.spawn(complexTaskWithNewIsolate, recevePort.sendPort);
                recevePort.listen((total){
                  setState(() {
                    tottal = total;
                  });
                });
            },
             child: const Text("with Isolate")),
        
        
          ],
        ),
      ),
    );
  }

  double complexTask(){

     tottal =0.0;

    for (int i = 1 ;i<=10000;i++){//you cam incresses the loop 
        tottal = tottal! + i;//for each etration it will add the new addition opration
        log(tottal.toString());
    }
    setState(() {});
    return tottal!;
  }
}

// --- End of the Class 

//we have to wrote indepent method mens not inside the class 


 complexTaskWithNewIsolate(SendPort sendPort)async{

  double total = tottal!;
  for (int i = 0 ;i<=100000;i++){

    total = total + i;
    log(total.toString());
  }
  
  sendPort.send(total);

}