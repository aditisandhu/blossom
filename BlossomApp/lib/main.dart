
   
import 'package:flutter/material.dart';
import 'package:testapp/helpers/loginservice.dart';
import 'package:testapp/pages/navigation_bar.dart';
import 'package:testapp/pages/onboarding_page.dart';
import 'package:testapp/pages/splash.dart';
import 'package:provider/provider.dart';
import './pages/start.dart';

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
        // home: OnboardingPage(),
        // home: NavHome(),
        theme: ThemeData(
          fontFamily: 'OpenSans'
        ),
      ),
    );
  }
}