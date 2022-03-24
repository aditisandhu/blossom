import 'package:flutter/material.dart';
import 'package:testapp/pages/calendar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:testapp/pages/event.dart';
//import 'package:testapp/models/LoginUserModel.dart';
//import 'package:testapp/helpers/loginservice.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:provider/provider.dart';

//LoginService loginService = Provider.of<LoginService>(context, listen:false);
//LoginUserModel userModel = loginService.loggedInUserModel;

//CollectionReference users = FirebaseFirestore.instance.collection('users');

class Tracker extends StatefulWidget {
  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();

  get floatingActionButton => null;

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }
  
  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }
  
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
              SizedBox(
                height: 10,
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
                          fontSize: 27,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 222, 116, 116),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Keep track of your period and how you feel.",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "You'll begin to notice your personal trends!",
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
              ],
            ),
          ),
        )
      ],
    );
  }

  
  Container buildClassItem1() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(10),
      height: 425,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 237, 211, 210).withOpacity(0.5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: 425,
              width: 300,
              child: TableCalendar(
                shouldFillViewport: true,
                focusedDay: selectedDay,
                firstDay: DateTime(2000),
                lastDay: DateTime(2050),
                calendarFormat: format,
                onFormatChanged: (CalendarFormat _format) {
                  setState(() {
                    format = _format;
                  });
                },
                startingDayOfWeek: StartingDayOfWeek.sunday,
                daysOfWeekVisible: true,

                //Day Changed
                onDaySelected: (DateTime selectDay, DateTime focusDay) {
                  setState(() {
                    selectedDay = selectDay;
                    focusedDay = focusDay;
                  });
                  print(focusedDay);
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(selectedDay, date);
                },

                eventLoader: _getEventsfromDay,

                //To style the Calendar
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                    color: Color.fromARGB(255, 222, 116, 116),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  selectedTextStyle: TextStyle(color: Colors.white),
                  todayDecoration: BoxDecoration(
                    color: Color.fromARGB(253, 238, 170, 98),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  defaultDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  weekendDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: true,
                  titleCentered: true,
                  formatButtonShowsNext: false,
                  formatButtonDecoration: BoxDecoration(
                    color: Color.fromARGB(255, 222, 116, 116),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  formatButtonTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          ..._getEventsfromDay(selectedDay).map(
            (Event event) => ListTile(
              title: Text(
                event.title,
              ),
            ),
          ),
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
      child: new RawMaterialButton( //Center(child: Text('Add Period Details', style: TextStyle(fontSize: 13, color: Color.fromARGB(255, 2, 42, 59)))),
        //floatingActionButton: FloatingActionButton.extended(
          child:Text("Add Period Details"),
          onPressed: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Details"),
              backgroundColor: Color.fromARGB(255, 237, 211, 210), 
              content: TextFormField(
                controller: _eventController,
              ),
              actions: [
                TextButton(
                  child: Text("Cancel"),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    if (_eventController.text.isEmpty) {

                    } else {
                      if (selectedEvents[selectedDay] != null) {
                        selectedEvents[selectedDay]!.add(
                          Event(title: _eventController.text),
                        );
                      } else {
                        selectedEvents[selectedDay] = [
                          Event(title: _eventController.text)
                        ];
                      }

                    }
                    Navigator.pop(context);
                    _eventController.clear();
                    setState((){});
                    return;
                  },
                ),
              ],
            ),
          ),
        //),
      ),
    );
  }
}