part of 'main_imports.dart';

class Main extends StatefulWidget {
  const Main({Key? key, required this.homeTabCubit}) : super(key: key);
  final GenericBloc<int> homeTabCubit;
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  MainData data = MainData();

  @override
  Widget build(BuildContext context) {
    Map<Widget, int> widgets = {
      Container(): 6,
      Transactions(
        homeTabCubit: widget.homeTabCubit,
      ): 0,
      const Reports(): 2,
      const Settings(): 3,
      Database(): 5,
      const Budget(): 8,
      const Wallet(): 7,
      Container(): 4,
    };
    return Scaffold(
/*
 context.watch<AppThemeCubit>().isDarkMode
          ? AppDarkColors.backgroundColor
          : MyColors.white
 */
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(Icons.account_box),
          fabSize: ExpandableFabSize.regular,
          foregroundColor: Colors.white,
          backgroundColor: context.watch<AppThemeCubit>().isDarkMode
              ? AppDarkColors.primary
              : MyColors.primary,
          shape: const CircleBorder(),
        ),
        closeButtonBuilder: DefaultFloatingActionButtonBuilder(
          child: const Icon(Icons.close),
          fabSize: ExpandableFabSize.small,
          foregroundColor: Colors.white,
          backgroundColor: context.watch<AppThemeCubit>().isDarkMode
              ? AppDarkColors.primary
              : MyColors.primary,
          shape: const CircleBorder(),
        ),
        children: [
          ...context.watch<FavoriteCubit>().getFavoriteModels().map((tool) {
            return FloatingActionButton.small(
              backgroundColor: context.watch<AppThemeCubit>().isDarkMode
                  ? AppDarkColors.primary
                  : MyColors.primary,
              heroTag: null,
              child: Icon(IconData(tool.iconCode, fontFamily: 'MaterialIcons')),
              onPressed: () {
                print(tool.iconCode);
                _navigateToToolScreen(context, tool);
              },
            );
          }).toList(),
        ],
      ),
      body: BlocProvider(
        create: (context) => ReportsCubit()..getReportData(context),
        child: BlocBuilder<ReportsCubit, ReportsState>(
          buildWhen: (previous, current) {
            return (previous == const ReportsState.reportDataLoading() ||
                current == const ReportsState.reportDataLoading());
          },
          builder: (context, state) {
            if (state is ReportDataLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: context.read<AppThemeCubit>().isDarkMode
                      ? AppDarkColors.primary
                      : MyColors.primary,
                ),
              );
            }
            if (state is ReportDataLoaded) {
              return Container(
                padding: EdgeInsets.all(15.r),
                width: double.infinity,
                height: double.infinity,
                //TODO: to build circules
                child: Column(
                  children: [
                    const WalletDetailsRow(),
                    Expanded(
                      child: BuildPieChart(
                        mainData: data,
                        homeTabCubit: widget.homeTabCubit,
                        widgets: widgets,
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container(
              padding: EdgeInsets.all(15.r),
              width: double.infinity,
              height: double.infinity,
              child: BuildPieChart(
                mainData: data,
                homeTabCubit: widget.homeTabCubit,
                widgets: widgets,
              ),
            );
          },
        ),
      ),
    );
  }

  void _navigateToToolScreen(BuildContext context, FavoriteModel tool) {
    switch (tool.toolName) {
      case "percentage":
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PercentageCalculatorScreen()));
        break;
      case "tax":
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ServiceTaxCalculatorScreen()));
        break;
      case "discount":
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DiscountCalculatorScreen()));
        break;
      case "qiblah":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => QiblahCompass()));
        break;
      case "scanner":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ScannerQrCode()));
        break;
      case "calender":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CalenderScreen()));
        break;
      case "calculator":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CalculatorScreen()));
        break;
      case "shoesSize":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ShoesSizeScreen()));
        break;
      case "ringSize":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const RingSizeScreen()));
        break;
      case "clothesSize":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ClothesSizeScreen()));
        break;
      // case "convert":
      //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConverterScreen()));
      //   break;
      case "bmi":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const BMICalculator()));
        break;
      case "bmr":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => BmrCalculatorScreen()));
        break;
      case "convertCurrency":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ChangeCurrency()));
        break;
      case "convertLength":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => LengthConverterScreen()));
        break;
      case "convertMass":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => MassConverterScreen()));
        break;
      case "convertTime":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TimeConverterScreen()));
        break;
      case "convertElectric":
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ElectricCurrentConverterScreen()));
        break;
      case "convertTemperature":
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TemperatureConverterScreen()));
        break;
      case "convertAcceleration":
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AccelerationConverterScreen()));
        break;
      case "convertArea":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AreaConverterScreen()));
        break;
      case "convertSpeed":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => SpeedConverterScreen()));
        break;
    }
  }
}

class YourTool {
  final IconData icon;
  final String toolName;

  YourTool({required this.icon, required this.toolName});
}
