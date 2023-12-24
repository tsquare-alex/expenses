part of 'add_transaction_widgets_imports.dart';

class BuildTransactionInputs extends StatelessWidget {
  const BuildTransactionInputs(
      {Key? key, required this.addTransactionData, required this.type})
      : super(key: key);
  final AddTransactionData addTransactionData;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0.r),
      child: Form(
        key: addTransactionData.formKey1,
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: context.watch<AppThemeCubit>().isDarkMode
                      ? AppDarkColors.primary
                      : MyColors.primary,
                  radius: 20.r,
                  child: Image.asset(
                    Res.wallet,
                    width: 20.w,
                    height: 20.w,
                    color: MyColors.white,
                  ),
                ),
                SizedBox(
                  width: 10.h,
                ),
                Expanded(
                  child: DropdownTextField<WalletModel>(
                    dropKey: addTransactionData.walletDropKey,
                    label: tr(context, "selectWallet"),
                    selectedItem: addTransactionData.selectedWalletModel,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    validate: (value) {
                      if (value == null) {
                        return ("Please fill this field");
                        print("Please fill this field");
                      }
                    },
                    onChange: addTransactionData.setSelectWalletModel,
                    finData: (data) => addTransactionData.getWalletData(
                      context,
                    ),
                    useName: true,
                    buttonsColor: MyColors.primary,
                    searchHint:tr(context, "search"),
                  ),
                )
              ],
            ),
            if (type == "الاهداف المالية المستهدفة")
              Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyText(
                        title: tr(context, "targetValue"),
                        color: MyColors.black,
                        size: 12.sp,
                        fontWeight: FontWeight.bold,
                        alien: TextAlign.center,
                      ),
                      SizedBox(
                        width: 85.w,
                      ),
                      Expanded(
                        child: GenericTextField(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          controller: addTransactionData.targetController,
                          fieldTypes: FieldTypes.normal,
                          type: TextInputType.number,
                          action: TextInputAction.next,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Enter the target';
                            }
                          },
                          label: tr(context, "value"),
                          margin: const EdgeInsets.only(top: 0),
                        ),
                      ),
                    ],
                  ),
                  GenericTextField(
                    onTab: () => addTransactionData.onSelectStartDate(
                      context,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
                    radius: 10.r,
                    fieldTypes: FieldTypes.clickable,
                    type: TextInputType.text,
                    action: TextInputAction.next,
                    label: tr(context, "startDate"),
                    prefixIcon: Icon(
                      Icons.date_range,
                      color: MyColors.primary,
                    ),
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Enter the start date';
                      }
                    },
                    controller: addTransactionData.startDateController,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                  ),
                  GenericTextField(
                    onTab: () {
                      if (addTransactionData
                          .startDateController.text.isNotEmpty) {
                        addTransactionData.onSelectEndDate(
                          context,
                        );
                      } else {
                        CustomToast.showSimpleToast(
                          msg: tr(context, "selectStartDate"),
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
                    label: tr(context, "endDate"),
                    prefixIcon: Icon(
                      Icons.date_range,
                      color: MyColors.primary,
                    ),
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Enter the end date';
                      }
                    },
                    controller: addTransactionData.endDateController,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                  ),
                ],
              ),
            if (type == "الالتزامات" || type == "التسوق والشراء")
              Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      MyText(
                        title: tr(context, "selectUnit"),
                        color: MyColors.black,
                        size: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      Expanded(
                        child: DropdownTextField<DropdownModel>(
                          dropKey: addTransactionData.unitsDropKey,
                          label: tr(context, "unit"),
                          selectedItem: addTransactionData.selectedUnit,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          validate: (value) {
                            return null;
                          },
                          onChange: addTransactionData.setSelectUnit,
                          finData: (data) => addTransactionData.getUnits(
                            context,
                          ),
                          useName: true,
                          buttonsColor: MyColors.primary,
                          searchHint:tr(context, "search"),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyText(
                        title: tr(context, "selectAmount"),
                        color: MyColors.black,
                        size: 12.sp,
                        fontWeight: FontWeight.bold,
                        alien: TextAlign.center,
                      ),
                      SizedBox(
                        width: 105.w,
                      ),
                      Expanded(
                        child: GenericTextField(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          controller: addTransactionData.amountController,
                          fieldTypes: FieldTypes.normal,
                          type: TextInputType.number,
                          action: TextInputAction.next,
                          validate: (value) {
                            return null;
                          },
                          label: tr(context, "amount"),
                          margin: const EdgeInsets.only(top: 0),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyText(
                        title: tr(context, "total"),
                        color: MyColors.black,
                        size: 12.sp,
                        fontWeight: FontWeight.bold,
                        alien: TextAlign.center,
                      ),
                      SizedBox(
                        width: 34.w,
                      ),
                      Expanded(
                        child: GenericTextField(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          controller: addTransactionData.totalController,
                          fieldTypes: FieldTypes.normal,
                          type: TextInputType.number,
                          action: TextInputAction.next,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Enter total price';
                            }
                          },
                          label: tr(context, "total"),
                          margin: const EdgeInsets.only(top: 0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            if (type == "المعاملات النقدية")
              Row(
                children: [
                  MyText(
                    title: tr(context, "enterTransferValue"),
                    color: MyColors.black,
                    size: 12.sp,
                    fontWeight: FontWeight.bold,
                    alien: TextAlign.center,
                  ),
                  SizedBox(
                    width: 34.w,
                  ),
                  Expanded(
                    child: GenericTextField(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      controller: addTransactionData.transferController,
                      fieldTypes: FieldTypes.normal,
                      type: TextInputType.number,
                      action: TextInputAction.next,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Enter the transfer value';
                        }
                      },
                      label: tr(context, "transferValue"),
                      margin: EdgeInsets.symmetric(vertical: 10.r),
                    ),
                  ),
                ],
              ),
            if (type == "التسوق والشراء")
              SizedBox(
                height: 10.h,
              ),
            if (type == "التسوق والشراء")
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyText(
                    title: tr(context, "brand"),
                    color: MyColors.black,
                    size: 12.sp,
                    fontWeight: FontWeight.bold,
                    alien: TextAlign.center,
                  ),
                  SizedBox(
                    width: 34.w,
                  ),
                  Expanded(
                    child: GenericTextField(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      controller: addTransactionData.brandController,
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
                ],
              ),
            SizedBox(
              height: 10.h,
            ),
            if (type == "الالتزامات" || type == "التسوق والشراء")
              Row(
                children: [
                  MyText(
                    title: tr(context, "registry"),
                    color: MyColors.black,
                    size: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: 10.h,
                  ),
                  Expanded(
                    child: DropdownTextField<DatabaseModel>(
                      dropKey: addTransactionData.commitmentPartyDropKey,
                      label: tr(context, "registry"),
                      selectedItem: addTransactionData.selectedDatabaseModel,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      validate: (value) {
                        if (value == null) {
                          print("Please fill this field");
                        }
                      },
                      onChange: addTransactionData.setSelectDatabaseModel,
                      finData: (data) => addTransactionData.getDatabaseData(
                        context,
                      ),
                      useName: true,
                      buttonsColor: MyColors.primary,
                      searchHint:tr(context, "search"),
                    ),
                  )
                ],
              ),
            if (type == "المعاملات النقدية")
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    title: tr(context, "transferTo"),
                    color: MyColors.black,
                    size: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: 10.h,
                  ),
                  DropdownTextField<DatabaseModel>(
                    dropKey: addTransactionData.transferDropKey,
                    label: tr(context, "select"),
                    selectedItem: addTransactionData.selectedDatabaseModel,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    validate: (value) {
                      if (value == null) {
                        print("Please fill this field");
                        return ("Please fill this field");
                      }
                    },
                    onChange: addTransactionData.setSelectDatabaseModel,
                    finData: (data) => addTransactionData.getDatabaseData(
                      context,
                    ),
                    useName: true,
                    buttonsColor: MyColors.primary,
                    searchHint:tr(context, "search"),
                  )
                ],
              ),
            if (type != "الاهداف المالية المستهدفة")
              Row(
                children: [
                  MyText(
                    title: tr(context, "priorityRatio"),
                    color: MyColors.black,
                    size: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: 10.h,
                  ),
                  Expanded(
                    child: DropdownTextField<DropdownModel>(
                      dropKey: addTransactionData.priorityDropKey,
                      label: tr(context, "priority"),
                      selectedItem: addTransactionData.selectedPriority,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      validate: (value) {
                        if (value == null) {
                          print("Please fill this field");
                          return ("Please fill this field");
                        }
                      },
                      onChange: addTransactionData.setSelectPriority,
                      finData: (data) => addTransactionData.getPriority(
                        context,
                      ),
                      useName: true,
                      buttonsColor: MyColors.primary,
                      searchHint:tr(context, "search"),
                    ),
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}
