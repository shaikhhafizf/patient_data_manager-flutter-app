import 'package:flutter/material.dart';
import 'Res/Theme/themes.dart';
import 'Screen/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patients',
      // debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      home: Builder(
        builder: (BuildContext context) => MyHomePage(
          onMenuPressed: () {
            Scaffold.of(context).openDrawer();
          },
          onSearchPressed: () {},
          title: 'Patients',
        ),
      ),
    );
  }
}
