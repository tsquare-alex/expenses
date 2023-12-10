part of 'reports_imports.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key,}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {

  ReportsData data = ReportsData();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Column(
        children: [
          MyText(title: "reports", color: MyColors.primary, size: 16.sp,fontWeight: FontWeight.bold,),
        ],
      ),
    );
  }
}
