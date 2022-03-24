import 'package:flutter/material.dart';
import 'package:testapp/models/LoginUserModel.dart';
import '../helpers/quiz1.dart';
import '../helpers/quiz2.dart';
import '../helpers/quiz3.dart';
import '../helpers/quiz4.dart';
import '../pages/home_page.dart';

class LearningPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LearningPageState();
  }
}

class LearningPageState extends State<LearningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('My Learning'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            child: buildWelcome(),
          ),
        ),
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
                onPressed: startQuiz1,
                child: const Text("Consent",
                    style: TextStyle(fontSize: 18.0, color: Colors.white))),
            MaterialButton(
                height: 50.0,
                color: Colors.pink,
                onPressed: startQuiz2,
                child: const Text("Periods",
                    style: TextStyle(fontSize: 18.0, color: Colors.white))),
            MaterialButton(
                height: 50.0,
                color: Colors.pink,
                onPressed: startQuiz3,
                child: const Text("Self Care",
                    style: TextStyle(fontSize: 18.0, color: Colors.white))),
            MaterialButton(
                height: 50.0,
                color: Colors.pink,
                onPressed: startQuiz4,
                child: const Text("Contraceptives",
                    style: TextStyle(fontSize: 18.0, color: Colors.white)))
          ],
        ),
      ),
    );
  }

  void startQuiz1() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Quiz1()));
    });
  }

  void startQuiz2() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Quiz2()));
    });
  }

  void startQuiz3() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Quiz3()));
    });
  }

  void startQuiz4() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Quiz4()));
    });
  }

  Widget buildWelcome() => Column(
        children: [
          Text(
            'Hello',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            'Anonymous User!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
        ],
      );
}
