part of 'expense_imports.dart';

class Expense extends StatefulWidget {
  const Expense({
    Key? key,
  }) : super(key: key);

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> with TickerProviderStateMixin {
  ExpenseData data = ExpenseData();
  TabController? tabController;


  @override
  void initState() {
    var local = context.read<LangCubit>().state.locale.languageCode;
    data.getCommitments(local);
    super.initState();

    tabController = TabController(length: 2, vsync: this);

    // Add a listener to the TabController to get the index when tabs are switched
    tabController?.addListener(() {
      data.tabCubit.onUpdateData(tabController!.index);
      print("Current Index: ${data.tabCubit.state.data}");
    });
  }

  @override
  Widget build(BuildContext context) {
    // TabController tabController = TabController(length: 2, vsync: this);

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: BlocBuilder<GenericBloc<int>, GenericState<int>>(
        bloc: data.tabCubit,
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: BlocBuilder<
                GenericBloc<List<TransactionModel>>,
                GenericState<List<TransactionModel>>>(
              bloc: data.commitmentsCubit,
              builder: (context, state2) {
                return FloatingActionButton(
                  backgroundColor: MyColors.primary,
                  onPressed: () =>
                      AutoRouter.of(context).push(AddTransactionRoute(
                    model: state2.data[state.data],
                  )),
                  shape: const CircleBorder(),
                  child: Icon(
                    Icons.add,
                    color: MyColors.white,
                  ),
                );
              },
            ),
            body: Column(
              children: [
                BlocBuilder<GenericBloc<List<TransactionModel>>,
                    GenericState<List<TransactionModel>>>(
                  bloc: data.commitmentsCubit,
                  builder: (context, state1) {
                    return Container(
                      height: 50.h,
                      color: MyColors.primary,
                      child: TabBar(
                        controller: tabController,
                        indicatorColor: MyColors.white,
                        indicatorPadding: EdgeInsets.only(
                            bottom: 2.r, right: 30.r, left: 30.r),
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: MyColors.white,
                        labelStyle: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                        unselectedLabelStyle: TextStyle(
                            color: MyColors.grey,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                        onTap: (i) {
                          data.tabCubit.onUpdateData(i);
                          state1.data
                              .map((element) => element.isSelected = false)
                              .toList();
                          state1.data[i].isSelected =
                              !state1.data[i].isSelected!;
                          data.commitmentsCubit.onUpdateData(state1.data);
                          print(state.data);
                        },
                        tabs: List.generate(
                            2,
                            (index) => Tab(
                                  text: tr(context, data.titles[index]),
                                )
                            ),
                      ),
                    );
                  },
                ),
                Expanded(
                  child: SizedBox(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Padding(
                      padding: EdgeInsets.all(15.0.r),
                      child: TabBarView(
                        controller: tabController,
                        children: const [
                          Commitments(),
                          Shopping(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
