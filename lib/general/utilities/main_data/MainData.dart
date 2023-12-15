part of 'MainDataImports.dart';


class MainData {

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
    // BlocProvider<UserCubit>(
    //     create: (BuildContext context)=> UserCubit()
    // ),
  ];


}