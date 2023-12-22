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
      badgeWidget: Padding(
        padding: EdgeInsets.only(top: 60.0.r),
        child: Image.asset(data.image!,width: 20.w,height: 20.h,color: MyColors.white,),
      ),
      titlePositionPercentageOffset: 0.5,
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
      name: "الميزانية و\nالخطط المالية",
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



}