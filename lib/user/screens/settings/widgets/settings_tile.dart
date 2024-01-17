part of 'settings_widgets_imports.dart';

class SettingTile extends StatelessWidget {
  const  SettingTile({
    Key? key,
    required this.child,
    this.doubleRow = false,
    this.border = true,
    this.greyBackground = false,
  }) : super(key: key);

  final Widget child;
  final bool? doubleRow;
  final bool? border;
  final bool? greyBackground;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: doubleRow! ? 126.h : 57.h,
      width: 398.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: greyBackground! ? const Color(0xFFFAFAFA) : MyColors.white,
        border: border!
            ? Border.all(
                color: context.watch<AppThemeCubit>().isDarkMode
                    ? AppDarkColors.accentColor
                    : MyColors.greyWhite,
                width: 1.r,
              )
            : null,
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
