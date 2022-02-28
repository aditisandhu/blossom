import 'package:flutter/material.dart';
import 'home_page.dart';
import 'maps_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);

  static const List<Widget> _pages = <Widget>[
    MyHomePage(title: 'Home Page'),
    Text(
      'Page 2: Track',
      style: optionStyle,
    ),
    Text(
      'Page 3: Learning',
      style: optionStyle,
    ),
    MapSample(),
    Text(
      'Page 5: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
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
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black,),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
