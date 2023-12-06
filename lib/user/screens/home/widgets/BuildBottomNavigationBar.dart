part of 'HomeWidgetsImports.dart';

class BuildBottomNavigationBar extends StatelessWidget {
  final HomeData controller;

  const BuildBottomNavigationBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<int>, GenericState<int>>(
      bloc: controller.homeTabCubit,
      builder: (context, state) {
        return AnimatedBottomNavigationBar.builder(
          itemCount: 3,
          tabBuilder: (int index, bool isActive) {
            return BuildTabIcon(
              index: index,
              active: isActive,
              controller: controller,
            );
          },
          backgroundColor: MyColors.primary,
          splashColor: MyColors.primary,
          activeIndex: state.data,
          gapLocation: GapLocation.none,
          splashSpeedInMilliseconds: 300,
          leftCornerRadius: 20,
          rightCornerRadius: 20,


          height: 60,
          onTap: (index) => controller.animateTabsPages(index, context),
        );
      },
    );
  }
}
