import 'package:flutter/material.dart';
import '../helpers/question1.dart';

class Consent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ConsentState();
  }
}

class ConsentState extends State<Consent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 237, 211, 210),
        elevation: 0,
        title: Text('Consent',
            style: TextStyle(color: Color.fromARGB(255, 2, 42, 59))),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  " Consent is a concept not many individuals talk about, but is one everyone needs to understand. Consent does not only have to pertain to sexual activity, but can pertain to anything in which individuals agree to participate in some activity. Consent should be communicated by both parties in order to understand and respect one another's boundaries.",
                  style: const TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 2, 42, 59)),
                  overflow: TextOverflow.clip),
                  const Padding(padding: const EdgeInsets.all(10.0)),
              TextButton(
                
                onPressed: Question1,
                child: const Text("Check Your Understanding",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 2, 42, 59)), textAlign: TextAlign.center,),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 10)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 237, 211, 210)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ))),
              ),
              const Padding(padding: const EdgeInsets.all(10.0)),
              Text(
                  " Consent cannot be given when an individual is impaired or unaware of their surroundings. If someone consents as a result of pressure from the other party, then that cannot be considered as true consent. Consent also cannot be freely given when there are differences in power between each party. These unequal power dynamics can occur at school or work.",
                  style: const TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 2, 42, 59)),
                  overflow: TextOverflow.clip),
                  TextButton(
                
                onPressed: null,
                child: const Text("Check Your Understanding",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 2, 42, 59)), textAlign: TextAlign.center,),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 10)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 237, 211, 210)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void Question1() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Quiz1()));
    });
  }
}
