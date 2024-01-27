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
      child: PieChart(
        PieChartData(
          borderData: FlBorderData(show: false),
          centerSpaceRadius: 75.r,
          sectionsSpace: 10.w,
          sections: mainData.getSections(context),
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
    );
  }
}
