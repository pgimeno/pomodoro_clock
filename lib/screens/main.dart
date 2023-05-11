import 'package:flutter/material.dart';

import '../utils/constants.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

bool _iconBool = false;
IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _iconBool ? CustomDarkTheme() : CustomLightTheme(),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Program your study'),
          actions: [
            IconButton(
                splashRadius: 1,
                onPressed: () {
                  setState(() {
                    _iconBool = !_iconBool;
                  });
                },
                icon: Icon(_iconBool ? _iconDark : _iconLight)),
          ],
        ),
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}

ThemeData CustomDarkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(background: kDarkBackground),
    appBarTheme: AppBarTheme(
      backgroundColor: kDarkBackground,
      elevation: 0,
      centerTitle: true,
    ),

    scaffoldBackgroundColor: kDarkBackground,
    //textTheme: TextTheme(
    //bodyMedium:
  );
}

ThemeData CustomLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    appBarTheme: AppBarTheme(
        backgroundColor: kLightBackground,
        elevation: 0,
        centerTitle: true,
        foregroundColor: kDarkBackground),

    scaffoldBackgroundColor: kLightBackground,
    //textTheme: TextTheme(
    //bodyMedium:
  );
}
