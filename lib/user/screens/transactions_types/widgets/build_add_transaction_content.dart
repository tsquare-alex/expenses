part of 'transactions_types_widgets_imports.dart';

class BuildAddTransactionContent extends StatelessWidget {
  const BuildAddTransactionContent(
      {Key? key, required this.data, required this.index})
      : super(key: key);
  final TransactionsTypesData data;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0.r),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                GenericTextField(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  controller: data.newContentController,
                  fieldTypes: FieldTypes.normal,
                  type: TextInputType.text,
                  action: TextInputAction.next,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Enter the transaction type name';
                    }
                  },
                  label: "محتوي جديد",
                  margin: const EdgeInsets.symmetric(vertical: 10),
                ),
              ],
            ),
            DefaultButton(
              onTap: () {
                // var box = Hive.box(ApiNames.kTransactionTypes);
                // box.put("name", "Mohamed");
                data.addTransactionContent(
                    TransactionContentModel(name: data.newContentController.text),
                    index);
                AutoRouter.of(context).pop();
                data.nameController.clear();
                data.contentController.clear();
              },
              title: "إضافة",
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
