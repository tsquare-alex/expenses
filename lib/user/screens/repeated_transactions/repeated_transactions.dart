part of 'repeated_transactions_imports.dart';

class RepeatedTransactions extends StatefulWidget {
  const RepeatedTransactions({Key? key}) : super(key: key);

  @override
  State<RepeatedTransactions> createState() => _RepeatedTransactionsState();
}

class _RepeatedTransactionsState extends State<RepeatedTransactions> {

  RepeatedTransactionsData data = RepeatedTransactionsData();

  @override
  void initState() {
    data.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.watch<AppThemeCubit>().isDarkMode
            ? AppDarkColors.backgroundColor
            : MyColors.white,
        surfaceTintColor: context.watch<AppThemeCubit>().isDarkMode
            ? AppDarkColors.backgroundColor
            : MyColors.white,
        title: Padding(
          padding: EdgeInsets.only(left: 40.0.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Res.repeated,
                width: 30.w,
                height: 30.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              MyText(
                title: tr(context, "recurringTransactions"),
                color: context.watch<AppThemeCubit>().isDarkMode
                    ? MyColors.white
                    : MyColors.black,
                size: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
        leading: InkWell(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => AutoRouter.of(context).pop(),
          child: Icon(Icons.arrow_back, color: context.watch<AppThemeCubit>().isDarkMode
              ? MyColors.white
              : MyColors.black,),
        ),
        centerTitle: true,
      ),

      body: BlocBuilder<GenericBloc<List<AddTransactionModel>>,
          GenericState<List<AddTransactionModel>>>(
        bloc: data.addTransactionCubit,
        builder: (context, state) {
          if (state.data.isEmpty) {
            return const SingleChildScrollView(
              child: BuildNoRecord(),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(15.0.r),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.data.length,
                itemBuilder: (context, i) => BuildRepeatedTransactionsCard(
                  model: state.data[i],onDelete: ()=>data.deleteItem(state.data[i]), data: data,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
