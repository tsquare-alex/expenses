part of 'reports_imports.dart';

class Reports extends StatefulWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {

  ReportsData data = ReportsData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => AutoRouter.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: MyText(
          title: "التقارير والاحصائيات",
          color: MyColors.txtColor,
          size: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
