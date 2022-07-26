import 'package:algoriza_task_todo/presentation/Screens/createTask/create_task_screen.dart';
import 'package:algoriza_task_todo/presentation/Screens/scheduleScreen/schedule_screen.dart';
import 'package:algoriza_task_todo/presentation/route_manager.dart';
import 'package:algoriza_task_todo/presentation/theme_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {

  const MyApp._internal();
  static const MyApp _instance = MyApp._internal(); // singleton or single instance
  factory MyApp () => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // onGenerateRoute: RoutesGenerator.getRoutes,
      // initialRoute: RoutesManager.scheduleRoute,
      theme: getApplicationTheme(),
      home: const CreateTaskScreen(),
    );
  }
}
