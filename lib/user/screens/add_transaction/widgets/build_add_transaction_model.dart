part of 'add_transaction_widgets_imports.dart';

class BuildAddTransactionModel extends StatelessWidget {
  const BuildAddTransactionModel({Key? key, required this.data, required this.type})
      : super(key: key);
  final AddTransactionData data;
  final String type;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(15.0.r),
      child: SingleChildScrollView(
        child: Column(
          children: [
            MyText(title: tr(context, "addTransaction"), color: MyColors.primary , size: 14.sp,fontWeight: FontWeight.bold,),
            SizedBox(
              height: 20.h,
            ),
            Column(
              children: [
                GenericTextField(
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  controller: data.nameController,
                  fieldTypes: FieldTypes.normal,
                  type: TextInputType.text,
                  action: TextInputAction.next,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Enter the transaction type name';
                    }
                  },
                  label: "نوع المعاملة",
                  margin: const EdgeInsets.symmetric(vertical: 10),
                ),
                // GenericTextField(
                //   contentPadding:
                //   const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                //   controller: data.contentController,
                //   fieldTypes: FieldTypes.normal,
                //   type: TextInputType.text,
                //   action: TextInputAction.next,
                //   validate: (value) {
                //     if (value!.isEmpty) {
                //       return 'Enter the transaction type name';
                //     }
                //   },
                //   label: "محتوي المعاملة",
                //   margin: const EdgeInsets.symmetric(vertical: 10),
                // ),
              ],
            ),
            DefaultButton(
              onTap: () {
                // var box = Hive.box(ApiNames.kTransactionTypes);
                // box.put("name", "Mohamed");
                if(type == "الالتزامات"||type=="التسوق والشراء"){data.addTransactionType(
                  TransactionTypeModel(
                      name: data.nameController.text,
                      content: [
                        // TransactionContentModel(
                        //     name: data.contentController.text
                        // )
                      ]
                  ),
                  type
                );}else if(type == "الاهداف المالية المستهدفة"){
                  data.addTarget(
                    DropdownModel(
                      name: data.nameController.text,
                    ),
                  );
                }else if (type == "المعاملات النقدية"){
                  data.addCashTransaction(
                    DropdownModel(
                      name: data.nameController.text,
                    ),
                  );
                }
                AutoRouter.of(context).pop();
                data.nameController.clear();
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
