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
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        title: MyText(
          title: tr(context, "main"),
          color: MyColors.txtColor,
          size: 16.sp,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(onPressed: (){
          }, icon: Icon(Icons.dark_mode_outlined,color: MyColors.primary,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.account_balance_outlined,color: MyColors.primary,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.settings,color: MyColors.primary,)),
        ],
      ),
      drawer: const Drawer(),
      body:Container(
        padding: EdgeInsets.all(15.r),
        width: double.infinity,
        height: double.infinity,
        child: BuildPieChart(mainData: data,),
      ),
    );
  }
}
