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
                title: tr(context, "transaction"),
                color: context.watch<AppThemeCubit>().isDarkMode
                    ? MyColors.white
                    : MyColors.black,
                size: 14.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                width: 67.w,
              ),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.r, vertical: 16.r),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.w, color: MyColors.greyWhite),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: MyText(
                    title: tr(context, model.transactionType!.name!).isNotEmpty
                        ? tr(context, model.transactionType?.name ?? "")
                        : model.transactionType?.name ?? "",
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? MyColors.white
                        : MyColors.black,
                    size: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          if (model.transactionName == "الالتزامات" ||
              model.transactionName == "التسوق والشراء")
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0.r),
              child: Row(
                children: [
                  MyText(
                    title: tr(context, "transactionContent"),
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? MyColors.white
                        : MyColors.black,
                    size: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: 23.w,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.r, vertical: 16.r),
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 1.w, color: MyColors.greyWhite),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: MyText(
                        title: tr(context, model.transactionContent!.name!)
                                .isNotEmpty
                            ? tr(context, model.transactionContent?.name ?? "")
                            : model.transactionContent?.name ?? "",
                        color: context.watch<AppThemeCubit>().isDarkMode
                            ? MyColors.white
                            : MyColors.black,
                        size: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          if (model.transactionName == "التسوق والشراء")
            Row(
              children: [
                MyText(
                  title: tr(context, "selectUnit"),
                  color: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
                  size: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  width: 10.h,
                ),
                Expanded(
                  child: DropdownTextField<DropdownModel>(
                    dropKey: transactionDetailsData.unitsDropKey,
                    label: tr(context, "unit"),
                    selectedItem:
                        transactionDetailsData.selectedUnit ?? model.unit,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    validate: (value) {
                      return null;
                    },
                    onChange: transactionDetailsData.setSelectUnit,
                    hintColor: context.watch<AppThemeCubit>().isDarkMode
                        ? MyColors.white
                        : MyColors.black,
                    finData: (data) => transactionDetailsData.getUnits(
                      context,
                    ),
                    useName: true,
                    hasLocalization: true,
                    buttonsColor: MyColors.primary,
                    searchHint: tr(context, "search"),
                  ),
                )
              ],
            ),
          if (model.transactionName == "التسوق والشراء")
            GenericTextField(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              controller: transactionDetailsData.amountController,
              fieldTypes: FieldTypes.normal,
              type: TextInputType.number,
              action: TextInputAction.next,
              hintColor: context.watch<AppThemeCubit>().isDarkMode
                  ? MyColors.white
                  : MyColors.black,
              textColor: context.watch<AppThemeCubit>().isDarkMode
                  ? MyColors.white
                  : MyColors.black,
              validate: (value) {
                return null;
              },
              label: tr(context, "amount"),
              margin: EdgeInsets.symmetric(vertical: 10.r),
            ),
          GenericTextField(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            controller: transactionDetailsData.totalController,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.number,
            action: TextInputAction.next,
            hintColor: context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.white
                : MyColors.black,
            textColor: context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.white
                : MyColors.black,
            validate: (value) {
              return null;
            },
            label: tr(context, "total"),
            margin: EdgeInsets.symmetric(vertical: 10.r),
          ),
          if (model.transactionName == "الاهداف المالية المستهدفة")
            Column(
              children: [
                GenericTextField(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  controller: transactionDetailsData.initialValueController,
                  fieldTypes: FieldTypes.normal,
                  type: TextInputType.number,
                  action: TextInputAction.next,
                  hintColor: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
                  textColor: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
                  validate: (value) {
                    return null;
                  },
                  label: tr(context, "initialVal"),
                  margin: EdgeInsets.symmetric(vertical: 10.r),
                ),
                GenericTextField(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  controller: transactionDetailsData.requiredValueController,
                  fieldTypes: FieldTypes.normal,
                  type: TextInputType.number,
                  action: TextInputAction.next,
                  hintColor: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
                  textColor: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
                  validate: (value) {
                    return null;
                  },
                  label: tr(context, "requiredVal"),
                  margin: EdgeInsets.symmetric(vertical: 10.r),
                ),
              ],
            ),
          GenericTextField(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            controller: transactionDetailsData.walletController,
            fieldTypes: FieldTypes.readonly,
            type: TextInputType.text,
            action: TextInputAction.next,
            hintColor: context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.white
                : MyColors.black,
            textColor: context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.white
                : MyColors.black,
            validate: (value) {
              return null;
            },
            label: tr(context, "wallet"),
            margin: EdgeInsets.symmetric(vertical: 10.r),
          ),
          if (model.database != null)
            GenericTextField(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              controller: transactionDetailsData.partyController,
              fieldTypes: FieldTypes.readonly,
              type: TextInputType.text,
              action: TextInputAction.next,
              hintColor: context.watch<AppThemeCubit>().isDarkMode
                  ? MyColors.white
                  : MyColors.black,
              textColor: context.watch<AppThemeCubit>().isDarkMode
                  ? MyColors.white
                  : MyColors.black,
              validate: (value) {
                return null;
              },
              label: tr(context, "registry"),
              margin: EdgeInsets.symmetric(vertical: 10.r),
            ),
          GenericTextField(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            controller: transactionDetailsData.descriptionController,
            fieldTypes: FieldTypes.normal,
            type: TextInputType.text,
            action: TextInputAction.next,
            hintColor: context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.white
                : MyColors.black,
            textColor: context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.white
                : MyColors.black,
            validate: (value) {
              return null;
            },
            label: tr(context, "notes"),
            margin: EdgeInsets.symmetric(vertical: 10.r),
          ),
          if (model.transactionName == "التسوق والشراء")
            GenericTextField(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              controller: transactionDetailsData.brandNameController,
              fieldTypes: FieldTypes.normal,
              type: TextInputType.text,
              action: TextInputAction.next,
              hintColor: context.watch<AppThemeCubit>().isDarkMode
                  ? MyColors.white
                  : MyColors.black,
              textColor: context.watch<AppThemeCubit>().isDarkMode
                  ? MyColors.white
                  : MyColors.black,
              validate: (value) {
                return null;
              },
              label: tr(context, "brand"),
              margin: EdgeInsets.symmetric(vertical: 10.r),
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
          if (model.transactionName != "الاهداف المالية المستهدفة")
            Row(
              children: [
                MyText(
                  title: tr(context, "priorityRatio"),
                  color: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
                  size: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  width: 10.h,
                ),
                Expanded(
                  child: DropdownTextField<DropdownModel>(
                    dropKey: transactionDetailsData.priorityDropKey,
                    label: tr(context, "priority"),
                    selectedItem: transactionDetailsData.selectedPriority ??
                        model.priority,
                    hintColor: context.watch<AppThemeCubit>().isDarkMode
                        ? MyColors.white
                        : MyColors.black,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    validate: (value) {
                      if (value == null) {
                        print("Please fill this field");
                        return ("Please fill this field");
                      }else{
                        return null;
                      }
                    },
                    onChange: transactionDetailsData.setSelectPriority,
                    finData: (data) => transactionDetailsData.getPriority(
                      context,
                    ),
                    useName: true,
                    hasLocalization: true,
                    buttonsColor: MyColors.primary,
                    searchHint: tr(context, "search"),
                  ),
                )
              ],
            ),
          if(model.transactionName!="الاهداف المالية المستهدفة")Row(
            children: [
              //Icon(Icons.date_range,color: MyColors.primary,),
              Column(
                children: [
                  Icon(
                    Icons.date_range,
                    color: MyColors.primary,
                  ),
                  MyText(
                    title: tr(context, "transactionDate"),
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
                  onTab: () => transactionDetailsData.onSelectDate(
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
                width: 120.w,
                child: GenericTextField(
                  onTab: () => transactionDetailsData.onSelectTime(
                    context,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  radius: 10.r,
                  fieldTypes: FieldTypes.clickable,
                  type: TextInputType.text,
                  hintColor: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
                  textColor: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
                  action: TextInputAction.next,
                  label: tr(context, "time"),
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
                  // onTab: () => transactionDetailsData.onSelectStartDate(
                  //   context,
                  // ),
                  onTab: (){},
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
                  hintColor: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
                  textColor: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
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
                  controller: transactionDetailsData.endDateController,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                ),
              ],
            ),
          if (model.transactionName == "الاهداف المالية المستهدفة")
            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: transactionDetailsData.iterateCubit,
              builder: (context, state) => Row(
                children: [
                  MyText(
                    title: tr(context, "repeatTransaction"),
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? MyColors.white
                        : MyColors.black,
                    size: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                    child: DropdownTextField<DropdownModel>(
                      dropKey: transactionDetailsData.iterateTransactionDropKey,
                      label: tr(context, "repeatDuration"),
                      selectedItem:
                          transactionDetailsData.selectedIterateTransaction,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      hintColor: context.watch<AppThemeCubit>().isDarkMode
                          ? MyColors.white
                          : MyColors.black,
                      validate: (value) {
                        if (value == null) {
                          return null;
                        }else{
                          return null;
                        }
                      },
                      onChange:
                          transactionDetailsData.setSelectIterateTransaction,
                      finData: (data) =>
                          transactionDetailsData.getIterateTransaction(context),
                      useName: true,
                      hasLocalization: true,
                      buttonsColor: MyColors.primary,
                      searchHint: tr(context, "search"),
                    ),
                  ),
                ],
              ),
            ),
          if (model.transactionName != "الاهداف المالية المستهدفة")
            BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
              bloc: transactionDetailsData.iterateCubit,
              builder: (context, state) {
                if (state.data == false) {
                  transactionDetailsData.notifyCubit.onUpdateData(false);
                  print(transactionDetailsData.notifyCubit.state.data);
                } else {
                  transactionDetailsData.notifyCubit
                      .onUpdateData(model.notify ?? false);
                  print(transactionDetailsData.notifyCubit.state.data);
                }
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.r),
                      margin: EdgeInsets.symmetric(vertical: 10.r),
                      decoration: BoxDecoration(
                        color: context.watch<AppThemeCubit>().isDarkMode
                            ? MyColors.greyWhite
                            : MyColors.backgroundColor,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: MyText(
                                    title: tr(context, "repeatTransaction"),
                                    color: context.watch<AppThemeCubit>().isDarkMode
                                        ? MyColors.white
                                        : MyColors.black,
                                    size: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                if (state.data == true)
                                  Expanded(
                                    child: DropdownTextField<DropdownModel>(
                                      dropKey: transactionDetailsData
                                          .iterateTransactionDropKey,
                                      label: tr(context, "repeatDuration"),
                                      selectedItem: transactionDetailsData
                                              .selectedIterateTransaction ??
                                          model.repeated,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      validate: (value) {
                                        if (value == null) {
                                          print("Please fill this field");
                                        }
                                        return null;
                                      },
                                      hintColor: context.watch<AppThemeCubit>().isDarkMode
                                          ? MyColors.white
                                          : MyColors.black,
                                      onChange: transactionDetailsData
                                          .setSelectIterateTransaction,
                                      finData: (data) => transactionDetailsData
                                          .getIterateTransaction(context),
                                      useName: true,
                                      hasLocalization: true,
                                      buttonsColor: MyColors.primary,
                                      searchHint: tr(context, "search"),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          CupertinoSwitch(
                            activeColor: MyColors.primary,
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
                              color: context.watch<AppThemeCubit>().isDarkMode
                                  ? MyColors.greyWhite
                                  : MyColors.backgroundColor,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      MyText(
                                        title: tr(context, "notify"),
                                        color: context.watch<AppThemeCubit>().isDarkMode
                                            ? MyColors.white
                                            : MyColors.black,
                                        size: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      MyText(
                                        title: "(${tr(context, "remember")})",
                                        color: context.watch<AppThemeCubit>().isDarkMode
                                            ? MyColors.white
                                            : MyColors.black,
                                        size: 11.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                CupertinoSwitch(
                                  activeColor: MyColors.primary,
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
            ),
          if (model.transactionName == "الاهداف المالية المستهدفة")
            Column(
              children: [
                BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                  bloc: transactionDetailsData.notifyCubit,
                  builder: (context, state1) {
                    return Container(
                      padding: EdgeInsets.all(10.r),
                      margin: EdgeInsets.symmetric(vertical: 10.r),
                      decoration: BoxDecoration(
                        color: context.watch<AppThemeCubit>().isDarkMode
                            ? MyColors.greyWhite
                            : MyColors.backgroundColor,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                MyText(
                                  title: tr(context, "notify"),
                                  color: context.watch<AppThemeCubit>().isDarkMode
                                      ? MyColors.white
                                      : MyColors.black,
                                  size: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                MyText(
                                  title: "(${tr(context, "remember")})",
                                  color: context.watch<AppThemeCubit>().isDarkMode
                                      ? MyColors.white
                                      : MyColors.black,
                                  size: 11.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          CupertinoSwitch(
                            activeColor: MyColors.primary,
                            trackColor: MyColors.blackOpacity,
                            value: state1.data,
                            onChanged: (value) {
                              transactionDetailsData.notifyCubit
                                  .onUpdateData(value);
                            },
                          )
                        ],
                      ),
                    );
                  },
                ),
                // BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                //   bloc: transactionDetailsData.remainderCubit,
                //   builder: (context, state1) {
                //     return Container(
                //       padding: EdgeInsets.all(10.r),
                //       margin: EdgeInsets.symmetric(vertical: 10.r),
                //       decoration: BoxDecoration(
                //         color: context.watch<AppThemeCubit>().isDarkMode
                //             ? MyColors.greyWhite
                //             : MyColors.backgroundColor,
                //         borderRadius: BorderRadius.circular(15.r),
                //       ),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Expanded(
                //             child: Row(
                //               children: [
                //                 MyText(
                //                   title: tr(context, "putRemainderInWallet"),
                //                   color: context.watch<AppThemeCubit>().isDarkMode
                //                       ? MyColors.white
                //                       : MyColors.black,
                //                   size: 14.sp,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ],
                //             ),
                //           ),
                //           SizedBox(
                //             width: 5.w,
                //           ),
                //           CupertinoSwitch(
                //             activeColor: MyColors.primary,
                //             trackColor: MyColors.blackOpacity,
                //             value: state1.data,
                //             onChanged: (value) {
                //               transactionDetailsData.remainderCubit
                //                   .onUpdateData(value);
                //             },
                //           )
                //         ],
                //       ),
                //     );
                //   },
                // ),
                // BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
                //   bloc: transactionDetailsData.ratioCubit,
                //   builder: (context, state) {
                //     return Container(
                //       padding: EdgeInsets.all(10.r),
                //       margin: EdgeInsets.symmetric(vertical: 10.r),
                //       decoration: BoxDecoration(
                //         color: context.watch<AppThemeCubit>().isDarkMode
                //             ? MyColors.greyWhite
                //             : MyColors.backgroundColor,
                //         borderRadius: BorderRadius.circular(15.r),
                //       ),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Expanded(
                //             child: Row(
                //               children: [
                //                 MyText(
                //                   title: tr(context, "completedNotify"),
                //                   color: context.watch<AppThemeCubit>().isDarkMode
                //                       ? MyColors.white
                //                       : MyColors.black,
                //                   size: 14.sp,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //                 SizedBox(
                //                   width: 5.w,
                //                 ),
                //                 if (state.data == true)
                //                   Expanded(
                //                     child: DropdownTextField<DropdownModel>(
                //                       dropKey:
                //                           transactionDetailsData.ratioDropKey,
                //                       label: tr(context, "ratio"),
                //                       selectedItem:
                //                           transactionDetailsData.selectedRatio,
                //                       margin: const EdgeInsets.symmetric(
                //                           vertical: 5),
                //                       validate: (value) {
                //                         if (value == null) {
                //                           print("Please fill this field");
                //                         }
                //                       },
                //                       onChange:
                //                           transactionDetailsData.setSelectRatio,
                //                       finData: (data) => transactionDetailsData
                //                           .getRatio(context),
                //                       useName: true,
                //                       buttonsColor: MyColors.primary,
                //                       searchHint: tr(context, "search"),
                //                     ),
                //                   ),
                //               ],
                //             ),
                //           ),
                //           SizedBox(
                //             width: 8.w,
                //           ),
                //           CupertinoSwitch(
                //             activeColor: MyColors.primary,
                //             trackColor: MyColors.blackOpacity,
                //             value: state.data,
                //             onChanged: (value) {
                //               transactionDetailsData.ratioCubit
                //                   .onUpdateData(value);
                //             },
                //           )
                //         ],
                //       ),
                //     );
                //   },
                // ),
              ],
            ),
        ],
      ),
    );
  }
}
