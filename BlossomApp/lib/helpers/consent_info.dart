import 'package:flutter/material.dart';

class Consent extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ConsentState();
  }
}
class ConsentState extends State<Consent> {
  @override
  Widget build(BuildContext context) {
 return Scaffold(
   body: SingleChildScrollView(
            child: Container(padding: const EdgeInsets.all(20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 50,),
                  Text("Consent is a concept not many individuals talk about, but is one everyone needs to understand.", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color.fromARGB(255, 2, 42, 59))),
                ],
                ),
                ),
   ),
 );
              }
              }