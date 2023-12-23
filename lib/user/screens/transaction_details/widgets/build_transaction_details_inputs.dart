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
          if (model.transactionName == "الالتزامات" ||
              model.transactionName == "التسوق والشراء")
          Row(
            children: [
              MyText(
                title: "المعاملة",
                color: MyColors.black,
                size: 12.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                width: 67.w,
              ),
              Expanded(
                child: GenericTextField(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  controller: transactionDetailsData.transactionTypeController,
                  fieldTypes: FieldTypes.readonly,
                  type: TextInputType.text,
                  action: TextInputAction.next,
                  validate: (value) {
                    return null;
                  },
                  label: model.transactionName == "الالتزامات"
    ? "الالتزام"
        : "جهة التسوق والشراء",
                  hint: model.transactionType?.name??"",
                  margin:  EdgeInsets.symmetric(vertical: 10.r),
                ),
              ),
            ],
          ),
          Row(
            children: [
              MyText(
                title: "محتوي المعاملة",
                color: MyColors.black,
                size: 12.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                width: 23.w,
              ),
              Expanded(
                child: GenericTextField(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  controller: transactionDetailsData.transactionContentController,
                  fieldTypes: FieldTypes.readonly,
                  type: TextInputType.text,
                  action: TextInputAction.next,
                  validate: (value) {
                    return null;
                  },
                  hint: model.transactionContent?.name??"",
                  margin:  EdgeInsets.symmetric(vertical: 10.r),
                ),
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
            margin: EdgeInsets.symmetric(vertical: 10.r),
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
            margin: EdgeInsets.symmetric(vertical: 10.r),
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
