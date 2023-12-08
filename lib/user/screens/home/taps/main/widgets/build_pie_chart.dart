part of 'main_widgets_imports.dart';

class BuildPieChart extends StatelessWidget {
  const BuildPieChart({Key? key, required this.mainData}) : super(key: key);
  final MainData mainData;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Container(
        decoration: BoxDecoration(
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
                    stops: [0.5, 0.5],
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
                                mainData.widgets[touchedIndex],
                          ),
                        );
                      }
                    }),
                  ),
                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    SpinKitPouringHourGlassRefined(
                      color: Colors.amber,
                      size: 150.0.w,
                      controller: mainData.controller,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            color: MyColors.white,
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove,
                            color: MyColors.white,
                            size: 25.w,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
