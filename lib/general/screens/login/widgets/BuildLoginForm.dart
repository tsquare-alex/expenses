part of 'login_widgets_imports.dart';

class BuildLoginForm extends StatelessWidget {
  final LoginData loginData;

  const BuildLoginForm({Key? key, required this.loginData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginData.formKey,
      child: Column(
        children: [
          GenericTextField(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            controller: loginData.emailController,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.emailAddress,
            action: TextInputAction.next,
            validate: (value) {
              if(value!.isEmpty){
                return 'Enter your Email';
              }
            },
            label: tr(context, "email"),
            margin: const EdgeInsets.only(top: 20),
          ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: loginData.passwordCubit,
            builder: (context, state) {
              return GenericTextField(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                controller: loginData.passwordController,
                fieldTypes:
                    !state.data ? FieldTypes.password : FieldTypes.normal,
                type: TextInputType.visiblePassword,
                action: TextInputAction.done,
                validate: (value) {
                  if(value!.isEmpty){
                    return 'Enter your Password';
                  }
                },
                label: tr(context, "password"),
                margin: const EdgeInsets.only(top: 20),
                suffixIcon: IconButton(
                  onPressed: () =>
                      loginData.passwordCubit.onUpdateData(!state.data),
                  icon: Icon(
                    !state.data ? Icons.visibility : Icons.visibility_off,
                    size: 20,
                    color: MyColors.grey,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
