import 'package:flutter/material.dart';
import './home.dart';

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
      'Index 1: Games',
      style: optionStyle,
    ),
    Text(
      'Index 2: Map',
      style: optionStyle,
    ),
    Text(
      'Index 3: Profile',
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
      appBar: AppBar(
        title: const Text('Blossom'),
      ),
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
            icon: Icon(Icons.games, color: Colors.black,),
            label: 'Games',
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
