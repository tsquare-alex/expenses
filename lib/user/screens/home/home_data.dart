part of 'home_imports.dart';

class HomeData{
  final GlobalKey<ScaffoldState> scaffold = GlobalKey();
  final GenericBloc<int> navCubit = GenericBloc(0);

  late AnimationController animationController;
  late TabController tabController;
  late Animation<double> animation;
  late CurvedAnimation curve;

  final GenericBloc<int> homeTabCubit = GenericBloc(0);

  List<String> activeTabs = [
    Res.dollar,
    Res.home,
    Res.cart,
  ];
  List<String> tabs = [
    Res.dollar,
    Res.home,
    Res.cart,
  ];

  void initBottomNavigation(TickerProvider ticker,int index) {
    tabController = TabController(length: 3, vsync: ticker,initialIndex:index );
    homeTabCubit.onUpdateData(index);

  }

  void animateTabsPages(int index, BuildContext context) {
    if (index != homeTabCubit.state.data) {
      homeTabCubit.onUpdateData(index);
      tabController.animateTo(index);
    }
  }
}