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
                leading: IconButton(
                  icon: Image.asset(Res.back),
                  onPressed: () => AutoRouter.of(context).pop(),
                ),
                backgroundColor: MyColors.white,
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(Res.budgetIcon, height: 28.h, width: 32.w),
                    MyText(
                      title: tr(context, "budget"),
                      color: MyColors.black,
                      size: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
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
                                    model: data[index],
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
