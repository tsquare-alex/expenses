part of '../statistics_imports.dart';

class ChoiceSection extends StatelessWidget {
  const ChoiceSection({
    Key? key,
    required this.label,
    required this.menuList,
    this.onSelect,
  }) : super(key: key);

  final Function(
  String key
  )? onSelect;
  final String label;
  final Map menuList;

  @override
  Widget build(BuildContext context) {
    return FieldSection(
      child: StatisticsDropdown(
        menuList: menuList,
        label: label,
        onSelect: onSelect!,
      ),
    );
  }
}
