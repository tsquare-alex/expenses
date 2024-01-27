import 'package:country_picker/country_picker.dart';
import 'package:expenses/general/themes/app_themes.dart';
import 'package:expenses/general/themes/cubit/app_theme_cubit.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:expenses/local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'blocks/lang_cubit/lang_cubit.dart';
import 'packages/localization/SetLocalization.dart';
import 'utilities/main_data/MainDataImports.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigatorKey = GlobalKey<NavigatorState>();
  final _appRouter = AppRouter();
  @override
  @override
  void initState() {
    super.initState();
    LocalNotifications.scheduleDailyNotification(

      title: '',
      body: '',
    );
  }


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: MainData.providers(context),
      child: BlocBuilder<LangCubit, LangState>(
        builder: (context, state) {
          return ScreenUtilInit(
              designSize: const Size(430, 932),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (BuildContext context, child) {
                return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    theme: AppThemes.lightTheme,
                    darkTheme: AppThemes.darkTheme,
                    themeMode: context.watch<AppThemeCubit>().themeMode,
                    title: "My Expenses",
                    supportedLocales: const [
                      Locale('en', 'US'),
                      Locale('ar', 'EG')
                    ],
                    localizationsDelegates: const [
                      LocalizationHelper.localizationsDelegate,
                      CountryLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    locale: state.locale,
                    routerDelegate: _appRouter.delegate(initialRoutes: [
                      SplashRoute(navigatorKey: navigatorKey)
                    ]),
                    routeInformationParser: _appRouter.defaultRouteParser(),
                    builder: (ctx, child) => FlutterEasyLoading(child: child));
              });
        },
      ),
    );
  }
}
