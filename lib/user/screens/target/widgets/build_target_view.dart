part of 'target_widgets_imports.dart';

class BuildTargetView extends StatefulWidget {
  const BuildTargetView(
      {Key? key,
      required this.hasData,
      required this.data,
      required this.transactionModel})
      : super(key: key);
  final bool hasData;
  final TargetData data;
  final TransactionModel transactionModel;

  @override
  State<BuildTargetView> createState() => _BuildTargetViewState();
}

class _BuildTargetViewState extends State<BuildTargetView> {
  @override
  void initState() {
    if(widget.hasData == true){
      widget.data.initData(widget.transactionModel);
    }
    super.initState();
  }

  @override
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
                        Res.cash,
                        width: 30.w,
                        height: 30.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      MyText(
                        title: tr(context, "target"),
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
          body: GridView.builder(
            itemCount: state.data.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.w,
                childAspectRatio: 0.5.w / 0.65.h),
            itemBuilder: (context, i) => BuildTargetItem(
              onTap: () async {
                if(state.data[i].name=="saving"){
                  await AutoRouter.of(context).push(AddTransactionRoute(
                      model: state.data[i],
                      transactionName: "الاهداف المالية المستهدفة",
                      boxName: "targetBox"));
                  widget.data.fetchData();
                }else{
                  AutoRouter.of(context).push(const SubscriptionsRoute());
                }
              },
              image: state.data[i].image ?? Res.shopping,
              name: state.data[i].name ?? "",
              isPro: state.data[i].name=="saving"?true:false,
            ),
          ),
        );
      },
    );
  }
}
