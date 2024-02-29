import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/models/add_transaction_model/add_transaction_model.dart';
import 'package:expenses/user/screens/reports/cubit/reports_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<pw.Document> generateAndSaveComparePDF({
  required BuildContext context,
  required List<AddTransactionModel> data1,
  required List<AddTransactionModel> data2,
}) async {
  final font = pw.Font.ttf(await rootBundle.load('assets/fonts/arial.TTF'));
  final appLogo = await imageFromAssetBundle(Res.logo);
  late Uint8List chartImage;
  if (context.mounted) {
    chartImage = await ReportsCubit.get(context).renderChartAsImage();
  }
  final chart = pw.MemoryImage(chartImage);

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
                appLogo,
                width: 60,
                height: 60,
              ),
              pw.Text(
                tr(context, 'reportDetails'),
                style: const pw.TextStyle(
                  fontSize: 16,
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Flexible(
                    flex: 1,
                    child: pw.Column(
                      children: [
                        pw.Text(
                          tr(context, 'firstChosen'),
                          style: const pw.TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Padding(
                          padding:
                              const pw.EdgeInsets.symmetric(horizontal: 10),
                          child: pw.Column(
                            children: [
                              pw.Text(
                                ReportsCubit.get(context)
                                        .selectedCompare1Transaction
                                        .isEmpty
                                    ? '${tr(context, 'transaction')}: ${tr(context, 'all')}'
                                    : tr(
                                                context,
                                                ReportsCubit.get(context)
                                                    .selectedCompare1Transaction)
                                            .isEmpty
                                        ? '${tr(context, 'transaction')}: ${ReportsCubit.get(context).selectedCompare1Transaction}'
                                        : '${tr(context, 'transaction')}: ${tr(context, ReportsCubit.get(context).selectedCompare1Transaction)}',
                                textAlign: pw.TextAlign.center,
                              ),
                              pw.SizedBox(height: 5),
                              pw.Text(
                                ReportsCubit.get(context)
                                        .compare1FormattedDateFrom
                                        .isEmpty
                                    ? '${tr(context, 'duration')}: ${tr(context, 'all')}'
                                    : '${tr(context, 'duration')}: ${tr(context, 'from')} ${ReportsCubit.get(context).compare1FormattedDateFrom} ${tr(context, 'to')} ${ReportsCubit.get(context).compare1FormattedDateTo}',
                                textAlign: pw.TextAlign.center,
                              )
                            ],
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Table(
                          border: pw.TableBorder.all(
                            color: PdfColors.black,
                          ),
                          defaultVerticalAlignment:
                              pw.TableCellVerticalAlignment.middle,
                          children: [
                            pw.TableRow(
                              decoration: const pw.BoxDecoration(
                                color: PdfColors.grey300,
                              ),
                              verticalAlignment:
                                  pw.TableCellVerticalAlignment.middle,
                              children: ReportsCubit.get(context)
                                          .getCurrentLocale(context) ==
                                      'ar_EG'
                                  ? [
                                      comparePdfTableRowCell(
                                        title: tr(context, 'duration'),
                                      ),
                                      comparePdfTableRowCell(
                                        title: tr(context, 'source'),
                                      ),
                                      comparePdfTableRowCell(
                                        title: tr(context, 'statsTransactions'),
                                      ),
                                    ].reversed.toList()
                                  : [
                                      comparePdfTableRowCell(
                                        title: tr(context, 'tableDuration'),
                                      ),
                                      comparePdfTableRowCell(
                                        title: tr(context, 'source'),
                                      ),
                                      comparePdfTableRowCell(
                                        title: tr(context, 'statsTransactions'),
                                      ),
                                    ].toList(),
                            ),
                            ...data1
                                .map(
                                  (transaction) => pw.TableRow(
                                    verticalAlignment:
                                        pw.TableCellVerticalAlignment.middle,
                                    children: ReportsCubit.get(context)
                                                .getCurrentLocale(context) ==
                                            'ar_EG'
                                        ? [
                                            comparePdfTableRowCell(
                                              title:
                                                  transaction.transactionDate,
                                            ),
                                            comparePdfTableRowCell(
                                              title: tr(
                                                          context,
                                                          transaction
                                                              .incomeSource!
                                                              .name)
                                                      .isEmpty
                                                  ? transaction
                                                      .incomeSource?.name
                                                  : tr(
                                                      context,
                                                      transaction
                                                          .incomeSource!.name),
                                            ),
                                            comparePdfTableRowCell(
                                              title: tr(
                                                          context,
                                                          transaction
                                                              .transactionContent!
                                                              .name!)
                                                      .isEmpty
                                                  ? transaction
                                                      .transactionContent?.name
                                                  : tr(
                                                      context,
                                                      transaction
                                                          .transactionContent!
                                                          .name!),
                                            ),
                                          ].reversed.toList()
                                        : [
                                            comparePdfTableRowCell(
                                              title:
                                                  transaction.transactionDate,
                                            ),
                                            comparePdfTableRowCell(
                                              title: tr(
                                                          context,
                                                          transaction
                                                              .incomeSource!
                                                              .name)
                                                      .isEmpty
                                                  ? transaction
                                                      .incomeSource?.name
                                                  : tr(
                                                      context,
                                                      transaction
                                                          .incomeSource!.name),
                                            ),
                                            comparePdfTableRowCell(
                                              title: tr(
                                                          context,
                                                          transaction
                                                              .transactionContent!
                                                              .name!)
                                                      .isEmpty
                                                  ? transaction
                                                      .transactionContent?.name
                                                  : tr(
                                                      context,
                                                      transaction
                                                          .transactionContent!
                                                          .name!),
                                            ),
                                          ].toList(),
                                  ),
                                )
                                .toList(),
                          ],
                        )
                      ],
                    ),
                  ),
                  pw.SizedBox(width: 10),
                  pw.Flexible(
                    flex: 1,
                    child: pw.Column(
                      children: [
                        pw.Text(
                          tr(context, 'secondChosen'),
                          style: const pw.TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Padding(
                          padding:
                              const pw.EdgeInsets.symmetric(horizontal: 10),
                          child: pw.Column(
                            children: [
                              pw.Text(
                                ReportsCubit.get(context)
                                        .selectedCompare2Transaction
                                        .isEmpty
                                    ? '${tr(context, 'transaction')}: ${tr(context, 'all')}'
                                    : tr(
                                                context,
                                                ReportsCubit.get(context)
                                                    .selectedCompare2Transaction)
                                            .isEmpty
                                        ? '${tr(context, 'transaction')}: ${ReportsCubit.get(context).selectedCompare2Transaction}'
                                        : '${tr(context, 'transaction')}: ${tr(context, ReportsCubit.get(context).selectedCompare2Transaction)}',
                                textAlign: pw.TextAlign.center,
                              ),
                              pw.SizedBox(height: 5),
                              pw.Text(
                                ReportsCubit.get(context)
                                        .compare2FormattedDateFrom
                                        .isEmpty
                                    ? '${tr(context, 'duration')}: ${tr(context, 'all')}'
                                    : '${tr(context, 'duration')}: ${tr(context, 'from')} ${ReportsCubit.get(context).compare2FormattedDateFrom} ${tr(context, 'to')} ${ReportsCubit.get(context).compare2FormattedDateTo}',
                                textAlign: pw.TextAlign.center,
                              )
                            ],
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Table(
                          border: pw.TableBorder.all(
                            color: PdfColors.black,
                          ),
                          defaultVerticalAlignment:
                              pw.TableCellVerticalAlignment.middle,
                          children: [
                            pw.TableRow(
                              decoration: const pw.BoxDecoration(
                                color: PdfColors.grey300,
                              ),
                              verticalAlignment:
                                  pw.TableCellVerticalAlignment.middle,
                              children: ReportsCubit.get(context)
                                          .getCurrentLocale(context) ==
                                      'ar_EG'
                                  ? [
                                      comparePdfTableRowCell(
                                        title: tr(context, 'duration'),
                                      ),
                                      comparePdfTableRowCell(
                                        title: tr(context, 'wallet'),
                                      ),
                                      comparePdfTableRowCell(
                                        title: tr(context, 'statsTransactions'),
                                      ),
                                    ].reversed.toList()
                                  : [
                                      comparePdfTableRowCell(
                                        title: tr(context, 'duration'),
                                      ),
                                      comparePdfTableRowCell(
                                        title: tr(context, 'wallet'),
                                      ),
                                      comparePdfTableRowCell(
                                        title: tr(context, 'statsTransactions'),
                                      ),
                                    ].toList(),
                            ),
                            ...data2
                                .map(
                                  (transaction) => pw.TableRow(
                                    verticalAlignment:
                                        pw.TableCellVerticalAlignment.middle,
                                    children: ReportsCubit.get(context)
                                                .getCurrentLocale(context) ==
                                            'ar_EG'
                                        ? [
                                            comparePdfTableRowCell(
                                              title:
                                                  transaction.transactionDate,
                                            ),
                                            comparePdfTableRowCell(
                                              title: tr(
                                                          context,
                                                          transaction
                                                              .incomeSource!
                                                              .name)
                                                      .isEmpty
                                                  ? transaction
                                                      .incomeSource?.name
                                                  : tr(
                                                      context,
                                                      transaction
                                                          .incomeSource!.name),
                                            ),
                                            comparePdfTableRowCell(
                                              title: tr(
                                                          context,
                                                          transaction
                                                              .transactionContent!
                                                              .name!)
                                                      .isEmpty
                                                  ? transaction
                                                      .transactionContent?.name
                                                  : tr(
                                                      context,
                                                      transaction
                                                          .transactionContent!
                                                          .name!),
                                            ),
                                          ].reversed.toList()
                                        : [
                                            comparePdfTableRowCell(
                                              title:
                                                  transaction.transactionDate,
                                            ),
                                            comparePdfTableRowCell(
                                              title: tr(
                                                          context,
                                                          transaction
                                                              .incomeSource!
                                                              .name)
                                                      .isEmpty
                                                  ? transaction
                                                      .incomeSource?.name
                                                  : tr(
                                                      context,
                                                      transaction
                                                          .incomeSource!.name),
                                            ),
                                            comparePdfTableRowCell(
                                              title: tr(
                                                          context,
                                                          transaction
                                                              .transactionContent!
                                                              .name!)
                                                      .isEmpty
                                                  ? transaction
                                                      .transactionContent?.name
                                                  : tr(
                                                      context,
                                                      transaction
                                                          .transactionContent!
                                                          .name!),
                                            ),
                                          ].toList(),
                                  ),
                                )
                                .toList(),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              pw.Image(chart),
            ],
          ),
        ];
      },
    ),
  );
  return doc;
}

pw.Padding comparePdfTableRowCell({required String? title}) {
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
