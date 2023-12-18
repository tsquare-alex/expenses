part of 'expense_imports.dart';

class Expense extends StatefulWidget {
  const Expense({Key? key}) : super(key: key);

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> with TickerProviderStateMixin {
  ExpenseData data = ExpenseData();

  @override
  void initState() {
    data.getCommitments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: BlocBuilder<GenericBloc<int>, GenericState<int>>(
        bloc: data.tabCubit,
  builder: (context, state) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: MyColors.primary,
          onPressed: ()=>AutoRouter.of(context).push(AddTransactionRoute(model: data.commitments[state.data],)),
          shape: const CircleBorder(),
          child: Icon(Icons.add,color: MyColors.white,),
        ),
        body: Column(
          children: [

            BlocBuilder<GenericBloc<List<TransactionModel>>,
                GenericState<List<TransactionModel>>>(
              bloc: data.commitmentsCubit,
              builder: (context, state1) {
                return Container(
                  height: 70.h,
                  color: MyColors.primary,
                  child: TabBar(
                    controller: tabController,
                    indicatorColor: MyColors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: MyColors.white,
                    labelStyle: TextStyle(
                        fontSize: 14.sp, fontWeight: FontWeight.bold),
                    unselectedLabelStyle: TextStyle(
                        color: MyColors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                    onTap: (i) {
                      data.tabCubit.onUpdateData(i);
                      state1.data.map((element) => element.isSelected=false).toList();
                      state1.data[i].isSelected=!state1.data[i].isSelected!;
                      data.commitmentsCubit.onUpdateData(state1.data);
                      print(state.data);
                    },
                    tabs: List.generate(
                        2,
                            (index) => Container(
                          height: 50.h,
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width*0.5,
                          decoration: BoxDecoration(
                              color: state1.data[index].isSelected==true?MyColors.white:MyColors.primary.withOpacity(0.4),
                              border: Border.all(
                                color: state1.data[index].isSelected==true?MyColors.black:MyColors.primary,
                                width: 2.w,
                              ),
                              borderRadius: BorderRadius.circular(15.r)
                          ),
                          child: MyText(
                            title: data.commitments[index].name ??"",
                            color: state1.data[index].isSelected==true?MyColors.primary:MyColors.black,
                            size: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
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
                    children: [
                      BuildCommitmentsView(),
                      BuildShoppingView(),
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
