part of 'budget_imports.dart';

class Budget extends StatelessWidget {
  const Budget({super.key});

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BudgetCubit()..fetchData(),
      child: BlocBuilder<BudgetCubit, BudgetState>(
        builder: (context, state) {
          return Scaffold(
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
                              itemBuilder: (context, index) => ItemBudget(
                                model: data[index],
                              ),
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
    );
  }
}
