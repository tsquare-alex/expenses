part of 'main_widgets_imports.dart';

class WalletDetailsRow extends StatelessWidget {
  const WalletDetailsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundColor: Colors.red,
          minRadius: 50.r,
          child: Column(
            children: [
              Text(
                tr(context, 'expense'),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                NumberFormat('##0.0').format(double.parse(context.read<ReportsCubit>().spentMoney.toString()))
                ,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 0.35.sw,
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
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  isExpanded: true,
                  value: context.watch<ReportsCubit>().selectedWallet.isEmpty
                      ? null
                      : context.watch<ReportsCubit>().selectedWallet,
                  hint: Text(
                    tr(context, 'chooseWallet'),
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
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
                            tr(context, 'allWallets'),
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
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
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    ReportsCubit.get(context).changeWallet(value!);
                  },
                ),
              ),
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.green,
          minRadius: 50.r,
          child: Column(
            children: [
              Text(
                tr(context, 'residual'),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                NumberFormat('##0.0').format(double.parse(
                    context.read<ReportsCubit>().residualMoney.toString())),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
