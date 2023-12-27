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
        padding: EdgeInsets.all(15.r),
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          color: MyColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  title: model.transactionDate ?? "",
                  color: MyColors.grey,
                  size: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
                IconButton(
                    onPressed: onDelete,
                    icon: Icon(
                      Icons.delete,
                      color: MyColors.primary,
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20.r,
                        backgroundColor: MyColors.primary.withOpacity(0.7),
                        child: Image.asset(
                          Res.transaction,
                          width: 20.w,
                          height: 20.h,
                          color: MyColors.white,
                        ),
                      ),
                      SizedBox(
                        width: 15.h,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              title:
                                  "${model.transactionName == "الالتزامات" || model.transactionName == "التسوق والشراء" ? model.transactionType?.name : model.transactionName == "الاهداف المالية المستهدفة" ? model.targetType?.name : model.transactionName == "المعاملات النقدية" ? model.cashTransactionType?.name : ""}",
                              color: MyColors.black,
                              size: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            if (model.transactionName == "الالتزامات" ||
                                model.transactionName == "التسوق والشراء")
                              Row(
                                children: [
                                  Image.asset(
                                    Res.contacts,
                                    width: 25.w,
                                    height: 25.h,
                                    color: MyColors.primary,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  MyText(
                                    title: model.database?.name ?? "",
                                    color: MyColors.black,
                                    size: 11.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            if (model.transactionName == "الالتزامات" ||
                                model.transactionName == "التسوق والشراء")
                              Row(
                                children: [
                                  Image.asset(
                                    Res.contacts,
                                    width: 25.w,
                                    height: 25.h,
                                    color: MyColors.primary,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                ],
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: MyColors.primary.withOpacity(0.6),
                          radius: 15.r,
                          child: Image.asset(
                            Res.bag,
                            width: 15.w,
                            height: 15.h,
                            color: MyColors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        MyText(
                          title: model.incomeSource?.paymentMethod ?? "",
                          color: MyColors.black,
                          size: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    MyText(
                      title: model.total ?? "",
                      color: MyColors.black,
                      size: 13.sp,
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
