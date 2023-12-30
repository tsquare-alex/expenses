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
        backgroundColor: MyColors.amber,
        title: Row(
          children: [
            Image.asset(
              Res.settings,
              width: 20.w,
              height: 20.h,
              color: MyColors.white,
            ),
            SizedBox(
              width: 10.w,
            ),
            MyText(
              title: tr(context, 'settings'),
              color: Colors.white,
              size: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SettingsBody(),
    );
  }
}
