part of 'WelcomePageImports.dart';

class WelcomePageData {
  // blocs
  final GenericBloc<int> pagesCubit = GenericBloc(0);

  // variables
  List<Widget> data = [];

  void initPagesData(BuildContext context) {

    data = [
      BuildPageView(
        key: const Key("1"),
        model: WelcomeEntity(
            title: "title1",
            desc: "body1",
            image: Res.transaction,
            index: 0,
            pageCubit: pagesCubit),
      ),
      BuildPageView(
        key: const Key("2"),
        model: WelcomeEntity(
            title: "title2",
            desc: "body2",
            image: Res.currencyExchange,
            index: 1,
            pageCubit: pagesCubit),
      ),
      BuildPageView(
        key: const Key("3"),
        model: WelcomeEntity(
            title: "title3",
            desc: "body3",
            image: Res.database,
            last: true,
            index: 2,
            pageCubit: pagesCubit),
      ),
    ];

  }
}
