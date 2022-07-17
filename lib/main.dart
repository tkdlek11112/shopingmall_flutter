import 'package:flutter/material.dart';
import 'screens/screen_splash.dart';
import 'screens/screen_index.dart';
import 'screens/screen_login.dart';
import 'screens/screen_register.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shopping mall',
      routes: {
        '/index': (context) => IndexScreen(),
        '/login': (context) => LoginScreen(),
        '/splash': (context) => SplashScreen(),
        '/register': (context) => RegisterScreen(),
      },
      initialRoute: '/splash',
    );
  }
}