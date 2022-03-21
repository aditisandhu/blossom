// ignore_for_file: unused_import

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/LoginUserModel.dart';
import 'package:testapp/loginservice.dart';
import './navigation_bar.dart';
import './news.dart';
import './news_widget.dart';
import './article.dart';

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

    LoginService loginService = Provider.of<LoginService>(context, listen:false);
    LoginUserModel userModel = loginService.loggedInUserModel;

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
                  
                const SizedBox(height: 70,),
                Text("Welcome, ${userModel.displayName}!", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Color.fromARGB(255, 2, 42, 59))),
        
                const SizedBox(height: 40,),
                const Text("Daily Question", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color.fromARGB(255, 2, 42, 59))),
                
                const SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 237, 211, 210),
                    border: Border.all(
                      color: const Color.fromARGB(255, 237, 211, 210),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))
                  ),
                  child: Center(child: Text('Add Question Here', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color.fromARGB(255, 2, 42, 59)))),

                ),
        
                const SizedBox(height: 40,),
                const Text("Reminders", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color.fromARGB(255, 2, 42, 59))),
                
                const SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 237, 211, 210),
                    border: Border.all(
                      color: const Color.fromARGB(255, 237, 211, 210),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))
                  ),
                  child: Center(child: Text('Next Cycle In:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color.fromARGB(255, 2, 42, 59)))),
                ),
        
                const SizedBox(height: 40,),
                const Text("Latest Stories", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color.fromARGB(255, 2, 42, 59))),
                
                SafeArea(
                  child: _loading 
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                    margin: const EdgeInsets.only(top: 1),
                    width: double.infinity,
                    child: SingleChildScrollView( scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        for (int index=0; index<min(10, newslist.length); index++)
                        NewsTile(
                          imgUrl: newslist[index].urlToImage ?? "",
                          title: newslist[index].title ?? "",
                          desc: newslist[index].description ?? "",
                          content: newslist[index].content ?? "",
                          posturl: newslist[index].articleUrl ?? "",
                        )
                      ],),
                    )
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
              const SizedBox(height: 80,),

              Text("Name: ${username}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color.fromARGB(255, 2, 42, 59))),

            ]
          ),
        )
      ),
    );
  }

}