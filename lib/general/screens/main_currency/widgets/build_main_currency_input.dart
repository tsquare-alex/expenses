part of 'main_currency_widgets_imports.dart';

class BuildMainCurrencyInput extends StatelessWidget {
  const BuildMainCurrencyInput({Key? key, required this.mainCurrencyData}) : super(key: key);
  final MainCurrencyData mainCurrencyData;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: mainCurrencyData.formKey,
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
                    mainCurrencyData.currencyCubit.onUpdateData(currency);
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
                  bloc: mainCurrencyData.currencyCubit,
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
        ],
      ),
    );
  }
}
