import 'package:flutter/material.dart';
import 'package:testapp/calendar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color:Color.fromARGB(255, 237, 211, 210),
            ),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: RichText(
                  text: TextSpan(
                      text: "Tuesday",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 12,
                          fontWeight: FontWeight.w900),
                      children: [
                        TextSpan(
                          text: " March 22",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                        )
                      ]),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://i.postimg.cc/pLW2sxSN/download-modified.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Cycle",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 222, 116, 116),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Learn more about your cycle",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 185,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: MediaQuery.of(context).size.height - 245,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListView(
              children: [
                buildClassItem1(),
                buildClassItem2(),
                SizedBox(
                  height: 25,
                ),
                buildTitleRow("REMINDERS"),
                SizedBox(
                  height: 20,
                ),
                buildTaskItem3()
              ],
            ),
          ),
        )
      ],
    );
  }

  Container buildTaskItem3() {
    return Container(
     margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(10),
      height: 100,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 237, 211, 210).withOpacity(0.5),
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
            color: Color.fromARGB(255, 237, 211, 210).withOpacity(0.5),
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
    );
  }

  Row buildTitleRow(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
              text: title,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal),
                ),
              ]),
        ),
      ],
    );
  }

  Container buildClassItem1() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(10),
      height: 250,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 237, 211, 210).withOpacity(0.5),
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
            color: Color.fromARGB(255, 237, 211, 210).withOpacity(0.5),
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
    );
  }
Container buildClassItem2() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(10),
      height: 60,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 237, 211, 210).withOpacity(0.5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(child: Text('Add Period Details', style: TextStyle(fontSize: 13, color: Color.fromARGB(255, 2, 42, 59)))),
    );
  }
}