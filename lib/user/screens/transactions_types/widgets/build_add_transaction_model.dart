part of 'transactions_types_widgets_imports.dart';

class BuildAddTransactionModel extends StatelessWidget {
  const BuildAddTransactionModel({Key? key, required this.data})
      : super(key: key);
  final TransactionsTypesData data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTransactionTypeCubit(),
      child: BlocConsumer<AddTransactionTypeCubit,AddTransactionTypeState>(
        listener: (context,state){},
        builder: (context,state)=>Padding(
          padding: EdgeInsets.all(15.0.r),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    GenericTextField(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      controller: data.nameController,
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
                    GenericTextField(
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      controller: data.contentController,
                      fieldTypes: FieldTypes.normal,
                      type: TextInputType.text,
                      action: TextInputAction.next,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Enter the transaction type name';
                        }
                      },
                      label: "محتوي المعاملة",
                      margin: const EdgeInsets.symmetric(vertical: 10),
                    ),
                  ],
                ),
              ),
              DefaultButton(
                onTap: () {
                  var box = Hive.box(ApiNames.kTransactionTypes);
                  box.put("name", "Mohamed");
                  //AddTransactionTypeCubit.get(context).addTransactionType(
                  //   TransactionTypeModel(
                  //     name: "Mohamed",
                  //     content: [
                  //       TransactionContentModel(
                  //         name: "content"
                  //       )
                  //     ]
                  //   ),
                  // );
                },
                title: "إضافة",
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
              DefaultButton(
                onTap: () {
                  var box = Hive.box(ApiNames.kTransactionTypes);
                  print(box.get("name"));
                },
                title: "طباعة",
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
