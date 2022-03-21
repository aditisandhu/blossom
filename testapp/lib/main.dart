import 'package:flutter/material.dart';
import 'package:testapp/loginservice.dart';
import 'package:testapp/splash.dart';
import 'package:provider/provider.dart';

import 'navigation_bar.dart';
import 'start.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static const String _title = 'Blossom';

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => LoginService(),
      child: MaterialApp(
        title: _title,
        debugShowCheckedModeBanner: false,
        home: SplashPage(duration: 2, goToPage: WelcomePage(),),
        theme: ThemeData(
          fontFamily: 'OpenSans'
        ),
      ),
    );
  }
}