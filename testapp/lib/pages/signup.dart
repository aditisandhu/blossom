import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:testapp/pages/login.dart';
import 'package:testapp/views/themebutton.dart';
import 'package:testapp/helpers/loginservice.dart';

import 'navigation_bar.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  final _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    
    LoginService loginService = Provider.of<LoginService>(context, listen:false);

    final nameField = TextFormField(
      autofocus: false,
      controller: nameController,
      onSaved: (value) {
        nameController.text = value!;
      },
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Please enter a name");
        }
        if (!regex.hasMatch(value)) {
          return ("Please enter a valid name (Minimum 3 characters)");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person, color: Colors.white,),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        fillColor: Colors.white,
        hintText: "Full Name",
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

    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailController.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter an email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
            .hasMatch(value)) {
          return ("Please enter a valid email");
        }
        return null;
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
          return ("Please enter a valid password (Minimum 6 characters)");
        }
      },
      textInputAction: TextInputAction.next,
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

    final confirmPassField = TextFormField(
      autofocus: false,
      controller: confirmPassController,
      obscureText: true,
      onSaved: (value) {
        confirmPassController.text = value!;
      },
      validator: (value) {
        if (confirmPassController.text !=
            passController.text) {
          return "Passwords don't match";
        }
        return null;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key, color: Colors.white,),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        fillColor: Colors.white,
        hintText: "Confirm Password",
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
                Text("Let's Get Started!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  )
                ),
                SizedBox(height: 25),
                
                Container(
                  // color: Colors.white,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(child: nameField, margin: EdgeInsets.only(left: 20, right: 20),),
                        SizedBox(height: 15),                        
                        Container(child: emailField, margin: EdgeInsets.only(left: 20, right: 20),),
                        SizedBox(height: 15),
                        Container(child: passField, margin: EdgeInsets.only(left: 20, right: 20),),
                        SizedBox(height: 15),
                        Container(child: confirmPassField, margin: EdgeInsets.only(left: 20, right: 20),),
                        SizedBox(height: 15),
                      ]),
                  ),

                ),

                SizedBox(height: 15),

                ThemeButton(
                  label: 'Sign Up',
                  highlight: Color.fromARGB(255, 237, 211, 210),
                  color: Color.fromARGB(255, 2, 42, 59),
                  onClick: () {
                    signUp(emailController.text, passController.text, nameController.text);
                  },
                ),
                
              ],
            ),
          )
        ],
      )
    ));
  }

  void signUp(String email, String password, String name) async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        
        if (user != null) {
          await _auth.currentUser!.updateDisplayName(name);
          await _auth.currentUser!.updateEmail(email);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Login()));
        }
        
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
