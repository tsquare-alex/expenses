part of 'shopping_screen_widgets_imports.dart';

class BuildAddNewShopping extends StatelessWidget {
  const BuildAddNewShopping({Key? key, required this.data}) : super(key: key);
  final ShoppingScreenData data;

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
                  hintColor: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
                  textColor: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
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
              ],
            ),
            DefaultButton(
              onTap: () {
                // var box = Hive.box(ApiNames.kTransactionTypes);
                // box.put("name", "Mohamed");
                data.addTransactionType(
                    TransactionTypeModel(
                        name: data.nameController.text,
                        image: Res.shopping,
                        content: [

                        ]
                    )
                );
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
