part of 'MainDataImports.dart';


class MainData {

  static List<BlocProvider>  providers(BuildContext context)=>[
    BlocProvider<LangCubit>(
      create: (BuildContext context)=> LangCubit()
    ),
    BlocProvider<MyExpansionCubit>(
        create: (BuildContext context)=> MyExpansionCubit()
    ),
    // BlocProvider<UserCubit>(
    //     create: (BuildContext context)=> UserCubit()
    // ),
  ];


}