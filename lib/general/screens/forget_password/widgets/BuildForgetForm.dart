part of 'forget_password_widgets_imports.dart';

class BuildForgetForm extends StatelessWidget {
  final ForgetPasswordData forgetPasswordData;

  const BuildForgetForm({Key? key, required this.forgetPasswordData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: forgetPasswordData.formKey,
      child: GenericTextField(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        controller: forgetPasswordData.email,
        fieldTypes: FieldTypes.normal,
        type: TextInputType.emailAddress,
        action: TextInputAction.next,
        validate: (value) {
          if(value!.isEmpty){
            return 'Enter your Password';
          }
        },
        label: tr(context, "email"),
      ),
    );
  }
}
