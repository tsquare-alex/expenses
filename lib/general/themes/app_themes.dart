import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/MyColors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    // pageTransitionsTheme: const PageTransitionsTheme(
    //   builders: <TargetPlatform, PageTransitionsBuilder>{
    //     TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    //   },
    // ),
    scaffoldBackgroundColor: MyColors.white,
    focusColor: MyColors.primary,
    primaryColor: MyColors.primary,
    fontFamily: GoogleFonts.tajawal().fontFamily,
    textTheme: TextTheme(
      titleMedium: GoogleFonts.tajawal(fontSize: 14),
    ),
    colorScheme: const ColorScheme.light(),
    // appBarTheme: const AppBarTheme(
    //   foregroundColor: Colors.black,
    //   systemOverlayStyle: SystemUiOverlayStyle(
    //     statusBarIconBrightness: Brightness.dark,
    //     statusBarColor: Colors.transparent,
    //   ),
    // ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    // pageTransitionsTheme: const PageTransitionsTheme(
    //   builders: <TargetPlatform, PageTransitionsBuilder>{
    //     TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    //   },
    // ),
    focusColor: MyColors.primary,
    primaryColor: MyColors.primary,
    fontFamily: GoogleFonts.tajawal().fontFamily,
    textTheme: TextTheme(
      titleMedium: GoogleFonts.tajawal(fontSize: 14),
    ),
    scaffoldBackgroundColor: MyColors.black,
    colorScheme: const ColorScheme.dark(),
    // appBarTheme: const AppBarTheme(
    //   foregroundColor: Colors.white,
    //   systemOverlayStyle: SystemUiOverlayStyle(
    //     statusBarIconBrightness: Brightness.light,
    //     statusBarColor: Colors.transparent,
    //   ),
    // ),
  );
}
