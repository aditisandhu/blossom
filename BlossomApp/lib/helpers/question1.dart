import 'package:flutter/material.dart';
import 'package:testapp/helpers/final_page.dart';

import 'consent_info.dart';

var finalScore = 0;
var questionNumber = 0;
var quiz = ConsentQuiz();

class ConsentQuiz{

  var questions = [
    "What is consent?",
  ];


  var choices = [
    ["Consent is when all individuals in question disagree to engage in some activity.", 
     "Consent is when all individuals in question agree to engage in some activity.",
     "Consent is when some individuals in question disagree to engage in some activity.",
     "Consent is when some individuals in question agree to engage in some activity."],
  ];


  var correctAnswers = [
    "Consent is when all individuals in question agree to engage in some activity."
  ];
}

class Quiz1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Quiz1State();
  }
}

class Quiz1State extends State<Quiz1> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(

          body: Container(
            
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: Column(
              children: <Widget>[

        
                const Padding(padding: EdgeInsets.all(10.0)),

                Text(quiz.questions[questionNumber],
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),),

                const Padding(padding: const EdgeInsets.all(10.0)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //button 1
                    Container(
                      width: 180.0,
                      height: 220.0,
                      child: TextButton(
                        style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 2, 42, 59)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
                        onPressed: (){
                          if(quiz.choices[questionNumber][0] == quiz.correctAnswers[questionNumber]){
                            debugPrint("Correct");
                            finalScore++;
                          }else{
                            debugPrint("Wrong");
                          }
                          updateQuestion();
                        },
                        
                        child: Text(quiz.choices[questionNumber][0],
                          style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.white
                          ),
                          textAlign: TextAlign.center),
                      ),
                    ),

                    //button 2
                    Container(
                      width: 180.0,
                      height: 220.0,
                      child: TextButton(
                        style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 2, 42, 59)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
                        onPressed: (){
                    
                          if(quiz.choices[questionNumber][1] == quiz.correctAnswers[questionNumber]){
                            debugPrint("Correct");
                            finalScore++;
                          }else{
                            debugPrint("Wrong");
                          }
                          updateQuestion();
                        },
                       
                        child: Text(quiz.choices[questionNumber][1],
                          style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.white
                          ),textAlign: TextAlign.center),
                      ),
                    ),

                  ],
                ),

                const Padding(padding: EdgeInsets.all(10.0)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    //button 3
                    Container(
                      width: 180.0,
                      height: 220.0,
                      child: TextButton(
                        style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 2, 42, 59)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
                        onPressed: (){
                    
                          if(quiz.choices[questionNumber][2] == quiz.correctAnswers[questionNumber]){
                            debugPrint("Correct");
                            finalScore++;
                          }else{
                            debugPrint("Wrong");
                          }
                          updateQuestion();
                        },
                      
                        child: Text(quiz.choices[questionNumber][2],
                          style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.white
                          ),textAlign: TextAlign.center),
                      ),
                    ),

                    //button 4
                    Container(
                      width: 180.0,
                      height: 220.0,
                      child: TextButton(
                        style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 2, 42, 59)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
                        onPressed: (){
                    
                          if(quiz.choices[questionNumber][3] == quiz.correctAnswers[questionNumber]){
                            debugPrint("Correct");
                            finalScore++;
                          }else{
                            debugPrint("Wrong");
                          }
                          updateQuestion();
                        },
                                     
                        child: Text(quiz.choices[questionNumber][3],
                          style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.white
                          ),textAlign: TextAlign.center),
                      ),
                    ),

                  ],
                ),

                const Padding(padding: const EdgeInsets.all(15.0)),

                Container(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                        style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 222, 116, 116)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
                      onPressed: consentInfo,
                      child: const Text("Quit",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white
                        ), textAlign: TextAlign.center,),
                  )
                ),




              ],
            ),
          ),

      )
    );
  }

  void resetQuiz(){
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
    });
  }



  void updateQuestion(){
    setState(() {
      if(questionNumber == quiz.questions.length - 1){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> FinalPage(score: finalScore,)));

      }else{
        questionNumber++;
      }
    });
  }
   void consentInfo() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Consent()));
    });
  }
}
