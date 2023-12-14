part of 'add_transaction_widgets_imports.dart';

class BuildTransactionWallet extends StatelessWidget {
  const BuildTransactionWallet({Key? key, required this.data})
      : super(key: key);
  final AddTransactionData data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0.r),
      child: BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
        bloc: data.walletCubit,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () =>
                    data.walletCubit.onUpdateData(!data.walletCubit.state.data),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                context.watch<AppThemeCubit>().isDarkMode
                                    ? AppDarkColors.primary
                                    : MyColors.primary,
                            radius: 20.r,
                            child: Image.asset(
                              Res.wallet,
                              width: 20.w,
                              height: 20.w,
                              color: MyColors.white,
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          MyText(
                            title: "مصروف الشهر",
                            color: context.watch<AppThemeCubit>().isDarkMode
                                ? MyColors.white
                                : MyColors.black,
                            size: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      state.data
                          ? Icons.keyboard_arrow_down_outlined
                          : Icons.arrow_forward_ios,
                      size: 20.w,
                    ),
                  ],
                ),
              ),
              state.data
                  ? Padding(
                      padding: EdgeInsets.only(right: 70.0.r),
                      child: MyText(
                        title: "200.00 ج.م",
                        color: MyColors.grey,
                        size: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Container(),
            ],
          );
        },
      ),
    );
  }
}
