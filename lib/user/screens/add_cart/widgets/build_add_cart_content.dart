part of 'add_cart_widgets_imports.dart';

class BuildAddCartContent extends StatelessWidget {
  const BuildAddCartContent({Key? key, required this.data, required this.typeModel}) : super(key: key);
  final AddCartData data;
  final CartTypeModel typeModel;
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
                  controller: data.contentController,
                  fieldTypes: FieldTypes.normal,
                  type: TextInputType.text,
                  hintColor: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
                  textColor: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
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

                data.addTransactionContent(
                      CartContentModel(
                        name: data.contentController.text,
                        image: Res.shopping,
                      ),
                    context,typeModel
                  );
                AutoRouter.of(context).pop();
                data.getCartTypeContent(context);
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
