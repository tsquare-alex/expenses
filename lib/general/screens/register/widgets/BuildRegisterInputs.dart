part of 'RegisterWidgetsImports.dart';

class BuildRegisterFields extends StatelessWidget {
  final RegisterDate registerDate;

  const BuildRegisterFields({Key? key, required this.registerDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerDate.formKey,
      child: Column(
        children: [
          GenericTextField(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            controller: registerDate.firstNameController,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.text,
            action: TextInputAction.next,
            validate: (value) {
              if(value!.isEmpty){
                return 'Enter your Name';
              }
            },            label: "الاسم",
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          GenericTextField(
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            controller: registerDate.emailController,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.emailAddress,
            action: TextInputAction.next,
            validate: (value) {
              if(value!.isEmpty){
                return 'Enter your Email';
              }
            },            label: "البريد الالكتروني",
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: registerDate.passwordCubit,
              builder: (context, state) {
                return GenericTextField(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  controller: registerDate.passwordController,
                  fieldTypes:
                      !state.data ? FieldTypes.password : FieldTypes.normal,
                  type: TextInputType.text,
                  action: TextInputAction.next,
                  validate: (value) {
                    if(value!.isEmpty){
                      return 'Enter your Password';
                    }
                    },
                  label: "كلمه المرور",
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  suffixIcon: IconButton(
                    onPressed: () =>
                        registerDate.passwordCubit.onUpdateData(!state.data),
                    icon: Icon(
                      !state.data ? Icons.visibility : Icons.visibility_off,
                      size: 20,
                      color: MyColors.yellow,
                    ),
                  ),
                );
              }),

        ],
      ),
    );
  }
}
