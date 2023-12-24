part of 'add_transaction_widgets_imports.dart';

class BuildAddTransactionContent extends StatelessWidget {
  const BuildAddTransactionContent({
    Key? key,
    required this.data,
    required this.type,
  }) : super(key: key);
  final AddTransactionData data;
  final String type;
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

                if(type == "الالتزامات"||type == "التسوق والشراء"){
                  data.addTransactionContent(
                    TransactionContentModel(
                      name: data.newContentController.text,
                    ),
                    type,
                  );
                }else if(type == "الاهداف المالية المستهدفة"){
                  data.addTarget(
                    DropdownModel(
                      name: data.newContentController.text,
                    ),
                  );
                }else if (type == "المعاملات النقدية"){
                  data.addCashTransaction(
                    DropdownModel(
                      name: data.newContentController.text,
                    ),
                  );
                }
                AutoRouter.of(context).pop();
                data.newContentController.clear();
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
