import 'package:flutter/material.dart';
import '../helpers/question1.dart';
import '../views/themebutton.dart';

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
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 2, 42, 59)
        ),
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
              
              Center(
                child: ThemeButton(
                    label: 'Check Your Understanding',
                    highlight: Color.fromARGB(255, 237, 211, 210),
                    color: Color.fromARGB(255, 2, 42, 59),
                    onClick: Question1,
                  ),
              ),
              const Padding(padding: const EdgeInsets.all(10.0)),
              Text(
                  " Consent cannot be given when an individual is impaired or unaware of their surroundings. If someone consents as a result of pressure from the other party, then that cannot be considered as true consent. Consent also cannot be freely given when there are differences in power between each party. These unequal power dynamics can occur at school or work.",
                  style: const TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 2, 42, 59)),
                  overflow: TextOverflow.clip),

              SizedBox(height: 20,),  
              
              Center(
                child: ThemeButton(
                    label: 'Check Your Understanding',
                    highlight: Color.fromARGB(255, 237, 211, 210),
                    color: Color.fromARGB(255, 2, 42, 59),
                    onClick: () {},
                  ),
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
