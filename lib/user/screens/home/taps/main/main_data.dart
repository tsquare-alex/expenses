part of 'main_imports.dart';

class MainData{

  GenericBloc<int?> touchCubit = GenericBloc(-1);

  int? touchedIndex;


  List<PieChartSectionData> getSections()=> data.asMap().map<int,PieChartSectionData>((i,data){
    final value= PieChartSectionData(
      color: data.color,
      value: data.percent,
      title: data.name,
      radius: 100.r,

      titlePositionPercentageOffset: 0.6,
      titleStyle: TextStyle(
        color: MyColors.white,
        fontWeight: FontWeight.bold,
        fontSize: 13.sp,
      )
    );

    return MapEntry(i, value);
  }).values.toList();

  List<PieChartDataModel> data = [
    PieChartDataModel(
      name: "المساعدة \nوالشرح",
      percent: 45,
      color: MyColors.primary,
      image: Res.explain,
    ),
    PieChartDataModel(
      name: "المعاملات \nوالمصروفات",
      percent: 45,
      color: Colors.deepPurple,
      image: Res.transaction,
    ),
    PieChartDataModel(
      name: "التقارير \nوالاحصائيات",
      percent: 45,
      color: Colors.lightGreen,
      image: Res.report,
    ),
    PieChartDataModel(
      name: "الضبط \nوالاعدادات",
      percent: 45,
      color: MyColors.amber,
      image: Res.settings,
    ),
    PieChartDataModel(
      name: "السجل \nوقواعد البيانات",
      percent: 45,
      color: Colors.amber,
      image: Res.database,
    ),
    PieChartDataModel(
      name: "الميزانية \nوالخطط المالية",
      percent: 45,
      color: Colors.green,
      image: Res.budget,
    ),
    PieChartDataModel(
      name: "المصادر \nالمالية",
      percent: 45,
      color: Colors.red,
      image: Res.wallet,
    ),
    PieChartDataModel(
      name: "الأدوات \nالمساعدة",
      percent: 45,
      color: Colors.deepOrange,
      image: Res.tools,
    ),
  ];

  final GenericBloc<int> homeTabCubit = GenericBloc(0);

  Map<Widget,int> widgets={
    Container():6,
    const Transactions():0,
    const Reports():2,
    const Settings():3,
    Database():5,
    const Budget():8,
    const Wallet():7,
    ToolsHelper():4,
  };

}