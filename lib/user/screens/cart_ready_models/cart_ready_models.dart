part of 'cart_ready_models_imports.dart';

class CartReadyModels extends StatefulWidget {
  const CartReadyModels({Key? key}) : super(key: key);

  @override
  State<CartReadyModels> createState() => _CartReadyModelsState();
}

class _CartReadyModelsState extends State<CartReadyModels> {

  CartReadyModelsData data = CartReadyModelsData();

  @override
  void initState() {
    data.fetchData(context);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Res.readyModels,
              width: 30.w,
              height: 30.h,
            ),
            SizedBox(
              width: 10.w,
            ),
            MyText(
              title: tr(context, "readyModels"),
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
      body: Padding(
        padding: EdgeInsets.all(15.0.r),
        child: BlocBuilder<GenericBloc<List<AddCartModel>>,GenericState<List<AddCartModel>>>(
          bloc: data.addCartCubit,
          builder: (context,state)=>ListView.builder(
            itemCount: state.data.length,
            itemBuilder: (context,i)=>BuildCartReadyModelsCard(model: state.data[i], onDelete: (){}, data: data, index: i,),
          ),
        ),
      ),
    );
  }
}
