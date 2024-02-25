import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/utilities/utils_functions/decimal_format.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/screens/reports/cubit/reports_cubit.dart';
import 'package:expenses/user/screens/reports/models/reports_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<pw.Document> generateReportPDF({
  required BuildContext context,
  required List<ReportCategory> data,
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
                tr(context, 'reports'),
                style: const pw.TextStyle(
                  fontSize: 16,
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Column(
                children: [
                  pw.Text(
                    ReportsCubit.get(context).selectedWallet.isEmpty
                        ? '${tr(context, 'source')}: ${tr(context, 'all')}'
                        : '${tr(context, 'source')}: ${ReportsCubit.get(context).selectedWallet}',
                    textAlign: pw.TextAlign.center,
                  ),
                  pw.SizedBox(height: 5),
                  pw.Text(
                    ReportsCubit.get(context)
                            .reportFormattedDateFrom
                            .isEmpty
                        ? '${tr(context, 'duration')}: ${tr(context, 'all')}'
                        : '${tr(context, 'duration')}: ${tr(context, 'from')} ${ReportsCubit.get(context).reportFormattedDateFrom} ${tr(context, 'to')} ${ReportsCubit.get(context).reportFormattedDateTo}',
                    textAlign: pw.TextAlign.center,
                  ),
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Padding(
                padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Row(
                      children: [
                        pw.Text(
                          '${tr(context, 'reportTotalResidual')}: ',
                        ),
                        pw.Text(
                          ReportsCubit.get(context)
                              .residualMoney
                              .toString()
                              .formatToDecimal(context: context),
                          style: const pw.TextStyle(
                            color: PdfColor(0.36, 0.88, 0.38, 1),
                          ),
                        ),
                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.Text(
                          '${tr(context, 'reportTotal')}: ',
                        ),
                        pw.Text(
                          ReportsCubit.get(context)
                              .allSpentMoney
                              .toString()
                              .formatToDecimal(context: context),
                        ),
                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.Text(
                          '${tr(context, 'totalSources')}: ',
                        ),
                        pw.Text(
                          ReportsCubit.get(context)
                              .totalMoney
                              .toString()
                              .formatToDecimal(context: context),
                          style: const pw.TextStyle(
                            color: PdfColors.lightBlue,
                          ),
                        ),
                      ],
                    ),
                  ],
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
                                  title: tr(context, 'reportCategory'),
                                ),
                                statsPdfTableRowCell(
                                  title: tr(context, 'reportCash'),
                                ),
                                statsPdfTableRowCell(
                                  title: '%',
                                ),
                              ].reversed.toList()
                            : [
                                statsPdfTableRowCell(
                                  title: tr(context, 'reportCategory'),
                                ),
                                statsPdfTableRowCell(
                                  title: tr(context, 'reportCash'),
                                ),
                                statsPdfTableRowCell(
                                  title: '%',
                                ),
                              ].toList(),
                  ),
                  ...data
                      .asMap()
                      .entries
                      .map(
                        (entry) => pw.TableRow(
                          verticalAlignment:
                              pw.TableCellVerticalAlignment.middle,
                          decoration: pw.BoxDecoration(
                            color: ReportsCubit.get(context)
                                .randomPDFColors[entry.key],
                          ),
                          children: ReportsCubit.get(context)
                                      .getCurrentLocale(context) ==
                                  'ar_EG'
                              ? [
                                  statsPdfTableRowCell(
                                    title: tr(context, entry.value.title)
                                            .isNotEmpty
                                        ? tr(context, entry.value.title)
                                        : entry.value.title,
                                  ),
                                  statsPdfTableRowCell(
                                    title: entry.value.totalMoney
                                        .toString()
                                        .formatToDecimal(context: context),
                                  ),
                                  statsPdfTableRowCell(
                                    title: NumberFormat.percentPattern('en')
                                        .format(entry.value.percentage),
                                  ),
                                ].reversed.toList()
                              : [
                                  statsPdfTableRowCell(
                                    title: tr(context, entry.value.title)
                                            .isNotEmpty
                                        ? tr(context, entry.value.title)
                                        : entry.value.title,
                                  ),
                                  statsPdfTableRowCell(
                                    title: entry.value.totalMoney
                                        .toString()
                                        .formatToDecimal(context: context),
                                  ),
                                  statsPdfTableRowCell(
                                    title: NumberFormat.percentPattern('en')
                                        .format(entry.value.percentage),
                                  ),
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
