part of 'add_cart_widgets_imports.dart';

class BuildAddCartType extends StatelessWidget {
  const BuildAddCartType({Key? key, required this.data, })
      : super(key: key);
  final AddCartData data;

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
                  controller: data.typeController,
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
              ],
            ),
            DefaultButton(
              onTap: () async{
              data.addCartType(
                  CartTypeModel(
                      name: data.typeController.text,
                      content: [

                      ]
                  ),
                );
                await AutoRouter.of(context).pop();
                data.typeController.clear();
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
