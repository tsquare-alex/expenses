part of 'target_widgets_imports.dart';

class BuildTargetCard extends StatelessWidget {
  const BuildTargetCard({Key? key, required this.model, required this.onDelete, required this.data})
      : super(key: key);
  final AddTransactionModel model;
  final GestureTapCallback onDelete;
  final TargetData data;
  @override
  Widget build(BuildContext context) {
    var remaining = double.parse(model.total!) - model.initialValue!;
    double percentage =
        (model.initialValue! / double.parse(model.total!)) * 100;
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
              Column(
                children: [
                  MyText(
                    title: tr(context, "startDate"),
                    color: MyColors.black,
                    size: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  MyText(
                    title: "${model.startDate}",
                    color: MyColors.grey,
                    size: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              Column(
                children: [
                  MyText(
                    title: tr(context, "endDate"),
                    color: MyColors.black,
                    size: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  MyText(
                    title: "${model.endDate}",
                    color: MyColors.grey,
                    size: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     MyText(
              //       title: model.transactionDate ?? "",
              //       color: MyColors.grey,
              //       size: 14.sp,
              //       fontWeight: FontWeight.bold,
              //     ),
              //     SizedBox(
              //       width: 10.w,
              //     ),
              //     InkWell(
              //       onTap: onDelete,
              //       child: CircleAvatar(
              //         radius: 20.r,
              //         backgroundColor: MyColors.greyWhite,
              //         child: Icon(
              //           Icons.delete,
              //           color: MyColors.primary,
              //         ),
              //       ),
              //     ),
              //
              //   ],
              // ),
            ],
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
                    title: tr(context, "residual"),
                    color: MyColors.grey,
                    size: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  MyText(
                    title: "$remaining",
                    color: MyColors.primary,
                    size: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  MyText(
                    title: tr(context, "EGP"),
                    color: MyColors.grey,
                    size: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          if (model.transactionName == "الاهداف المالية المستهدفة")
            LinearPercentIndicator(
              isRTL: true,
              lineHeight: 24.0.h,
              percent: percentage / 100,
              progressColor: Colors.green,
              animateFromLastPercent: true,
              restartAnimation: true,
              animation: true,
              animationDuration: 1000,
            ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  MyText(
                    title: tr(context, "saving"),
                    color: MyColors.grey,
                    size: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  MyText(
                    title: "${model.initialValue}",
                    color: MyColors.black,
                    size: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              MyText(
                title: tr(context, "from"),
                color: MyColors.black,
                size: 14.sp,
                fontWeight: FontWeight.bold,
              ),
              Row(
                children: [
                  MyText(
                    title: "${model.total}",
                    color: MyColors.black,
                    size: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  MyText(
                    title: tr(context, "aim"),
                    color: MyColors.grey,
                    size: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
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
            ),
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
            ),
          ),
        ],
      ),
    );
  }
}
