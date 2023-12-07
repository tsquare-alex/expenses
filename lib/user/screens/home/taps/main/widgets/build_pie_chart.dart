part of 'main_widgets_imports.dart';

class BuildPieChart extends StatelessWidget {
  const BuildPieChart({Key? key, required this.mainData}) : super(key: key);
  final MainData mainData;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Container(
        decoration:  BoxDecoration(
          color: MyColors.backgroundColor,
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              height: 150.h,
              width: 150.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  stops: [
                    0.5,0.5
                  ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Colors.green,
                      Colors.red,
                    ]),
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                PieChart(
                  PieChartData(
                    borderData: FlBorderData(show: false),
                    centerSpaceRadius: 80,
                    sections: mainData.getSections(),
                    pieTouchData:
                        PieTouchData(touchCallback: (event, pieTouchResponse) {
                      if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        return;
                      }
                      final int touchedIndex =
                          pieTouchResponse.touchedSection!.touchedSectionIndex;
                      if (touchedIndex >= 0 &&
                          touchedIndex < mainData.data.length) {
                        // Navigate to the page with the corresponding widget
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  mainData.widgets[touchedIndex]),
                        );
                      }
                    }),
                  ),
                ),
                Container(
                  width: 150.w,
                  // padding: EdgeInsets.only(bottom: 5.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 40,
                          height: 40,
                          alignment: Alignment.center,
                          // padding: EdgeInsets.all(5.r),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 1,color: Colors.white,),
                              shape: BoxShape.circle),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 40,
                          height: 40,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5.r),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 1,color: Colors.white,),
                              shape: BoxShape.circle),
                          child: const Center(
                            child: Icon(
                              Icons.remove,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
