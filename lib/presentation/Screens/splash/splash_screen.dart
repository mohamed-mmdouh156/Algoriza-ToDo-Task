import 'dart:async';
import 'package:algoriza_task_todo/presentation/assets_manager.dart';
import 'package:algoriza_task_todo/presentation/color_manager.dart';
import 'package:algoriza_task_todo/presentation/route_manager.dart';
import 'package:algoriza_task_todo/presentation/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer ;

  _startDelay()
  {
    _timer = Timer(const Duration(seconds: 4), _goNext);
  }

  _goNext ()
  {
    Navigator.pushReplacementNamed(context, RoutesManager.homeRoute);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorManager.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: AppSize.s100,
              width: AppSize.s100,
              child: Image(
                image: AssetImage(AssetsManager.appIcon),
              ),
            ),
            const SizedBox(
              height: AppSize.s8,
            ),
            Text(
              'ToDo',
              style: GoogleFonts.lato(
                color: ColorManager.white,
                fontWeight: FontWeight.bold,
                fontSize: AppSize.s22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
