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
      const ToolsHelper(): 4,
      Transactions(
        homeTabCubit: widget.homeTabCubit,
      ): 0,
      const Reports(): 2,
      Database(): 5,
      const Wallet(): 7,
      const Budget(): 8,

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
        backgroundColor: context.watch<AppThemeCubit>().isDarkMode
            ? Colors.transparent
            : MyColors.white,
        surfaceTintColor: context.watch<AppThemeCubit>().isDarkMode
          ? Colors.transparent
          : MyColors.white,
        // leadingWidth: 35.w,
        centerTitle: false,
        title: BlocBuilder<GenericBloc<int>, GenericState<int>>(
          bloc: data.homeTabCubit,
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    AutoRouter.of(context).push(const NotificationScreenRoute());
                  },
                  child: Icon(
                    Icons.notifications_active_outlined,
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? MyColors.amber
                        : MyColors.amber,
                    size: 30.w,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Image.asset(
                  Res.activeHome,
                  width: 30.w,
                  height: 30.h,
                  color: context.watch<AppThemeCubit>().isDarkMode
                      ?MyColors.white:null,
                ),
                SizedBox(
                  width: 10.w,
                ),
                MyText(
                  title: tr(context,"main"),
                  color: context.watch<AppThemeCubit>().isDarkMode
                      ? Colors.white
                      : MyColors.black,
                  size: 18.sp,
                  alien: TextAlign.center,
                  fontWeight: FontWeight.bold,
                ),
              ],
            );
          },
        ),
        leadingWidth: 40.w,
        leading: Padding(
          padding: EdgeInsets.only(right: 8.0.w),
          child: InkWell(
            onTap: () {
              data.scaffold.currentState?.openDrawer();
            },
            child: Icon(
              Icons.menu,
              color: context.watch<AppThemeCubit>().isDarkMode
                  ? Colors.white
                  : MyColors.black,
              size: 30.w,
            ),
          ),
        ),
        actions: [
          // BlocBuilder<AppThemeCubit, AppThemeState>(
          //   builder: (context, state) {
          //     return IconButton(
          //       onPressed: () {
          //         AppThemeCubit.get(context).changeTheme();
          //       },
          //       padding: EdgeInsets.zero,
          //       icon: Icon(
          //         Icons.dark_mode_outlined,
          //         color: context.watch<AppThemeCubit>().isDarkMode
          //             ? Colors.white
          //             : MyColors.black,
          //         size: 20.w,
          //       ),
          //     );
          //   },
          // ),
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
                        const SizedBox(width: 8.0),
                        MyText(
                          title: tr(context, model.toolName),
                          // color: Colors.white,
                          color: context.read<AppThemeCubit>().isDarkMode
                              ? Colors.white
                              : Colors.black,
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
              color: context.watch<AppThemeCubit>().isDarkMode
                  ? Colors.white
                  : MyColors.black,
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
                padding: EdgeInsets.all(16.r),
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
    switch (tool.toolName)
    {
      case "percentage":
        AutoRouter.of(context).push( const SubscriptionsRoute());
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => PercentageCalculatorScreen()));
        break;
      case "tax":
        AutoRouter.of(context).push( const SubscriptionsRoute());
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => ServiceTaxCalculatorScreen()));
        break;
      case "discount":
        AutoRouter.of(context).push( const SubscriptionsRoute());
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => DiscountCalculatorScreen()));
        break;
      case "qiblah":
        AutoRouter.of(context).push( const SubscriptionsRoute());
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => QiblahCompass()));
        break;
      case "scanner":
        AutoRouter.of(context).push( const SubscriptionsRoute());
        // Navigator.of(context)
        //     .push(
        //     MaterialPageRoute(builder: (context) =>
        //     // const ScannerQrCode()
        //
        //     ));
        break;
      case "calender":
        AutoRouter.of(context).push( const SubscriptionsRoute());
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => CalenderScreen()));
        break;
      case "calculator":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CalculatorScreen()));
        break;
        // case "shoesSize":
        //   Navigator.of(context).push(
        //       MaterialPageRoute(builder: (context) => const ShoesSizeScreen()));
        break;
      case "ringSize":
      // Navigator.of(context).push(
      //     MaterialPageRoute(builder: (context) => const RingSizeScreen()));
        AutoRouter.of(context).push( const SubscriptionsRoute());
        break;
      case "clothesSize":
      // Navigator.of(context).push(
      //     MaterialPageRoute(builder: (context) => const ClothesSizeScreen()));
        AutoRouter.of(context).push( const SubscriptionsRoute());
        break;
      case "bmi":
      // Navigator.of(context).push(
      //     MaterialPageRoute(builder: (context) => const BMICalculator()));
        AutoRouter.of(context).push( const SubscriptionsRoute());
        break;
      case "bmr":
      // Navigator.of(context).push(
      //     MaterialPageRoute(builder: (context) => BmrCalculatorScreen()));
        AutoRouter.of(context).push( const SubscriptionsRoute());
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
      // Navigator.of(context).push(
      //     MaterialPageRoute(builder: (context) => AreaConverterScreen()));
        AutoRouter.of(context).push( const SubscriptionsRoute());
        break;
      case "convertSpeed":
      // Navigator.of(context).push(
      //     MaterialPageRoute(builder: (context) => SpeedConverterScreen()));
        AutoRouter.of(context).push( const SubscriptionsRoute());
        break;
      case "convertData":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DataConverterScreen()));
        break;
      case "convertVolume":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => VolumeConverterScreen()));
        break;
      case "reminder":
      // Navigator.of(context).push(
      //     MaterialPageRoute(builder: (context) => ReminderScreen()));
        AutoRouter.of(context).push( const SubscriptionsRoute());
        break;
      case "ruler":
      // Navigator.of(context).push(
      //     MaterialPageRoute(builder: (context) => RulerScreen()));
        AutoRouter.of(context).push( const SubscriptionsRoute());
        break;
      case "note":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const NoteView()));
        break;
      case "calculateUnitPrice":
      // Navigator.of(context).push(
      //     MaterialPageRoute(builder: (context) => UnitPriceScreen()));
        AutoRouter.of(context).push( const SubscriptionsRoute());
        break;
      case "temporary":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TemporaryScreen()));
        break;
      case "stopWatch":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => StopwatchScreen()));
        break;
    }
  }
}

