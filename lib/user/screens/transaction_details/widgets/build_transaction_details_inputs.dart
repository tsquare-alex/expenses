part of 'transaction_details_widgets_imports.dart';

class BuildTransactionDetailsInputs extends StatelessWidget {
  const BuildTransactionDetailsInputs(
      {Key? key, required this.transactionDetailsData, required this.model})
      : super(key: key);
  final TransactionDetailsData transactionDetailsData;
  final AddTransactionModel model;
  @override
  Widget build(BuildContext context) {
    print(model.transactionContent?.name);
    return Form(
      key: transactionDetailsData.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {
                print(model.transactionType?.content?[0].name);
              },
              icon: Icon(Icons.add)),
          if (model.transactionName == "الالتزامات" ||
              model.transactionName == "التسوق والشراء")
            Column(
              children: [
                MyText(
                  title: model.transactionName == "الالتزامات"
                      ? "الالتزام"
                      : "جهة التسوق والشراء",
                  color: MyColors.black,
                  size: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
                DropdownTextField<TransactionTypeModel>(
                  dropKey: transactionDetailsData.commitmentDropKey,
                  label: "المعاملة",
                  selectedItem: transactionDetailsData.selectedCommitment ??
                      model.transactionType,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  validate: (value) {
                    if (value == null) {
                      print("Please fill this field");
                    }
                  },
                  onChange: transactionDetailsData.setSelectCommitment,
                  finData: (data) =>
                      transactionDetailsData.getCommitments(context),
                  useName: true,
                  buttonsColor: MyColors.primary,
                  searchHint: "بحث",
                ),
                SizedBox(
                  height: 20.h,
                ),
                MyText(
                  title: "اختار محتوي المعاملة",
                  color: MyColors.black,
                  size: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
                DropdownTextField<TransactionContentModel>(
                  dropKey: transactionDetailsData.commitmentContentDropKey,
                  label: "اختر",
                  selectedItem:
                      transactionDetailsData.selectedCommitmentContent ??
                          model.transactionContent,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  validate: (value) {
                    if (value == null) {
                      print("Please fill this field");
                    }
                  },
                  onChange: transactionDetailsData.selectedCommitmentContent,
                  finData: (data) => transactionDetailsData
                      .getCommitmentsContent(context, model.transactionType!),
                  useName: true,
                  buttonsColor: MyColors.primary,
                  searchHint: "بحث",
                ),
              ],
            ),
          GenericTextField(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            controller: transactionDetailsData.amountController,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.number,
            action: TextInputAction.next,
            validate: (value) {
              return null;
            },
            label: "الكمية",
            margin: const EdgeInsets.only(top: 0),
          ),
          GenericTextField(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            controller: transactionDetailsData.totalController,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.number,
            action: TextInputAction.next,
            validate: (value) {
              return null;
            },
            label: "الاجمالي",
            margin: const EdgeInsets.only(top: 0),
          ),
          // DropdownTextField<DatabaseModel>(
          //   dropKey: addTransactionData.transferDropKey,
          //   label: "اختر",
          //   selectedItem: addTransactionData.selectedDatabaseModel,
          //   margin: const EdgeInsets.symmetric(vertical: 5),
          //   validate: (value) {
          //     if (value == null) {
          //       print ("Please fill this field");
          //       return ("Please fill this field");
          //     }
          //   },
          //   onChange: addTransactionData.setSelectDatabaseModel,
          //   finData: (data) => addTransactionData.getDatabaseData(
          //     context,
          //   ),
          //   useName: true,
          //   buttonsColor: MyColors.primary,
          //   searchHint: "بحث",
          // ),
        ],
      ),
    );
  }
}
