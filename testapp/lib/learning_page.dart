import 'package:flutter/material.dart';
import 'quiz1.dart';

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
     appBar: AppBar(
       title: const Text("Multiple Choice Quiz"),
       backgroundColor: Colors.blue,
     ),


     body: Container(
          margin: const EdgeInsets.all(15.0),
       child: Column(
          
         crossAxisAlignment: CrossAxisAlignment.stretch,
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[

           MaterialButton(
             height: 50.0,
               color: Colors.pink,
               onPressed: startQuiz,
               child: const Text("Quiz 1", style: TextStyle(fontSize: 18.0, color: Colors.white))
           )
         ],
       ),
     ),


   );
  }

  void startQuiz(){
   setState(() {
     Navigator.push(context, MaterialPageRoute(builder: (context)=> Quiz1()));
   });
  }
}