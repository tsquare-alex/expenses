part of 'settings_widgets_imports.dart';

class TileRow extends StatelessWidget {
  const TileRow({
    super.key,
    required this.icon,
    required this.title,
    this.isTrailing = true,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final bool isTrailing;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 25.sp,
          color: MyColors.primary,
        ),
        SizedBox(width: 10.w),
        Baseline(
          baseline: 16.sp,
          baselineType: TextBaseline.alphabetic,
          child: MyText(
            title: title,
            color: MyColors.primary,
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
