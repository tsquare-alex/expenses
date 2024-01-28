part of 'login_widgets_imports.dart';

class BuildLoginSkip extends StatelessWidget {
  const BuildLoginSkip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: (){
          AutoRouter.of(context).push(HomeRoute(index: 1));
        },
        child: MyText(
          title: tr(context, "skip"),
          color: context.read<AppThemeCubit>().isDarkMode?
          MyColors.white:
          MyColors.primary,
          size: 16.sp,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
