import 'package:algoriza_task_todo/presentation/Screens/createTask/create_task_screen.dart';
import 'package:algoriza_task_todo/presentation/Screens/scheduleScreen/schedule_screen.dart';
import 'package:algoriza_task_todo/presentation/string_manager.dart';
import 'package:flutter/material.dart';
import 'Screens/home/home_Screen.dart';
import 'Screens/splash/splash_screen.dart';

class RoutesManager {
  static const String splashRoute = '/';
  static const String homeRoute = '/home';
  static const String createTeskRoute = '/createTask';
  static const String scheduleRoute = '/schedule';
}

class RoutesGenerator {

  static Route<dynamic> getRoutes (RouteSettings settings)
  {
    switch (settings.name)
    {
      case RoutesManager.splashRoute :
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutesManager.homeRoute :
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RoutesManager.createTeskRoute :
        return MaterialPageRoute(builder: (_) => const CreateTaskScreen());
      case RoutesManager.scheduleRoute :
        return MaterialPageRoute(builder: (_) => const ScheduleScreen());
      default :
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute (){
    return MaterialPageRoute(builder: (_) => Scaffold(
      appBar: AppBar(
        title: const Text(
          StringManager.undefinedRoute,
        ),
      ),
      body: const Center(
        child: Text(
          StringManager.undefinedRoute,
        ),
      ),
    ));

  }

}