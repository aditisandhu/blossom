import 'package:flutter/material.dart';
import 'package:testapp/login.dart';
import 'package:testapp/loginservice.dart';
import 'package:provider/provider.dart';
import './navigation_bar.dart';
import './themebutton.dart';
import 'LoginUserModel.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({ Key? key }) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {

    LoginService loginService = Provider.of<LoginService>(context, listen:false);

    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                'assets/background.jpg',
                fit: BoxFit.cover),
                // child: Container(color: Color.fromARGB(255, 113, 169, 196)),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: ClipOval(
                      child: Container(
                        width: 180,
                        height: 180,
                        // color: Color.fromARGB(255, 237, 211, 210),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          // color: Color.fromARGB(255, 255, 255, 255),
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
                  SizedBox(height: 50),
                  Text('Blossom',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  SizedBox(height: 40),
                  ThemeButton(
                    label: 'Login With Google',
                    highlight: Color.fromARGB(255, 2, 42, 59),
                    color: Color.fromARGB(255, 237, 211, 210),
                    labelColor: Color.fromARGB(255, 0, 0, 0),
                    onClick: () async {
                      bool success = await loginService.signInWithGoogle();

                      if (success) {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => NavHome())
                        );
                      }
                    },
                  ),
                  ThemeButton(
                    label: "Login With Email",
                    labelColor: Color.fromARGB(255, 237, 211, 210),
                    color: Colors.transparent,
                    highlight: Color.fromARGB(255, 237, 211, 210).withOpacity(0.5),
                    borderColor: Color.fromARGB(255, 237, 211, 210),
                    borderWidth: 4,
                    onClick: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => Login(),));
                    }
                  ),
                  ThemeButton(
                    label: 'Continue As Guest',
                    highlight: Color.fromARGB(255, 237, 211, 210),
                    color: Color.fromARGB(255, 2, 42, 59),
                    onClick: () {
                      loginService.signInAsGuest();
                      
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => NavHome(),));
                    },
                  ),
                ],
              ),
            )
          ],
        )
      )
    );
  }
}