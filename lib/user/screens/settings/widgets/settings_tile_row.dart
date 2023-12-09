part of 'settings_widgets_imports.dart';

class TileRow extends StatelessWidget {
  const TileRow({
    super.key,
    required this.icon,
    required this.title,
    this.isTrailing = true,
    this.trailing,
  });

  final String icon;
  final String title;
  final bool isTrailing;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          icon,
          width: 25.w,
          height: 25,
          color: context.watch<AppThemeCubit>().isDarkMode
              ? Colors.lightBlue[200]
              : MyColors.primary,
        ),
        SizedBox(width: 10.w),
        Baseline(
          baseline: 16.sp,
          baselineType: TextBaseline.alphabetic,
          child: MyText(
            title: title,
            color: context.watch<AppThemeCubit>().isDarkMode
                ? Colors.lightBlue[200]
                : MyColors.primary,
            size: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (isTrailing) ...[
          const Spacer(),
          SizedBox(
            width: 130.w,
            child: trailing!,
          ),
        ]
      ],
    );
  }
}
