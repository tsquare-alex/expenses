part of 'select_currency_widgets_imports.dart';

class BuildSelectCurrencyInput extends StatelessWidget {
  const BuildSelectCurrencyInput({Key? key, required this.currencyData}) : super(key: key);
  final SelectCurrencyData currencyData;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: currencyData.formKey,
      child: Column(
        children: [
          BlocBuilder<GenericBloc<Currency>,GenericState<Currency>>(
            bloc: currencyData.currencyCubit,
            builder: (context,state){
              currencyData.mainCurrencyController.text = currencyData.currencyCubit.state.data.name;
              return GenericTextField(
                onTab: () {
                  showCurrencyPicker(
                    context: context,
                    showFlag: true,
                    showSearchField: true,
                    showCurrencyName: true,
                    showCurrencyCode: true,
                    favorite: ['EGP','USD','SAR'],
                    onSelect: (Currency currency) {
                      currencyData.currencyCubit.onUpdateData(currency);
                      print('Select currency: ${currency.name}');
                    },
                  );
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 16.r),
                suffixIcon: Icon(Icons.keyboard_arrow_down_outlined,color: MyColors.grey,size: 18.w,),
                controller: currencyData.mainCurrencyController,
                fieldTypes: FieldTypes.clickable,
                type: TextInputType.text,
                action: TextInputAction.next,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Select country';
                  }
                },
                label: tr(context, "selectCountry"),
                margin: EdgeInsets.symmetric(vertical: 10.r),
              );
            },
          ),
          BlocBuilder<GenericBloc<Currency>,GenericState<Currency>>(
            bloc: currencyData.subCurrencyCubit,
            builder: (context,state){
              currencyData.subCurrencyController.text = currencyData.subCurrencyCubit.state.data.name;
              return GenericTextField(
                onTab: () {
                  showCurrencyPicker(
                    context: context,
                    showFlag: true,
                    showSearchField: true,
                    showCurrencyName: true,
                    showCurrencyCode: true,
                    favorite: ['EGP','USD','SAR'],
                    onSelect: (Currency currency) {
                      currencyData.subCurrencyCubit.onUpdateData(currency);
                      print('Select currency: ${currency.name}');
                    },
                  );
                },
                suffixIcon: Icon(Icons.keyboard_arrow_down_outlined,color: MyColors.grey,size: 18.w,),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.r),
                controller: currencyData.subCurrencyController,
                fieldTypes: FieldTypes.clickable,
                type: TextInputType.text,
                action: TextInputAction.next,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Select country';
                  }
                },
                label: tr(context, "selectCountry"),
                margin: EdgeInsets.symmetric(vertical: 10.r),
              );
            },
          ),
          GenericTextField(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.r),
            controller: currencyData.valueController,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.number,
            action: TextInputAction.next,
            validate: (value) {
              if(value!.isEmpty){
                return 'Enter the transfer value';
              }
            },
            label: tr(context, "transferValue"),
            margin: EdgeInsets.symmetric(vertical: 10.r),
          ),
        ],
      ),
    );
  }
}
