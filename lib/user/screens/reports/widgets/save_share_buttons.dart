part of 'reports_widgets_imports.dart';

class SaveAndShareButtons extends StatelessWidget {
  final bool isPro;

  const SaveAndShareButtons({
    Key? key,
    this.isPro = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.watch<AppThemeCubit>().isDarkMode
          ? AppDarkColors.backgroundColor
          : MyColors.white,
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  if (isPro) {
                    switch (AppThemeCubit.get(context).saveMethod) {
                      case 'excel':
                        ReportsCubit.get(context).generateAndSaveReportExcel(
                            context: context, openFile: true);
                      case 'pdf':
                        ReportsCubit.get(context).generateAndSaveReportPDF(
                            context: context, openFile: true);
                    }
                  } else {
                    AutoRouter.of(context).push(const SubscriptionsRoute());
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(318.w, 58.h),
                  backgroundColor: context.watch<AppThemeCubit>().isDarkMode
                      ? AppDarkColors.primary
                      : MyColors.primary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
                child: isPro
                    ? Text(
                        tr(context, 'save'),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            tr(context, 'save'),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Image.asset(
                            Res.pro,
                            height: 40.h,
                            width: 40.w,
                          ),
                        ],
                      ),
              ),
            ),
            SizedBox.square(dimension: 16.r),
            OutlinedButton(
              onPressed: () async {
                if (isPro) {
                  switch (context.mounted
                      ? AppThemeCubit.get(context).saveMethod
                      : '') {
                    case 'excel':
                      await ReportsCubit.get(context)
                          .generateAndSaveReportExcel(context: context);
                      if (context.mounted) {
                        if (ReportsCubit.get(context)
                                .reportExcelPath
                                .isNotEmpty &&
                            context
                                .read<ReportsCubit>()
                                .categoriesList
                                .isNotEmpty) {
                          Share.shareXFiles([
                            XFile(ReportsCubit.get(context).reportExcelPath),
                          ]);
                        } else {
                          CustomToast.showSimpleToast(
                            msg: tr(context, 'noRecord'),
                            color: MyColors.primary,
                          );
                        }
                      }
                    case 'pdf':
                      await ReportsCubit.get(context)
                          .generateAndSaveReportPDF(context: context);
                      if (context.mounted) {
                        if (ReportsCubit.get(context)
                                .reportPdfPath
                                .isNotEmpty &&
                            context
                                .read<ReportsCubit>()
                                .categoriesList
                                .isNotEmpty) {
                          Share.shareXFiles([
                            XFile(ReportsCubit.get(context).reportPdfPath),
                          ]);
                        } else {
                          CustomToast.showSimpleToast(
                            msg: tr(context, 'noRecord'),
                            color: MyColors.primary,
                          );
                        }
                      }
                  }
                } else {
                  AutoRouter.of(context).push(const SubscriptionsRoute());
                }
              },
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
                padding: EdgeInsets.zero,
              ),
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      Res.shareIcon,
                      color: context.watch<AppThemeCubit>().isDarkMode
                          ? AppDarkColors.secondary
                          : MyColors.primary,
                      height: 24.h,
                      width: 24.w,
                    ),
                  ),
                  if (!isPro)
                    Positioned(
                      bottom: -7.r,
                      left: 0.r,
                      child: Image.asset(
                        Res.pro,
                        height: 40.h,
                        width: 40.w,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
