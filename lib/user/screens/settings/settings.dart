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
            color: MyColors.black,
          ),
        ),
        backgroundColor: MyColors.white,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Res.settings,
              width: 24.w,
              height: 24.h,
              color: MyColors.primary,
            ),
            SizedBox(
              width: 8.w,
            ),
            MyText(
              title: tr(context, 'settings'),
              color: Colors.black,
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
