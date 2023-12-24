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
          DropdownTextField<DropdownModel>(
            dropKey: currencyData.currencyDropKey,
            label: tr(context, "currency"),
            selectedItem: currencyData.selectedCurrency,
            margin: const EdgeInsets.symmetric(vertical: 5),
            validate: (value) {
              if(value==null){
                return "Please fill this field";
              }
            },
            onChange: currencyData.setSelectCurrency,
            finData: (data) => currencyData.getCurrencies(context),
            useName: true,
            buttonsColor: MyColors.primary,
            searchHint: tr(context, "search"),
          ),
          SizedBox(
            height: 15.h,
          ),
          DropdownTextField<DropdownModel>(
            dropKey: currencyData.subCurrencyDropKey,
            label: tr(context, "subCurrency"),
            selectedItem: currencyData.selectedSubCurrency,
            margin: const EdgeInsets.symmetric(vertical: 5),
            validate: (value) {
              if(value==null){
                return "Please fill this field";
              }
            },
            onChange: currencyData.setSelectSubCurrency,
            finData: (data) => currencyData.getSubCurrencies(context),
            useName: true,
            buttonsColor: MyColors.primary,
            searchHint: tr(context, "search"),
          ),
          SizedBox(
            height: 10.h,
          ),
          GenericTextField(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
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
            margin: const EdgeInsets.only(top: 20),
          ),
        ],
      ),
    );
  }
}
