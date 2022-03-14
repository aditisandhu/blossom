import 'package:flutter/material.dart';

import 'navigation_bar.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static const String _title = 'Blossom';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Home(),
      theme: ThemeData(
        fontFamily: 'OpenSans'
      ),
    );
  }
}