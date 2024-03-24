part of 'main_widgets_imports.dart';

class WalletDetailsRow extends StatelessWidget {
  const WalletDetailsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 208.h,
      padding: EdgeInsets.fromLTRB(6.w, 16.h, 6.w, 8.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: context.watch<AppThemeCubit>().isDarkMode
              ? AppDarkColors.accentColor
              : MyColors.greyWhite,
          width: 1.r,
        ),
        color: context.watch<AppThemeCubit>().isDarkMode
            ? AppDarkColors.backgroundColor
            : Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: context.watch<AppThemeCubit>().isDarkMode
                ? AppDarkColors.accentColor
                : MyColors.greyWhite,
            blurRadius: 0.5,
            spreadRadius: 0.5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tr(context, 'mainExpenses'),
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 100.r,
                width: 100.r,
                child: LiquidCircularProgressIndicator(
                  value: context.watch<ReportsCubit>().spentMoneyPercentage,
                  valueColor: const AlwaysStoppedAnimation(Colors.red),
                  borderColor: Colors.grey.shade400,
                  borderWidth: 0.5,
                  backgroundColor: context.watch<AppThemeCubit>().isDarkMode
                      ? AppDarkColors.accentColor1
                      : Colors.white,
                  center: Text(
                    NumberFormat.percentPattern('en').format(
                        context.watch<ReportsCubit>().spentMoneyPercentage),
                    style: TextStyle(
                      color:
                          context.watch<ReportsCubit>().spentMoneyPercentage <
                                  0.6
                              ? Colors.black
                              : Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text(
                tr(context, 'totalExpenses'),
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                context
                    .read<ReportsCubit>()
                    .spentMoney
                    .toString()
                    .formatToDecimal(context: context),
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? AppDarkColors.accentColor
                        : MyColors.greyWhite,
                    width: 2.r,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      value:
                          context.watch<ReportsCubit>().selectedWallet.isEmpty
                              ? null
                              : context.watch<ReportsCubit>().selectedWallet,
                      hint: Text(
                        tr(context, 'source'),
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.grey,
                        ),
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      menuMaxHeight: 0.3.sh,
                      items: [
                            DropdownMenuItem(
                              value: 'all',
                              child: Text(
                                tr(context, 'all'),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      context.watch<AppThemeCubit>().isDarkMode
                                          ? Colors.white
                                          : Colors.black54,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ] +
                          ReportsCubit.get(context)
                              .wallets
                              .map(
                                (wallet) => DropdownMenuItem(
                                  value: wallet.name,
                                  child: Text(
                                    wallet.name,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: context
                                              .watch<AppThemeCubit>()
                                              .isDarkMode
                                          ? Colors.white
                                          : Colors.black54,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                      onChanged: (value) {
                        ReportsCubit.get(context).changeMainWallet(value!);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tr(context, 'residual'),
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 100.r,
                width: 100.r,
                child: LiquidCircularProgressIndicator(
                  value: context.watch<ReportsCubit>().residualMoneyPercentage,
                  valueColor: const AlwaysStoppedAnimation(Color(0xFF5DE062)),
                  borderColor: Colors.grey.shade400,
                  borderWidth: 0.5,
                  backgroundColor: context.watch<AppThemeCubit>().isDarkMode
                      ? AppDarkColors.accentColor1
                      : Colors.white,
                  center: Text(
                    NumberFormat.percentPattern('en').format(
                        context.watch<ReportsCubit>().residualMoneyPercentage),
                    style: TextStyle(
                      color: context
                                  .watch<ReportsCubit>()
                                  .residualMoneyPercentage <
                              0.6
                          ? Colors.black
                          : Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text(
                tr(context, 'totalResidual'),
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                context
                    .read<ReportsCubit>()
                    .residualMoney
                    .toString()
                    .formatToDecimal(context: context),
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
