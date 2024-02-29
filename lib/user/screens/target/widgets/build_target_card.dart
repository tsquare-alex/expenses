part of 'target_widgets_imports.dart';

class BuildTargetCard extends StatelessWidget {
  const BuildTargetCard(
      {Key? key,
      required this.model,
      required this.onDelete,
      required this.data})
      : super(key: key);
  final AddTransactionModel model;
  final GestureTapCallback onDelete;
  final TargetData data;
  @override
  Widget build(BuildContext context) {
    var lang = context.watch<LangCubit>().state.locale.languageCode;
    var remaining = double.parse(model.total!) - model.initialValue!;
    double percentage =
        (model.initialValue! / double.parse(model.total!)) * 100;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 20.r),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
          color:  context.watch<AppThemeCubit>().isDarkMode
              ? MyColors.greyWhite
              : MyColors.white,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(width: 1.w, color: MyColors.greyWhite)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  MyText(
                    title: tr(context, "startDate"),
                    color: MyColors.black,
                    size: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  MyText(
                    title: "${model.startDate}",
                    color: MyColors.grey,
                    size: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              Row(
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
                    title: remaining.toString().formatToDecimal(context: context),
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
              isRTL: lang=="ar"?true:false,
              lineHeight: 24.0.h,
              percent: percentage / 100,
              progressColor: MyColors.primary,
              animateFromLastPercent: true,
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
                    title: model.initialValue.toString().formatToDecimal(context: context),
                    color:  context.watch<AppThemeCubit>().isDarkMode
                        ? MyColors.white
                        : MyColors.black,
                    size: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              MyText(
                title: tr(context, "from"),
                color:  context.watch<AppThemeCubit>().isDarkMode
                    ? MyColors.white
                    : MyColors.black,
                size: 14.sp,
                fontWeight: FontWeight.bold,
              ),
              Row(
                children: [
                  MyText(
                    title: model.total.toString().formatToDecimal(context: context),
                    color:  context.watch<AppThemeCubit>().isDarkMode
                        ? MyColors.white
                        : MyColors.black,
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
          Divider(
            thickness: 1.w,
            color:  context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.white
                : MyColors.greyWhite,
          ),
          SizedBox(
            height: 10.h,
          ),
          InkWell(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () async {
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
