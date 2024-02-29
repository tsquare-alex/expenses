import 'package:expenses/general/themes/app_colors.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import '../constants/MyColors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    // pageTransitionsTheme: const PageTransitionsTheme(
    //   builders: <TargetPlatform, PageTransitionsBuilder>{
    //     TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    //   },
    // ),
    // scaffoldBackgroundColor: AppLightColors.backgroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: MyColors.primary,
    ),
    focusColor: MyColors.primary,
    primaryColor: MyColors.primary,
    fontFamily: 'Tajawal',
    colorScheme: const ColorScheme.light(),
    appBarTheme: AppBarTheme(
      backgroundColor: MyColors.primary,
      foregroundColor: Colors.white,
      // systemOverlayStyle: SystemUiOverlayStyle(
      //   statusBarIconBrightness: Brightness.dark,
      //   statusBarColor: Colors.transparent,
      // ),
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    // pageTransitionsTheme: const PageTransitionsTheme(
    //   builders: <TargetPlatform, PageTransitionsBuilder>{
    //     TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    //   },
    // ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppDarkColors.primary,
      selectedItemColor: MyColors.white,
      unselectedItemColor: MyColors.grey,
    ),
    focusColor: MyColors.primary,
    primaryColor: MyColors.primary,
    fontFamily: 'Tajawal',
    scaffoldBackgroundColor: AppDarkColors.backgroundColor,
    colorScheme: const ColorScheme.dark(),
    appBarTheme: AppBarTheme(
      backgroundColor: AppDarkColors.primary,
      foregroundColor: Colors.white,
      // systemOverlayStyle: SystemUiOverlayStyle(
      //   statusBarIconBrightness: Brightness.light,
      //   statusBarColor: Colors.transparent,
      // ),
    ),
  );
}
