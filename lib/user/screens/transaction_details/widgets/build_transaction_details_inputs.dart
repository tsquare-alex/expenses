part of 'transaction_details_widgets_imports.dart';

class BuildTransactionDetailsInputs extends StatelessWidget {
  const BuildTransactionDetailsInputs({Key? key, required this.data, required this.model}) : super(key: key);
  final TransactionDetailsData data;
  final AddTransactionModel model;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: data.formKey,
      child: Column(
        children: [
          GenericTextField(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            controller: data.amountController,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.number,
            action: TextInputAction.next,
            validate: (value) {
              return null;
            },
            label: "الكمية",
            margin: const EdgeInsets.only(top: 0),
          ),
        ],
      ),
    );
  }
}
