part of 'change_currency_widgets_imports.dart';

class BuildChangeCurrencyInputs extends StatelessWidget {
  const BuildChangeCurrencyInputs({Key? key, required this.changeCurrencyData})
      : super(key: key);
  final ChangeCurrencyData changeCurrencyData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.r),
      child: Column(
        children: [
          Row(
            children: [
              MyText(
                  title: tr(context, "from"),
                  color: MyColors.txtColor,
                  size: 14.sp),
              Expanded(
                child: DropdownTextField<DropdownModel>(
                  dropKey: changeCurrencyData.fromCurrencyDropKey,
                  label: tr(context, "currency"),
                  selectedItem: changeCurrencyData.selectedCurrency,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  validate: (value) {
                    if (value == null) {
                      print("Please fill this field");
                    }
                  },
                  onChange: changeCurrencyData.setSelectCurrency,
                  finData: (data) => changeCurrencyData.getCurrencies(context),
                  useName: true,
                  buttonsColor: MyColors.primary,
                  searchHint: tr(context, "search"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              MyText(
                  title: tr(context, "to"),
                  color: MyColors.txtColor,
                  size: 14.sp),
              Expanded(
                child: DropdownTextField<DropdownModel>(
                  dropKey: changeCurrencyData.toCurrencyDropKey,
                  label: tr(context, "subCurrency"),
                  hintColor: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
                  selectedItem: changeCurrencyData.selectedCurrency,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  validate: (value) {
                    if (value == null) {
                      print("Please fill this field");
                    }
                  },
                  onChange: changeCurrencyData.setSelectCurrency,
                  finData: (data) => changeCurrencyData.getCurrencies(context),
                  useName: true,
                  buttonsColor: MyColors.primary,
                  searchHint: tr(context, "search"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                  title: tr(context, "value"),
                  color: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
                  size: 14.sp),
              SizedBox(
                width: 120.w,
                child: GenericTextField(
                  hintColor: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
                  textColor: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  controller: changeCurrencyData.valueController,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                  title: tr(context, "transferValue"),
                  color: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
                  size: 14.sp),
              SizedBox(
                width: 120.w,
                child: GenericTextField(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  controller: changeCurrencyData.amountController,
                  fieldTypes: FieldTypes.normal,
                  type: TextInputType.number,
                  action: TextInputAction.next,
                  validate: (value) {
                    return null;
                  },
                  hint: "",
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  hintColor: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
                  textColor: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
