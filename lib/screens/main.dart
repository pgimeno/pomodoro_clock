import 'package:flutter/material.dart';
import 'package:pomodoro_clock/utils/themes.dart';
import 'package:provider/provider.dart';
import '../utils/constants.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../utils/theme_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: MainApp(),
  ));
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
  void _toggleTheme() {
    setState(() {
      _iconBool = !_iconBool;
    });
  }

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: CustomLightTheme(),
        darkTheme: CustomDarkTheme(),
        themeMode: themeProvider.currentTheme,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _focusInterval = 25;
  int _restDuration = 5;
  int _longBreakDuration = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Program your session'),
        actions: [
          IconButton(
            splashRadius: 1,
            onPressed: () {
              final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
              themeProvider.toggleTheme();
            },
            icon: Icon(Provider.of<ThemeProvider>(context).currentTheme == ThemeMode.dark
                ? Icons.wb_sunny
                : Icons.nights_stay),

          )

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
                      style: Provider.of<ThemeProvider>(context).currentTheme == ThemeMode.dark
                          ? CustomDarkTheme().textTheme.bodyLarge
                          : CustomLightTheme().textTheme.bodyLarge),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                          heroTag: "fab1",
                          child: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (_focusInterval > 5) {
                                _focusInterval -= 5;
                              }
                            });
                          }),
                      Text('${_focusInterval} minutes',
                          style: Provider.of<ThemeProvider>(context).currentTheme == ThemeMode.dark
                              ? CustomDarkTheme().textTheme.bodyLarge
                              : CustomLightTheme().textTheme.bodyLarge),
                      FloatingActionButton(
                          heroTag: "fab2",
                          child: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              if (_focusInterval <= 55) {
                                _focusInterval += 5;
                              }
                            });
                          }),
                    ],
                  ),
                  Text('Set the duration for short breaks.',
                      style: Provider.of<ThemeProvider>(context).currentTheme == ThemeMode.dark
                          ? CustomDarkTheme().textTheme.bodyLarge
                          : CustomLightTheme().textTheme.bodyLarge),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                          heroTag: "fab3",
                          child: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (_restDuration > 2) {
                                _restDuration--;
                              }
                            });
                          }),
                      Text('${_restDuration} minutes',
                          style:Provider.of<ThemeProvider>(context).currentTheme == ThemeMode.dark
                              ? CustomDarkTheme().textTheme.bodyLarge
                              : CustomLightTheme().textTheme.bodyLarge),
                      FloatingActionButton(
                          heroTag: "fab4",
                          child: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              if (_restDuration < 5) {
                                _restDuration++;
                              }
                            });
                          }),
                    ],
                  ),
                  Text('Set the duration for the long break.',
                      style: Provider.of<ThemeProvider>(context).currentTheme == ThemeMode.dark
                          ? CustomDarkTheme().textTheme.bodyLarge
                          : CustomLightTheme().textTheme.bodyLarge),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                          heroTag: "fab5",
                          child: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (_longBreakDuration > 15) {
                                _longBreakDuration -= 5;
                              }
                            });
                          }),
                      Text('${_longBreakDuration} minutes',
                          style: Provider.of<ThemeProvider>(context).currentTheme == ThemeMode.dark
                              ? CustomDarkTheme().textTheme.bodyLarge
                              : CustomLightTheme().textTheme.bodyLarge),
                      FloatingActionButton(
                          heroTag: "fab6",
                          child: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              if (_longBreakDuration < 35) {
                                _longBreakDuration += 5;
                              }
                            });
                          }),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //Navigator.push(context, MaterialPageRoute(builder: (context) =>  TimerScreen()));
                    },
                    child: Text(
                      'Start focusing',
                      style: TextStyle(fontSize: 18),

                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
