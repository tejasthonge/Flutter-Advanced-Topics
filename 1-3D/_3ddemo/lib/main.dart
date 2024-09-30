
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';


void main(){

  runApp( const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key });
  @override
  Widget build(BuildContext context) {

    return const MaterialApp( 

      home:ThreeDDemo()
    );
  }
}


class ThreeDDemo extends StatefulWidget{
  const ThreeDDemo({super.key});
  @override
  State<ThreeDDemo> createState()=>_ThreeDDemoState();
}

class _ThreeDDemoState extends State<ThreeDDemo> {

  Flutter3DController _controller = Flutter3DController();

  @override 
  Widget build(BuildContext context)
  {

    return Scaffold(

      body: Center( 


        child: Flutter3DViewer(
          controller: _controller,
          src: "assets/3d/DamagedHelmet.glb"),

      ),
      floatingActionButton: Row( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ 

          IconButton(onPressed: (){ 
            _controller.playAnimation();
      
          }, icon: Icon(Icons.play_arrow)),
          IconButton(onPressed: (){ 
            _controller.pauseAnimation();
      
          }, icon: Icon(Icons.stop)),
          IconButton(onPressed: (){ 
            _controller.getAvailableAnimations();
      
          }, icon: Icon(Icons.list
          )),
          

        ],
      ),
    );

  
  }

}