part of 'MainDataImports.dart';


class MainData {

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Janna',
    primarySwatch: Colors.blueGrey,
    floatingActionButtonTheme:
    FloatingActionButtonThemeData(backgroundColor: MyColors.primary),
    scaffoldBackgroundColor: const Color(0xFF262424),
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: MyColors.white,
        ),
        titleSpacing: 20,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Color(0xFF262424),
        ),
        backgroundColor: Color(0xFF262424),
        elevation: 0,
        titleTextStyle: const TextStyle(
            fontFamily: 'Janna',
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      elevation: 30,
      backgroundColor: MyColors.black  ,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
      subtitle1: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 4,
          color: Colors.white,
          height: 1.3),
    ),
  );
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Janna',
    primarySwatch: Colors.blueGrey,
    floatingActionButtonTheme:
    FloatingActionButtonThemeData(backgroundColor: MyColors.primary),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        titleSpacing: 20,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.white10,
        ),
        backgroundColor: MyColors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: const TextStyle(
            fontFamily: 'Janna',
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold)),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
      subtitle1: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: Colors.black,
          height: 1.3),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: MyColors.primary,
      unselectedItemColor: Colors.grey,
      elevation: 30,
      backgroundColor: MyColors.primary,
    ),
  );

  static List<BlocProvider>  providers(BuildContext context)=>[
    BlocProvider<LangCubit>(
      create: (BuildContext context)=> LangCubit()
    ),
    BlocProvider<MyExpansionCubit>(
        create: (BuildContext context)=> MyExpansionCubit()
    ),
    BlocProvider<AppThemeCubit>(
      create: (context) => AppThemeCubit()..applyAppTheme(),
    ),
    BlocProvider<LengthConverterCubit>(
      create: (context) => LengthConverterCubit(),

    ),
    BlocProvider<AreaConverterCubit>(
      create: (context) => AreaConverterCubit(),

    ),
    BlocProvider<AddDataBaseCubit>(
      create: (context) => AddDataBaseCubit(),

    ),
    BlocProvider<DatabaseCubit>(
      create: (context) => DatabaseCubit(),

    ),
    BlocProvider<FavoriteCubit>(
      create: (context) => FavoriteCubit(),

    ),
    // BlocProvider<UserCubit>(
    //     create: (BuildContext context)=> UserCubit()
    // ),
  ];


}