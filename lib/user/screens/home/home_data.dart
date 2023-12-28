part of 'home_imports.dart';

class HomeData{
  final GlobalKey<ScaffoldState> scaffold = GlobalKey();
  final GenericBloc<int> navCubit = GenericBloc(0);
  GenericBloc<bool> shareCubit = GenericBloc(false);

  late AnimationController animationController;
  late TabController tabController;
  late Animation<double> animation;
  late CurvedAnimation curve;

  final GenericBloc<int> homeTabCubit = GenericBloc(0);

  List<TabModel> tabs = [
    TabModel(
      image: Res.dollar,
      title: "transactions",
    ),
    TabModel(
      image: Res.home,
      title: "main",
    ),
    TabModel(
      image: Res.cart,
      title: "reports",
    ),
  ];
  List<String> titles=[
    "transactions",
    "main",
    "reports",
    "settings",
    "tools",
    "database",
    "help",
    "wallets",
    "budget",
    "expense",
    "target",
    "cashTransactions",
    "recurringTransactions",
    "commitments",
    "shopping",
    "cart",
  ];

  List<String> icons=[
    Res.transaction,
    Res.home,
    Res.report,
    Res.settings,
    Res.tools,
    Res.database,
    Res.explain,
    Res.wallet,
    Res.budget,
    Res.transaction,
    Res.budget,
    Res.cashTransactions,
    Res.repeatedTransactions,
    Res.commitment,
    Res.bag,
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