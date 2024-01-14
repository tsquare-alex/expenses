part of 'repeated_transactions_widgets_imports.dart';

class BuildRepeatedTransactionsCard extends StatelessWidget {
  const BuildRepeatedTransactionsCard({Key? key, required this.model, required this.onDelete, required this.data})
      : super(key: key);
  final AddTransactionModel model;
  final GestureTapCallback onDelete;
  final RepeatedTransactionsData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 20.r),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(width: 1.w, color: MyColors.greyWhite)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.asset(
                      model.transactionType?.image ?? Res.transaction,
                      width: 30.w,
                      height: 30,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: MyText(
                        title: tr(context, model.transactionType?.name ?? "")
                            .isNotEmpty
                            ? tr(context, model.transactionType?.name ?? "")
                            : model.transactionType?.name ?? "",
                        color: MyColors.black,
                        size: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              MyText(
                title: model.transactionDate ?? "",
                color: MyColors.grey,
                size: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Divider(
            thickness: 1.w,
            color: MyColors.greyWhite,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              model.transactionName=="الالتزامات"||model.transactionName=="التسوق والشراء"?Expanded(
                child: Row(
                  children: [
                    Image.asset(model.transactionContent?.image??"",width: 30.w,height: 30.h,),
                    SizedBox(
                      width: 10.w,
                    ),
                    MyText(
                      title: tr(context, model.transactionContent?.name ?? "")
                          .isNotEmpty
                          ? tr(context, model.transactionContent?.name ?? "")
                          : model.transactionType?.name ?? "",
                      color: MyColors.black,
                      size: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ):Container(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        Res.insurances,
                        width: 30.w,
                        height: 30.h,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      MyText(
                        title: model.incomeSource?.paymentMethod ?? "",
                        color: MyColors.black,
                        size: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  MyText(
                    title: "${tr(context, "value")} : ${model.total}",
                    color: MyColors.black,
                    size: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          if(model.description !="")Container(
            alignment: Alignment.topRight,
            child: Row(
              children: [
                Image.asset(
                  Res.description,
                  width: 20.w,
                  height: 20.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                MyText(
                  title: model.description ?? "",
                  size: 12.sp,
                  fontWeight: FontWeight.w900,
                  color: MyColors.grey,
                ),
              ],
            ),),
          SizedBox(
            height: 10.h,
          ),
          Divider(thickness: 1.w,color: MyColors.greyWhite,),
          SizedBox(
            height: 10.h,
          ),
          InkWell(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () async{
              await AutoRouter.of(context).push(
                TransactionDetailsRoute(
                  model: model,
                ),
              );
              data.addTransactionList.clear();
              data.fetchData();
            },
            child: MyText(
              title: "المزيد من التفاصيل",
              size: 16.sp,
              fontWeight: FontWeight.bold,
              color: MyColors.primary,
            ),),
        ],
      ),
    );

  }
}
