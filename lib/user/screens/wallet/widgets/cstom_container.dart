import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/user/screens/wallet/data/cubit/wallet_cubit/wallet_cubit.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet_model.dart';
import 'package:expenses/user/screens/wallet/wallet_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  final WalletModel model;

  const CustomContainer({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    WalletData data = WalletData();
    DateTime currentDate = DateTime.now();
    bool endDatePassed =
        currentDate.isAfter(context.read<WalletCubit>().endDate);
    return BlocProvider(
      create: (context) => WalletCubit(),
      child: Container(
        padding: EdgeInsets.all(20.w),
        height: 180.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r), color: MyColors.primary),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(title: model.name, color: MyColors.white, size: 16.sp),
                endDatePassed
                    ? IconButton(
                        onPressed: () {
                          data.showButtomSheet(context, build, model);
                        },
                        icon: Icon(
                          Icons.arrow_drop_down_outlined,
                          color: MyColors.white,
                        ))
                    : const Text("hi")
              ],
            ),
            MyText(
                title: model.paymentMethod, color: MyColors.white, size: 16.sp),
            Row(
              children: [
                MyText(title: "الرصيد الحالي", color: MyColors.white, size: 16),
                SizedBox(
                  width: 10.w,
                ),
                MyText(
                    title: "${model.balance}",
                    color: MyColors.white,
                    size: 16.sp),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    model.delete();
                    BlocProvider.of<WalletCubit>(context).fetchAllData();
                  },
                  icon: const Icon(Icons.delete),
                  color: MyColors.white,
                ),
                IconButton(
                  onPressed: () async {
                    await AutoRouter.of(context)
                        .push(EditWalletRoute(model: model));
                    if (context.mounted) {
                      BlocProvider.of<WalletCubit>(context).fetchAllData();
                    }
                  },
                  icon: const Icon(Icons.edit_sharp),
                  color: MyColors.white,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
