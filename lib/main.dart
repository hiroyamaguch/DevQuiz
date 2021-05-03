import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  ThemeMode.system == ThemeMode.dark
      ? SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // status bar color
          statusBarBrightness: Brightness.light, //status bar brigtness
          statusBarIconBrightness: Brightness.light, //status barIcon Brightness
        ))
      : SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // status bar color
          statusBarBrightness: Brightness.light, //status bar brigtness
          statusBarIconBrightness: Brightness.light, //status barIcon Brightness
          systemNavigationBarColor: AppColors.black, // navigation bar color
          systemNavigationBarDividerColor:
              AppColors.black, //Navigation bar divider color
          systemNavigationBarIconBrightness:
              Brightness.dark, //navigation bar icon
        ));

  runApp(AppWidget());
}
