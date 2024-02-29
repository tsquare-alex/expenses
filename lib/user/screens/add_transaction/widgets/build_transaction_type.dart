part of 'add_transaction_widgets_imports.dart';

class BuildTransactionType extends StatefulWidget {
  const BuildTransactionType({
    Key? key,
    required this.addTransactionData,
    required this.type,
    required this.model,
    required this.boxName,
  }) : super(key: key);
  final AddTransactionData addTransactionData;
  final String type;
  final TransactionTypeModel model;
  final String boxName;

  @override
  State<BuildTransactionType> createState() => _BuildTransactionTypeState();
}

class _BuildTransactionTypeState extends State<BuildTransactionType> {

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    print(widget.type);
    return Column(
      children: [
        if (widget.type == "الالتزامات" || widget.type == "التسوق والشراء")
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: (){
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Container(
              padding: EdgeInsets.all(15.r),
              decoration: BoxDecoration(
                border: Border.all(width: 1.w, color: MyColors.greyWhite),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Theme(
                data:
                    Theme.of(context).copyWith(dividerColor: Colors.transparent),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              Res.transactions,
                              width: 30.w,
                              height: 30.h,
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            BlocBuilder<GenericBloc<String?>, GenericState<String?>>(
                              bloc: widget.addTransactionData.transactionNameBloc,
                              builder: (context, state) {
                                return MyText(
                                  title: state.data == null
                                      ? tr(context, "transaction")
                                      : tr(context, state.data!).isNotEmpty
                                      ? tr(context, state.data!)
                                      : state.data ?? "",
                                  color: context.watch<AppThemeCubit>().isDarkMode
                                      ? MyColors.white
                                      : MyColors.black,
                                  size: 14.sp,
                                  fontWeight: FontWeight.bold,
                                );
                              },
                            ),
                          ],
                        ),
                        Icon(isExpanded==false?Icons.arrow_drop_up:Icons.arrow_drop_down,color: MyColors.primary,),
                      ],
                    ),
                    if(isExpanded == true)Padding(
                      padding: EdgeInsets.only(top: 10.0.h),
                      child: Column(
                          children: [
                          BlocBuilder<GenericBloc<List<TransactionContentModel>?>,
                              GenericState<List<TransactionContentModel>?>>(
                            bloc: widget.addTransactionData.typeContentCubit,
                            builder: (context, state) {
                              return Column(
                                children:
                                List.generate(state.data?.length ?? 0, (index) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              state.data?[index].image ??
                                                  Res.commitments,
                                              width: 30.w,
                                              height: 30.h,
                                            ),
                                            SizedBox(
                                              width: 15.w,
                                            ),
                                            Flexible(
                                              child: MyText(
                                                title: tr(context,
                                                    state.data![index].name!)
                                                    .isNotEmpty
                                                    ? tr(context,
                                                    state.data![index].name!)
                                                    : state.data?[index].name ?? "",
                                                color: context
                                                    .watch<AppThemeCubit>()
                                                    .isDarkMode
                                                    ? MyColors.white
                                                    : MyColors.black,
                                                size: 13.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // state.data?[index].name == "electric" ||
                                      //         state.data?[index].name == "telephone" ||
                                      //         state.data?[index].name == "dairy" ||
                                      //         state.data?[index].name == "cheese" ||
                                      //         state.data?[index].name == "bakedGoods" ||
                                      //         state.data?[index].name == "vegetable" ||
                                      //         state.data?[index].name == "fruits" ||
                                      //         state.data?[index].name == "oil" ||
                                      //         state.data?[index].name == "salt" ||
                                      //         state.data?[index].name == "rent"
                                      //     ?
                                      Radio(
                                        value:
                                        widget.addTransactionData.selectedContent ==
                                            null
                                            ? false
                                            : state.data?[index].selected ??
                                            false,
                                        groupValue: true,
                                        activeColor: MyColors.primary,
                                        onChanged: (v) {
                                          widget.addTransactionData.selectContent(
                                              v!,
                                              widget.model,
                                              state.data![index],
                                              index,
                                              widget.type,
                                              widget.boxName);
                                          widget.addTransactionData.transactionNameBloc
                                              .onUpdateData(
                                              state.data?[index].name);
                                          setState(() {
                                            isExpanded = false; // Close the ExpansionTile
                                            print(isExpanded);
                                          });
                                        },
                                      )
                                      // : InkWell(
                                      //     highlightColor: Colors.transparent,
                                      //     hoverColor: Colors.transparent,
                                      //     splashColor: Colors.transparent,
                                      //     onTap: () {
                                      //       AutoRouter.of(context)
                                      //           .push(const SubscriptionsRoute());
                                      //     },
                                      //     child: Image.asset(
                                      //       Res.pro,
                                      //       width: 50.w,
                                      //       height: 60.h,
                                      //     ),
                                      //   ),
                                    ],
                                  );
                                }),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          InkWell(
                            onTap: () => widget.addTransactionData.addTransactionContentModel(
                                context, widget.type, widget.model),
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText(
                                  title: tr(context, "addNewContent"),
                                  color: context.watch<AppThemeCubit>().isDarkMode
                                      ? MyColors.white
                                      : MyColors.black,
                                  size: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                Icon(
                                  Icons.add,
                                  color: MyColors.primary,
                                ),
                              ],
                            ),
                          ),
                          ]
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        if (widget.type == "المعاملات النقدية" || widget.type == "الاهداف المالية المستهدفة")
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                title: tr(context, "transaction"),
                color: MyColors.black,
                size: 14.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1.w, color: MyColors.greyWhite),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: EdgeInsets.all(10.r),
                child: Row(
                  children: [
                    Image.asset(
                      widget.model.image ?? "",
                      width: 30.w,
                      height: 30.h,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    MyText(
                      title: tr(context, widget.model.name!).isNotEmpty
                          ? tr(context, widget.model.name!)
                          : widget.model.name ?? "",
                      color: context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                      size: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }
}
