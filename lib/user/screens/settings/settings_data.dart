part of 'settings_imports.dart';

class SettingsData {
  List<String> monthDays =
      List.generate(31, (index) => (1 + index++).toString());

  List<String> weekDays(BuildContext context) {
    return [
      tr(context, 'saturday'),
      tr(context, 'sunday'),
      tr(context, 'monday'),
      tr(context, 'tuesday'),
      tr(context, 'wednesday'),
      tr(context, 'thursday'),
      tr(context, 'friday'),
    ];
  }

  List<String> numberFormat = ['عربي', 'انجليزي'];

  List<String> decimal = ['رقم', 'رقمين'];

  List<String> saveFormat = ['PDF', 'XLSX'];

  List<String> syncOptions = ['Google Drive', 'Firebase'];

  Future languagePressed(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const BuildLanguageBottomSheet(),
          surfaceTintColor: MyColors.white,
        );
      },
    );
  }

  Future settingsDialog({
    required BuildContext context,
    required List dialogList,
    required String title,
    bool isList = false,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(16.r),
          content: SizedBox(
            height: isList ? 0.3.sh : null,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: MyText(
                      title: title,
                      color: context.watch<AppThemeCubit>().isDarkMode
                          ? Colors.lightBlue[200]
                          : MyColors.primary,
                      fontWeight: FontWeight.bold,
                      size: 18.sp,
                    ),
                  ),
                ),
                if (!isList)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...dialogList
                          .map(
                            (item) => TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: MyText(
                                title: item,
                                color: context.watch<AppThemeCubit>().isDarkMode
                                    ? Colors.lightBlue[200]
                                    : MyColors.primary,
                                size: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                          .toList(),
                    ],
                  ),
                if (isList)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...dialogList
                              .map(
                                (item) => TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: MyText(
                                    title: item,
                                    color: context
                                            .watch<AppThemeCubit>()
                                            .isDarkMode
                                        ? Colors.lightBlue[200]
                                        : MyColors.primary,
                                    size: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                              .toList(),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          surfaceTintColor: MyColors.white,
        );
      },
    );
  }
}
