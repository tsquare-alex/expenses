part of 'commitments_widgets_imports.dart';

class BuildCommitmentView extends StatefulWidget {
  const BuildCommitmentView({
    Key? key,
    required this.hasData,
    required this.data,
    required this.transactionModel,
  }) : super(key: key);
  final CommitmentsData data;
  final bool hasData;
  final TransactionModel transactionModel;

  @override
  State<BuildCommitmentView> createState() => _BuildCommitmentViewState();
}

class _BuildCommitmentViewState extends State<BuildCommitmentView> {
  @override
  void initState() {
    if (widget.hasData == true) {
      widget.data.initData(widget.transactionModel);
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<TransactionTypeModel>>,
        GenericState<List<TransactionTypeModel>>>(
      bloc: widget.data.transactionTypeCubit,
      builder: (context, state) {
        return Scaffold(
          appBar: widget.hasData == true
              ? AppBar(
                  backgroundColor: context.watch<AppThemeCubit>().isDarkMode
                      ? AppDarkColors.backgroundColor
                      : MyColors.white,
                  surfaceTintColor: context.watch<AppThemeCubit>().isDarkMode
                      ? AppDarkColors.backgroundColor
                      : MyColors.white,
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        Res.commitments,
                        width: 30.w,
                        height: 30.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      MyText(
                        title: tr(context, "commitments"),
                        color: context.watch<AppThemeCubit>().isDarkMode
                            ? MyColors.white
                            : MyColors.black,
                        size: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  leading: InkWell(
                    onTap: () => AutoRouter.of(context).pop(),
                    child: Icon(
                      Icons.arrow_back,
                      color: context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                    ),
                  ),
                  centerTitle: true,
                )
              : null,
          floatingActionButton: widget.hasData == true
              ? FloatingActionButton(
                  backgroundColor: MyColors.primary,
                  onPressed: () {
                    widget.data.addTransactionModel(context);
                  },
                  shape: const CircleBorder(),
                  child: Icon(
                    Icons.add,
                    color: MyColors.white,
                  ),
                )
              : null,
          body: Padding(
            padding: EdgeInsets.only(top: 15.0.r),
            child: GridView.builder(
              itemCount: state.data.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 0.5.h / 0.65.w),
              itemBuilder: (context, i) => BuildCommitmentItem(
                onTap: () async {
                  // if (state.data[i].name == "bills" ||
                  //     state.data[i].name == "family") {
                    await AutoRouter.of(context).push(AddTransactionRoute(
                        model: state.data[i],
                        transactionName: "الالتزامات",
                        boxName: "transactionBox"));
                    widget.data.addTransactionList.clear();
                    widget.data.fetchData();
                  // } else {
                  //   AutoRouter.of(context).push(const SubscriptionsRoute());
                  // }
                },
                image: state.data[i].image ?? Res.commitments,
                name: state.data[i].name ?? "",
                isPro:
                //  state.data[i].name != "bills" &&
                //         state.data[i].name != "family"
                //     ? false
                //     :
                     true,
              ),
            ),
          ),
        );
      },
    );
  }
}
