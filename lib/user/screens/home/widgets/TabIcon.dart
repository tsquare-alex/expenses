part of 'HomeWidgetsImports.dart';

class TabIcon extends StatelessWidget {
  final HomeData userHomeData;
  final int index;
  final bool active;

  TabIcon({required this.index, required this.active, required this.userHomeData});

  @override
  Widget build(BuildContext context) {
    Color color = active ? context.watch<AppThemeCubit>().isDarkMode
            ? MyColors.white
            : MyColors.primary : MyColors.grey;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Image.asset(
            "${active?userHomeData.activeTabs[index].image:userHomeData.tabs[index].image}",
            color: active? null
                : context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.white
                : null,
            width: 25, height: 25,
          ),
          SizedBox(height: 5.h),
          MyText(
            title: tr(context, userHomeData.tabs[index].title!),
            size: 12.sp,
            max: 1,
            overflow: TextOverflow.ellipsis,
            color: active? context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.primary
                : MyColors.primary
                :context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.white
                : MyColors.grey,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}

