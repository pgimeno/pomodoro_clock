import 'package:flutter/material.dart';
import 'package:pomodoro_clock/utils/themes.dart';

import '../utils/constants.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

bool _iconBool = false;
IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

class _TimerScreenState extends State<TimerScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _iconBool ? CustomDarkTheme() : CustomLightTheme(),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Program your session'),
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
          child: Text('Hello World!', style: _iconBool ? CustomDarkTheme().textTheme.bodyMedium : CustomLightTheme().textTheme.bodyMedium),
        ),
      ),
    );
  }
}

