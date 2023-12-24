part of '../statistics_imports.dart';

class SelectionCheckbox extends StatelessWidget {
  const SelectionCheckbox({
    Key? key,
    required this.isChecked,
  }) : super(key: key);

  final bool isChecked;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.h,
      width: 15.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isChecked
            ? context.watch<AppThemeCubit>().isDarkMode
                ? AppDarkColors.primary
                : MyColors.primary
            : Colors.transparent,
        border: Border.all(
          width: 2.r,
          color: isChecked
              ? context.watch<AppThemeCubit>().isDarkMode
                  ? AppDarkColors.primary
                  : MyColors.primary
              : Colors.grey,
        ),
      ),
    );
  }
}
