part of 'commitments_imports.dart';

class Commitments extends StatefulWidget {
  const Commitments({Key? key, required this.model}) : super(key: key);
  final TransactionModel model;

  @override
  State<Commitments> createState() => _CommitmentsState();
}

class _CommitmentsState extends State<Commitments> {
  CommitmentsData data = CommitmentsData();

  @override
  void initState() {
    data.initData(widget.model);
    data.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<AddTransactionModel>>,
        GenericState<List<AddTransactionModel>>>(
      bloc: data.addTransactionCubit,
      builder: (context, state1) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            centerTitle: true,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  Res.commitments,
                  width: 30.w,
                  height: 30.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                MyText(
                  title: tr(context, "commitments"),
                  color: MyColors.black,
                  size: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            leading: InkWell(
              onTap: () => AutoRouter.of(context).pop(),
              child: Icon(
                Icons.arrow_back,
                color: MyColors.black,
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: MyColors.primary,
            onPressed: () async{
              if (state1.data.isEmpty) {
                data.addTransactionModel(context);
              } else {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BuildCommitmentView(
                          hasData: true,
                          data: data,
                          transactionModel: widget.model,
                        )));
                var box = await Hive.openBox<AddTransactionModel>("addTransactionBox");
                var list = box.values.toList();
                for(AddTransactionModel item in list){
                  AddTransactionModel newModel = AddTransactionModel(
                    image: item.image,
                    total: item.total,
                    amount: item.amount,
                    time: DateFormat("hh:mm aa", "en").format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, TimeOfDay.now().hour, TimeOfDay.now().minute)),
                    description: item.description,
                    putReminderInWallet: item.putReminderInWallet,
                    notify: null,
                    requiredValue: item.requiredValue,
                    initialValue: item.initialValue,
                    transactionName: item.transactionName,
                    priority: item.priority,
                    endDate: item.endDate,
                    startDate: DateFormat("dd/MM/yyyy", "en").format(DateTime.now()),
                    targetValue: item.targetValue,
                    transactionType: item.transactionType,
                    brandName: item.brandName,
                    repeated: null,
                    transactionDate: DateFormat("dd/MM/yyyy", "en").format(DateTime.now()),
                    unit: item.unit,
                    incomeSource: item.incomeSource,
                    transactionContent: item.transactionContent,
                    budget: item.budget,
                    cashTransactionType: item.cashTransactionType,
                    completedNotify: item.completedNotify,
                    database: item.database,
                    ratio: item.ratio,
                    targetType: item.targetType,
                  );
                  if(item.repeated != null){
                    if(item.repeated?.name == "daily"){
                      double total = double.parse(item.total!);
                      if (total <= item.incomeSource!.balance) {
                        var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
                        var walletList = walletBox.values.toList();
                        WalletModel? targetModel = walletList.firstWhere(
                              (model) => model.name == item.incomeSource?.name,
                        );
                        print("object ${targetModel.name}");
                        targetModel.balance = targetModel.balance - total;
                        print("balance ${targetModel.balance}");
                        await walletBox.put(item.incomeSource?.key, targetModel);
                        print(item.incomeSource!.balance);
                        box.add(newModel);
                        print("object");
                      }else{
                        CustomToast.showSimpleToast(msg: "msg");
                      }
                    }
                  }
                }
              }
            },
            shape: const CircleBorder(),
            child: Icon(
              Icons.add,
              color: MyColors.white,
            ),
          ),
          body: state1.data.isEmpty
              ? Padding(
                  padding: EdgeInsets.all(15.r),
                  child: BuildCommitmentView(
                    hasData: false,
                    data: data,
                    transactionModel: widget.model,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.all(15.0.r),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state1.data.length,
                    itemBuilder: (context, i) => BuildCommitmentCard(
                      model: state1.data[i],
                      onDelete: () => data.deleteItem(state1.data[i]),
                      data: data,
                    ),
                  ),
                ),
        );
      },
    );
  }
}
