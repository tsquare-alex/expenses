part of 'reports_widgets_imports.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    Key? key,
    required this.label,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final Color color;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}

Future<dynamic> showReportOptionsModalSheet({required BuildContext context}) {
  return showModalBottomSheet(
    context: context,
    isDismissible: true,
    barrierColor: Colors.black.withOpacity(0.65),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25.r),
        topRight: Radius.circular(25.r),
      ),
    ),
    builder: (_) {
      return Container(
        padding: EdgeInsets.all(30.r),
        height: 0.32.sh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OptionButton(
              label: 'Show transactions on table',
              color: context.watch<AppThemeCubit>().isDarkMode
                  ? AppDarkColors.primary
                  : MyColors.primary,
              onPressed: () {
                AutoRouter.of(context).push(const ReportTableRoute());
                AutoRouter.of(context).pop();
              },
            ),
            OptionButton(
              label: 'Show transactions on chart',
              color: context.watch<AppThemeCubit>().isDarkMode
                  ? AppDarkColors.primary
                  : MyColors.primary,
              onPressed: () {
                AutoRouter.of(context).push(const ReportChartRoute());
                AutoRouter.of(context).pop();
              },
            ),
            OptionButton(
              label: 'Compare between transactions',
              color: context.watch<AppThemeCubit>().isDarkMode
                  ? AppDarkColors.primary
                  : MyColors.primary,
              onPressed: () {
                AutoRouter.of(context).push(const ReportComparisonRoute());
                AutoRouter.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}
