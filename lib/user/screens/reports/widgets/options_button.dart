part of 'reports_widgets_imports.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    Key? key,
    required this.label,
    required this.color,
    required this.onPressed,
    this.isPro = false,
  }) : super(key: key);

  final String label;
  final Color color;
  final Function onPressed;
  final bool isPro;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 57.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (isPro) {
            onPressed();
          } else {
            CustomToast.showSimpleToast(msg: 'Pro');
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 0,
          padding: EdgeInsets.symmetric(horizontal: 0.2.sw),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: isPro
            ? Text(
                label,
                style: TextStyle(
                  color: context.watch<AppThemeCubit>().isDarkMode
                      ? AppDarkColors.secondary
                      : MyColors.primary,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: context.watch<AppThemeCubit>().isDarkMode
                          ? AppDarkColors.secondary
                          : MyColors.primary,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    Res.pro,
                    height: 40.h,
                    width: 40.w,
                  ),
                ],
              ),
      ),
    );
  }
}

Future<dynamic> showReportOptionsModalSheet({required BuildContext context}) {
  return showModalBottomSheet(
    context: context,
    isDismissible: true,
    backgroundColor: context.read<AppThemeCubit>().isDarkMode
        ? AppDarkColors.backgroundColor
        : Colors.white,
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
          color: context.read<AppThemeCubit>().isDarkMode
              ? AppDarkColors.backgroundColor
              : Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...ReportsCubit.get(context)
                .statsDetailsOptions(context)
                .entries
                .map(
                  (entry) => OptionButton(
                    label: entry.value,
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? AppDarkColors.accentColor
                        : Colors.grey.shade200,
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
