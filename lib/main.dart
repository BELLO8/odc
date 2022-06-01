import 'package:flutter/material.dart';
import 'package:odc/screens/SplashScreen.dart';

import 'screens/details.dart';
import 'screens/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sasami',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Splash(),
      routes: {
        '/Home': (context) => Home(),
        '/Detail': (context) => Details(),
      },
    );
  }
}