part of '../../statistics_imports.dart';

class ReportComparison extends StatelessWidget {
  const ReportComparison({
    Key? key,
    required this.data1,
    required this.data2,
  }) : super(key: key);

  final List<AddTransactionModel> data1;
  final List<AddTransactionModel> data2;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
              indicatorColor: MyColors.primary,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.black87,
              unselectedLabelColor: Colors.grey.shade400,
              tabs: [
                Tab(
                  child: Text(
                    'جدول',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'رسم بياني',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            TabsBody(
              data1: data1,
              data2: data2,
            ),
          ],
        ),
      ),
    );
  }
}
