part of 'reports_widgets_imports.dart';

class ReportNoRecord extends StatelessWidget {
  const ReportNoRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20.r),
            child: Image.asset(
              Res.searchRecords,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          MyText(
            title: "No Record",
            color: MyColors.black,
            size: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
