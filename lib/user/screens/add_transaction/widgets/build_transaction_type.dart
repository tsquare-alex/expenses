part of 'add_transaction_widgets_imports.dart';

class BuildTransactionType extends StatelessWidget {
  const BuildTransactionType({Key? key, required this.addTransactionData, required this.type,}) : super(key: key);
  final AddTransactionData addTransactionData;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: addTransactionData.formKey,
      child: Column(
        children: [
          if( type=="الالتزامات" ||  type=="التسوق والشراء") BlocBuilder<GenericBloc<List<TransactionTypeModel>>, GenericState<List<TransactionTypeModel>>>(
            bloc: type=="الالتزامات"?addTransactionData.transactionTypeCubit:addTransactionData.shoppingTypeCubit,
            builder: (context, state) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(title: type=="الالتزامات"?"اختار الالتزام":"تحديد جهة التسوق والشراء", color: MyColors.black, size: 12.sp,fontWeight: FontWeight.bold,),
                  IconButton(onPressed: ()=>addTransactionData.clearBoxData("addTransactionBox"), icon: Icon(Icons.add))
                ],
              ),
              DropdownTextField<TransactionTypeModel>(
                dropKey: addTransactionData.commitmentDropKey,
                label: "المعاملات",
                selectedItem: addTransactionData.selectedCommitment,
                margin: const EdgeInsets.symmetric(vertical: 5),
                validate: (value) {
                  if(value==null){
                    print("Please fill this field");
                  }
                },
                onChange: addTransactionData.setSelectCommitment,
                finData: (data) => addTransactionData.getCommitments(context,state.data),
                useName: true,
                buttonsColor: MyColors.primary,
                searchHint: "بحث",
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(title: "اختار محتوي المعاملة", color: MyColors.black, size: 12.sp,fontWeight: FontWeight.bold,),
                  IconButton(onPressed: ()=>addTransactionData.addTransactionContentModel(context,type), icon: Icon(Icons.add))
                ],
              ),
              DropdownTextField<TransactionContentModel>(
                dropKey: addTransactionData.commitmentContentDropKey,
                label: "اختر",
                selectedItem: addTransactionData.selectedCommitmentContent,
                margin: const EdgeInsets.symmetric(vertical: 5),
                validate: (value) {
                  if(value==null){
                    print("Please fill this field");
                  }
                },
                onChange: addTransactionData.selectedCommitmentContent,
                finData: (data) => addTransactionData.getCommitmentsContent(context,),
                useName: true,
                buttonsColor: MyColors.primary,
                searchHint: "بحث",
              ),
            ],
          );
            },
          ),
          if( type=="الاهداف المالية المستهدفة") Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(title: "تحديد اسم المستهدف", color: MyColors.black, size: 12.sp,fontWeight: FontWeight.bold,),
                  IconButton(onPressed: ()=>addTransactionData.addTransactionContentModel(context, type), icon: Icon(Icons.add))
                ],
              ),
              DropdownTextField<DropdownModel>(
                dropKey: addTransactionData.targetDropKey,
                label: "اختر",
                selectedItem: addTransactionData.selectedTarget,
                margin: const EdgeInsets.symmetric(vertical: 5),
                validate: (value) {
                  if(value==null){
                    print("Please fill this field");
                  }
                },
                onChange: addTransactionData.setSelectTarget,
                finData: (data) => addTransactionData.getTarget(context,),
                useName: true,
                buttonsColor: MyColors.primary,
                searchHint: "بحث",
              ),
            ],
          ),
          if( type=="المعاملات النقدية") Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(title: "نوع المعامله النقدية", color: MyColors.black, size: 12.sp,fontWeight: FontWeight.bold,),
                  IconButton(onPressed: ()=>addTransactionData.addTransactionContentModel(context, type), icon: Icon(Icons.add))
                ],
              ),
              DropdownTextField<DropdownModel>(
                dropKey: addTransactionData.cashTransactionDropKey,
                label: "اختر",
                selectedItem: addTransactionData.selectedCashTransaction,
                margin: const EdgeInsets.symmetric(vertical: 5),
                validate: (value) {
                  if(value==null){
                    print("Please fill this field");
                  }
                },
                onChange: addTransactionData.setSelectCashTransactions,
                finData: (data) => addTransactionData.getCashTransactions(context,),
                useName: true,
                buttonsColor: MyColors.primary,
                searchHint: "بحث",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
