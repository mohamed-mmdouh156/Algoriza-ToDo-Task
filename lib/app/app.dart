import 'package:algoriza_task_todo/app/bloc/cubit.dart';
import 'package:algoriza_task_todo/app/bloc/state.dart';
import 'package:algoriza_task_todo/presentation/Screens/scheduleScreen/schedule_screen.dart';
import 'package:algoriza_task_todo/presentation/Screens/splash/splash_screen.dart';
import 'package:algoriza_task_todo/presentation/route_manager.dart';
import 'package:algoriza_task_todo/presentation/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit , AppStates>(
        listener: (context , state){},
        builder: (context , state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RoutesGenerator.getRoutes,
            initialRoute: RoutesManager.splashRoute,
            theme: getApplicationTheme(),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
