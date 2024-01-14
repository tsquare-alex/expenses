part of 'home_imports.dart';

class HomeData{
  final GenericBloc<int> navCubit = GenericBloc(0);

  late AnimationController animationController;
  late TabController tabController;
  late Animation<double> animation;
  late CurvedAnimation curve;

  final GenericBloc<int> homeTabCubit = GenericBloc(0);

  List<TabModel> tabs = [
    TabModel(
      image: Res.transaction,
      title: "transactions",
    ),
    TabModel(
      image: Res.home,
      title: "main",
    ),
    TabModel(
      image: Res.chart,
      title: "reports",
    ),
  ];
  List<String> titles=[
    "",
    "main",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    // "transactions",
    // "main",
    // "reports",
    // "settings",
    // "tools",
    // "database",
    // "help",
    // "wallets",
    // "budget",
    // "expense",
    // "target",
    // "cashTransactions",
    // "recurringTransactions",
    // "commitments",
    // "shopping",
    // "cart",
  ];

  List<String> icons=[
    "",
    Res.home,
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    // Res.transaction,
    // Res.home,
    // Res.report,
    // Res.settings,
    // Res.tools,
    // Res.database,
    // Res.explain,
    // Res.wallet,
    // Res.budget,
    // Res.transaction,
    // Res.budget,
    // Res.cashTransactions,
    // Res.repeatedTransactions,
    // Res.commitment,
    // Res.bag,
    // Res.cart,
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