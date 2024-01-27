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
    Workmanager().registerPeriodicTask(
      "1",
      "Open The App",
      frequency: Duration(minutes: 15),
      // frequency: Duration(hours: 12),

      inputData: {
        "Name":"The Name",
        "Email":"email@gmail.com"
      },
    ).then((value) {
      print("On Then");
      // sendNotificationNow();
    });
    // Workmanager().registerPeriodicTask(
    //     "2",
    //     "repeated transaction",
    //   frequency: Duration(minutes: 15),
    //
    //   inputData: {
    //     "id":"transaction",
    //   },
    // );
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
      Container(child: Center(
          child: Text(
            'قيد التطوير حاليا',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: MyColors.primary,
            ),
          ),
        ),),
      const Wallet(),
      const Budget(),
      Container(),
      Container(),
      Container(),
      const RepeatedTransactions(),
      Container(),
      Container(),
      const Cart(),
    ];
    return WillPopScope(
        onWillPop: () async {
          if (data.homeTabCubit.state.data == 1) {
            await SystemNavigator.pop();
          }

          Future.delayed(const Duration(milliseconds: 200), () {
            data.homeTabCubit.onUpdateData(1);
            data.tabController.animateTo(1);
          });

          return data.homeTabCubit.state.data == 1;
        },
        child: DefaultTabController(
          length: 15,
          initialIndex: widget.index,
          child: Scaffold(

            body: BlocBuilder<GenericBloc<int>, GenericState<int>>(
              bloc: data.homeTabCubit,
              builder: (context, state) => screen[data.homeTabCubit.state.data],
            ),
            bottomNavigationBar: BuildBottomNavigationBar(controller: data),
          ),
        ));
  }


}
