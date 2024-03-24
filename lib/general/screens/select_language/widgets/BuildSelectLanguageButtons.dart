part of 'SelectLanguageWidgetsImports.dart';

class BuildSelectLanguageButtons extends StatelessWidget {
  final SelectLanguageData data;

  const BuildSelectLanguageButtons({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var local = context.read<LangCubit>().state.locale.languageCode;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          LoadingButton(
              borderRadius: 8,
              title: tr(context, "langAr"),
              onTap: (){
               if(local == "ar"){
                 AutoRouter.of(context).push(SelectCountryRoute(fromSetting: false));
               }else{
                 Utils.changeLanguage("ar",context);
                 Phoenix.rebirth(context);
               }
              },
              color: MyColors.primary,
              textColor: MyColors.white,
              btnKey: data.btnKey1,
              margin: const EdgeInsets.symmetric(vertical: 10),
              fontSize: 14),
          LoadingButton(
              borderRadius: 8,
              title: tr(context, "langEn"),
              onTap: (){
                if(local == "en"){
                  AutoRouter.of(context).push(SelectCountryRoute(fromSetting: false));
                }else{
                  Utils.changeLanguage("en",context);
                  Phoenix.rebirth(context);
                }
              },
              borderColor: MyColors.primary.withOpacity(0.1),
              color: MyColors.primary.withOpacity(0.1),
              textColor: MyColors.primary,
              btnKey: data.btnKey2,
              margin: const EdgeInsets.symmetric(vertical: 10),
              fontSize: 14),
        ],
      ),
    );
  }
}
