part of 'currency_rate_widgets_imports.dart';

class BuildCurrencyRateInput extends StatelessWidget {
  const BuildCurrencyRateInput({Key? key, required this.currencyRateData}) : super(key: key);
  final CurrencyRateData currencyRateData;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: currencyRateData.formKey,
        child: Column(
          children: [
            Row(
              children: [
                MyText(title: "من: ", color: MyColors.txtColor, size: 14.sp),
                Expanded(
                  child: GenericTextField(
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    controller: currencyRateData.fromCurrencyController,
                    fieldTypes: FieldTypes.readonly,
                    type: TextInputType.text,
                    action: TextInputAction.next,
                    validate: (value) {
                      return null;
                    },
                    hint: "الدولار الامريكي \$",
                    margin: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                MyText(title: "الي: ", color: MyColors.txtColor, size: 14.sp),
                Expanded(
                  child: DropdownTextField<CurrencyModel>(
                    dropKey: currencyRateData.currencyDropKey,
                    label: "العملة",
                    selectedItem: currencyRateData.selectedCurrency,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    validate: (value) {
                      if(value==null){
                        print("Please fill this field");
                      }
                    },
                    onChange: currencyRateData.setSelectCurrency,
                    finData: (data) => currencyRateData.getCurrencies(context),
                    useName: true,
                    buttonsColor: MyColors.yellow,
                    searchHint: "بحث",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                MyText(title: "القيمة: ", color: MyColors.txtColor, size: 14.sp),
                Expanded(
                  child: GenericTextField(
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    controller: currencyRateData.valueController,
                    fieldTypes: FieldTypes.normal,
                    type: TextInputType.number,
                    action: TextInputAction.next,
                    validate: (value) {
                      return null;
                    },
                    hint: "",
                    margin: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }
}
