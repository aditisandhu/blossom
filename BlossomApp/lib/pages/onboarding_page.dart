import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/models/onboardingcontent.dart';
import 'package:testapp/views/themebutton.dart';
import 'package:smart_select/smart_select.dart';

import '../helpers/loginservice.dart';
import '../models/LoginUserModel.dart';
import 'navigation_bar.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({ Key? key }) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {

  double _age = 10;

  int pageIndex = 0;
  late PageController _controller;

  int? _value = 0;

  filterChipWidget q1 = filterChipWidget(chipName: 'What are periods?');
  filterChipWidget q2 = filterChipWidget(chipName: 'Pain & Cramps');
  filterChipWidget q3 = filterChipWidget(chipName: 'Period Products');
  filterChipWidget q4 = filterChipWidget(chipName: 'Birth Control');
  filterChipWidget q5 = filterChipWidget(chipName: 'Family Planning');

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LoginService loginService = Provider.of<LoginService>(context, listen:false);
    LoginUserModel userModel = loginService.loggedInUserModel;

    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUserData() {
      // Call the user's CollectionReference to add a new user
      return users
        .doc(userModel.userId).set({
          'age': _age, 
          'started_period': _value==1,
          'learning': [q1.isSelected, q2.isSelected, q3.isSelected, q4.isSelected, q5.isSelected]
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
    }

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40),
          Center(
            child: ClipOval(
              child: Container(
                width: 80,
                height: 80,
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

          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (int page) {
                setState(() {
                  pageIndex = page;
                });
              },
              children: [
                
                Container(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                  margin: EdgeInsets.fromLTRB(40, 30, 40, 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 237, 211, 210),
                        blurRadius: 20,
                        offset: Offset.zero
                      )
                    ]
                  ),
                  child: Column(
                    children: [
                      Text("How old are you?", textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 2, 42, 59)),),
                      SizedBox(height: 170,),
                      Text(_age.toInt().toString(), textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 2, 42, 59)),),
                      Slider(
                        value: _age,
                        thumbColor: Color.fromARGB(255, 228, 118, 118),
                        activeColor: Color.fromARGB(255, 228, 118, 118),
                        inactiveColor: Color.fromARGB(255, 2, 42, 59),
                        min: 5,
                        max: 20,
                        divisions: 15,
                        label: _age.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _age = value;
                          });
                        },
                      )
                    ],
                  ),
                ),


                Container(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                  margin: EdgeInsets.fromLTRB(40, 30, 40, 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 237, 211, 210),
                        blurRadius: 20,
                        offset: Offset.zero
                      )
                    ]
                  ),
                  child: Column(
                    children: [
                      Text("Have you started your period?", textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 2, 42, 59)),),
                      SizedBox(height: 120,),

                      Column(
                        children: [
                          ChoiceChip(
                            label: Text('Yes'),
                            selected: _value == 1,
                            onSelected: (bool selected) {
                              setState(() {
                                _value = selected ? 1 : null;
                              });
                            },
                            labelStyle: TextStyle(color: Color.fromARGB(255, 2, 42, 59), fontSize: 22, fontWeight: FontWeight.bold),
                            labelPadding: EdgeInsets.fromLTRB(80, 10, 80, 10),
                            selectedColor: Color.fromARGB(255, 228, 118, 118),
                            backgroundColor: Color.fromARGB(255, 241, 218, 217),
                          ),
                          SizedBox(height: 20,),
                          ChoiceChip(
                            label: Text('No'),
                            labelStyle: TextStyle(color: Color.fromARGB(255, 2, 42, 59), fontSize: 22, fontWeight: FontWeight.bold),
                            labelPadding: EdgeInsets.fromLTRB(85, 10, 85, 10),
                            selected: _value == 2,
                            onSelected: (bool selected) {
                              setState(() {
                                _value = selected ? 2 : null;
                              });
                            },
                            selectedColor: Color.fromARGB(255, 228, 118, 118),
                            backgroundColor: Color.fromARGB(255, 241, 218, 217),
                          ),
                        ]
                      )
                      
                    ],
                  ),
                ),


                Container(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                  margin: EdgeInsets.fromLTRB(40, 30, 40, 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 237, 211, 210),
                        blurRadius: 20,
                        offset: Offset.zero
                      )
                    ]
                  ),
                  child: Column(
                    children: [
                      Text("What would you like to learn more about?", textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 2, 42, 59)),),
                      SizedBox(height: 25,),
                      Container(
                        child: Wrap(
                          spacing: 5.0,
                          runSpacing: 5.0,
                          children: <Widget>[
                            // filterChipWidget(chipName: 'What are periods?'),
                            q1,
                            q2,
                            q3,
                            q4,
                            q5,
                          ],
                        ),
                      ),
                      SizedBox(height: 40,),
                      ThemeButton(
                        label: 'Save & Proceed',
                        highlight: Color.fromARGB(255, 237, 211, 210),
                        color: Color.fromARGB(255, 2, 42, 59),
                        onClick: () {
                          addUserData();                          
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => NavHome(),));
                        },
                      ),
                    ],
                  ),
                ),
              ]
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) => 
                GestureDetector(
                  onTap: () {
                    _controller.animateTo(
                      MediaQuery.of(context).size.width * index,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut
                    );
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 228, 118, 118),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        width: 6,
                        color: pageIndex == index ? Color.fromARGB(255, 241, 218, 217) : Theme.of(context).canvasColor
                      )
                    ),
                  ),
                )),
            ),

            SizedBox(height: 20)
           
        ],
      )
    );
  }
  

}

class filterChipWidget extends StatefulWidget {
  final String chipName;
  var isSelected = false;

  filterChipWidget({Key? key, required this.chipName}) : super(key: key);

  @override
  _filterChipWidgetState createState() => _filterChipWidgetState();
}

class _filterChipWidgetState extends State<filterChipWidget> {

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipName),
      selected: widget.isSelected,
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            30.0),),
      onSelected: (isSelected) {
        setState(() {
          widget.isSelected = isSelected;
        });
      },
      labelStyle: TextStyle(color: Color.fromARGB(255, 2, 42, 59), fontSize: 18, fontWeight: FontWeight.bold),
      // labelPadding: EdgeInsets.fromLTRB(20, 10, 80, 10),
      selectedColor: Color.fromARGB(255, 228, 118, 118),
      backgroundColor: Color.fromARGB(255, 241, 218, 217),
    );
  }
}