import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/theme_provider.dart';
import 'package:pomodoro_clock/utils/themes.dart';
import 'package:provider/provider.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

class TimerScreen extends StatefulWidget {
  final int focusInterval;
  final int restDuration;
  final int longBreakDuration;

  TimerScreen({
    Key? key,
    required this.focusInterval,
    required this.restDuration,
    required this.longBreakDuration,
  }) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

enum TimerPhase { Focus, Rest, LongBreak }

class _TimerScreenState extends State<TimerScreen> {
  TimerPhase currentPhase = TimerPhase.Focus;
  int cyclesCounter = 0;
  late CountDownController controller;
  late UniqueKey timerKey;

  @override
  void initState() {
    super.initState();
    controller = CountDownController();
    timerKey = UniqueKey();
  }

  int get currentDuration {
    switch (currentPhase) {
      case TimerPhase.Focus:
        return widget.focusInterval*60;
      case TimerPhase.Rest:
        return widget.restDuration*60;
      case TimerPhase.LongBreak:
        return widget.longBreakDuration*60;
    }
  }

  void _handleOnComplete() {
    //TODO: Vibrar i disparar sons quan acabi cada franja
    switch (currentPhase) {
      case TimerPhase.Focus:
        cyclesCounter++;
        if (cyclesCounter >= 4) {
          setState(() {
            currentPhase = TimerPhase.LongBreak;
            timerKey = UniqueKey();
            controller.start();
          });
          cyclesCounter = 0;
        } else {
          setState(() {
            currentPhase = TimerPhase.Rest;
            timerKey = UniqueKey();
            controller.start();
          });
        }
        break;
      case TimerPhase.Rest:
        setState(() {
          currentPhase = TimerPhase.Focus;
          timerKey = UniqueKey();
          controller.start();
        });
        break;
      case TimerPhase.LongBreak:
        setState(() {
          Navigator.pop(context); // Navigate back to main screen
        });
        break;
    }
  }

  String get currentPhaseText {
    switch (currentPhase) {
      case TimerPhase.Focus:
        return 'Focus on your task';
      case TimerPhase.Rest:
        return 'Take a short rest';
      case TimerPhase.LongBreak:
        return 'Take a long rest';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pomodoro Timer'),
        actions: [
          IconButton(
            splashRadius: 1,
            onPressed: () {
              final themeProvider =
              Provider.of<ThemeProvider>(context, listen: false);
              themeProvider.toggleTheme();
            },
            icon: Icon(Provider.of<ThemeProvider>(context).currentTheme ==
                ThemeMode.dark
                ? Icons.wb_sunny
                : Icons.nights_stay),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NeonCircularTimer(
                  key: timerKey,
                  width: 200,
                  isReverse: true,
                  duration: currentDuration,
                  neon: 1,
                  controller: controller,
                  onComplete: _handleOnComplete,
                  isTimerTextShown: true,
                  strokeWidth: 20,

                  innerFillGradient:
                  Provider.of<ThemeProvider>(context).currentTheme ==
                      ThemeMode.dark
                      ? LinearGradient(colors: [
                    kLightBackground,
                    kAccentColor,
                  ])
                      : LinearGradient(colors: [kDarkBackground, kAccentColor]),
                  neonColor: Provider.of<ThemeProvider>(context).currentTheme ==
                      ThemeMode.dark
                      ? kAccentColor
                      : kDarkBackground,
                  neumorphicEffect: false,
                  textStyle: Provider.of<ThemeProvider>(context).currentTheme ==
                      ThemeMode.dark
                      ? CustomDarkTheme().textTheme.bodyLarge
                      : CustomLightTheme().textTheme.bodyLarge,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 200.0),
                  child: Text(currentPhaseText, style: Provider.of<ThemeProvider>(context).currentTheme ==
                      ThemeMode.dark
                      ? CustomDarkTheme().textTheme.bodyLarge
                      : CustomLightTheme().textTheme.bodyLarge,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
