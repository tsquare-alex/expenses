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
      ToolsHelper(),
      Database(),
      FavoriteScreen(),
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
                    ),),
                  SizedBox(
                    width: 10.w,
                  ),
                  BlocBuilder<GenericBloc<int>, GenericState<int>>(
                    bloc: data.homeTabCubit,
                    builder: (context, state) {
                      return Image.asset(
                        data.icons[state.data], color: MyColors.white,width: 20.w,height: 20.h,);
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
            body:BlocProvider.of<AuthenticationCubit>(context).state.isAuthenticated ?
            BlocBuilder<GenericBloc<int>, GenericState<int>>(
              bloc: data.homeTabCubit,
              builder: (context, state) => screen[data.homeTabCubit.state.data],
            ) :  Container(
              // height: 200,
              child: Column(
                children: [
                  BlocBuilder<AuthenticationCubit, AuthenticationState>(
                    builder: (context, state) {
                      return SwitchListTile(
                        title: Text('Enable Authentication'),
                        value: state.isAuthenticated,
                        onChanged: (value) async {
                          final authenticationCubit = context.read<AuthenticationCubit>();
                          if (value && authenticationCubit.isAuthenticationRequired()) {
                            // Show authentication dialog
                            bool authenticated = await authenticationCubit.showAuthenticationDialog(context);
                            setState(() {});
                            // Only update the status if the authentication was successful
                            if (authenticated) {
                              authenticationCubit.emit(AuthenticationState(isAuthenticated: true));
                              setState(() {});
                            }
                          } else {
                            // If authentication is not required or the user turns off the switch
                            if (!value) {
                              authenticationCubit.clearAuthenticationStatus();
                            }
                            authenticationCubit.emit(AuthenticationState(isAuthenticated: value));
                          }
                        },
                      );
                    },
                  ),
                  BlocBuilder<AuthenticationCubit, AuthenticationState>(
                    builder: (context, state) {
                      return Visibility(
                        visible: state.isAuthenticated,
                        child: Text(
                          'Authentication is enabled',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            bottomNavigationBar:
            BuildBottomNavigationBar(controller: data),
          ),
        ));
  }
}
