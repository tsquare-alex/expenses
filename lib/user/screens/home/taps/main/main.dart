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
      key: data.scaffold,
      drawer: BuildDrawer(
        shareCubit: data.shareCubit,
        homeTabCubit: data.homeTabCubit,
      ),
      endDrawer: BuildEndDrawer(
        homeTabCubit: data.homeTabCubit,
      ),
      // floatingActionButtonLocation: ExpandableFab.location,
      // floatingActionButton: ExpandableFab(
      //   openButtonBuilder: RotateFloatingActionButtonBuilder(
      //     child: const Icon(Icons.account_box),
      //     fabSize: ExpandableFabSize.regular,
      //     foregroundColor: Colors.white,
      //     backgroundColor: context.watch<AppThemeCubit>().isDarkMode
      //         ? AppDarkColors.primary
      //         : MyColors.primary,
      //     shape: const CircleBorder(),
      //   ),
      //   closeButtonBuilder: DefaultFloatingActionButtonBuilder(
      //     child: const Icon(Icons.close),
      //     fabSize: ExpandableFabSize.small,
      //     foregroundColor: Colors.white,
      //     backgroundColor: context.watch<AppThemeCubit>().isDarkMode
      //         ? AppDarkColors.primary
      //         : MyColors.primary,
      //     shape: const CircleBorder(),
      //   ),
      //   children: [
      //     ...context.watch<FavoriteCubit>().getFavoriteModels().map((tool) {
      //       return FloatingActionButton.small(
      //         backgroundColor: context.watch<AppThemeCubit>().isDarkMode
      //             ? AppDarkColors.primary
      //             : MyColors.primary,
      //         heroTag: null,
      //         child: Icon(IconData(tool.iconCode, fontFamily: 'MaterialIcons')),
      //         onPressed: () {
      //           print(tool.iconCode);
      //           _navigateToToolScreen(context, tool);
      //         },
      //       );
      //     }).toList(),
      //   ],
      // ),
      appBar: AppBar(
        //backgroundColor: MyColors.primary,
        // leadingWidth: 35.w,
        title: BlocBuilder<GenericBloc<int>, GenericState<int>>(
          bloc: data.homeTabCubit,
          builder: (context, state) {
            return Row(
              children: [
                Image.asset(
                  Res.home,
                  color: MyColors.white,
                  width: 30.w,
                  height: 30.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                MyText(
                  title: tr(context,"main"),
                  color: MyColors.white,
                  size: 18.sp,
                  alien: TextAlign.center,
                  fontWeight: FontWeight.bold,
                ),
              ],
            );
          },
        ),
        leadingWidth: 40.w,
        leading: InkWell(
          onTap: () {
            data.scaffold.currentState?.openDrawer();
          },
          child: Icon(
            Icons.menu,
            color: MyColors.white,
            size: 30.w,
          ),
        ),
        actions: [
          BlocBuilder<AppThemeCubit, AppThemeState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  AppThemeCubit.get(context).changeTheme();
                },
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.dark_mode_outlined,
                  color: MyColors.white,
                  size: 20.w,
                ),
              );
            },
          ),
          PopupMenuButton<FavoriteModel>(
            // surfaceTintColor: Colors.blue,
            icon: Icon(
              Icons.more_vert,
              color: context.watch<AppThemeCubit>().isDarkMode
                  ? MyColors.white
                  : MyColors.black100,
            ),
            color: context.watch<AppThemeCubit>().isDarkMode
                ? AppDarkColors.backgroundColor
                :MyColors.white,
            onSelected: _onFavoriteItemSelected,
            itemBuilder: (BuildContext context) {
              if (getFavoriteModels(context).isEmpty) {
                CustomToast.showSimpleToast(msg: 'يرجى إضافة ادوات مساعدة');
              }
              return [
                for (FavoriteModel model in getFavoriteModels(context))
                  PopupMenuItem<FavoriteModel>(
                    value: model,
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          model.imagePath,
                          width: 24.0,
                          height: 24.0,
                          color: MyColors.primary,
                        ),
                        SizedBox(width: 8.0),
                        MyText(
                          title: tr(context, model.toolName),
                          color:context.read<AppThemeCubit>().isDarkMode
                              ? MyColors.white
                              :MyColors.black100,
                          size: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
              ];
            },
          ),

          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.account_balance_outlined,
          //     color: MyColors.white,
          //     size: 20.w,
          //   ),),
          IconButton(
            onPressed: () {
              data.scaffold.currentState?.openEndDrawer();
            },
            icon: Image.asset(
              Res.menu,
              color: MyColors.white,
              width: 20.w,
              height: 20.h,
            ),
          ),
        ],
      ),

      body: BlocProvider(
        create: (context) => ReportsCubit()..getMainReportData(),
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

  void _onFavoriteItemSelected(FavoriteModel selectedModel) {
    // Handle the selected favorite item
    print('Selected: ${selectedModel.toolName}');
    // Add any logic you need to perform when a favorite item is selected
    // For example, you can navigate to a specific screen:
    _navigateToToolScreen(context, selectedModel);
  }

  List<FavoriteModel> getFavoriteModels(BuildContext context) {
    // Use context.read instead of context.watch to avoid listening outside the widget tree
    return context.read<FavoriteCubit>().getFavoriteModels();
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
      case "convertTemperature":
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TemperatureConverterScreen()));
        break;
      case "convertArea":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AreaConverterScreen()));
        break;
      case "convertSpeed":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => SpeedConverterScreen()));
        break;
      case "convertData":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DataConverterScreen()));
        break;
      case "convertVolume":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => VolumeConverterScreen()));
        break;
    }
  }
}

