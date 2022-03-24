import 'package:flutter/material.dart';


var finalScore = 0;
var questionNumber = 0;
var quiz = SelfCareQuiz();

class SelfCareQuiz{

  var questions = [
    "Why does blood come out during the period?",
    "An individual can get pregnant while on their period.",
    "What foods are good to eat during the period?",
    "What are blood clots and why do they occur?",
  ];


  var choices = [
    ["When a fertilized egg does not attach itself to the uterus lining, the lining breaks down and bleeds.", 
     "There is a build-up of testosterone in the uterus.",
     "When a fertilized egg does attach itself to the uterus lining, the lining breaks down and bleeds.",
     "Hormones in the body stay the same"],
    ["Yes, an individual is actually more likely to get pregnant while on their period.",
     "No, an individual cannot get pregant on their period.",
     "Yes, because sperm can live inside an indivual for up to 72 hours after ejaculation.",
     "No, because sperm cannot live inside an individual after ejaculation."],
    ["Spicy foods",
     "Red meat",
     "Fruits and leafy-green vegetables",
     "Coffee"],
    ["Blood clots are large eggs. They occur when the body is unable to thin the material coming out of the uterus slow enough.",
     "Blood clots are small eggs. They occur when the body is unable to thin the material coming out of the uterus fast enough.",
     "Blood clots are large blobs of tissue and blood. They occur when the body does not thin the material coming out slow enough.",
     "Blood clots are small blobs of tissue and blood. They occur when the body does not thin the material coming out fast enough."]
  ];


  var correctAnswers = [
    "When a fertilized egg does not attach itself to the uterus lining, the lining breaks down and bleeds.",
    "Yes, because sperm can live inside an indivual for up to 72 hours after ejaculation.",
    "Fruits and leafy-green vegetables",
    "Blood clots are small blobs tissue and blood. They occur when the body is unable to thin the material coming out of the uterus fast enough."
  ];
}

class Quiz3 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Quiz3State();
  }
}

class Quiz3State extends State<Quiz3> {
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
                const Padding(padding: const EdgeInsets.all(20.0)),

                Container(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Text("Question ${questionNumber + 1} of ${quiz.questions.length}",
                        style: const TextStyle(
                            fontSize: 22.0
                        ),),

                      Text("Score: $finalScore",
                        style: const TextStyle(
                            fontSize: 22.0
                        ),)
                    ],
                  ),
                ),

                const Padding(padding: EdgeInsets.all(10.0)),

                Text(quiz.questions[questionNumber],
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),),

                const Padding(padding: const EdgeInsets.all(10.0)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //button 1
                    Container(
                      width: 180.0,
                      height: 240.0,
                      child: MaterialButton(
                        color: Colors.blueGrey,
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
                          ),),
                      ),
                    ),

                    //button 2
                    Container(
                      width: 180.0,
                      height: 240.0,
                      child: MaterialButton(
                        color: Colors.blueGrey,
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
                          ),),
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
                      height: 240.0,
                      child: MaterialButton(
                        color: Colors.blueGrey,
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
                          ),),
                      ),
                    ),

                    //button 4
                    Container(
                      width: 180.0,
                      height: 240.0,
                      child: MaterialButton(
                        color: Colors.blueGrey,
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
                          ),),
                      ),
                    ),

                  ],
                ),

                const Padding(padding: const EdgeInsets.all(15.0)),

                Container(
                  alignment: Alignment.bottomCenter,
                  child:  MaterialButton(
                      minWidth: 240.0,
                      height: 30.0,
                      color: Colors.red,
                      onPressed: resetQuiz,
                      child: const Text("Quit",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white
                        ),)
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
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Summary(score: finalScore,)));

      }else{
        questionNumber++;
      }
    });
  }
}


class Summary extends StatelessWidget{
  final int score;
  Summary({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(

        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text("Final Score: $score",
                style: const TextStyle(
                    fontSize: 35.0
                ),),

              const Padding(padding: EdgeInsets.all(30.0)),

              MaterialButton(
                color: Colors.red,
                onPressed: (){
                  questionNumber = 0;
                  finalScore = 0;
                  Navigator.pop(context);
                },
                child: const Text("Reset Quiz",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white
                  ),),)

            ],
          ),
        ),


      ),
    );
  }


}