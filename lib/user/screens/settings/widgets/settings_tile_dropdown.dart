part of 'settings_widgets_imports.dart';

class TileDropdownButton extends StatelessWidget {
  const TileDropdownButton({
    Key? key,
    required this.menuList,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final List menuList;
  final Object value;
  final Function(Object? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value,
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: MyColors.primary,
      ),
      iconSize: 22.sp,
      style: TextStyle(
        fontSize: 14.sp,
        color: MyColors.primary,
        fontWeight: FontWeight.bold,
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
      ),
      items: menuList.map(
        (value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value.toString()),
          );
        },
      ).toList(),
      onChanged: onChanged,
    );
  }
}
