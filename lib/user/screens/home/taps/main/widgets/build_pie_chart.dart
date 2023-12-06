part of 'main_widgets_imports.dart';

class BuildPieChart extends StatelessWidget {
  const BuildPieChart({Key? key, required this.mainData}) : super(key: key);
  final MainData mainData;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          color: Colors.white,
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            PieChart(
              PieChartData(
                borderData: FlBorderData(show: false),
                centerSpaceRadius: 50,
                sections: mainData.getSections(),
                pieTouchData: PieTouchData(
                    touchCallback: (event, pieTouchResponse) {
                      if (!event.isInterestedForInteractions || pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                        return;
                      }
                      final int touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                      if (touchedIndex >= 0 && touchedIndex < mainData.data.length) {
                        // Navigate to the page with the corresponding widget
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => mainData.widgets[touchedIndex]),
                        );
                      }
                    }
                ),
              ),
            ),
            SizedBox(
              width: 80.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap:(){},
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      // padding: EdgeInsets.all(5.r),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        shape: BoxShape.circle
                      ),
                      child: Center(
                        child: Icon(Icons.add,color: MyColors.black,),
                      ),
                    ),
                  ),
                  Divider(thickness: 2.w,),
                  InkWell(
                    onTap: (){},
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5.r),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          shape: BoxShape.circle
                      ),
                      child: Center(
                        child: MyText(
                          title: "--",
                          color: MyColors.black,
                          size: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
