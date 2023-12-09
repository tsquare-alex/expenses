part of 'settings_widgets_imports.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.watch<AppThemeCubit>().isDarkMode
          ? MyColors.greyWhite
          : MyColors.backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
