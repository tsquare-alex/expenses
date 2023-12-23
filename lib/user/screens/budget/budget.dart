part of 'budget_imports.dart';

class Budget extends StatefulWidget {
  const Budget({super.key});

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  Widget build(BuildContext context) {
    return BlocConsumer<BudgetCubit, BudgetState>(
      listener: (context, state) {
        if (state is SuccessFetchData) {}
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(children: [
            Expanded(
              child: BlocBuilder<BudgetCubit, BudgetState>(
                builder: (context, state) {
                  List<BudgetModel> data =
                      BlocProvider.of<BudgetCubit>(context).budgetList;
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) => ItemBudget(
                      model: data[index],
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
    );
  }
}
