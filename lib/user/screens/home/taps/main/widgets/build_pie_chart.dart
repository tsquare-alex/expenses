part of 'main_widgets_imports.dart';

class BuildPieChart extends StatelessWidget {
  BuildPieChart({Key? key, required this.mainData, required this.homeTabCubit}) : super(key: key);
  final MainData mainData;
  final GenericBloc<int> homeTabCubit;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.white,
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              height: 150.h,
              width: 150.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.white,
                // gradient: LinearGradient(
                //     stops: [0.5, 0.5],
                //     begin: Alignment.topCenter,
                //     end: Alignment.bottomCenter,
                //     colors: <Color>[
                //       Colors.green,
                //       Colors.red,
                //     ]),
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                PieChart(
                  PieChartData(
                    borderData: FlBorderData(show: false),
                    centerSpaceRadius: 60.r,
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
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) =>
                        //         mainData.widgets.keys.toList()[touchedIndex],
                        //   ),
                        // );
                        homeTabCubit.onUpdateData(mainData.widgets.values.toList()[touchedIndex]);
                        // //print(mainData.widgets.values.toList()[touchedIndex]);
                        // print(data.homeTabCubit.state.data);
                      }
                    }),
                  ),
                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    // SpinKitPouringHourGlassRefined(
                    //   color: Colors.amber,
                    //   size: 150.0.w,
                    //   controller: mainData.controller,
                    // ),
                    Image.asset(Res.hourglass,width: 100.w,height: 100.h,),
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
