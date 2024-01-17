part of 'add_transaction_widgets_imports.dart';

class BuildAddTransactionContent extends StatelessWidget {
  const BuildAddTransactionContent({
    Key? key,
    required this.data,
    required this.type, required this.typeModel,
  }) : super(key: key);
  final AddTransactionData data;
  final String type;
  final TransactionTypeModel typeModel;
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
              onTap: () async {

                if(type == "الالتزامات"||type == "التسوق والشراء"){
                  data.addTransactionContent(
                    TransactionContentModel(
                      name: data.newContentController.text,
                      image: Res.transaction,
                    ),
                    type,
                    typeModel
                  );
                }
                await AutoRouter.of(context).pop();
                data.newContentController.clear();
                data.getContents(typeModel, type);
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
