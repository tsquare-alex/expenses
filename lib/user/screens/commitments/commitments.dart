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
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<GenericBloc<List<AddTransactionModel>>, GenericState<List<AddTransactionModel>>>(
          bloc: data.addTransactionCubit,
          builder: (context, state) {
            if(state.data.isEmpty){
              return BuildNoRecord();
            }else{
              return Center(child: Text("Data"),);
            }
          },
        ),
      ),
    );
  }
}
