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
            title: "Welcome on My Expenses",
            desc: "Plan your finance any time, any where",
            image: Res.onboardingOne,
            index: 0,
            pageCubit: pagesCubit),
      ),
      BuildPageView(
        key: const Key("2"),
        model: WelcomeEntity(
            title: "One touch and send money",
            desc:
            "Send money to everyone by one step and organize your wallet easier",
            image: Res.onboardingTwo,
            index: 1,
            pageCubit: pagesCubit),
      ),
      BuildPageView(
        key: const Key("3"),
        model: WelcomeEntity(
            title: "Automatically organize",
            desc:"Organize your expenses and secure your account",
            image: Res.onboardingThree,
            last: true,
            index: 2,
            pageCubit: pagesCubit),
      ),
    ];

  }
}
