import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  int? duration = 0;
  Widget goToPage;

  SplashPage({ required this.goToPage, this.duration });

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: this.duration!), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => this.goToPage)
      );
    });

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 211, 210),
      body: Center(
        child: ClipOval(
          child: Container(
            width: 180,
            height: 180,
            // color: Color.fromARGB(255, 237, 211, 210),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/Logo.png'),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
      
    );
  }
}