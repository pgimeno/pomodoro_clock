import 'package:flutter/material.dart';
import 'package:pomodoro_clock/utils/themes.dart';
import '../utils/constants.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

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
  int _focusInterval = 25;
  int _restDuration = 5;
  int _longBreakDuration = 20;
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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Set the duration for each focus interval.',
                        style: _iconBool
                            ? CustomDarkTheme().textTheme.bodyLarge
                            : CustomLightTheme().textTheme.bodyLarge),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton(
                            child: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                if (_focusInterval <= 55) {
                                  _focusInterval += 5;
                                }
                              });
                            }),
                        Text('${_focusInterval} minutes',
                            style: _iconBool
                                ? CustomDarkTheme().textTheme.bodyLarge
                                : CustomLightTheme().textTheme.bodyLarge),
                        FloatingActionButton(
                            child: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (_focusInterval > 5) {
                                  _focusInterval -= 5;
                                }
                              });
                            }),
                      ],
                    ),
                    Text('Set the duration for short breaks.',
                        style: _iconBool
                            ? CustomDarkTheme().textTheme.bodyLarge
                            : CustomLightTheme().textTheme.bodyLarge),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton(
                            child: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                if (_restDuration < 5) {
                                  _restDuration++;
                                }
                              });
                            }),
                        Text('${_restDuration} minutes',
                            style: _iconBool
                                ? CustomDarkTheme().textTheme.bodyLarge
                                : CustomLightTheme().textTheme.bodyLarge),
                        FloatingActionButton(
                            child: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (_restDuration > 2) {
                                  _restDuration--;
                                }
                              });
                            }),
                      ],
                    ),
                    Text('Set the duration for the long break.',
                        style: _iconBool
                            ? CustomDarkTheme().textTheme.bodyLarge
                            : CustomLightTheme().textTheme.bodyLarge),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton(
                            child: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                if (_longBreakDuration < 35) {
                                  _longBreakDuration += 5;
                                }
                              });
                            }),
                        Text('${_longBreakDuration} minutes',
                            style: _iconBool
                                ? CustomDarkTheme().textTheme.bodyLarge
                                : CustomLightTheme().textTheme.bodyLarge),
                        FloatingActionButton(
                            child: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (_longBreakDuration > 15) {
                                  _longBreakDuration -= 5;
                                }
                              });
                            }),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //Amagar teclat al fer click al botó
                        //FocusManager.instance.primaryFocus?.unfocus();

                      },
                      child: Text(
                        'Start focusing',
                      ),
                    )

                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

//Text('Hello World!', style: _iconBool ? CustomDarkTheme().textTheme.bodyMedium : CustomLightTheme().textTheme.bodyMedium),
