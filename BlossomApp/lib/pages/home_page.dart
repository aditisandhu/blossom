// ignore_for_file: unused_import

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/helpers/daily_queston.dart';
import 'package:testapp/models/LoginUserModel.dart';
import 'package:testapp/helpers/loginservice.dart';
import '../views/themebutton.dart';
import './navigation_bar.dart';
import '../helpers/news.dart';
import '../views/news_widget.dart';
import '../models/article.dart';
import 'onboarding_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String username = 'Jinal';
  bool profilePageFlag = false;
  var newslist;
  bool _loading = true;

  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    // TODO: implement initState
    super.initState();
    getNews();
  }

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
    LoginService loginService =
        Provider.of<LoginService>(context, listen: false);
    LoginUserModel userModel = loginService.loggedInUserModel;

    if (profilePageFlag) {
      return profilePage();
    } else {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: profilePageRequested,
          child: const Icon(Icons.person),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 70,
                ),
                Text("Welcome, ${userModel.displayName}!",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color.fromARGB(255, 2, 42, 59))),
                const SizedBox(
                  height: 40,
                ),
                const Text("Daily Question",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color.fromARGB(255, 2, 42, 59))),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 237, 211, 210),
                      border: Border.all(
                        color: const Color.fromARGB(255, 237, 211, 210),
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))
                          ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
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
                      const SizedBox(
                        width: 20,
                      ),
                      Center(
                        child: TextButton(
                          child: Text('Question \nNumber 31',
                          overflow: TextOverflow.clip,
                              style: const TextStyle(
                                  fontSize: 30.0,
                                  color: Color.fromARGB(255, 2, 42, 59)
                              ),
                              textAlign: TextAlign. center),
                            style: ButtonStyle(
                                
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ))),
                            onPressed: (dailyQuestion), 
                            ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40,),

                const Text("Reminders", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color.fromARGB(255, 2, 42, 59))),

                const SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.only(bottom: 15),
                  padding: EdgeInsets.all(10),
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 237, 211, 210),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "31",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "MAR",
                            style:
                                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                        ],
                      ),
                      Container(
                        height: 100,
                        width: 1,
                        color: Color.fromARGB(255, 237, 211, 210).withOpacity(0.1),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 160,
                            child: Text(
                              "Upcoming cycle details",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today_outlined,
                                color: Colors.grey,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width - 160,
                                child: Text(
                                  "Start date: March 31",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.grey, fontSize: 13),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_outlined,
                                color: Colors.grey,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Est. length: 3 days",
                                style: TextStyle(color: Colors.grey, fontSize: 13),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(
                  height: 40,
                ),
                const Text("Latest Stories",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color.fromARGB(255, 2, 42, 59))),
                SafeArea(
                  child: _loading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          margin: const EdgeInsets.only(top: 1),
                          width: double.infinity,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (int index = 0;
                                    index < min(10, newslist.length);
                                    index++)
                                  NewsTile(
                                    imgUrl: newslist[index].urlToImage ?? "",
                                    title: newslist[index].title ?? "",
                                    desc: newslist[index].description ?? "",
                                    content: newslist[index].content ?? "",
                                    posturl: newslist[index].articleUrl ?? "",
                                  )
                              ],
                            ),
                          )),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget profilePage() {
    LoginService loginService =
        Provider.of<LoginService>(context, listen: false);
    LoginUserModel userModel = loginService.loggedInUserModel;

    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: homePageRequested,
        child: const Icon(Icons.arrow_back),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 50,
          ),
          Center(
              child: Text(
            "Profile Data",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 2, 42, 59)),
          )),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text("Name: ",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color.fromARGB(255, 2, 42, 59))),
              Text("${userModel.displayName}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color.fromARGB(255, 228, 118, 118))),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text("Email: ",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color.fromARGB(255, 2, 42, 59))),
              Text("${userModel.email}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color.fromARGB(255, 228, 118, 118))),
            ],
          ),
          FutureBuilder<DocumentSnapshot>(
            future: users.doc(userModel.userId).get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("Something went wrong");
              }

              if (snapshot.hasData && !snapshot.data!.exists) {
                return Text("Document does not exist");
              }

              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text("Age: ",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color.fromARGB(255, 2, 42, 59))),
                        Text("${data['age'].toInt().toString()}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color.fromARGB(255, 228, 118, 118))),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (data['started_period'] ||
                        data['started_period'] == "Anonymous") ...[
                      Row(
                        children: [
                          Text("Started Period: ",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 2, 42, 59))),
                          Text("Yes",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 228, 118, 118))),
                        ],
                      ),
                    ] else ...[
                      Row(
                        children: [
                          Text("Started Period: ",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 2, 42, 59))),
                          Text("No",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 228, 118, 118))),
                        ],
                      ),
                    ],
                    const SizedBox(
                      height: 20,
                    ),
                    Text("What Do You Want To Learn?",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color.fromARGB(255, 2, 42, 59))),
                    const SizedBox(
                      height: 10,
                    ),
                    if (data['learning'][0]) ...[
                      Row(
                        children: [
                          Icon(Icons.check),
                          Text("What are periods?",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 228, 118, 118))),
                        ],
                      ),
                    ],
                    if (data['learning'][1]) ...[
                      Row(
                        children: [
                          Icon(Icons.check),
                          Text("Pain & Cramps",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 228, 118, 118))),
                        ],
                      ),
                    ],
                    if (data['learning'][2]) ...[
                      Row(
                        children: [
                          Icon(Icons.check),
                          Text("Period Products",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 228, 118, 118))),
                        ],
                      ),
                    ],
                    if (data['learning'][3]) ...[
                      Row(
                        children: [
                          Icon(Icons.check),
                          Text("Birth Control",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 228, 118, 118))),
                        ],
                      ),
                    ],
                    if (data['learning'][4]) ...[
                      Row(
                        children: [
                          Icon(Icons.check),
                          Text("Family Planning",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 228, 118, 118))),
                        ],
                      ),
                    ]
                  ],
                );
              }

              return Text("loading");
            },
          ),
          const SizedBox(
            height: 50,
          ),
          ThemeButton(
              label: 'Update Profile',
              highlight: Color.fromARGB(255, 2, 42, 59),
              color: Color.fromARGB(255, 237, 211, 210),
              labelColor: Color.fromARGB(255, 0, 0, 0),
              onClick: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OnboardingPage()));
              }),
        ]),
      )),
    );
  }
  void dailyQuestion() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Quiz5()));
    });
  }
}
