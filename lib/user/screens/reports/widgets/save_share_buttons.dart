part of 'reports_widgets_imports.dart';

class SaveAndShareButtons extends StatelessWidget {
  final List<ReportCategory> category;

  const SaveAndShareButtons({
    Key? key,
    required this.category,
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
                  ReportsCubit.get(context).generateAndSaveReportExcel(
                      category: category, context: context, openFile: true);
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
                child: Text(
                  tr(context, 'save'),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox.square(dimension: 16.r),
            OutlinedButton(
              onPressed: () async {
                Share.shareXFiles([
                  XFile(
                    await ReportsCubit.get(context).generateAndSaveReportExcel(
                        category: category, context: context),
                  ),
                ]);
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
      ),
    );
  }
}
