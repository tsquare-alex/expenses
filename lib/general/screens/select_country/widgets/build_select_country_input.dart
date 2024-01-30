part of 'select_country_widgets_imports.dart';

class BuildSelectCountryInput extends StatelessWidget {
  const BuildSelectCountryInput({Key? key, required this.selectCountryData})
      : super(key: key);
  final SelectCountryData selectCountryData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<Country>, GenericState<Country>>(
      bloc: selectCountryData.countryCubit,
      builder: (context, state) {
        selectCountryData.countryController.text = selectCountryData.countryCubit.state.data.nameLocalized??"";
        return Form(
          key: selectCountryData.formKey,
          child: GenericTextField(
            onTab: () {
              showCountryPicker(
                context: context,
                showPhoneCode: false,
                onSelect: (Country country) {
                  selectCountryData.countryCubit.onUpdateData(country);
                  print('Selected country: ${selectCountryData.countryCubit.state
                      .data.name}');
                },
              );
            },
            contentPadding: EdgeInsets.symmetric(horizontal: 16.r),
            suffixIcon: Icon(Icons.keyboard_arrow_down_outlined,color: MyColors.grey,size: 18.w,),
            controller: selectCountryData.countryController,
            fieldTypes: FieldTypes.clickable,
            type: TextInputType.text,
            action: TextInputAction.next,
            validate: (value) {
              if (value!.isEmpty) {
                return 'Select country';
              }
            },
            label: tr(context, "selectCountry"),
            margin: EdgeInsets.symmetric(vertical: 30.r),
          ),
        );
      },
    );
  }
}
