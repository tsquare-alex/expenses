part of 'HomeWidgetsImports.dart';

class TabIcon extends StatelessWidget {
  final HomeData userHomeData;
  final int index;
  final bool active;

  const TabIcon({super.key, required this.index, required this.active, required this.userHomeData});

  @override
  Widget build(BuildContext context) {
    Color color = active ? MyColors.secondary : MyColors.blackOpacity;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(userHomeData.tabs[index],
              width: 25, height: 25,color: color,),

        ],
      ),
    );
  }
}
