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
    print(type);
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
                if (type == "الالتزامات" || type == "التسوق والشراء") {
                  addTransactionData.addTransactionModel(context, type);
                } else if (type == "المعاملات النقدية" ||
                    type == "الاهداف المالية المستهدفة") {
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
                    ? BlocBuilder<GenericBloc<List<DropdownModel>>,
                        GenericState<List<DropdownModel>>>(
                        bloc: type == "الاهداف المالية المستهدفة"
                            ? addTransactionData.targetCubit
                            : addTransactionData.cashTransactionCubit,
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
                                  if (type == "المعاملات النقدية") {
                                    addTransactionData.cashTypeCubit
                                        .onUpdateData(state.data[i]);
                                    AutoRouter.of(context).pop();
                                    print(addTransactionData
                                        .cashTypeCubit.state.data?.name);
                                  } else if (type ==
                                      "الاهداف المالية المستهدفة") {
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
                                          backgroundColor: MyColors.primary,
                                          child: Image.asset(
                                            Res.transaction,
                                            color: MyColors.white,
                                            width: 18.w,
                                            height: 18.h,
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
                                    if (i != state.data.length - 1)
                                      Divider(
                                        thickness: 1.w,
                                        color: MyColors.grey,
                                      ),
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
          closedBuilder: (_, openContainer) => Form(
            key: addTransactionData.formKey,
            child: Column(
              children: [
                if(type=="الالتزامات"||type=="التسوق والشراء")BlocBuilder<GenericBloc<TransactionContentModel?>,
                    GenericState<TransactionContentModel?>>(
                  bloc: addTransactionData.typeContentCubit,
                  builder: (context, state) {
                    if (state.data != null) {
                      addTransactionData.transactionController.text =
                          state.data?.name ?? "";
                    }
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0.r),
                      child: GenericTextField(
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 10.0.r),
                          child: CircleAvatar(
                            radius: 20.r,
                            backgroundColor: MyColors.primary,
                            child: Image.asset(
                              Res.transaction,
                              color: MyColors.white,
                              width: 18.w,
                              height: 18.h,
                            ),
                          ),
                        ),
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16),
                        controller: addTransactionData.transactionController,
                        fieldTypes: FieldTypes.clickable,
                        type: TextInputType.text,
                        action: TextInputAction.next,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Enter brand name';
                          }
                        },
                        label: tr(context, "transaction"),
                        margin: const EdgeInsets.only(top: 0),
                        suffixIcon: Icon(
                          Icons.arrow_drop_down,
                          color: MyColors.grey,
                          size: 28.w,
                        ),
                      ),
                    );
                  },
                ),
                if(type == "المعاملات النقدية" ||
                    type == "الاهداف المالية المستهدفة")  BlocBuilder<GenericBloc<DropdownModel?>,
                    GenericState<DropdownModel?>>(
                  bloc: type == "المعاملات النقدية"
                      ? addTransactionData.cashTypeCubit
                      : addTransactionData.targetTypeCubit,
                  builder: (context, state) {
                  if (state.data != null) {
                    addTransactionData.transactionController.text =
                        state.data?.name ?? "";
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0.r),
                    child: GenericTextField(
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 10.0.r),
                        child: CircleAvatar(
                          radius: 20.r,
                          backgroundColor: MyColors.primary,
                          child: Image.asset(
                            Res.transaction,
                            color: MyColors.white,
                            width: 18.w,
                            height: 18.h,
                          ),
                        ),
                      ),
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16),
                      controller: addTransactionData.transactionController,
                      fieldTypes: FieldTypes.clickable,
                      type: TextInputType.text,
                      action: TextInputAction.next,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Enter brand name';
                        }
                      },
                      label: tr(context, "transaction"),
                      margin: const EdgeInsets.only(top: 0),
                      suffixIcon: Icon(
                        Icons.arrow_drop_down,
                        color: MyColors.grey,
                        size: 28.w,
                      ),
                    ),
                  );
                },
                ),
            
            
              ],
            ),
          ),
        ),
      ],
    );
  }
}
