part of 'RegisterWidgetsImports.dart';

class BuildRegisterText extends StatelessWidget {
  const BuildRegisterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: MyText(
        title: tr(context, "register"),
        color: MyColors.black,
        size: 17.sp,
        fontWeight: FontWeight.bold,
        alien: TextAlign.center,
      ),
    );
  }
}
