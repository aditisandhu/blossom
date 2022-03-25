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
      backgroundColor: Color.fromARGB(255, 237, 211, 210),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90), 
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 237, 211, 210),
            border: Border.all(
              color: const Color.fromARGB(255, 237, 211, 210),
            ),
            borderRadius:
                const BorderRadius.all(Radius.circular(20))
                ),
          child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 35,),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://www.pngall.com/wp-content/uploads/5/Learning-PNG-Free-Image.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                          "My Learning",
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 222, 116, 116),
                          ),
                        ),
            ],
          )]),
        )
      ),

      body: Container(
        padding: const EdgeInsets.all(15),
        margin: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          border: Border.all(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          borderRadius:
              const BorderRadius.all(Radius.circular(20))
              ),
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
                      fontSize: 17.0, color: Colors.white)),
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
              child: const Text("Period Products", textAlign: TextAlign.center,
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
