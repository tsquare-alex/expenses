part of 'target_imports.dart';

class Target extends StatefulWidget {
  const Target({
    Key? key, required this.model,
  }) : super(key: key);
  final TransactionModel model;

  @override
  State<Target> createState() => _TargetState();
}

class _TargetState extends State<Target> {
  TargetData data = TargetData();

  @override
  void initState() {
    data.fetchData();
    data.initData(widget.model);
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
            title: Padding(
              padding: EdgeInsets.only(left: 40.0.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Res.cash,
                    width: 30.w,
                    height: 30.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  MyText(
                    title: tr(context, "target"),
                    color: MyColors.black,
                    size: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            leading: InkWell(
              onTap: () => AutoRouter.of(context).pop(),
              child: Icon(Icons.arrow_back, color: MyColors.black,),
            ),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: MyColors.primary,
            onPressed: () {
              if (state1.data.isEmpty) {
                data.addTransactionModel(context);
              } else {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => BuildTargetView(
                      transactionModel: widget.model, hasData: true, data: data,))
                );
              }
            },
            shape: const CircleBorder(),
            child: Icon(Icons.add, color: MyColors.white,),
          ),
          body: state1.data.isEmpty ? BlocBuilder<
              GenericBloc<List<TransactionTypeModel>>,
              GenericState<List<TransactionTypeModel>>>(
            bloc: data.transactionTypeCubit,
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.all(15.r),
                child: BuildTargetView(transactionModel: widget.model, hasData: false,data: data,),
              );
            },
          ) : Padding(
            padding: EdgeInsets.all(15.0.r),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: state1.data.length,
              itemBuilder: (context, i) =>
                  BuildTargetCard(
                    model: state1.data[i], onDelete: () =>
                      data.deleteItem(state1.data[i],), data: data,
                  ),
            ),
          ),
        );
      },
    );
  }
}
