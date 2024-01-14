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
      height: 57.h,
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
            color: MyColors.primary,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
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
    backgroundColor: MyColors.white,
    barrierColor: Colors.black.withOpacity(0.65),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
    ),
    builder: (_) {
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: 24.r,
          horizontal: 16.r,
        ),
        height: 263.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          color: MyColors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...ReportsCubit.get(context)
                .statsDetailsOptions
                .entries
                .map(
                  (entry) => OptionButton(
                    label: entry.value,
                    color: Colors.grey.shade100,
                    // color: context.watch<AppThemeCubit>().isDarkMode
                    //     ? AppDarkColors.primary
                    //     : MyColors.primary,
                    onPressed: () {
                      AutoRouter.of(context)
                          .push(StatisticsRoute(option: entry.key));
                      AutoRouter.of(context).pop();
                    },
                  ),
                )
                .toList(),
          ],
        ),
      );
    },
  );
}
