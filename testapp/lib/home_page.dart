import 'package:flutter/material.dart';
import './navigation_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String username = 'Jinal';
  bool profilePageFlag = false;

  profilePageRequested() {
    setState(() {
      profilePageFlag = true;
    });
  }

  homePageRequested() {
    setState(() {
      profilePageFlag = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (profilePageFlag) { return profilePage(); }

    else {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: profilePageRequested,
          child: const Icon(Icons.person),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,

        body: SingleChildScrollView(
          child: Container(padding: const EdgeInsets.all(20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  
                SizedBox(height: 70,),
                Text("Welcome, ${username}!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Color.fromARGB(255, 2, 42, 59))),
        
                SizedBox(height: 40,),
                Text("Daily Question", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color.fromARGB(255, 2, 42, 59))),
                
                SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 237, 211, 210),
                    border: Border.all(
                      color: Color.fromARGB(255, 237, 211, 210),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                ),
        
                SizedBox(height: 40,),
                Text("Key Accomplishments", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color.fromARGB(255, 2, 42, 59))),
                
                SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 237, 211, 210),
                    border: Border.all(
                      color: Color.fromARGB(255, 237, 211, 210),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                ),
        
                SizedBox(height: 40,),
                Text("Latest Stories", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color.fromARGB(255, 2, 42, 59))),
                
                SizedBox(height: 10,),
                for (int i=0; i<5; i++)
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 75,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 237, 211, 210),
                    border: Border.all(
                      color: Color.fromARGB(255, 237, 211, 210),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget profilePage() {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: homePageRequested,
        child: const Icon(Icons.arrow_back),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,

      body: SingleChildScrollView(child: 
        Container(padding: const EdgeInsets.all(20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80,),

              Text("Name: ${username}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color.fromARGB(255, 2, 42, 59))),

            ]
          ),
        )
      ),
    );
  }

}