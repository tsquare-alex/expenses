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
            title: Row(
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
            onPressed: () {
              if (state1.data.isEmpty) {
                data.addTransactionModel(context);
              } else {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BuildCommitmentView(
                          hasData: true,
                          data: data,
                          transactionModel: widget.model,
                        )));
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
