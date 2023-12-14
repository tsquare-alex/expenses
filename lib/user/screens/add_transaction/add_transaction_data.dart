part of 'add_transaction_imports.dart';

class AddTransactionData{

  GenericBloc<bool> contentCubit = GenericBloc(false);
  GenericBloc<bool> walletCubit = GenericBloc(false);

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void onSelectTime(
      BuildContext context,) {
    FocusScope.of(context).requestFocus(FocusNode());
    var local = context.read<LangCubit>().state.locale.languageCode;
    AdaptivePicker.timePicker(
        context: context,
        onConfirm: (date) {
          timeController.text = DateFormat("hh:mm aa",local).format(date!);

        },
        title: '');


  }

  void onSelectDate(
      BuildContext context,) {
    FocusScope.of(context).requestFocus(FocusNode());
    var local = context.read<LangCubit>().state.locale.languageCode;
    AdaptivePicker.datePicker(
        context: context,
        onConfirm: (date) {
          dateController.text = DateFormat("dd MMMM yyyy", local).format(date!);
        },
        title: '');

  }
}