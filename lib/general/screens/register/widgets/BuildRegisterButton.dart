part of 'RegisterWidgetsImports.dart';

class BuildRegisterButton extends StatelessWidget {
  final RegisterDate registerDate;

  const BuildRegisterButton({Key? key, required this.registerDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      borderRadius: 8,
      borderColor: MyColors.primary,
      title: "انشاء الحساب",
      onTap: ()=>registerDate.userRegister(context),
      color: MyColors.primary,
      textColor: MyColors.white,
      btnKey: registerDate.btnKey,
      margin: const EdgeInsets.symmetric(vertical: 30),
      fontSize: 13,
    );
  }
}
