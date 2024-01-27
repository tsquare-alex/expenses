part of '../statistics_imports.dart';

class StatisticsDropdown extends StatelessWidget {
  const StatisticsDropdown({
    Key? key,
    required this.onSelect,
    required this.label,
    required this.choice,
    required this.menuList,
  }) : super(key: key);

  final Function(String value) onSelect;
  final String label;
  final String choice;
  final List<DropdownMenuItem<String>> menuList;

  @override
  Widget build(BuildContext context) {
    return FieldSection(
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: choice.isEmpty ? null : choice,
          isExpanded: true,
          hint: Text(
            label,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: context.watch<AppThemeCubit>().isDarkMode
                ? AppDarkColors.secondary
                : MyColors.primary,
          ),
          menuMaxHeight: 0.3.sh,
          items: menuList,
          onChanged: (value) {
            onSelect(value!);
          },
        ),
      ),
    );
  }
}
