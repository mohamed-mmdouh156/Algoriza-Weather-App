import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/presentation/styles/colors_manager.dart';

ThemeData getApplicationTheme ()
{
  return ThemeData(
    // color theme
    primaryColor: ColorManager.primary1,
    disabledColor: ColorManager.lightGrey,
    splashColor: ColorManager.primary1,
    scaffoldBackgroundColor: ColorManager.dingo,

    appBarTheme: AppBarTheme(
      color: ColorManager.dingo,
      elevation: 0.0,
      iconTheme:IconThemeData(
        color: ColorManager.white,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorManager.dingo,
        statusBarIconBrightness: Brightness.light,
      ),
      titleTextStyle: TextStyle(
        fontSize: 16.0,
        color: ColorManager.white,
      ),
    ),

  );
}