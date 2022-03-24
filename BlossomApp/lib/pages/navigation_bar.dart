import 'package:flutter/material.dart';
import 'package:testapp/pages/tracker.dart';
import 'learning_page.dart';
import 'home_page.dart';
import 'maps_page.dart';

class NavHome extends StatefulWidget {
  const NavHome({Key? key}) : super(key: key);

  @override
  State createState() {
    return NavHomeState();
  }
}

class NavHomeState extends State<NavHome> {

  int selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);

  // ignore: prefer_final_fields
  static List<Widget> _pages = <Widget>[
    const MyHomePage(title: 'Home Page'),
    Tracker(),
    LearningPage(),
    const MapSample(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes, color: Colors.black,),
            label: 'Track',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_library, color: Colors.black,),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on, color: Colors.black,),
            label: 'Map',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        onTap: onItemTapped,
      ),
    );
  }
}
