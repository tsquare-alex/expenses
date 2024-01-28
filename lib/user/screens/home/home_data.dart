part of 'home_imports.dart';

class HomeData{
  final GenericBloc<int> navCubit = GenericBloc(0);

  late AnimationController animationController;
  late TabController tabController;
  late Animation<double> animation;
  late CurvedAnimation curve;

  final GenericBloc<int> homeTabCubit = GenericBloc(0);

  List<TabModel> activeTabs = [
    TabModel(
      image: Res.transactions,
      title: "transactions",
    ),
    TabModel(
      image: Res.activeHome,
      title: "main",
    ),
    TabModel(
      image: Res.reports,
      title: "reports",
    ),
  ];

  List<TabModel> tabs=[
    TabModel(
      image: Res.homeTransaction,
      title: "transactions",
    ),
    TabModel(
      image: Res.home,
      title: "main",
    ),
    TabModel(
      image: Res.homeReports,
      title: "reports",
    ),
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