part of 'reports_widgets_imports.dart';

class FieldSection extends StatelessWidget {
  const FieldSection({
    Key? key,
    required this.child,
    this.padding,
    this.radius,
  }) : super(key: key);

  final Widget child;
  final double? padding;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 8.r),
      height: 57.h,
      width: 398.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 7.r),
        color: context.watch<AppThemeCubit>().isDarkMode
            ? MyColors.greyWhite
            : Colors.white,
        border: Border.all(
          color: context.watch<AppThemeCubit>().isDarkMode
              ? AppDarkColors.accentColor
              : MyColors.greyWhite,
          width: 1.r,
        ),
        boxShadow: [
          BoxShadow(
            color: context.watch<AppThemeCubit>().isDarkMode
                ? AppDarkColors.accentColor
                : MyColors.greyWhite,
            blurRadius: 0.5,
            spreadRadius: 0.5,
          ),
        ],
      ),
      child: child,
    );
  }
}
