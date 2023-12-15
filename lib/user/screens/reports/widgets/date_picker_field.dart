part of 'reports_widgets_imports.dart';

class DatePickerField extends StatelessWidget {
  const DatePickerField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReportsData data = ReportsData();
    return GestureDetector(
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data.formattedDate,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const Icon(
              CupertinoIcons.calendar_today,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
