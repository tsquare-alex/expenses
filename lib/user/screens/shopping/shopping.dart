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
    return BlocBuilder<GenericBloc<List<AddTransactionModel>>, GenericState<List<AddTransactionModel>>>(
      bloc: data.addTransactionCubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            title: Row(
              children: [
                Image.asset(
                  Res.cart,
                  width: 20.w,
                  height: 20.h,
                  color: MyColors.white,
                ),
                SizedBox(
                  width: 10.w,
                ),
                MyText(
                  title: tr(context, "shopping"),
                  color: Colors.white,
                  size: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            automaticallyImplyLeading: false,
          ),
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
                model: state.data[i],
                onDelete: () => data.deleteItem(state.data[i]),),
            ),
          ),
        );
      },
    );
  }
}
