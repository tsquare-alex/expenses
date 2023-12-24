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
                  MyText(title: type=="الالتزامات"?tr(context, "selectCommitment"):tr(context, "selectShopping"), color: MyColors.black, size: 12.sp,fontWeight: FontWeight.bold,),
                  IconButton(onPressed: ()=>addTransactionData.addTransactionModel(context, type), icon: Icon(Icons.add))
                ],
              ),
              DropdownTextField<TransactionTypeModel>(
                dropKey: addTransactionData.commitmentDropKey,
                label: tr(context, "transaction"),
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
                searchHint:tr(context, "search"),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(title: tr(context, "selectTransferContent"), color: MyColors.black, size: 12.sp,fontWeight: FontWeight.bold,),
                  IconButton(onPressed: ()=>addTransactionData.addTransactionContentModel(context,type), icon: Icon(Icons.add))
                ],
              ),
              DropdownTextField<TransactionContentModel>(
                dropKey: addTransactionData.commitmentContentDropKey,
                label: tr(context, "select"),
                selectedItem: addTransactionData.selectedCommitmentContent,
                margin: const EdgeInsets.symmetric(vertical: 5),
                validate: (value) {
                  if(value==null){
                    print("Please fill this field");
                  }
                },
                onChange: addTransactionData.setSelectCommitmentContent,
                finData: (data) => addTransactionData.getCommitmentsContent(context,),
                useName: true,
                buttonsColor: MyColors.primary,
                searchHint:tr(context, "search"),
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
                  MyText(title: tr(context, "selectTargetName"), color: MyColors.black, size: 12.sp,fontWeight: FontWeight.bold,),
                  IconButton(onPressed: ()=>addTransactionData.addTransactionContentModel(context, type), icon: Icon(Icons.add))
                ],
              ),
              DropdownTextField<DropdownModel>(
                dropKey: addTransactionData.targetDropKey,
                label: tr(context, "select"),
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
                searchHint:tr(context, "search"),
              ),
            ],
          ),
          if( type=="المعاملات النقدية") Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(title: tr(context, "selectCashTransaction"), color: MyColors.black, size: 12.sp,fontWeight: FontWeight.bold,),
                  IconButton(onPressed: ()=>addTransactionData.addTransactionContentModel(context, type), icon: Icon(Icons.add))
                ],
              ),
              DropdownTextField<DropdownModel>(
                dropKey: addTransactionData.cashTransactionDropKey,
                label: tr(context, "select"),
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
                searchHint:tr(context, "search"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
