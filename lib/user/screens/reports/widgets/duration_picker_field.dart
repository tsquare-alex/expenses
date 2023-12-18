part of 'reports_widgets_imports.dart';

class DurationPickerField extends StatelessWidget {
  const DurationPickerField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReportsData data = ReportsData();
    String currentLocale = data.getCurrentLocale(context);
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () async {
              data.selectedDate = await showDatePicker(
                context: context,
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                initialDate: data.selectedDate!,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(
                  const Duration(days: 365),
                ),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                        primary: context.watch<AppThemeCubit>().isDarkMode
                            ? AppDarkColors.primary
                            : MyColors.primary,
                        onSurface: context.watch<AppThemeCubit>().isDarkMode
                            ? AppDarkColors.primary
                            : MyColors.primary,
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              data.changeDate();
            },
            child: FieldSection(
              isSmallMarginRight:
                  currentLocale == ReportsData.arLocale ? false : true,
              isSmallMarginLeft:
                  currentLocale == ReportsData.arLocale ? true : false,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Duration from',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () async {
              data.selectedDate = await showDatePicker(
                context: context,
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                initialDate: data.selectedDate!,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(
                  const Duration(days: 365),
                ),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                        primary: context.watch<AppThemeCubit>().isDarkMode
                            ? AppDarkColors.primary
                            : MyColors.primary,
                        onSurface: context.watch<AppThemeCubit>().isDarkMode
                            ? AppDarkColors.primary
                            : MyColors.primary,
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              data.changeDate();
            },
            child: FieldSection(
              isSmallMarginLeft:
                  currentLocale == ReportsData.arLocale ? false : true,
              isSmallMarginRight:
                  currentLocale == ReportsData.arLocale ? true : false,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Duration to',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
