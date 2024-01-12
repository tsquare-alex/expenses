part of 'widgets_imports.dart';

class BuildTransactionCard extends StatelessWidget {
  const BuildTransactionCard(
      {Key? key, required this.model, required this.onDelete})
      : super(key: key);
  final AddTransactionModel model;
  final GestureTapCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(
          TransactionDetailsRoute(
            model: model,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 20.r),
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
            color: MyColors.white,
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(width: 1.w, color: MyColors.greyWhite)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
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
                        width: 5.w,
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
                Row(
                  children: [
                    MyText(
                      title: model.transactionDate ?? "",
                      color: MyColors.grey,
                      size: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    InkWell(
                      onTap: onDelete,
                      child: CircleAvatar(
                        radius: 20.r,
                        backgroundColor: MyColors.greyWhite,
                        child: Icon(
                          Icons.delete,
                          color: MyColors.primary,
                        ),
                      ),
                    ),

                  ],
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
                      Image.asset(model.transactionContent?.image??"",width: 35.w,height: 35.h,),
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
                          Res.wallet,
                          width: 25.w,
                          height: 25.h,
                          color: MyColors.primary,
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
            if (model.transactionName == "الاهداف المالية المستهدفة")
              LinearPercentIndicator(
                lineHeight: 10.0.h,
                percent: 0.25,
                progressColor: Colors.blue,
              ),
          ],
        ),
      ),
    );
  }
}
