import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        backgroundColor: AppColors.white,
        textTheme: TextTheme(
          bodyText1: AppTextStyles.body,
          bodyText2: AppTextStyles.bodyBold,
          headline1: AppTextStyles.heading,
          headline2: AppTextStyles.heading40,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: AppColors.black,
        textTheme: TextTheme(
          bodyText1: AppTextStyles.bodyDark,
          bodyText2: AppTextStyles.bodyBoldDark,
          headline1: AppTextStyles.headingDark,
          headline2: AppTextStyles.heading40Dark,
        ),
      ),
      themeMode: ThemeMode.system,
      title: "Dev Quiz",
      home: SplashPage(),
    );
  }
}
