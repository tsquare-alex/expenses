part of 'main_imports.dart';

class Main extends StatefulWidget {
  const Main({Key? key, required this.homeTabCubit}) : super(key: key);
  final GenericBloc<int> homeTabCubit;
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  MainData data = MainData();

  @override
  Widget build(BuildContext context) {
    Map<Widget, int> widgets = {
      Container(): 6,
      Transactions(
        homeTabCubit: widget.homeTabCubit,
      ): 0,
      const Reports(): 2,
      const Settings(): 3,
      Database(): 5,
      const Budget(): 8,
      const Wallet(): 7,
      Container(): 4,
    };
    return Scaffold(

      // floatingActionButtonLocation: ExpandableFab.location,
      // floatingActionButton: ExpandableFab(
      //   openButtonBuilder: RotateFloatingActionButtonBuilder(
      //     child: const Icon(Icons.account_box),
      //     fabSize: ExpandableFabSize.regular,
      //     foregroundColor: Colors.white,
      //     backgroundColor: context.watch<AppThemeCubit>().isDarkMode
      //         ? AppDarkColors.primary
      //         : MyColors.primary,
      //     shape: const CircleBorder(),
      //   ),
      //   closeButtonBuilder: DefaultFloatingActionButtonBuilder(
      //     child: const Icon(Icons.close),
      //     fabSize: ExpandableFabSize.small,
      //     foregroundColor: Colors.white,
      //     backgroundColor: context.watch<AppThemeCubit>().isDarkMode
      //         ? AppDarkColors.primary
      //         : MyColors.primary,
      //     shape: const CircleBorder(),
      //   ),
      //   children: [
      //     ...context.watch<FavoriteCubit>().getFavoriteModels().map((tool) {
      //       return FloatingActionButton.small(
      //         backgroundColor: context.watch<AppThemeCubit>().isDarkMode
      //             ? AppDarkColors.primary
      //             : MyColors.primary,
      //         heroTag: null,
      //         child: Icon(IconData(tool.iconCode, fontFamily: 'MaterialIcons')),
      //         onPressed: () {
      //           print(tool.iconCode);
      //           _navigateToToolScreen(context, tool);
      //         },
      //       );
      //     }).toList(),
      //   ],
      // ),
      body: Container(
        padding: EdgeInsets.all(15.r),
        width: double.infinity,
        height: double.infinity,
        child: BuildPieChart(
          mainData: data,
          homeTabCubit: widget.homeTabCubit,
          widgets: widgets,
        ),
      ),
    );
  }


}

