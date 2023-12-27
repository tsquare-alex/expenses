part of 'WelcomeWidgetImports.dart';

class BuildPageView extends StatelessWidget {
  final WelcomeEntity model;

  const BuildPageView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lang = context.watch<LangCubit>().state.locale.languageCode;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: MyColors.greyWhite
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(child: Image.asset(model.image!,color: MyColors.primary,width: 250.w,)),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: MyText(
                title: model.title ?? "",
                size: 24,
                color: MyColors.primary,
                alien: TextAlign.center,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 30),
              child: MyText(
                title: model.desc ?? "",
                size: 18,
                color: MyColors.grey,
                alien: TextAlign.center,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => AutoRouter.of(context)
                        .push(const SelectLanguageRoute()),
                    child: MyText(
                      title: (model.index! == 2)
                          ? tr(context, "start")
                          : tr(context, "skip"),
                      size: 18,
                      color: MyColors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => model.last
                        ? AutoRouter.of(context)
                            .push(const SelectLanguageRoute())
                        : model.pageCubit?.onUpdateData(model.index! + 1),
                    child: Container(
                        margin: const EdgeInsets.all(17),
                        child: CircleProgressBar(
                            foregroundColor: MyColors.primary,
                            backgroundColor: Colors.transparent,
                            value: (model.index! + 1) * .333,
                            strokeWidth: 2.5,
                            child: Container(
                                margin: const EdgeInsets.all(8),
                                padding:
                                    const EdgeInsetsDirectional.only(start: 7),
                                decoration: BoxDecoration(
                                  color: MyColors.primary,
                                  borderRadius: BorderRadius.circular(150),
                                ),
                                alignment: Alignment.center,
                                child: Icon(
                                  lang == "ar"
                                      ? Icons.arrow_back_ios
                                      : Icons.arrow_forward_ios,
                                  size: 25,
                                  color: MyColors.white,
                                )))),
                  ),
                ),
                Expanded(child: Container()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
