import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/screens/reports/cubit/reports_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<pw.Document> generateAndSaveChartPDF({
  required BuildContext context,
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
              pw.SizedBox(height: 10),
              pw.Text(
                ReportsCubit.get(context).statsFormattedDateFrom.isEmpty
                    ? '${tr(context, 'duration')}: ${tr(context, 'all')}'
                    : '${tr(context, 'duration')}: ${tr(context, 'from')} ${ReportsCubit.get(context).statsFormattedDateFrom} ${tr(context, 'to')} ${ReportsCubit.get(context).statsFormattedDateTo}',
                textAlign: pw.TextAlign.center,
              ),
              pw.SizedBox(height: 5),
              pw.Text(
                ReportsCubit.get(context).statsSelectedWallet.isEmpty
                    ? '${tr(context, 'source')}: ${tr(context, 'all')}'
                    : tr(context, ReportsCubit.get(context).statsSelectedWallet)
                            .isEmpty
                        ? '${tr(context, 'source')}: ${ReportsCubit.get(context).statsSelectedWallet}'
                        : '${tr(context, 'source')}: ${tr(context, ReportsCubit.get(context).statsSelectedWallet)}',
                textAlign: pw.TextAlign.center,
              ),
              pw.SizedBox(height: 5),
              pw.Text(
                ReportsCubit.get(context).statsSelectedTransaction.isEmpty
                    ? '${tr(context, 'transaction')}: ${tr(context, 'all')}'
                    : tr(
                                context,
                                ReportsCubit.get(context)
                                    .statsSelectedTransaction)
                            .isEmpty
                        ? '${tr(context, 'transaction')}: ${ReportsCubit.get(context).statsSelectedTransaction}'
                        : '${tr(context, 'transaction')}: ${tr(context, ReportsCubit.get(context).statsSelectedTransaction)}',
                textAlign: pw.TextAlign.center,
              ),
              pw.SizedBox(height: 5),
              pw.Text(
                ReportsCubit.get(context).statsSelectedSubTransaction.isEmpty
                    ? '${tr(context, 'tableSubTransaction')}: ${tr(context, 'all')}'
                    : tr(
                                context,
                                ReportsCubit.get(context)
                                    .statsSelectedSubTransaction)
                            .isEmpty
                        ? '${tr(context, 'tableSubTransaction')}: ${ReportsCubit.get(context).statsSelectedSubTransaction}'
                        : '${tr(context, 'tableSubTransaction')}: ${tr(context, ReportsCubit.get(context).statsSelectedSubTransaction)}',
                textAlign: pw.TextAlign.center,
              ),
              pw.SizedBox(height: 5),
              pw.Text(
                ReportsCubit.get(context).statsSelectedPriorities.isEmpty
                    ? '${tr(context, 'tablePriority')}: ${tr(context, 'all')}'
                    : tr(
                                context,
                                ReportsCubit.get(context)
                                    .statsSelectedPriorities)
                            .isEmpty
                        ? '${tr(context, 'tablePriority')}: ${ReportsCubit.get(context).statsSelectedPriorities}'
                        : '${tr(context, 'tablePriority')}: ${tr(context, ReportsCubit.get(context).statsSelectedPriorities)}',
                textAlign: pw.TextAlign.center,
              ),
              pw.SizedBox(height: 20),
              pw.Image(chart),
            ],
          ),
        ];
      },
    ),
  );
  return doc;
}
