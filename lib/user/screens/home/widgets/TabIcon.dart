part of 'HomeWidgetsImports.dart';

class TabIcon extends StatelessWidget {
  final HomeData userHomeData;
  final int index;
  final bool active;

  TabIcon({required this.index, required this.active, required this.userHomeData});

  @override
  Widget build(BuildContext context) {
    Color color = active ? MyColors.white : MyColors.grey;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Image.asset(
            "${userHomeData.tabs[index].image}",
            color: active?MyColors.white:MyColors.grey,
            width: 25, height: 25,
          ),
          SizedBox(height: 5.h),
          MyText(
            title: tr(context, userHomeData.tabs[index].title!),
            size: 9.sp,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}

