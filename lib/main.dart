import 'package:flutter/material.dart';
import 'package:tsvetomir_stanev_employees/home.dart';
import 'package:tsvetomir_stanev_employees/store/app_store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});
  //final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // scaffoldMessengerKey: _scaffoldMessengerKey,
      title: 'Employees App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 16, 20, 255)),
      ),
      home: HomeScreen(),
    );
  }
}
