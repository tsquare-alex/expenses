part of 'home_imports.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {

  HomeData data = HomeData();

  @override
  void initState() {
    data.initBottomNavigation(this, widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screen = [
      Transactions(homeTabCubit: data.homeTabCubit,),
      Main(homeTabCubit: data.homeTabCubit,),
      const Reports(),
      const Settings(),
      Container(),
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
                    title: data.titles[state.data],
                    color: MyColors.white,
                    size: 14.sp,
                    alien: TextAlign.center,
                    fontWeight: FontWeight.bold,
                  );
                },
              ),
              leading: Padding(
                padding: EdgeInsets.only(right: 15.0.r),
                child: IconButton(
                  onPressed: () {
                    data.scaffold.currentState?.openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: MyColors.white,
                    size: 30.w,
                  ),),
              ),
              actions: [
                BlocBuilder<AppThemeCubit, AppThemeState>(
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () {
                        AppThemeCubit.get(context).toggleTheme(AppThemeCubit.get(context).isDarkMode);
                      },
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.dark_mode_outlined,
                        color: MyColors.white,
                        size: 20.w,
                      ),);
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
            endDrawer: BuildEndDrawer(homeTabCubit: data.homeTabCubit,),
            body: BlocBuilder<GenericBloc<int>, GenericState<int>>(
              bloc: data.homeTabCubit,
              builder: (context, state) {
                var index = widget.index;
                index= state.data;
                return screen[index];
              },
            ),
            bottomNavigationBar:
            BuildBottomNavigationBar(controller: data),
          ),
        ));
  }
}
