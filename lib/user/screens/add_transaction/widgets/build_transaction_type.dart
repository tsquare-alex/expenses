part of 'add_transaction_widgets_imports.dart';

class BuildTransactionType extends StatelessWidget {
  const BuildTransactionType({
    Key? key,
    required this.addTransactionData,
    required this.type,
    required this.model, required this.boxName,
  }) : super(key: key);
  final AddTransactionData addTransactionData;
  final String type;
  final TransactionTypeModel model;
  final String boxName;

  @override
  Widget build(BuildContext context) {
    print(type);
    return Column(
      children: [
        if (type == "الالتزامات" || type == "التسوق والشراء")
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1.w, color: MyColors.greyWhite),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                childrenPadding: EdgeInsets.all(10.r),
                title: Row(
                  children: [
                    Image.asset(Res.transactions,width: 30.w,height: 30.h,),
                    SizedBox(
                      width: 15.w,
                    ),
                    MyText(
                      title: tr(context, "transaction"),
                      color: MyColors.black,
                      size: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                children: [
                  BlocBuilder<GenericBloc<List<TransactionContentModel>?>,
                      GenericState<List<TransactionContentModel>?>>(
                    bloc: addTransactionData.typeContentCubit,
                    builder: (context, state) {
                      return Column(
                        children: List.generate(state.data?.length??0, (index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Row(
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
                                      MyText(
                                        title: tr(context,
                                                    state.data![index].name!)
                                                .isNotEmpty
                                            ? tr(context,
                                                state.data![index].name!)
                                            : state.data?[index].name ?? "",
                                        color: MyColors.black,
                                        size: 13.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Radio(
                                  value: state.data?[index].selected ?? false,
                                  groupValue: true,
                                  onChanged: (v) {
                                    addTransactionData.selectContent(
                                        v!, model,state.data![index], index,type,boxName);
                                  }),
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
                    onTap: () => addTransactionData.addTransactionContentModel(
                        context, type, model),
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          title: tr(context, "addNewContent"),
                          color: MyColors.black,
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
                ],
              ),
            ),
          ),
        if (type == "المعاملات النقدية" || type == "الاهداف المالية المستهدفة")
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
                      model.image ?? "",
                      width: 30.w,
                      height: 30.h,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    MyText(
                      title: tr(context, model.name!).isNotEmpty?tr(context, model.name!):model.name ?? "",
                      color: MyColors.black,
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
