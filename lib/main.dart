import 'package:devquiz/core/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
    statusBarBrightness: Brightness.light, //status bar brigtness
    statusBarIconBrightness: Brightness.light, //status barIcon Brightness
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    systemNavigationBarDividerColor:
        Colors.black, //Navigation bar divider color
    systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icon
  ));

  runApp(AppWidget());
}
