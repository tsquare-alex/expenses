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
    await Future.delayed(const Duration(seconds: 2));

    refreshController.refreshCompleted();
  }

  @override
  void initState() {
    context.read<BudgetCubit>().calcualteRatio();
    super.initState();
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
                surfaceTintColor: Colors.transparent,
                leading: GestureDetector(
                  onTap: () => AutoRouter.of(context).pop(),
                  child: Icon(
                    Icons.arrow_back,
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? MyColors.white
                        : MyColors.black,
                  ),
                ),
                backgroundColor: context.watch<AppThemeCubit>().isDarkMode
                    ? AppDarkColors.backgroundColor
                    : MyColors.white,
                centerTitle: true,
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(Res.budget_icon, height: 28.h, width: 32.w),
                    MyText(
                      title: tr(context, "budget"),
                      color: context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : AppDarkColors.backgroundColor,
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
