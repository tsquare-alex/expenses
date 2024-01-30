part of 'add_transaction_imports.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({Key? key, required this.model, this.transactionName, this.boxName,}) : super(key: key);
  final TransactionTypeModel? model;
  final String? transactionName;
  final String? boxName;

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {

  AddTransactionData data = AddTransactionData();

  @override
  void initState() {
    data.selectedContent=null;
    data.selectedContent?.selected=false;
    data.getContents(widget.model!,widget.transactionName!);
    data.typeContentCubit.state
        .data?.map((e) => e.selected = false).toList();

    data.selectedContent = null;
    print(data.selectedContent?.selected);
    print(data.selectedContent?.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor:  context.watch<AppThemeCubit>().isDarkMode
            ? AppDarkColors.backgroundColor
            : MyColors.white,
        elevation: 0,
        backgroundColor:  context.watch<AppThemeCubit>().isDarkMode
            ? AppDarkColors.backgroundColor
            : MyColors.white,
        leading: IconButton(
          onPressed: () => AutoRouter.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            color:  context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.white
                : MyColors.black,
            size: 20.sp,
          ),
        ),
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(widget.model?.image??"",width: 25.w,height: 25.h,),
            SizedBox(
              width: 15.w,
            ),
            MyText(
              title: tr(context, widget.model!.name!).isNotEmpty?tr(context, widget.model!.name!):widget.model?.name??"",
              color:  context.watch<AppThemeCubit>().isDarkMode
                  ? MyColors.white
                  : MyColors.black,
              size: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0.r),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              BuildTransactionType(addTransactionData: data, type: widget.transactionName??"", model: widget.model!, boxName: widget.boxName??"",),
              BuildTransactionInputs(addTransactionData: data, type: widget.transactionName??"",),
              BuildAddProductPhoto(data: data,),
              BuildTransactionDate(data: data,type: widget.transactionName??""),
              BuildIterateTransaction(addTransactionData: data,type: widget.transactionName??"",),
              BuildTransactionButton(data: data,type: widget.transactionName??"", transactionType: widget.model!,),

            ],
          ),
        ),
      ),
    );
  }
}
