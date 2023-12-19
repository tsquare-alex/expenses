part of 'shopping_imports.dart';

class Shopping extends StatefulWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {

  ShoppingData data = ShoppingData();

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
