part of 'settings_widgets_imports.dart';

class BuildLanguageBottomSheet extends StatelessWidget {
  const BuildLanguageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(15.0.r),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                alignment: Alignment.center,
                child: MyText(
                  title: 'تغيير اللغة',
                  color: MyColors.primary,
                  fontWeight: FontWeight.bold,
                  size: 18.sp,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultButton(
                  title: tr(context, 'langAr'),
                  onTap: () {
                    Utils.changeLanguage("ar",context);
                    Phoenix.rebirth(context);
                  },
                ),
                DefaultButton(
                  title: tr(context, "langEn"),
                  onTap: () {
                    Utils.changeLanguage("en",context);
                    Phoenix.rebirth(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
