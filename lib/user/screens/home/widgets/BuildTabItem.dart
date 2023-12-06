part of'HomeWidgetsImports.dart';

class BuildTabIcon extends StatelessWidget {
  final int index;
  final bool active;
  final HomeData controller;
  const BuildTabIcon({super.key, required this.index, required this.active, required this.controller});

  @override
  Widget build(BuildContext context) {
    // Color color = active ? MyColors.backgroundColor : MyColors.grey;
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Image.asset(
          !active?controller.tabs[index]:controller.activeTabs[index],
          color: active?Colors.white:null,
          width: 25, height: 25,

        )
    );
  }
}
