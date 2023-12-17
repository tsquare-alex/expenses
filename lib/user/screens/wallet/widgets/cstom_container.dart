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
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomContainer extends StatelessWidget {
  final WalletModel model;

  const CustomContainer({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    WalletData data = WalletData();
    return Container(
      padding: EdgeInsets.all(18.w),
      height: 200.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r), color: MyColors.primary),
      child:
          // Slidable(
          // key: const ValueKey(0),
          // startActionPane: ActionPane(
          //   motion: const ScrollMotion(),
          //   extentRatio: 0.3,
          //   children: [
          //     SlidableAction(
          //       onPressed: (context) {
          //         model.delete();
          //         BlocProvider.of<WalletCubit>(context).fetchAllData();
          //       },
          //       backgroundColor: Colors.transparent,
          //       borderRadius: BorderRadius.only(
          //           topLeft: Radius.circular(12.r),
          //           bottomLeft: Radius.circular(12.r)),
          //       foregroundColor: Colors.white,
          //       icon: Icons.delete,
          //     ),
          //     SlidableAction(
          //       onPressed: (context) {},
          //       backgroundColor: Colors.transparent,
          //       borderRadius: BorderRadius.only(
          //           topLeft: Radius.circular(12.r),
          //           bottomLeft: Radius.circular(12.r)),
          //       foregroundColor: Colors.white,
          //       icon: Icons.edit,
          //     ),
          //   ],
          // ),
          // child:
          Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(title: "walletNumber", color: MyColors.white, size: 16.sp),
              IconButton(
                  onPressed: () {
                    data.showButtomSheet(context, build);
                  },
                  icon: Icon(
                    Icons.arrow_drop_down_outlined,
                    color: MyColors.white,
                  ))
            ],
          ),
          MyText(
              title: model.paymentMethod, color: MyColors.white, size: 16.sp),
          MyText(title: "availableBalance", color: MyColors.white, size: 16.sp),
          MyText(title: model.balance, color: MyColors.white, size: 16.sp),
          IconButton(
              onPressed: () {
                model.delete();
                BlocProvider.of<WalletCubit>(context).fetchAllData();
                AutoRouter.of(context).popAndPush(const WalletRoute());
              },
              icon: Icon(Icons.delete))
        ],
      ),
    );
  }
}
