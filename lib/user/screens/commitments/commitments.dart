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
    return BlocBuilder<GenericBloc<List<TransactionTypeModel>>, GenericState<List<TransactionTypeModel>>>(
      bloc: data.transactionTypeCubit,
      builder: (context, state) {
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
                    Res.commitments,
                    width: 24.w,
                    height: 16.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  MyText(
                    title: tr(context, "commitments"),
                    color: MyColors.black,
                    size: 14.sp,
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
          floatingActionButton: state.data.isNotEmpty ? FloatingActionButton(
            backgroundColor: MyColors.primary,
            onPressed: () {
              data.addTransactionModel(context);
            },
            shape: const CircleBorder(),
            child: Icon(Icons.add, color: MyColors.white,),
          ) : null,
          // body: state.data.isEmpty?AddTransaction(model: data.model):
          // Padding(
          //   padding: EdgeInsets.all(15.0.r),
          //   child: ListView.builder(
          //     physics: const BouncingScrollPhysics(),
          //     shrinkWrap: true,
          //     itemCount: state.data.length,
          //     itemBuilder: (context, i) => BuildTransactionCard(
          //       model: state.data[i], onDelete: () =>
          //         data.deleteItem(state.data[i]),),
          //   ),
          // ),
          body: Padding(
            padding: EdgeInsets.all(15.r),
            child: BuildCommitmentView(model: state.data,),
          ),
        );
      },
    );
  }
}
