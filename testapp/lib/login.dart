import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:testapp/signup.dart';
import 'package:testapp/themebutton.dart';
import 'package:testapp/loginservice.dart';

import 'navigation_bar.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    
    LoginService loginService = Provider.of<LoginService>(context, listen:false);

    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter a email");
        }

        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter a valid email");
        }
      },
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail, color: Colors.white,),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        fillColor: Colors.white,
        hintText: "Email",
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white)
        ),
      ),
      style: TextStyle(color: Colors.white),
    );

    final passField = TextFormField(
      autofocus: false,
      controller: passController,
      obscureText: true,
      onSaved: (value) {
        passController.text = value!;
      },
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Please enter a password");
        }
        if (!regex.hasMatch(value)) {
          return ("Please enter a valid password (minimum 6 characters)");
        }
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key, color: Colors.white,),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        fillColor: Colors.white,
        hintText: "Password",
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white)
        ),
      ),
      style: TextStyle(color: Colors.white),
    );

    return Scaffold(body: Container(
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
                      width: 150,
                      height: 150,
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
                SizedBox(height: 10),
                Text('Blossom',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  )
                ),
                SizedBox(height: 10),
                
                Container(
                  // color: Colors.white,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(child: emailField, margin: EdgeInsets.only(left: 20, right: 20),),
                        SizedBox(height: 10),
                        Container(child: passField, margin: EdgeInsets.only(left: 20, right: 20),),
                      ]),
                  ),

                ),

                SizedBox(height: 10),

                ThemeButton(
                  label: 'Login',
                  highlight: Color.fromARGB(255, 237, 211, 210),
                  color: Color.fromARGB(255, 2, 42, 59),
                  onClick: () {
                    SignInWithEmail(emailController.text, passController.text);
                  },
                ),

                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("Don't have an account? ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    )
                  ),

                  GestureDetector(
                    child: Text("Sign Up!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                    },
                  )
                ],)
                
              ],
            ),
          )
        ],
      )
    ));
  }

  void SignInWithEmail(String email, String password) async {

    LoginService loginService = Provider.of<LoginService>(context, listen:false);

    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
              loginService.emailSignIn(uid.user!.displayName ?? "Unknown Name", uid.user!.email ?? "Unkown Email"),
              Fluttertoast.showToast(msg: "Login Successful"),
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => NavHome())),
          });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

}
