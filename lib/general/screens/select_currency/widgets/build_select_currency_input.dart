part of 'select_currency_widgets_imports.dart';

class BuildSelectCurrencyInput extends StatelessWidget {
  const BuildSelectCurrencyInput({Key? key, required this.currencyData})
      : super(key: key);
  final SelectCurrencyData currencyData;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: currencyData.formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0.r),
            child: InkWell(
              onTap: (){
                showCurrencyPicker(
                  context: context,
                  showFlag: true,
                  showSearchField: true,
                  showCurrencyName: true,
                  showCurrencyCode: true,
                  favorite: ['EGP', 'USD', 'SAR'],
                  onSelect: (Currency currency) {
                    currencyData.currencyCubit.onUpdateData(currency);
                    print('Select currency: ${currency.name}');
                  },
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                //margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 7),
                decoration: BoxDecoration(
                    color: MyColors.backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: MyColors.shadow, spreadRadius: 0, blurRadius: 12)
                    ]),
                child: BlocBuilder<GenericBloc<Currency>, GenericState<Currency>>(
                  bloc: currencyData.currencyCubit,
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          title: state.data.name ?? tr(context, "transaction"),
                          color: MyColors.black,
                          size: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: MyColors.grey,
                          size: 18.w,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0.r),
            child: InkWell(
              onTap: (){
                showCurrencyPicker(
                  context: context,
                  showFlag: true,
                  showSearchField: true,
                  showCurrencyName: true,
                  showCurrencyCode: true,
                  favorite: ['EGP', 'USD', 'SAR'],
                  onSelect: (Currency currency) {
                    currencyData.subCurrencyCubit.onUpdateData(currency);
                    print('Select currency: ${currency.name}');
                  },
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                //margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 7),
                decoration: BoxDecoration(
                    color: MyColors.backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: MyColors.shadow, spreadRadius: 0, blurRadius: 12)
                    ]),
                child: BlocBuilder<GenericBloc<Currency>, GenericState<Currency>>(
                  bloc: currencyData.subCurrencyCubit,
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          title: state.data.name ?? tr(context, "transaction"),
                          color: MyColors.black,
                          size: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: MyColors.grey,
                          size: 18.w,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),

          GenericTextField(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.r),
            controller: currencyData.valueController,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.number,
            action: TextInputAction.next,
            validate: (value) {
              if (value!.isEmpty) {
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
