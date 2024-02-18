part of 'settings_widgets_imports.dart';

class BuildLanguageBottomSheet extends StatelessWidget {
  const BuildLanguageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lang = context.watch<LangCubit>().state.locale.languageCode;
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
                  title: tr(context, 'changeLanguage'),
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
                    if(lang == "ar"){
                      Navigator.of(context).pop();
                    }else{
                      Utils.changeLanguage("ar",context);
                      AutoRouter.of(context).pop();
                    }
                  },
                ),
                DefaultButton(
                  title: tr(context, "langEn"),
                  onTap: () {
                    if(lang == "en"){
                      Navigator.of(context).pop();
                    }else{
                      Utils.changeLanguage("en",context);
                      AutoRouter.of(context).pop();
                    }
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
