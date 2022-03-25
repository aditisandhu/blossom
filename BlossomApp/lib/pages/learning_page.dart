import 'package:flutter/material.dart';
import '../helpers/quiz2.dart';
import '../helpers/quiz3.dart';
import '../helpers/quiz4.dart';
import '../helpers/consent_info.dart';

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
        backgroundColor: Color.fromARGB(255, 237, 211, 210),
        elevation: 0,
        title: Text(
                        "My Learning",
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 222, 116, 116),
                        ),
                      ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(15.0),
        child: GridView(
          primary: false,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 30,
          ),
          children: <Widget>[
            TextButton(
              onPressed: consentInfo,
              child: const Text("Consent",
                  style: TextStyle(
                      fontSize: 18.0, color: Colors.white)),
              style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 222, 116, 116)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
            ),
            TextButton(
              onPressed: startQuiz2,
              child: const Text("Periods",
                  style: TextStyle(
                      fontSize: 18.0, color: Colors.white)),
              style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                     Color.fromARGB(255, 222, 116, 116)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
            ),
            TextButton(
              onPressed: startQuiz3,
              child: const Text("Self Care",
                  style: TextStyle(
                      fontSize: 18.0, color: Colors.white)),
              style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 222, 116, 116)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
            ),
            TextButton(
              onPressed: startQuiz4,
              child: const Text("Contraceptives",
                  style: TextStyle(
                      fontSize: 18.0, color: Colors.white)),
              style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 222, 116, 116)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
            ),
            TextButton(
              onPressed: consentInfo,
              child: const Text("Ovulation",
                  style: TextStyle(
                      fontSize: 18.0, color: Colors.white)),
              style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 222, 116, 116)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
            ),
            TextButton(
              onPressed: consentInfo,
              child: const Text("Safety",
                  style: TextStyle(
                      fontSize: 18.0, color: Colors.white)),
              style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 222, 116, 116)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
            ),
            TextButton(
              onPressed: startQuiz2,
              child: const Text("Period Products",
                  style: TextStyle(
                      fontSize: 18.0, color: Colors.white)),
              style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                     Color.fromARGB(255, 222, 116, 116)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
            ),
            TextButton(
              onPressed: startQuiz3,
              child: const Text("Pregnancy",
                  style: TextStyle(
                      fontSize: 18.0, color: Colors.white)),
              style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 222, 116, 116)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
            ),
          ],
        ),
      ),
    );
  }

  void consentInfo() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Consent()));
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

 
}
