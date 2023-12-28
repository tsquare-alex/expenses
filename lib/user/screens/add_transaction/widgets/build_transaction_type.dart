part of 'add_transaction_widgets_imports.dart';

class BuildTransactionType extends StatelessWidget {
  const BuildTransactionType({
    Key? key,
    required this.addTransactionData,
    required this.type,
  }) : super(key: key);
  final AddTransactionData addTransactionData;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OpenContainer(
          closedElevation: 0,
          closedColor: Colors.transparent,
          closedShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          transitionDuration: const Duration(milliseconds: 400),
          openBuilder: (_, closeContainer) => Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: MyColors.primary,
              title: MyText(
                title: tr(context, "transaction"),
                color: MyColors.white,
                size: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if(type == "الالتزامات" || type == "التسوق والشراء"){
                  addTransactionData.addTransactionModel(context, type);

                }else if(type == "المعاملات النقدية" || type == "الاهداف المالية المستهدفة"){
                  addTransactionData.addTransactionModel(context, type);
                }
              },
              backgroundColor: MyColors.primary,
              child: Icon(
                Icons.add,
                color: MyColors.white,
              ),
            ),
            body: type == "الالتزامات" || type == "التسوق والشراء"
                ? Padding(
                    padding: EdgeInsets.all(15.0.r),
                    child: BlocBuilder<GenericBloc<List<TransactionTypeModel>>,
                        GenericState<List<TransactionTypeModel>>>(
                      bloc: type == "الالتزامات"
                          ? addTransactionData.transactionTypeCubit
                          : addTransactionData.shoppingTypeCubit,
                      builder: (context, state) => ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.data.length,
                        itemBuilder: (context, i) => Padding(
                          padding: EdgeInsets.only(bottom: 10.0.r),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 20.r,
                                        backgroundColor: MyColors.primary,
                                        child: Image.asset(
                                          Res.transaction,
                                          width: 18.w,
                                          height: 18.h,
                                          color: MyColors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      MyText(
                                        title: state.data[i].name ?? "",
                                        color: MyColors.black,
                                        size: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () => addTransactionData
                                          .addTransactionContentModel(
                                              context, type, state.data[i]),
                                      icon: Icon(
                                        Icons.add,
                                        color: MyColors.primary,
                                      ))
                                ],
                              ),
                              if (state.data[i].content!.isNotEmpty)
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: state.data[i].content?.length,
                                      itemBuilder: (context, index) => Padding(
                                        padding: EdgeInsets.only(
                                            right: 20.r, bottom: 10.r),
                                        child: InkWell(
                                          onTap: () {
                                            addTransactionData.typeCubit
                                                .onUpdateData(state.data[i]);
                                            addTransactionData.typeContentCubit
                                                .onUpdateData(state
                                                    .data[i].content?[index]);
                                            AutoRouter.of(context).pop();
                                            print(addTransactionData
                                                .typeCubit.state.data?.name);
                                          },
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 15.r,
                                                backgroundColor: MyColors
                                                    .primary
                                                    .withOpacity(0.3),
                                              ),
                                              SizedBox(
                                                width: 15.w,
                                              ),
                                              MyText(
                                                title: state.data[i]
                                                        .content?[index].name ??
                                                    "",
                                                color: MyColors.black,
                                                size: 14.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1.w,
                                      color: MyColors.grey,
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : type == "الاهداف المالية المستهدفة" ||
                        type == "المعاملات النقدية"
                    ? BlocBuilder<GenericBloc<List<DropdownModel>>, GenericState<List<DropdownModel>>>(
              bloc: type == "الاهداف المالية المستهدفة" ?addTransactionData.targetCubit:addTransactionData.cashTransactionCubit,
                        builder: (context, state) => Padding(
                          padding: EdgeInsets.all(15.0.r),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.data.length,
                            itemBuilder: (context, i) => Padding(
                              padding: EdgeInsets.only(bottom: 5.0.r),
                              child: InkWell(
                                onTap: () {
                                  if(type=="المعاملات النقدية"){
                                    addTransactionData.cashTypeCubit
                                        .onUpdateData(state.data[i]);
                                    AutoRouter.of(context).pop();
                                    print(addTransactionData
                                        .cashTypeCubit.state.data?.name);
                                  }else if(type=="الاهداف المالية المستهدفة"){
                                    addTransactionData.targetTypeCubit
                                        .onUpdateData(state.data[i]);
                                    AutoRouter.of(context).pop();
                                    print(addTransactionData
                                        .targetTypeCubit.state.data?.name);
                                  }

                                },
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 20.r,
                                          backgroundColor:
                                              MyColors.primary,
                                          child: Image.asset(Res.transaction,color: MyColors.white,width: 18.w,height: 18.h,),
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        MyText(
                                          title: state.data[i].name ??
                                              "",
                                          color: MyColors.black,
                                          size: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    if(i!=state.data.length-1)Divider(thickness: 1.w,color: MyColors.grey,),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : type == ""
                        ? Container()
                        : Container(),
          ),
          closedBuilder: (_, openContainer) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            //margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
            decoration: BoxDecoration(
                color: MyColors.backgroundColor,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: const [
                  BoxShadow(
                      color: MyColors.shadow, spreadRadius: 0, blurRadius: 12)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20.r,
                      backgroundColor: MyColors.primary,
                      child: Image.asset(
                        Res.transaction,
                        color: MyColors.white,
                        width: 18.w,
                        height: 18.h,
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    if(type=="الالتزامات"||type=="التسوق والشراء")BlocBuilder<GenericBloc<TransactionContentModel?>,
                        GenericState<TransactionContentModel?>>(
                      bloc: addTransactionData.typeContentCubit,
                      builder: (context, state) {
                        return MyText(
                          title: state.data == null
                              ? tr(context, "transaction")
                              : "${state.data?.name}",
                          color: MyColors.black,
                          size: 14.sp,
                          fontWeight: FontWeight.bold,
                        );
                      },
                    ),
                    if(type=="المعاملات النقدية"||type=="الاهداف المالية المستهدفة")BlocBuilder<GenericBloc<DropdownModel?>,
                        GenericState<DropdownModel?>>(
                      bloc: type=="المعاملات النقدية"?addTransactionData.cashTypeCubit:addTransactionData.targetTypeCubit,
                      builder: (context, state) {
                        return MyText(
                          title: state.data == null
                              ? tr(context, "transaction")
                              : "${state.data?.name}",
                          color: MyColors.black,
                          size: 14.sp,
                          fontWeight: FontWeight.bold,
                        );
                      },
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_drop_down,
                  size: 30.w,
                  color: MyColors.grey,
                ),
              ],
            ),
          ),
        ),
        // Form(
        //   key: addTransactionData.formKey,
        //   child: Column(
        //     children: [
        //       if (type == "الالتزامات" || type == "التسوق والشراء")
        //         BlocBuilder<GenericBloc<List<TransactionTypeModel>>,
        //             GenericState<List<TransactionTypeModel>>>(
        //           bloc: type == "الالتزامات"
        //               ? addTransactionData.transactionTypeCubit
        //               : addTransactionData.shoppingTypeCubit,
        //           builder: (context, state) {
        //             return Column(
        //               children: [
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: [
        //                     MyText(
        //                       title: type == "الالتزامات"
        //                           ? tr(context, "selectCommitment")
        //                           : tr(context, "selectShopping"),
        //                       color: MyColors.black,
        //                       size: 12.sp,
        //                       fontWeight: FontWeight.bold,
        //                     ),
        //                     IconButton(
        //                         onPressed: () => addTransactionData
        //                             .addTransactionModel(context, type),
        //                         icon: Icon(Icons.add))
        //                   ],
        //                 ),
        //                 DropdownTextField<TransactionTypeModel>(
        //                   dropKey: addTransactionData.commitmentDropKey,
        //                   label: tr(context, "transaction"),
        //                   selectedItem: addTransactionData.selectedCommitment,
        //                   margin: const EdgeInsets.symmetric(vertical: 5),
        //                   validate: (value) {
        //                     if (value == null) {
        //                       print("Please fill this field");
        //                     }
        //                   },
        //                   onChange: addTransactionData.setSelectCommitment,
        //                   finData: (data) => addTransactionData.getCommitments(
        //                       context, state.data),
        //                   useName: true,
        //                   buttonsColor: MyColors.primary,
        //                   searchHint: tr(context, "search"),
        //                 ),
        //                 SizedBox(
        //                   height: 20.h,
        //                 ),
        //                 Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                   children: [
        //                     MyText(
        //                       title: tr(context, "selectTransferContent"),
        //                       color: MyColors.black,
        //                       size: 12.sp,
        //                       fontWeight: FontWeight.bold,
        //                     ),
        //                     IconButton(
        //                         onPressed: () => addTransactionData
        //                             .addTransactionContentModel(context, type),
        //                         icon: Icon(Icons.add))
        //                   ],
        //                 ),
        //                 DropdownTextField<TransactionContentModel>(
        //                   dropKey: addTransactionData.commitmentContentDropKey,
        //                   label: tr(context, "select"),
        //                   selectedItem:
        //                       addTransactionData.selectedCommitmentContent,
        //                   margin: const EdgeInsets.symmetric(vertical: 5),
        //                   validate: (value) {
        //                     if (value == null) {
        //                       print("Please fill this field");
        //                     }
        //                   },
        //                   onChange: addTransactionData.setSelectCommitmentContent,
        //                   finData: (data) =>
        //                       addTransactionData.getCommitmentsContent(
        //                     context,
        //                   ),
        //                   useName: true,
        //                   buttonsColor: MyColors.primary,
        //                   searchHint: tr(context, "search"),
        //                 ),
        //               ],
        //             );
        //           },
        //         ),
        //       if (type == "الاهداف المالية المستهدفة")
        //         Column(
        //           children: [
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 MyText(
        //                   title: tr(context, "selectTargetName"),
        //                   color: MyColors.black,
        //                   size: 12.sp,
        //                   fontWeight: FontWeight.bold,
        //                 ),
        //                 IconButton(
        //                     onPressed: () => addTransactionData
        //                         .addTransactionContentModel(context, type),
        //                     icon: Icon(Icons.add))
        //               ],
        //             ),
        //             DropdownTextField<DropdownModel>(
        //               dropKey: addTransactionData.targetDropKey,
        //               label: tr(context, "select"),
        //               selectedItem: addTransactionData.selectedTarget,
        //               margin: const EdgeInsets.symmetric(vertical: 5),
        //               validate: (value) {
        //                 if (value == null) {
        //                   print("Please fill this field");
        //                 }
        //               },
        //               onChange: addTransactionData.setSelectTarget,
        //               finData: (data) => addTransactionData.getTarget(
        //                 context,
        //               ),
        //               useName: true,
        //               buttonsColor: MyColors.primary,
        //               searchHint: tr(context, "search"),
        //             ),
        //           ],
        //         ),
        //       if (type == "المعاملات النقدية")
        //         Column(
        //           children: [
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 MyText(
        //                   title: tr(context, "selectCashTransaction"),
        //                   color: MyColors.black,
        //                   size: 12.sp,
        //                   fontWeight: FontWeight.bold,
        //                 ),
        //                 IconButton(
        //                     onPressed: () => addTransactionData
        //                         .addTransactionContentModel(context, type),
        //                     icon: Icon(Icons.add))
        //               ],
        //             ),
        //             DropdownTextField<DropdownModel>(
        //               dropKey: addTransactionData.cashTransactionDropKey,
        //               label: tr(context, "select"),
        //               selectedItem: addTransactionData.selectedCashTransaction,
        //               margin: const EdgeInsets.symmetric(vertical: 5),
        //               validate: (value) {
        //                 if (value == null) {
        //                   print("Please fill this field");
        //                 }
        //               },
        //               onChange: addTransactionData.setSelectCashTransactions,
        //               finData: (data) => addTransactionData.getCashTransactions(
        //                 context,
        //               ),
        //               useName: true,
        //               buttonsColor: MyColors.primary,
        //               searchHint: tr(context, "search"),
        //             ),
        //           ],
        //         ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
