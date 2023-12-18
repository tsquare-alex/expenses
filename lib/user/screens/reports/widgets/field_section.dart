part of 'reports_widgets_imports.dart';

class FieldSection extends StatelessWidget {
  const FieldSection({
    Key? key,
    required this.child,
    this.isSmallMarginRight = false,
    this.isSmallMarginLeft = false,
  }) : super(key: key);

  final Widget child;
  final bool isSmallMarginRight;
  final bool isSmallMarginLeft;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        isSmallMarginLeft ? 10.r : 20.r,
        10.r,
        isSmallMarginRight ? 10.r : 20.r,
        0.r,
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 10.r),
        height: 40.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: context.watch<AppThemeCubit>().isDarkMode
                ? AppDarkColors.accentColor
                : MyColors.greyWhite,
            width: 2.r,
          ),
        ),
        child: child,
      ),
    );
  }
}
