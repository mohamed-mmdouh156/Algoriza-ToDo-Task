import 'package:algoriza_task_todo/presentation/style_manager.dart';
import 'package:flutter/material.dart';
import 'color_manager.dart';
import 'font_manager.dart';
import 'value_manager.dart';

ThemeData getApplicationTheme ()
{
  return ThemeData(
    // color theme
    primaryColor: ColorManager.primary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.primary,
    scaffoldBackgroundColor: ColorManager.whiteDark,

    appBarTheme: AppBarTheme(
      color: ColorManager.white,
      elevation: 0.0,
      titleTextStyle: getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
    ),


    textTheme: TextTheme(
      headline1: getSemiBoldStyle(color: ColorManager.dartGrey , fontSize: FontSize.s18),
      subtitle1: getMediumStyle(color: ColorManager.lightGrey , fontSize: FontSize.s16),
      caption: getRegularStyle(color: ColorManager.grey1),
      bodyText1: getRegularStyle(color: ColorManager.grey),
      headline2: getLightStyle(color: ColorManager.white , fontSize: FontSize.s22), // display Large
    ),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(color: ColorManager.grey , fontSize: FontSize.s14),
      errorStyle: getRegularStyle(color: ColorManager.red , fontSize: FontSize.s14),
      labelStyle: getMediumStyle(color: ColorManager.grey , fontSize: FontSize.s14),

      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,

    ),
  );
}