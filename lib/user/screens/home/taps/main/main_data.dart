part of 'main_imports.dart';

class MainData{
  final GlobalKey<ScaffoldState> scaffold = GlobalKey();
  GenericBloc<bool> shareCubit = GenericBloc(false);

  GenericBloc<int?> touchCubit = GenericBloc(-1);

  int? touchedIndex;


  List<PieChartSectionData> getSections(BuildContext context)=> data.asMap().map<int,PieChartSectionData>((i,data){
    final value= PieChartSectionData(
      color: data.color,
      value: data.percent,
      title: tr(context, data.name!),
      radius: 125.r,
      badgeWidget: Padding(
        padding: EdgeInsets.only(top: 80.0.r),
        child: Image.asset(data.image!,width: 30.w,height: 30.h,color: MyColors.white,),
      ),
      titlePositionPercentageOffset: 0.54,
      titleStyle: TextStyle(
        color: MyColors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18.sp,
      )
    );

    return MapEntry(i, value);
  }).values.toList();

  List<PieChartDataModel> data = [
    PieChartDataModel(
      name: "flTools",
      percent: 45,
      color: Color(0xFFFFD600),
      image: Res.toolsImage,
    ),
    PieChartDataModel(
      name: "flTransactions",
      percent: 45,
      color: Color(0xFFFF4C2C),
      image: Res.transactions,
    ),
    PieChartDataModel(
      name: "flReports",
      percent: 45,
      color: Color(0xFFFFB300),
      image: Res.reports,
    ),
    // PieChartDataModel(
    //   name: "flSettings",
    //   percent: 45,
    //   color: MyColors.amber,
    //   image: Res.settings,
    // ),
    PieChartDataModel(
      name: "flDatabase",
      percent: 45,
      color: Color(0xFFFF00A8),
      image: Res.databaseImage,
    ),

    PieChartDataModel(
      name: "flWallets",
      percent: 45,
      color: Color(0xFF5DE062),
      image: Res.walletImage,
    ),
    PieChartDataModel(
      name: "flBudget",
      percent: 45,
      color: Color(0xFF32468C),
      image: Res.budgetImage,
    ),
  ];

  final GenericBloc<int> homeTabCubit = GenericBloc(0);



}