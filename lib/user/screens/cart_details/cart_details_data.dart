part of 'cart_details_imports.dart';

class CartDetailsData{

  final GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController typeController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dateCreatedController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController estimatedValueController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


  void onSelectTime(
      BuildContext context,
      ) {
    FocusScope.of(context).requestFocus(FocusNode());
    AdaptivePicker.timePicker(
        context: context,
        onConfirm: (date) {
          timeController.text = DateFormat("hh:mm aa", "en").format(date!);
        },
        title: '');
  }

  void onSelectDate(
      BuildContext context,
      ) {
    FocusScope.of(context).requestFocus(FocusNode());
    AdaptivePicker.datePicker(
        context: context,
        minDate: DateTime.now().subtract(Duration(days:30)),
        onConfirm: (date) {
          dateController.text = DateFormat("dd/MM/yyyy", "en").format(date!);
        },
        title: '');
  }

  void onSelectCreateDate(
      BuildContext context,
      ) {
    FocusScope.of(context).requestFocus(FocusNode());
    AdaptivePicker.datePicker(
        context: context,
        minDate: DateTime.now().subtract(Duration(days:30)),
        onConfirm: (date) {
          dateCreatedController.text = DateFormat("dd/MM/yyyy", "en").format(date!);
        },
        title: '');
  }
}