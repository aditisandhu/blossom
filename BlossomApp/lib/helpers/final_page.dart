import 'package:flutter/material.dart';
import 'package:testapp/pages/learning_page.dart';
import 'package:testapp/pages/navigation_bar.dart';

import 'consent_info.dart';
class FinalPage extends StatefulWidget {
  final int score;
  FinalPage({Key? key, required this.score}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    
    return FinalPageState();
  }
}

class FinalPageState extends State<FinalPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (body: Container(margin: EdgeInsets.all(20),
    
          child: Column(
            
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[  
                     
const Padding(padding: EdgeInsets.all(100.0)),
              TextButton(
                        style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 222, 116, 116)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ))),
                onPressed: consentInfo,
                child: const Text("Go back to the Consent Learning Page",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white
                  ),
                  textAlign: TextAlign.center,),
                  )

            ],
       
        ),
),);
}
  void consentInfo() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => NavHome(passedIndex: 2,)));
    });
  }
}