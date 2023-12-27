import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/user/screens/wallet/data/cubit/wallet_cubit/wallet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletCategory extends StatelessWidget {
  const WalletCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: GridView.builder(
              itemCount: context.read<WalletCubit>().walletCategory.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () =>
                      AutoRouter.of(context).push(const AddWalletRoute()),
                  child: Container(
                    height: 28.h,
                    width: 34.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.w),
                      color: MyColors.primary.withOpacity(0.3),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 18.h),
                        Center(
                          child: context.read<WalletCubit>().Images[index],
                        ),
                        Center(
                          child: MyText(
                              title: context
                                  .read<WalletCubit>()
                                  .walletCategory[index],
                              color: MyColors.primary,
                              size: 12.sp),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}
