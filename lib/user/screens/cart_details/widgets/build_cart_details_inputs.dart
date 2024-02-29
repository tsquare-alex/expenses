part of 'cart_details_widgets_imports.dart';

class BuildCartDetailsInputs extends StatelessWidget {
  const BuildCartDetailsInputs({Key? key, required this.data, required this.model}) : super(key: key);
  final CartDetailsData data;
  final AddCartModel model;
  @override
  Widget build(BuildContext context) {
    data.cartTypeController.text = tr(context, model.typeModel!.name!).isNotEmpty?tr(context, model.typeModel!.name!):model.typeModel?.name??"";
    data.contentController.text = tr(context, model.contentModel!.name!).isNotEmpty?tr(context, model.contentModel!.name!):model.contentModel?.name??"";
    return Form(
      key: data.formKey,
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
              MyText(title: tr(context, "cartType"), color: MyColors.black, size: 14.sp,fontWeight: FontWeight.bold,),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: GenericTextField(
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16),
                  controller: data.cartTypeController,
                  fieldTypes: FieldTypes.readonly,
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
              MyText(title: tr(context, "cartContent"), color: MyColors.black, size: 14.sp,fontWeight: FontWeight.bold,),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: GenericTextField(
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16),
                  controller: data.contentController,
                  fieldTypes: FieldTypes.readonly,
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
          Row(
            children: [
              Column(
                children: [
                  Image.asset(Res.dateTime,width: 30.w,height: 30.h,),
                  SizedBox(
                    height: 5.h,
                  ),
                  MyText(
                    title: tr(context, "implementationTime"),
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? MyColors.white
                        : MyColors.black,
                    size: 11.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: GenericTextField(
                  onTab: () => data.onSelectDate(
                    context,
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
                  radius: 10.r,
                  hintColor: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
                  textColor: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
                  fieldTypes: FieldTypes.clickable,
                  type: TextInputType.text,
                  action: TextInputAction.next,
                  label: tr(context, "date"),
                  validate: (value) {
                    if(value!.isEmpty){
                      return 'Enter transaction date';
                    }
                  },
                  controller: data.dateController,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              SizedBox(
                width: 120.w,
                child: GenericTextField(
                  onTab: () => data.onSelectTime(
                    context,
                  ),
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  radius: 10.r,
                  hintColor: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
                  textColor: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
                  fieldTypes: FieldTypes.clickable,
                  type: TextInputType.text,
                  action: TextInputAction.next,
                  label: tr(context, "time"),
                  validate: (value) {
                    if(value!.isEmpty){
                      return 'Enter the time';
                    }
                  },
                  controller: data.timeController,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                ),
              ),
            ],
          ),          // SizedBox(
          //   height: 20.h,
          // ),
          // BuildCartType(addCartData: data,),
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
                  type: TextInputType.text,
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
          SizedBox(
            height: 10.h,
          ),
          if (model.image != null)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0.r),
              child: Image.memory(
                model.image!,
                height: 180,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
        ],
      ),
    );
  }
}
