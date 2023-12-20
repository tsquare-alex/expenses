part of 'reports_widgets_imports.dart';

class DurationPickerField extends StatelessWidget {
  const DurationPickerField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.r),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () async {
                ReportsCubit.get(context).selectedDateFrom =
                    await showDatePicker(
                  context: context,
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                  initialDate: ReportsCubit.get(context).selectedDateFrom!,
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
                if (context.mounted) {
                  ReportsCubit.get(context).changeDateFrom();
                }
              },
              child: FieldSection(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.watch<ReportsCubit>().formattedDateFrom.isEmpty
                          ? tr(context, 'durationFrom')
                          : context.watch<ReportsCubit>().formattedDateFrom,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const Icon(
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
                ReportsCubit.get(context).selectedDateTo = await showDatePicker(
                  context: context,
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                  initialDate: ReportsCubit.get(context).selectedDateTo,
                  firstDate: ReportsCubit.get(context).selectedDateFrom!,
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
                if (context.mounted) {
                  ReportsCubit.get(context).changeDateTo();
                }
              },
              child: FieldSection(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.watch<ReportsCubit>().formattedDateTo.isEmpty
                          ? tr(context, 'durationTo')
                          : context.watch<ReportsCubit>().formattedDateTo,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
