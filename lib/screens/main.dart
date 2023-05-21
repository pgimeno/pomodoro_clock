import 'package:flutter/material.dart';
import 'package:pomodoro_clock/utils/themes.dart';
import 'package:provider/provider.dart';
import '../utils/constants.dart';
import '../utils/theme_provider.dart';
import 'timer_screen.dart';

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
  int _currentQuestionIndex = 0;
  List<String> _questions = [
    'Set the duration for each focus interval.',
    'Set the duration for short breaks.',
    'Set the duration for the long break.'
  ];

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
                Text(
                  _questions[_currentQuestionIndex],
                  style: Provider.of<ThemeProvider>(context).currentTheme == ThemeMode.dark
                      ? CustomDarkTheme().textTheme.bodyLarge
                      : CustomLightTheme().textTheme.bodyLarge,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      heroTag: "fab1",
                      child: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (_currentQuestionIndex == 0 && _focusInterval > 5) {
                            _focusInterval -= 5;
                          } else if (_currentQuestionIndex == 1 && _restDuration > 2) {
                            _restDuration--;
                          } else if (_currentQuestionIndex == 2 && _longBreakDuration > 15) {
                            _longBreakDuration -= 5;
                          }
                        });
                      },
                    ),
                    Text(
                      _currentQuestionIndex == 0
                          ? '${_focusInterval} minutes'
                          : _currentQuestionIndex == 1
                          ? '${_restDuration} minutes'
                          : '${_longBreakDuration} minutes',
                      style: Provider.of<ThemeProvider>(context).currentTheme == ThemeMode.dark
                          ? CustomDarkTheme().textTheme.bodyLarge
                          : CustomLightTheme().textTheme.bodyLarge,
                    ),
                    FloatingActionButton(
                      heroTag: "fab2",
                      child: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          if (_currentQuestionIndex == 0 && _focusInterval <= 55) {
                            _focusInterval += 5;
                          } else if (_currentQuestionIndex == 1 && _restDuration < 5) {
                            _restDuration++;
                          } else if (_currentQuestionIndex == 2 && _longBreakDuration < 35) {
                            _longBreakDuration += 5;
                          }
                        });
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 95.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (_currentQuestionIndex < _questions.length - 1) {
                                    _currentQuestionIndex++;
                                  } else {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation, secondaryAnimation) => TimerScreen(
                                          focusInterval: _focusInterval,
                                          restDuration: _restDuration,
                                          longBreakDuration: _longBreakDuration,
                                        ),
                                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                          return FadeTransition(
                                            opacity: animation,
                                            child: child,
                                          );
                                        },
                                      ),
                                    );
                                  }
                                });
                              },
                              child: Text(
                                _currentQuestionIndex < _questions.length - 1 ? 'Next' : 'Start focusing',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    if (_currentQuestionIndex != 0)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 120.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    if (_currentQuestionIndex > 0) {
                                      _currentQuestionIndex--;
                                    }
                                  });
                                },
                                child: Text(
                                  'Previous',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
