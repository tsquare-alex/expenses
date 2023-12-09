part of 'main_imports.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  MainData data = MainData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: data.scaffoldKey,
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        leadingWidth: 35.w,
        title:  MyText(
          title: tr(context, "main"),
          color: MyColors.txtColor,
          size: 16.sp,
          fontWeight: FontWeight.bold,
        ),
        leading: Padding(
          padding: EdgeInsets.only(right: 15.0.r),
          child: IconButton(
              onPressed: () {
                data.scaffoldKey.currentState?.openDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: MyColors.primary,
              ),),
        ),
        actions: [
          IconButton(
              onPressed: () {
                AutoRouter.of(context).push(const ChangeCurrencyRoute());
              },
              icon: Icon(
                Icons.dark_mode_outlined,
                color: MyColors.primary,
              ),),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.account_balance_outlined,
                color: MyColors.primary,
              ),),
          IconButton(
            onPressed: () {
              data.scaffoldKey.currentState?.openEndDrawer();
            },
            icon: Image.asset(
              Res.menu,
              color: MyColors.primary,
              width: 25.w,
              height: 25.h,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: MyColors.primary,
        child: Icon(
          Icons.edit,
          color: MyColors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: BuildDrawer(
        shareCubit: data.shareCubit,
      ),
      endDrawer: const BuildEndDrawer(),
      body: Container(
        padding: EdgeInsets.all(15.r),
        width: double.infinity,
        height: double.infinity,
        child: BuildPieChart(
          mainData: data,
        ),
      ),
    );
  }
}
