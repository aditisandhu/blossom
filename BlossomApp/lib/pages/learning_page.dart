import 'package:flutter/material.dart';
import '../helpers/quiz1.dart';
import '../helpers/quiz2.dart';

class LearningPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return LearningPageState();
  }
}

class LearningPageState extends State<LearningPage>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(

     body: Container(
          margin: const EdgeInsets.all(15.0),
       child: Column(
          
         crossAxisAlignment: CrossAxisAlignment.stretch,
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[

           MaterialButton(
             height: 50.0,
               color: Colors.pink,
               onPressed: startQuiz1,
               child: const Text("Consent", style: TextStyle(fontSize: 18.0, color: Colors.white))
           ),
           MaterialButton(
             height: 50.0,
               color: Colors.pink,
               onPressed: startQuiz2,
               child: const Text("Periods", style: TextStyle(fontSize: 18.0, color: Colors.white))
           )
         ],
       ),
     ),

   );
  }

  void startQuiz1(){
   setState(() {
     Navigator.push(context, MaterialPageRoute(builder: (context)=> Quiz1()));
   });
  }
   void startQuiz2(){
   setState(() {
     Navigator.push(context, MaterialPageRoute(builder: (context)=> Quiz2()));
   });
  }
}