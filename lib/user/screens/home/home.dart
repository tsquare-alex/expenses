part of 'home_imports.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{

  HomeData data = HomeData();

  @override
  void initState() {
    data.initBottomNavigation(this,widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          length: 3,
          initialIndex: widget.index,
          child: Scaffold(
            body: TabBarView(
              controller: data.tabController,
              physics: const NeverScrollableScrollPhysics(),
              children:  [
                Container(),
                const Main(),
                Container(),
              ],
            ),
            bottomNavigationBar:
            BuildBottomNavigationBar(controller: data),
          ),
        ));
  }
}
