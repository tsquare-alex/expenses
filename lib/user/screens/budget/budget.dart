part of 'budget_imports.dart';

class Budget extends StatefulWidget {
  const Budget({super.key});

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  
  BudgetData budgetData = BudgetData();

  RefreshController refreshController =
  RefreshController(initialRefresh: false);

  void onRefresh() async {
    // Simulate a delay or perform any background tasks
    await Future.delayed(const Duration(seconds: 2));

    // After the task is complete, end the refreshing process
    refreshController.refreshCompleted();
  }
  
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: refreshController,
      onRefresh: onRefresh,
      child: BlocProvider(
        create: (context) => BudgetCubit()..fetchData(),
        child: BlocBuilder<BudgetCubit, BudgetState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.red,
                title: Row(
                  children: [
                    Image.asset(
                      Res.budget,
                      width: 20.w,
                      height: 20.h,
                      color: MyColors.white,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    MyText(
                      title: tr(context, 'budget'),
                      color: Colors.white,
                      size: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                automaticallyImplyLeading: false,
              ),
              body: Column(children: [
                Expanded(
                  child: BlocBuilder<BudgetCubit, BudgetState>(
                    builder: (context, state) {
                      List<BudgetModel> data =
                          BlocProvider.of<BudgetCubit>(context).budgetList;
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 3.h),
                        child: data.isEmpty
                            ? const BuildNoRecord()
                            : ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return ItemBudget(
                                    model: data[index], data: budgetData,
                                  );
                                },
                              ),
                      );
                    },
                  ),
                ),
              ]),
              floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  await AutoRouter.of(context)
                      .push(const AddTransactionBudgetRoute());
                  if (context.mounted) {
                    context.read<BudgetCubit>().fetchData();
                  }
                },
                backgroundColor: MyColors.primary,
                child: Icon(
                  Icons.add,
                  size: 20.sp,
                  color: MyColors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
