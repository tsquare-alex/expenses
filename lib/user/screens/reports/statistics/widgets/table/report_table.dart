part of '../../statistics_imports.dart';

class ReportTable extends StatelessWidget {
  const ReportTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.r),
        child: Table(
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
                ...List.generate(
                  4,
                  (index) => Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.r),
                      child: Text(
                        'Data ${index + 1}',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ...List.generate(
              3,
              (index) => TableRow(
                children: [
                  ...List.generate(
                    4,
                    (index) => Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.r),
                        child: Text(
                          'Data ${index + 1}',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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
