import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/themes/app_colors.dart';
import 'package:expenses/general/themes/cubit/app_theme_cubit.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/screens/reports/cubit/reports_cubit.dart';
import 'package:expenses/user/screens/reports/statistics/statistics_imports.dart';
import 'package:expenses/user/screens/reports/widgets/reports_widgets_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompareBody extends StatelessWidget {
  const CompareBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          Text(
            tr(context, 'compareTransactions'),
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Flexible(
                child: GestureDetector(
                  onTap: () async {
                    ReportsCubit.get(context).compare1SelectedDate =
                        await showDateRangePicker(
                      context: context,
                      initialDateRange:
                          ReportsCubit.get(context).compare1InitialDate,
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 365)),
                      lastDate: DateTime.now().add(
                        const Duration(days: 365),
                      ),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                              primary: context.watch<AppThemeCubit>().isDarkMode
                                  ? AppDarkColors.primary
                                  : MyColors.primary,
                              secondary: Colors.grey.shade200,
                              onSurface:
                                  context.watch<AppThemeCubit>().isDarkMode
                                      ? AppDarkColors.primary
                                      : MyColors.primary,
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (context.mounted) {
                      ReportsCubit.get(context).changeCompare1DateRange();
                    }
                  },
                  child: FieldSection(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            context
                                    .watch<ReportsCubit>()
                                    .compare1FormattedDateFrom
                                    .isEmpty
                                ? '${tr(context, 'chooseDuration')} 1'
                                : '${tr(context, 'from')} ${context.watch<ReportsCubit>().compare1FormattedDateFrom} ${tr(context, 'to')} ${context.watch<ReportsCubit>().compare1FormattedDateTo}',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: context.watch<AppThemeCubit>().isDarkMode
                              ? AppDarkColors.secondary
                              : MyColors.primary,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.r),
              Flexible(
                child: GestureDetector(
                  onTap: () async {
                    ReportsCubit.get(context).compare2SelectedDate =
                        await showDateRangePicker(
                      context: context,
                      initialDateRange:
                          ReportsCubit.get(context).compare2InitialDate,
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 365)),
                      lastDate: DateTime.now().add(
                        const Duration(days: 365),
                      ),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                              primary: context.watch<AppThemeCubit>().isDarkMode
                                  ? AppDarkColors.primary
                                  : MyColors.primary,
                              secondary: Colors.grey.shade200,
                              onSurface:
                                  context.watch<AppThemeCubit>().isDarkMode
                                      ? AppDarkColors.primary
                                      : MyColors.primary,
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (context.mounted) {
                      ReportsCubit.get(context).changeCompare2DateRange();
                    }
                  },
                  child: FieldSection(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            context
                                    .watch<ReportsCubit>()
                                    .compare2FormattedDateFrom
                                    .isEmpty
                                ? '${tr(context, 'chooseDuration')} 2'
                                : '${tr(context, 'from')} ${context.watch<ReportsCubit>().compare2FormattedDateFrom} ${tr(context, 'to')} ${context.watch<ReportsCubit>().compare2FormattedDateTo}',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: context.watch<AppThemeCubit>().isDarkMode
                              ? AppDarkColors.secondary
                              : MyColors.primary,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.r),
          Row(
            children: [
              Flexible(
                child: StatisticsDropdown(
                  label: '${tr(context, 'chooseWallet')} 1',
                  choice: ReportsCubit.get(context).selectedCompare1Wallet,
                  menuList: ReportsCubit.get(context)
                      .wallets
                      .map(
                        (wallet) => DropdownMenuItem<String>(
                          value: wallet.name,
                          child: Text(
                            wallet.name,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onSelect: (value) =>
                      ReportsCubit.get(context).onCompareWallet1Select(value),
                ),
              ),
              SizedBox(width: 16.r),
              Flexible(
                child: StatisticsDropdown(
                  label: '${tr(context, 'chooseWallet')} 2',
                  choice: ReportsCubit.get(context).selectedCompare2Wallet,
                  menuList: ReportsCubit.get(context)
                      .wallets
                      .map(
                        (wallet) => DropdownMenuItem<String>(
                          value: wallet.name,
                          child: Text(
                            wallet.name,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onSelect: (value) =>
                      ReportsCubit.get(context).onCompareWallet2Select(value),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.r),
          Row(
            children: [
              Flexible(
                child: StatisticsDropdown(
                  label: '${tr(context, 'chooseTransaction')} 1',
                  choice: ReportsCubit.get(context).selectedCompare1Transaction,
                  menuList: context
                      .watch<ReportsCubit>()
                      .compare1Transactions
                      .map(
                        (transaction) => DropdownMenuItem<String>(
                          value: transaction,
                          child: Text(
                            tr(context, transaction).isEmpty
                                ? transaction
                                : tr(context, transaction),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onSelect: (value) => ReportsCubit.get(context)
                      .onCompareTransactions1Select(value),
                ),
              ),
              SizedBox(width: 16.r),
              Flexible(
                child: StatisticsDropdown(
                  label: '${tr(context, 'chooseTransaction')} 2',
                  choice: ReportsCubit.get(context).selectedCompare2Transaction,
                  menuList: context
                      .watch<ReportsCubit>()
                      .compare2Transactions
                      .map(
                        (transaction) => DropdownMenuItem<String>(
                          value: transaction,
                          child: Text(
                            tr(context, transaction).isEmpty
                                ? transaction
                                : tr(context, transaction),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onSelect: (value) => ReportsCubit.get(context)
                      .onCompareTransactions2Select(value),
                ),
              ),
            ],
          ),
          SizedBox(height: 32.h),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    ReportsCubit.get(context).showComparison(context);
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(322.w, 58.h),
                    backgroundColor: context.watch<AppThemeCubit>().isDarkMode
                        ? AppDarkColors.primary
                        : MyColors.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    tr(context, 'showResults'),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox.square(dimension: 12.r),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  fixedSize: Size(64.w, 58.h),
                  elevation: 0,
                  side: BorderSide(
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? AppDarkColors.primary
                        : MyColors.primary,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
                child: Image.asset(
                  Res.shareIcon,
                  color: context.watch<AppThemeCubit>().isDarkMode
                      ? AppDarkColors.secondary
                      : MyColors.primary,
                  height: 24,
                  width: 24,
                ),
              ),
            ],
          ),
          SizedBox(height: 32.h),
          BlocBuilder<ReportsCubit, ReportsState>(
            builder: (context, state) {
              if (state is ShowReportDetails) {
                return ReportComparison(
                  data1: ReportsCubit.get(context).compare1FilteredTransactions,
                  data2: ReportsCubit.get(context).compare2FilteredTransactions,
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
