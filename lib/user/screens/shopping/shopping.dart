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
      body: BlocBuilder<GenericBloc<List<AddTransactionModel>>, GenericState<List<AddTransactionModel>>>(
        bloc: data.addTransactionCubit,
        builder: (context, state) {
          if(state.data.isEmpty){
            return SingleChildScrollView(child: BuildNoRecord());
          }else{
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.data.length,
              itemBuilder: (context,i)=>BuildTransactionCard(model: state.data[i], onDelete: ()=>data.deleteItem(state.data[i]),),
            );
          }
        },
      ),
    );
  }
}
