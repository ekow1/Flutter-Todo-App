import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_schedule/model/task_data.dart';
import 'package:my_schedule/screens/splash_screen.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MySchedule());
}

class MySchedule extends StatelessWidget {
  const MySchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set the status bar color and brightness
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.teal, // Set the status bar color
      statusBarBrightness: Brightness.dark, // Set the status bar brightness
    ));

    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
