import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/screens/wallet/data/cubit/wallet_cubit/wallet_cubit.dart';
import 'package:expenses/user/screens/wallet/data/cubit/wallet_cubit/wallet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletCategory extends StatelessWidget {
  const WalletCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(Res.back),
          onPressed: () => AutoRouter.of(context).pop(),
        ),
        backgroundColor: MyColors.white,
        title: Center(
          child: MyText(
            title: tr(context, 'wallet'),
            color: MyColors.black,
            size: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: MyColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Icon(
          Icons.add,
          size: 20.sp,
          color: MyColors.white,
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
            child: BlocBuilder<WalletCubit, WalletState>(
              builder: (context, state) {
                return GridView.builder(
                  itemCount: 12,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.h,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          String selectedCategory =
                              context.read<WalletCubit>().walletCategory[index];
                          context
                              .read<WalletCubit>()
                              .selectedCategoryIndex
                              .value = index;
                          // context
                          //     .read<WalletCubit>()
                          //     .selectedCategoryIndex
                          //     .value = index;
                          AutoRouter.of(context).push(AddWalletRoute(
                            selectItemIndex: index,
                            selectedCategory: selectedCategory,
                          ));
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 70.h,
                              width: 70.w,
                              decoration: BoxDecoration(
                                  color: MyColors.greyWhite,
                                  borderRadius: BorderRadius.circular(85.r)),
                              child: ClipRect(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: context
                                      .read<WalletCubit>()
                                      .walletCategoryImage[index],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(context
                                .read<WalletCubit>()
                                .walletCategory[index]),
                          ],
                        )
                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(20),
                        //   child: Container(
                        //     decoration: BoxDecoration(color: MyColors.grey),
                        //     child: Column(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Image.asset("assets/images/salary.png"),
                        //         Center(
                        //           child: MyText(
                        //             title: context
                        //                 .read<WalletCubit>()
                        //                 .walletCategory[index],
                        //             color: MyColors.white,
                        //             size: 12.sp,
                        //             fontWeight: FontWeight.bold,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        );
                  },
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}
