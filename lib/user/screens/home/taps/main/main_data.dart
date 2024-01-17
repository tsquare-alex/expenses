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
      radius: 160.r,
      badgeWidget: Padding(
        padding: EdgeInsets.only(top: 80.0.r),
        child: Image.asset(data.image!,width: 30.w,height: 30.h,color: MyColors.white,),
      ),
      titlePositionPercentageOffset: 0.54,
      titleStyle: TextStyle(
        color: MyColors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
      )
    );

    return MapEntry(i, value);
  }).values.toList();

  List<PieChartDataModel> data = [
    PieChartDataModel(
      name: "flHelp",
      percent: 45,
      color: Colors.lightGreen,
      image: Res.info,
    ),
    PieChartDataModel(
      name: "flTransactions",
      percent: 45,
      color: Colors.amber,
      image: Res.transaction,
    ),
    PieChartDataModel(
      name: "flReports",
      percent: 45,
      color: MyColors.primary,
      image: Res.chart,
    ),
    PieChartDataModel(
      name: "flSettings",
      percent: 45,
      color: MyColors.amber,
      image: Res.settings,
    ),
    PieChartDataModel(
      name: "flDatabase",
      percent: 45,
      color: Colors.deepPurple,
      image: Res.database,
    ),
    PieChartDataModel(
      name: "flBudget",
      percent: 45,
      color: Colors.red,
      image: Res.budget,
    ),
    PieChartDataModel(
      name: "flWallets",
      percent: 45,
      color: Colors.green,
      image: Res.wallet,
    ),
    PieChartDataModel(
      name: "flTools",
      percent: 50,
      color: Colors.deepOrange,
      image: Res.tools,
    ),
  ];

  final GenericBloc<int> homeTabCubit = GenericBloc(0);



}