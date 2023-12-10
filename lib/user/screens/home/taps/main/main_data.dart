part of 'main_imports.dart';

class MainData{

  GenericBloc<int?> touchCubit = GenericBloc(-1);
  GenericBloc<bool> shareCubit = GenericBloc(false);
  int? touchedIndex;

  AnimationController? controller;

  List<PieChartSectionData> getSections()=> data.asMap().map<int,PieChartSectionData>((i,data){
    final value= PieChartSectionData(
      color: data.color,
      value: data.percent,
      title: data.name,
      radius: 115.r,
      badgePositionPercentageOffset: 0.55,
      badgeWidget: Padding(
        padding: EdgeInsets.only(top: 67.0.r),
        child: Image.asset(data.image!,height: 25.h,width: 25.w,color: MyColors.white,),
      ),
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
      color: MyColors.primary,
      image: Res.transaction,
    ),
    PieChartDataModel(
      name: "التقارير \nوالاحصائيات",
      percent: 45,
      color: MyColors.primary,
      image: Res.report,
    ),
    PieChartDataModel(
      name: "الضبط \nوالاعدادات",
      percent: 45,
      color: MyColors.primary,
      image: Res.settings,
    ),
    PieChartDataModel(
      name: "السجل \nوقواعد البيانات",
      percent: 45,
      color: MyColors.primary,
      image: Res.database,
    ),
    PieChartDataModel(
      name: "الميزانية \nوالخطط المالية",
      percent: 45,
      color: MyColors.primary,
      image: Res.budget,
    ),
    PieChartDataModel(
      name: "المصادر \nالمالية",
      percent: 45,
      color: MyColors.primary,
      image: Res.wallet,
    ),
    PieChartDataModel(
      name: "الأدوات \nالمساعدة",
      percent: 45,
      color: MyColors.primary,
      image: Res.tools,
    ),
  ];


  Map<Widget,int> widgets={
    Container():6,
    const Transactions():0,
    const Reports():2,
    const Settings():3,
    Database():5,
    const Budget():8,
    const Wallet():7,
    Container():4,
  };

}