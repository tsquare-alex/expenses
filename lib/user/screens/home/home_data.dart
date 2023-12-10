part of 'home_imports.dart';

class HomeData{
  final GlobalKey<ScaffoldState> scaffold = GlobalKey();
  final GenericBloc<int> navCubit = GenericBloc(0);

  late AnimationController animationController;
  late TabController tabController;
  late Animation<double> animation;
  late CurvedAnimation curve;

  final GenericBloc<int> homeTabCubit = GenericBloc(0);

  List<TabModel> tabs = [
    TabModel(
      image: Res.dollar,
      title: "المعاملات",
    ),
    TabModel(
      image: Res.home,
      title: "الرئيسية",
    ),
    TabModel(
      image: Res.cart,
      title: "الاحصائيات",
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