import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/themes/app_colors.dart';
import 'package:expenses/general/themes/cubit/app_theme_cubit.dart';
import 'package:expenses/user/models/add_transaction_model/add_transaction_model.dart';
import 'package:expenses/user/screens/reports/statistics/statistics_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompareTable extends StatelessWidget {
  const CompareTable({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<AddTransactionModel> data;
  @override
  Widget build(BuildContext context) {
    return Table(
      defaultColumnWidth: const MaxColumnWidth(
        IntrinsicColumnWidth(),
        FlexColumnWidth(),
      ),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      border: TableBorder.all(
        borderRadius: BorderRadius.circular(12.r),
        color: context.watch<AppThemeCubit>().isDarkMode
            ? AppDarkColors.accentColor
            : MyColors.greyWhite,
        width: 2.r,
      ),
      children: [
        TableRow(
          children: [
            StatsRowCell(title: tr(context, 'duration'), padding: 15),
            StatsRowCell(title: tr(context, 'wallet'), padding: 15),
            StatsRowCell(title: tr(context, 'statsTransactions'), padding: 15),
          ],
        ),
        ...data
            .map(
              (transaction) => TableRow(
                children: [
                  StatsRowCell(title: transaction.transactionDate),
                  StatsRowCell(
                    title: tr(context, transaction.incomeSource!.name).isEmpty
                        ? transaction.incomeSource?.name
                        : tr(context, transaction.incomeSource!.name),
                  ),
                  StatsRowCell(
                    title: tr(context, transaction.transactionContent!.name!)
                            .isEmpty
                        ? transaction.transactionContent?.name
                        : tr(context, transaction.transactionContent!.name!),
                  ),
                ],
              ),
            )
            .toList(),
      ],
    );
  }
}
