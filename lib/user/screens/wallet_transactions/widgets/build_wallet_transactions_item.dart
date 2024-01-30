part of 'wallet_transactions_widgets_imports.dart';

class BuildWalletTransactionsItem extends StatelessWidget {
  const BuildWalletTransactionsItem({Key? key, required this.model, this.onArrowTap, required this.data, required this.walletModel}) : super(key: key);
  final AddTransactionModel model;
  final GestureTapCallback?  onArrowTap;
  final WalletTransactionsData data;
  final WalletModel walletModel;
  @override
  Widget build(BuildContext context) {
    double percentage =
        ((model.initialValue!=null?model.initialValue:0 )! / double.parse(model.total!)) * 100;
    return Column(
      children: [
        Container(
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
                  Row(
                    children: [
                      MyText(
                        title: model.transactionDate ?? "",
                        color: MyColors.grey,
                        size: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      InkWell(onTap: onArrowTap, child: Icon(Icons.arrow_drop_down,color: MyColors.primary,),),
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
                        Image.asset(model.transactionContent?.image??Res.shop,width: 30.w,height: 30.h,),
                        SizedBox(
                          width: 10.w,
                        ),
                        Flexible(
                          child: MyText(
                            title: tr(context, model.transactionContent?.name ?? "")
                                .isNotEmpty
                                ? tr(context, model.transactionContent?.name ?? "")
                                : model.transactionContent?.name ?? "",
                            color: MyColors.black,
                            size: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
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
              if (model.transactionName == "الاهداف المالية المستهدفة")
                LinearPercentIndicator(
                  isRTL: true,
                  lineHeight: 24.0.h,
                  percent: percentage / 100,
                  progressColor: Colors.green,
                  animateFromLastPercent: true,
                  animation: true,
                  animationDuration: 1000,
                ),
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
                  data.getWalletTransactions(context, walletModel);
                },
                child: MyText(
                  title: "المزيد من التفاصيل",
                  size: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: MyColors.primary,
                ),),
            ],
          ),
        ),
      ],
    );
  }
}
