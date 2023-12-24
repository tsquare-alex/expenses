part of '../statistics_imports.dart';

class StatisticsDropdown extends StatelessWidget {
  const StatisticsDropdown({
    Key? key,
    required this.label,
    required this.menuList,
    required this.onSelect,
  }) : super(key: key);

  final Function(String key) onSelect;
  final String label;
  final Map menuList;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        isExpanded: true,
        hint: Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.grey,
        ),
        menuMaxHeight: 0.3.sh,
        items: menuList.entries
            .map(
              (entry) => DropdownMenuItem(
                enabled: false,
                child: ListTile(
                  onTap: () {
                    onSelect(entry.key);
                  },
                  title: Text(
                    entry.key,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  trailing: SelectionCheckbox(isChecked: entry.value),
                ),
                // child: CheckboxListTile(
                //   activeColor: context.watch<AppThemeCubit>().isDarkMode
                //       ? AppDarkColors.primary
                //       : MyColors.primary,
                //   value: entry.value,
                //   contentPadding: EdgeInsets.zero,
                //   title: Text(
                //     entry.key,
                //     style: TextStyle(
                //       fontSize: 12.sp,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.grey,
                //     ),
                //   ),
                //   onChanged: (value) {
                //     setState(() {
                //       menuList[entry.key] = value;
                //       // ReportsCubit.get(context)
                //       //     .onWalletMapSelect(value!, entry.key);
                //     });
                //     print(value);
                //     print(ReportsCubit.get(context).walletsMap);
                //     // onSelect(value!, entry.key);
                //   },
                // ),
              ),
            )
            .toList(),
        onChanged: (value) {},
      ),
    );
  }
}
