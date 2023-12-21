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
                      : model.transactionName == "التسوق والشراء"
                          ? "جهة التسوق والشراء"
                          : "المعاملة",
                  margin: EdgeInsets.symmetric(vertical: 10.r),
                ),
              ),
            ],
          ),
          if (model.transactionName == "الالتزامات" ||
              model.transactionName == "التسوق والشراء")
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
                    controller:
                        transactionDetailsData.transactionContentController,
                    fieldTypes: FieldTypes.readonly,
                    type: TextInputType.text,
                    action: TextInputAction.next,
                    validate: (value) {
                      return null;
                    },
                    label: "المحتوي",
                    margin: EdgeInsets.symmetric(vertical: 10.r),
                  ),
                ),
              ],
            ),
          if (model.transactionName == "الالتزامات" ||
              model.transactionName == "التسوق والشراء")
            Row(
              children: [
                MyText(
                  title: "تحديد الوحدة",
                  color: MyColors.black,
                  size: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  width: 10.h,
                ),
                Expanded(
                  child: DropdownTextField<DropdownModel>(
                    dropKey: transactionDetailsData.unitsDropKey,
                    label: "الوحدة",
                    selectedItem:
                        transactionDetailsData.selectedUnit ?? model.unit,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    validate: (value) {
                      return null;
                    },
                    onChange: transactionDetailsData.setSelectUnit,
                    finData: (data) => transactionDetailsData.getUnits(
                      context,
                    ),
                    useName: true,
                    buttonsColor: MyColors.primary,
                    searchHint: "بحث",
                  ),
                )
              ],
            ),
          if (model.transactionName == "الالتزامات"||model.transactionName=="التسوق والشراء")GenericTextField(
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
          GenericTextField(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            controller: transactionDetailsData.walletController,
            fieldTypes: FieldTypes.readonly,
            type: TextInputType.text,
            action: TextInputAction.next,
            validate: (value) {
              return null;
            },
            label: "المحفظة",
            margin: EdgeInsets.symmetric(vertical: 10.r),
          ),
          if (model.transactionName != "الاهداف المالية المستهدفة")
            GenericTextField(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              controller: transactionDetailsData.partyController,
              fieldTypes: FieldTypes.readonly,
              type: TextInputType.text,
              action: TextInputAction.next,
              validate: (value) {
                return null;
              },
              label: "الجهة",
              margin: EdgeInsets.symmetric(vertical: 10.r),
            ),
          if (model.transactionName == "التسوق والشراء")
            GenericTextField(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              controller: transactionDetailsData.brandNameController,
              fieldTypes: FieldTypes.normal,
              type: TextInputType.text,
              action: TextInputAction.next,
              validate: (value) {
                return null;
              },
              label: "اسم البراند",
              margin: EdgeInsets.symmetric(vertical: 10.r),
            ),
          if (model.image!=null)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0.r),
              child: Image.memory(
                model.image!,
                height: 180,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          if (model.transactionName != "الاهداف المالية المستهدفة")
            Row(
              children: [
                MyText(
                  title: "نسبة الاولوية",
                  color: MyColors.black,
                  size: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  width: 10.h,
                ),
                Expanded(
                  child: DropdownTextField<DropdownModel>(
                    dropKey: transactionDetailsData.priorityDropKey,
                    label: "الاولوية",
                    selectedItem: transactionDetailsData.selectedPriority ??
                        model.priority,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    validate: (value) {
                      if (value == null) {
                        print("Please fill this field");
                        return ("Please fill this field");
                      }
                    },
                    onChange: transactionDetailsData.setSelectPriority,
                    finData: (data) => transactionDetailsData.getPriority(
                      context,
                    ),
                    useName: true,
                    buttonsColor: MyColors.primary,
                    searchHint: "بحث",
                  ),
                )
              ],
            ),
          Row(
            children: [
              //Icon(Icons.date_range,color: MyColors.primary,),
              Column(
                children: [
                  Icon(
                    Icons.date_range,
                    color: MyColors.primary,
                  ),
                  MyText(
                    title: "ميعاد المعاملة",
                    color: MyColors.black,
                    size: 9.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: GenericTextField(
                  onTab: () => transactionDetailsData.onSelectDate(
                    context,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
                  radius: 10.r,
                  fieldTypes: FieldTypes.clickable,
                  type: TextInputType.text,
                  action: TextInputAction.next,
                  label: "التاريخ",
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Enter transaction date';
                    }
                  },
                  controller: transactionDetailsData.transactionDateController,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              SizedBox(
                width: 90.w,
                child: GenericTextField(
                  onTab: () => transactionDetailsData.onSelectTime(
                    context,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  radius: 10.r,
                  fieldTypes: FieldTypes.clickable,
                  type: TextInputType.text,
                  action: TextInputAction.next,
                  label: "الوقت",
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Enter the time';
                    }
                  },
                  controller: transactionDetailsData.timeController,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                ),
              ),
            ],
          ),
          if (model.transactionName == "الاهداف المالية المستهدفة")
            Column(
              children: [
                GenericTextField(
                  onTab: () => transactionDetailsData.onSelectStartDate(
                    context,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
                  radius: 10.r,
                  fieldTypes: FieldTypes.clickable,
                  type: TextInputType.text,
                  action: TextInputAction.next,
                  label: "تاريخ البداية",
                  prefixIcon: Icon(
                    Icons.date_range,
                    color: MyColors.primary,
                  ),
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Enter the start date';
                    }
                  },
                  controller: transactionDetailsData.startDateController,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                ),
                GenericTextField(
                  onTab: () {
                    if (transactionDetailsData
                        .startDateController.text.isNotEmpty) {
                      transactionDetailsData.onSelectEndDate(
                        context,
                      );
                    } else {
                      CustomToast.showSimpleToast(
                        msg: "حدد بداية المدة أولا",
                        color: Colors.red,
                      );
                    }
                  },
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
                  radius: 10.r,
                  fieldTypes: FieldTypes.clickable,
                  type: TextInputType.text,
                  action: TextInputAction.next,
                  label: "تاريخ النهاية",
                  prefixIcon: Icon(
                    Icons.date_range,
                    color: MyColors.primary,
                  ),
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Enter the end date';
                    }
                  },
                  controller: transactionDetailsData.endDateController,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                ),
              ],
            ),
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: transactionDetailsData.iterateCubit,
            builder: (context, state) {
              if (state.data == false) {
                transactionDetailsData.notifyCubit.onUpdateData(false);
                print(transactionDetailsData.notifyCubit.state.data);
              }
              else{
                transactionDetailsData.notifyCubit.onUpdateData(model.notify!);
                print(transactionDetailsData.notifyCubit.state.data);

              }
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.r),
                    margin: EdgeInsets.symmetric(vertical: 10.r),
                    decoration: BoxDecoration(
                      color: MyColors.backgroundColor,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              MyText(
                                title: "تكرار المعاملة",
                                color: MyColors.black,
                                size: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              if (state.data == true)
                                Expanded(
                                  child: DropdownTextField<DropdownModel>(
                                    dropKey: transactionDetailsData
                                        .iterateTransactionDropKey,
                                    label: "مدة التكرار",
                                    selectedItem: transactionDetailsData.selectedIterateTransaction??model.repeated ,
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    validate: (value) {
                                      if (value == null) {
                                        print("Please fill this field");
                                      }
                                    },
                                    onChange: transactionDetailsData
                                        .setSelectIterateTransaction,
                                    finData: (data) => transactionDetailsData
                                        .getIterateTransaction(context),
                                    useName: true,
                                    buttonsColor: MyColors.primary,
                                    searchHint: "بحث",
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        CupertinoSwitch(
                          trackColor: MyColors.blackOpacity,
                          value: state.data,
                          onChanged: (value) {
                            transactionDetailsData.iterateCubit
                                .onUpdateData(value);
                            },
                        )
                      ],
                    ),
                  ),
                  if (state.data == true)
                    BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                      bloc: transactionDetailsData.notifyCubit,
                      builder: (context, state1) {
                        return Container(
                          padding: EdgeInsets.all(10.r),
                          margin: EdgeInsets.symmetric(vertical: 10.r),
                          decoration: BoxDecoration(
                            color: MyColors.backgroundColor,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    MyText(
                                      title: "التنبيه بالمعاملة",
                                      color: MyColors.black,
                                      size: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    MyText(
                                      title: "(سيتم تذكيرك قبل الموعد)",
                                      color: MyColors.black,
                                      size: 9.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              CupertinoSwitch(
                                trackColor: MyColors.blackOpacity,
                                value: state1.data,
                                onChanged: (value) {
                                  transactionDetailsData.notifyCubit
                                      .onUpdateData(value);
                                  print(state1.data);
                                  print("state1.data");
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
