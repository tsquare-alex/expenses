import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/utilities/utils_functions/decimal_format.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/models/add_transaction_model/add_transaction_model.dart';
import 'package:expenses/user/screens/reports/cubit/reports_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<pw.Document> generateAndSaveStatsTablePDF({
  required BuildContext context,
  required List<AddTransactionModel> data,
}) async {
  final font = pw.Font.ttf(await rootBundle.load('assets/fonts/arial.TTF'));
  final image = await imageFromAssetBundle(Res.logo);
  final doc = pw.Document();
  doc.addPage(
    pw.MultiPage(
      theme: pw.ThemeData.withFont(
        base: font,
      ),
      textDirection: context.mounted
          ? ReportsCubit.get(context).getCurrentLocale(context) == 'ar_EG'
              ? pw.TextDirection.rtl
              : pw.TextDirection.ltr
          : null,
      margin: pw.EdgeInsets.zero,
      pageFormat: PdfPageFormat.a4,
      build: (_) {
        return [
          pw.Column(
            children: [
              pw.Image(
                image,
                width: 60,
                height: 60,
              ),
              pw.Text(
                tr(context, 'reportDetails'),
                style: const pw.TextStyle(
                  fontSize: 16,
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Padding(
                padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                child: pw.Text(
                  ReportsCubit.get(context).statsFormattedDateFrom.isEmpty
                      ? '${tr(context, 'duration')}: ${tr(context, 'all')}'
                      : '${tr(context, 'duration')}: ${tr(context, 'from')} ${ReportsCubit.get(context).statsFormattedDateFrom} ${tr(context, 'to')} ${ReportsCubit.get(context).statsFormattedDateTo}',
                  textAlign: pw.TextAlign.center,
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Table(
                border: pw.TableBorder.all(
                  color: PdfColors.black,
                ),
                defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
                children: [
                  pw.TableRow(
                    decoration: const pw.BoxDecoration(
                      color: PdfColors.grey300,
                    ),
                    verticalAlignment: pw.TableCellVerticalAlignment.middle,
                    children:
                        ReportsCubit.get(context).getCurrentLocale(context) ==
                                'ar_EG'
                            ? [
                                statsPdfTableRowCell(
                                  title: tr(context, 'source'),
                                ),
                                statsPdfTableRowCell(
                                  title: tr(context, 'tableTransaction'),
                                ),
                                statsPdfTableRowCell(
                                  title: tr(context, 'tableSubTransaction'),
                                ),
                                statsPdfTableRowCell(
                                  title: tr(context, 'tableDuration'),
                                ),
                                statsPdfTableRowCell(
                                  title: tr(context, 'tablePriority'),
                                ),
                                statsPdfTableRowCell(
                                  title: tr(context, 'tableAmount'),
                                ),
                                statsPdfTableRowCell(
                                  title: tr(context, 'tableValue'),
                                ),
                                statsPdfTableRowCell(
                                  title: tr(context, 'tableContact'),
                                ),
                              ].reversed.toList()
                            : [
                                statsPdfTableRowCell(
                                  title: tr(context, 'source'),
                                ),
                                statsPdfTableRowCell(
                                  title: tr(context, 'tableTransaction'),
                                ),
                                statsPdfTableRowCell(
                                  title: tr(context, 'tableSubTransaction'),
                                ),
                                statsPdfTableRowCell(
                                  title: tr(context, 'tableDuration'),
                                ),
                                statsPdfTableRowCell(
                                  title: tr(context, 'tablePriority'),
                                ),
                                statsPdfTableRowCell(
                                  title: tr(context, 'tableAmount'),
                                ),
                                statsPdfTableRowCell(
                                  title: tr(context, 'tableValue'),
                                ),
                                statsPdfTableRowCell(
                                  title: tr(context, 'tableContact'),
                                ),
                              ].toList(),
                  ),
                  ...data
                      .map(
                        (transaction) => pw.TableRow(
                          verticalAlignment:
                              pw.TableCellVerticalAlignment.middle,
                          decoration: pw.BoxDecoration(
                            color: transaction.database != null
                                ? PdfColors.yellow50
                                : transaction.unit != null
                                    ? PdfColors.indigo50
                                    : (transaction.database != null &&
                                            transaction.unit != null)
                                        ? PdfColors.green50
                                        : PdfColors.red50,
                          ),
                          children: ReportsCubit.get(context)
                                      .getCurrentLocale(context) ==
                                  'ar_EG'
                              ? [
                                  statsPdfTableRowCell(
                                    title: tr(context,
                                                transaction.incomeSource!.name)
                                            .isEmpty
                                        ? transaction.incomeSource?.name
                                        : tr(context,
                                            transaction.incomeSource!.name),
                                  ),
                                  statsPdfTableRowCell(
                                    title: tr(
                                                context,
                                                transaction
                                                    .transactionType!.name!)
                                            .isEmpty
                                        ? transaction.transactionType?.name
                                        : tr(context,
                                            transaction.transactionType!.name!),
                                  ),
                                  statsPdfTableRowCell(
                                    title: tr(
                                                context,
                                                transaction
                                                    .transactionContent!.name!)
                                            .isEmpty
                                        ? transaction.transactionContent?.name
                                        : tr(
                                            context,
                                            transaction
                                                .transactionContent!.name!),
                                  ),
                                  statsPdfTableRowCell(
                                    title:
                                        '${transaction.transactionDate}\n${transaction.time!}',
                                  ),
                                  statsPdfTableRowCell(
                                    title:
                                        tr(context, transaction.priority!.name!)
                                                .isEmpty
                                            ? transaction.priority?.name
                                            : tr(context,
                                                transaction.priority!.name!),
                                  ),
                                  statsPdfTableRowCell(
                                    title: tr(
                                                context,
                                                transaction.unit == null
                                                    ? ''
                                                    : transaction.unit!.name!)
                                            .isEmpty
                                        ? transaction.unit?.name
                                        : tr(context, transaction.unit!.name!),
                                  ),
                                  statsPdfTableRowCell(
                                      title: transaction.total!
                                          .formatToDecimal(context: context)),
                                  statsPdfTableRowCell(
                                      title: transaction.database?.name),
                                ].reversed.toList()
                              : [
                                  statsPdfTableRowCell(
                                    title: tr(context,
                                                transaction.incomeSource!.name)
                                            .isEmpty
                                        ? transaction.incomeSource?.name
                                        : tr(context,
                                            transaction.incomeSource!.name),
                                  ),
                                  statsPdfTableRowCell(
                                    title: tr(
                                                context,
                                                transaction
                                                    .transactionType!.name!)
                                            .isEmpty
                                        ? transaction.transactionType?.name
                                        : tr(context,
                                            transaction.transactionType!.name!),
                                  ),
                                  statsPdfTableRowCell(
                                    title: tr(
                                                context,
                                                transaction
                                                    .transactionContent!.name!)
                                            .isEmpty
                                        ? transaction.transactionContent?.name
                                        : tr(
                                            context,
                                            transaction
                                                .transactionContent!.name!),
                                  ),
                                  statsPdfTableRowCell(
                                    title:
                                        '${transaction.transactionDate}\n${transaction.time!}',
                                  ),
                                  statsPdfTableRowCell(
                                    title:
                                        tr(context, transaction.priority!.name!)
                                                .isEmpty
                                            ? transaction.priority?.name
                                            : tr(context,
                                                transaction.priority!.name!),
                                  ),
                                  statsPdfTableRowCell(
                                    title: tr(
                                                context,
                                                transaction.unit == null
                                                    ? ''
                                                    : transaction.unit!.name!)
                                            .isEmpty
                                        ? transaction.unit?.name
                                        : tr(context, transaction.unit!.name!),
                                  ),
                                  statsPdfTableRowCell(
                                      title: transaction.total!
                                          .formatToDecimal(context: context)),
                                  statsPdfTableRowCell(
                                      title: transaction.database?.name),
                                ].toList(),
                        ),
                      )
                      .toList(),
                ],
              )
            ],
          ),
        ];
      },
    ),
  );
  return doc;
}

pw.Padding statsPdfTableRowCell({required String? title}) {
  return pw.Padding(
    padding: const pw.EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 5,
    ),
    child: pw.Text(
      title ?? '',
      textAlign: pw.TextAlign.center,
      style: const pw.TextStyle(
        fontSize: 12,
      ),
    ),
  );
}
