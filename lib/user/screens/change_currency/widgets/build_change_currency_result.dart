part of 'change_currency_widgets_imports.dart';

class BuildChangeCurrencyResult extends StatelessWidget {
  const BuildChangeCurrencyResult({Key? key, required this.data}) : super(key: key);
  final ChangeCurrencyData data;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<double>, GenericState<double>>(
      bloc: data.currencyCubit,
      builder: (context, state) {
        return MyText(
          title: "${tr(context, "result")} ${state.data.toStringAsFixed(2)}",
          color: MyColors.primary,
          size: 16.sp,
          fontWeight: FontWeight.bold,
        );
      },
    );
  }
}
