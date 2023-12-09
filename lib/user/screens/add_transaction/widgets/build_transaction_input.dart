part of 'add_transaction_widgets_imports.dart';

class BuildTransactionInput extends StatelessWidget {
  const BuildTransactionInput({Key? key, required this.transactionData}) : super(key: key);
  final AddTransactionData transactionData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownTextField<DropdownModel>(
          dropKey: transactionData.expenseDropKey,
          label: "المصروفات",
          selectedItem: transactionData.selectedExpense,
          margin: const EdgeInsets.symmetric(vertical: 5),
          validate: (value) {
            if(value==null){
              print("Please fill this field");
            }
          },
          onChange: transactionData.setSelectCountry,
          finData: (data) => transactionData.getExpense(context),
          useName: true,
          buttonsColor: MyColors.primary,
          searchHint: "بحث",
        ),
        SizedBox(
          height: 25.h,
        ),
        DropdownTextField<DropdownModel>(
          dropKey: transactionData.targetsDropKey,
          label: "الأهداف المالية المستهدفة",
          selectedItem: transactionData.selectedTargets,
          margin: const EdgeInsets.symmetric(vertical: 5),
          validate: (value) {
            if(value==null){
              print("Please fill this field");
            }
          },
          onChange: transactionData.setSelectCountry,
          finData: (data) => transactionData.getTargets(context),
          useName: true,
          buttonsColor: MyColors.primary,
          searchHint: "بحث",
        ),
        SizedBox(
          height: 25.h,
        ),
        DropdownTextField<DropdownModel>(
          dropKey: transactionData.transactionsDropKey,
          label: "المعاملات النقدية",
          selectedItem: transactionData.selectedTransactions,
          margin: const EdgeInsets.symmetric(vertical: 5),
          validate: (value) {
            if(value==null){
              print("Please fill this field");
            }
          },
          onChange: transactionData.setSelectCountry,
          finData: (data) => transactionData.getTransactions(context),
          useName: true,
          buttonsColor: MyColors.primary,
          searchHint: "بحث",
        ),
      ],
    );
  }
}
