part of 'add_cart_widgets_imports.dart';

class BuildAddCartInputs extends StatelessWidget {
  const BuildAddCartInputs({Key? key, required this.data}) : super(key: key);
  final AddCartData data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: data.formKey1,
        child: Column(
          children: [
            Row(
              children: [
                MyText(title: tr(context, "cartName"), color: MyColors.black, size: 14.sp,fontWeight: FontWeight.bold,),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: GenericTextField(
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16),
                    controller: data.nameController,
                    fieldTypes: FieldTypes.normal,
                    type: TextInputType.text,
                    action: TextInputAction.next,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Enter cart name';
                      }
                    },
                    hint: tr(context, "addCartName"),
                    margin: const EdgeInsets.only(top: 0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                MyText(title: tr(context, "address"), color: MyColors.black, size: 14.sp,fontWeight: FontWeight.bold,),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: GenericTextField(
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16),
                    controller: data.addressController,
                    fieldTypes: FieldTypes.normal,
                    type: TextInputType.text,
                    action: TextInputAction.next,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Enter the address';
                      }
                    },
                    label: tr(context, "addCartAddress"),
                    margin: const EdgeInsets.only(top: 0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                MyText(title: tr(context, "dateCreated"), color: MyColors.black, size: 14.sp,fontWeight: FontWeight.bold,),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: GenericTextField(
                    onTab: () => data.onSelectCreateDate(
                      context,
                    ),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16),
                    controller: data.dateCreatedController,
                    fieldTypes: FieldTypes.clickable,
                    type: TextInputType.text,
                    action: TextInputAction.next,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Enter the address';
                      }
                    },
                    label: tr(context, "dateCreated"),
                    margin: const EdgeInsets.only(top: 0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            BuildCartDate(data: data,),
            SizedBox(
              height: 20.h,
            ),
            BuildCartType(addCartData: data,),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                  child: GenericTextField(
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16),
                    controller: data.numberController,
                    fieldTypes: FieldTypes.normal,
                    type: TextInputType.number,
                    action: TextInputAction.next,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Enter the number';
                      }
                    },
                    label: tr(context, "number"),
                    margin: const EdgeInsets.only(top: 0),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: GenericTextField(
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16),
                    controller: data.amountController,
                    fieldTypes: FieldTypes.normal,
                    type: TextInputType.number,
                    action: TextInputAction.next,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Enter the amount';
                      }
                    },
                    label: tr(context, "amount"),
                    margin: const EdgeInsets.only(top: 0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                  child: GenericTextField(
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16),
                    controller: data.brandController,
                    fieldTypes: FieldTypes.normal,
                    type: TextInputType.text,
                    action: TextInputAction.next,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Enter brand name';
                      }
                    },
                    label: tr(context, "brand"),
                    margin: const EdgeInsets.only(top: 0),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: GenericTextField(
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16),
                    controller: data.typeController,
                    fieldTypes: FieldTypes.normal,
                    type: TextInputType.text,
                    action: TextInputAction.next,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Enter the type';
                      }
                    },
                    label: tr(context, "type"),
                    margin: const EdgeInsets.only(top: 0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                MyText(title: tr(context, "estimatedValue"), color: MyColors.black, size: 14.sp,fontWeight: FontWeight.bold,),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: GenericTextField(
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16),
                    controller: data.estimatedValueController,
                    fieldTypes: FieldTypes.normal,
                    type: TextInputType.number,
                    action: TextInputAction.next,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Enter the Estimated Value';
                      }
                    },
                    label: tr(context, "estimatedValue"),
                    margin: const EdgeInsets.only(top: 0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                MyText(title: tr(context, "total"), color: MyColors.black, size: 14.sp,fontWeight: FontWeight.bold,),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: GenericTextField(
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16),
                    controller: data.totalController,
                    fieldTypes: FieldTypes.normal,
                    type: TextInputType.number,
                    action: TextInputAction.next,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Enter the total';
                      }
                    },
                    label: tr(context, "total"),
                    margin: const EdgeInsets.only(top: 0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                MyText(title: tr(context, "addNote"), color: MyColors.black, size: 14.sp,fontWeight: FontWeight.bold,),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: GenericTextField(
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16),
                    controller: data.descriptionController,
                    fieldTypes: FieldTypes.normal,
                    type: TextInputType.number,
                    action: TextInputAction.next,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Enter the description';
                      }
                    },
                    label: tr(context, "notes"),
                    margin: const EdgeInsets.only(top: 0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
