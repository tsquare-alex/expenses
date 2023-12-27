part of 'home_imports.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.index, this.pageIndex}) : super(key: key);
  final int index;
  final int? pageIndex;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  HomeData data = HomeData();

  @override
  void initState() {
    data.initBottomNavigation(this, widget.index);
    if (widget.pageIndex != null) {
      data.homeTabCubit.onUpdateData(widget.pageIndex!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screen = [
      Transactions(
        homeTabCubit: data.homeTabCubit,
      ),
      Main(
        homeTabCubit: data.homeTabCubit,
      ),
      const Reports(),
      const Settings(),
      ToolsHelper(),
      Database(),
      Container(),
      const Wallet(),
      const Budget(),
      const Expense(),
      const Target(),
      const CashTransactions(),
      const RepeatedTransactions(),
    ];
    return WillPopScope(
        onWillPop: () async {
          if (data.homeTabCubit.state.data == 0) {
            await SystemNavigator.pop();
          }

          Future.delayed(const Duration(milliseconds: 200), () {
            data.homeTabCubit.onUpdateData(0);
            data.tabController.animateTo(0);
          });

          return data.homeTabCubit.state.data == 0;
        },
        child: DefaultTabController(
          length: 12,
          initialIndex: widget.index,
          child: Scaffold(
            key: data.scaffold,
            appBar: AppBar(
              //backgroundColor: MyColors.primary,
              // leadingWidth: 35.w,
              title: BlocBuilder<GenericBloc<int>, GenericState<int>>(
                bloc: data.homeTabCubit,
                builder: (context, state) {
                  return MyText(
                    title: tr(context, data.titles[state.data]),
                    color: MyColors.white,
                    size: 14.sp,
                    alien: TextAlign.center,
                    fontWeight: FontWeight.bold,
                  );
                },
              ),
              leadingWidth: 71.w,
              leading: Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  InkWell(
                    onTap: () {
                      data.scaffold.currentState?.openDrawer();
                    },
                    child: Icon(
                      Icons.menu,
                      color: MyColors.white,
                      size: 30.w,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  BlocBuilder<GenericBloc<int>, GenericState<int>>(
                    bloc: data.homeTabCubit,
                    builder: (context, state) {
                      return Image.asset(
                        data.icons[state.data],
                        color: MyColors.white,
                        width: 20.w,
                        height: 20.h,
                      );
                    },
                  ),
                ],
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
                  color: Colors.black,
                  onSelected: _onFavoriteItemSelected,
                  itemBuilder: (BuildContext context) {
                    return [
                      for (FavoriteModel model in getFavoriteModels(context))
                        PopupMenuItem<FavoriteModel>(
                          value: model,
                          child: Row(
                            children: <Widget>[
                              Icon(IconData(model.iconCode, fontFamily: 'MaterialIcons'),color: MyColors.primary), // Add an icon or any widget to represent the favorite item
                              SizedBox(width: 8.0),
                            MyText(title: tr(context, model.toolName), color:Colors.white, size: 15.sp)
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
            drawer: BuildDrawer(
              shareCubit: data.shareCubit,
              homeTabCubit: data.homeTabCubit,
            ),
            endDrawer: BuildEndDrawer(
              homeTabCubit: data.homeTabCubit,
            ),
            body: BlocBuilder<GenericBloc<int>, GenericState<int>>(
              bloc: data.homeTabCubit,
              builder: (context, state) => screen[data.homeTabCubit.state.data],
            ),
            bottomNavigationBar: BuildBottomNavigationBar(controller: data),
          ),
        ));
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
