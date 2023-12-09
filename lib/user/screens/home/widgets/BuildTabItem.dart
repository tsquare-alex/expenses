part of'HomeWidgetsImports.dart';

class BuildTabIcon extends StatelessWidget {
  final int index;
  final bool active;
  final HomeData controller;
  const BuildTabIcon({super.key, required this.index, required this.active, required this.controller});

  @override
  Widget build(BuildContext context) {
    // Color color = active ? MyColors.backgroundColor : MyColors.grey;
    return TabIcon(index: index, active: active, userHomeData: controller);
  }
}
