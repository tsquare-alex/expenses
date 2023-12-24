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
    Map<Widget,int> widgets={
      Container():6,
      Transactions(homeTabCubit: widget.homeTabCubit,):0,
      const Reports():2,
      const Settings():3,
      Database():5,
      const Budget():8,
      const Wallet():7,
      Container():4,
    };
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CustomToast.showSimpleToast(msg: "تحت التطوير",color: Colors.red,);
        },
        shape: const CircleBorder(),
        backgroundColor: context.watch<AppThemeCubit>().isDarkMode?AppDarkColors.primary:MyColors.primary,
        child: Icon(
          Icons.edit,
          color: MyColors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        padding: EdgeInsets.all(15.r),
        width: double.infinity,
        height: double.infinity,
        child: BuildPieChart(
          mainData: data, homeTabCubit: widget.homeTabCubit, widgets: widgets,
        ),
      ),
    );
  }
}
