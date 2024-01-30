part of 'settings_imports.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => AutoRouter.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.white
                : MyColors.black,
          ),
        ),
        backgroundColor: context.watch<AppThemeCubit>().isDarkMode
            ? AppDarkColors.backgroundColor
            : Colors.white,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Res.settings,
              width: 24.w,
              height: 24.h,
              color: context.watch<AppThemeCubit>().isDarkMode
                  ? AppDarkColors.secondary
                  : MyColors.primary,
            ),
            SizedBox(
              width: 8.w,
            ),
            MyText(
              title: tr(context, 'settings'),
              color: context.watch<AppThemeCubit>().isDarkMode
                  ? MyColors.white
                  : MyColors.black,
              size: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
      body: const SettingsBody(),
    );
  }
}
