part of 'commitments_imports.dart';

class Commitments extends StatefulWidget {
  const Commitments({Key? key}) : super(key: key);

  @override
  State<Commitments> createState() => _CommitmentsState();
}

class _CommitmentsState extends State<Commitments> {

  CommitmentsData data = CommitmentsData();

  @override
  void initState() {
    data.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<AddTransactionModel>>, GenericState<List<AddTransactionModel>>>(
      bloc: data.addTransactionCubit,
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: state.data.isNotEmpty?FloatingActionButton(
            backgroundColor: MyColors.primary,
            onPressed: () {
              AutoRouter.of(context).push(AddTransactionRoute(model: data.model),);
            },
            child: Icon(Icons.add,color: MyColors.white,),
          ):null,
          body: state.data.isEmpty?AddTransaction(model: data.model):
          Padding(
            padding: EdgeInsets.all(15.0.r),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.data.length,
              itemBuilder: (context, i) => BuildTransactionCard(
                model: state.data[i], onDelete: () =>
                  data.deleteItem(state.data[i]),),
            ),
          ),
        );
      },
    );
  }
}
