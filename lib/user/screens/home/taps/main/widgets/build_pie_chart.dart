part of 'main_widgets_imports.dart';

class BuildPieChart extends StatelessWidget {
  BuildPieChart({Key? key, required this.mainData, required this.homeTabCubit, required this.widgets})
      : super(key: key);
  final MainData mainData;
  final GenericBloc<int> homeTabCubit;
  final Map<Widget,int> widgets;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            height: 150.h,
            width: 150.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: MyColors.white,
            ),
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              PieChart(
                PieChartData(
                  borderData: FlBorderData(show: false),
                  centerSpaceRadius: 60.r,
                  sectionsSpace: 5.w,
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
                      homeTabCubit.onUpdateData(
                          widgets.values.toList()[touchedIndex]);
                    }
                  }),
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset(
                        Res.hourglass,
                        width: 100.w,
                        height: 100.h,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyText(
                            title: "3000",
                            color: MyColors.primary,
                            size: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          MyText(
                            title: "250",
                            color: MyColors.white,
                            size: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.add,
                          color: MyColors.black,
                        ),
                      ),

                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.remove,
                          color: MyColors.black,
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
    );
  }
}
