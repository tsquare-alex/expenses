import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/themes/app_colors.dart';
import 'package:expenses/general/themes/cubit/app_theme_cubit.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/screens/wallet/data/cubit/wallet_cubit/wallet_cubit.dart';
import 'package:expenses/user/screens/wallet/data/cubit/wallet_cubit/wallet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletCategory extends StatefulWidget {
  const WalletCategory({
    super.key, this.fromTransaction=false,
  });
  final bool? fromTransaction;
  @override
  State<WalletCategory> createState() => _WalletCategoryState();
}

class _WalletCategoryState extends State<WalletCategory> {
  @override
  void initState() {
    context.read<WalletCubit>().iniData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.watch<AppThemeCubit>().isDarkMode
            ? AppDarkColors.backgroundColor
            : MyColors.white,
        surfaceTintColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => AutoRouter.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.white
                : MyColors.black,
          ),
        ),
        title: Center(
          child: MyText(
            title: tr(context, 'wallet'),
            color: context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.white
                : MyColors.black,
            size: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<WalletCubit>().addValueCategory(context, build,
              context.read<WalletCubit>().addCategoryController);
        },
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
                return BlocBuilder<WalletCubit, WalletState>(
                  builder: (context, state) {
                    return GridView.builder(
                      itemCount:
                          context.read<WalletCubit>().categoryList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 12.w,
                        mainAxisSpacing: 12.h,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              // if (context
                              //             .read<WalletCubit>()
                              //             .categoryList[index]
                              //             .name !=
                              //         "salary" &&
                              //     context
                              //             .read<WalletCubit>()
                              //             .categoryList[index]
                              //             .name !=
                              //         "bankAccount") {
                              //   AutoRouter.of(context)
                              //       .push(const SubscriptionsRoute());
                              // } else {
                                String iconPath = context
                                    .read<WalletCubit>()
                                    .categoryList[index]
                                    .imagePath!;
                                String selectedCategory = context
                                    .read<WalletCubit>()
                                    .categoryList[index]
                                    .name!;
                                context
                                    .read<WalletCubit>()
                                    .selectedCategoryIndex
                                    .value = index;
                                AutoRouter.of(context).push(AddWalletRoute(
                                  selectItemIndex: index,
                                  selectedCategory: selectedCategory,
                                  iconPath: iconPath,
                                  fromTransaction: widget.fromTransaction,
                                ));
                              // }
                            },
                            child: Column(
                              children: [
                                Stack(
                                  alignment: AlignmentDirectional.topEnd,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      height: 85.h,
                                      width: 85.w,
                                      decoration: BoxDecoration(
                                          color: MyColors.greyWhite,
                                          borderRadius:
                                              BorderRadius.circular(100.r)),
                                      child: ClipRect(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Image.asset(context
                                              .read<WalletCubit>()
                                              .categoryList[index]
                                              .imagePath!),
                                        ),
                                      ),
                                    ),
                                    // if (context
                                    //             .read<WalletCubit>()
                                    //             .categoryList[index]
                                    //             .name !=
                                    //         "salary" &&
                                    //     context
                                    //             .read<WalletCubit>()
                                    //             .categoryList[index]
                                    //             .name !=
                                    //         "bankAccount")
                                    //   Positioned(
                                    //     bottom: 55.h,
                                    //     right: 30.w,
                                    //     child: Image.asset(
                                    //       Res.pro,
                                    //       height: 50.h,
                                    //       width: 50.w,
                                    //     ),
                                    //   ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(tr(
                                            context,
                                            context
                                                .read<WalletCubit>()
                                                .categoryList[index]
                                                .name!)
                                        .isNotEmpty
                                    ? tr(
                                        context,
                                        context
                                            .read<WalletCubit>()
                                            .categoryList[index]
                                            .name!)
                                    : context
                                        .read<WalletCubit>()
                                        .categoryList[index]
                                        .name!)
                              ],
                            ));
                      },
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
